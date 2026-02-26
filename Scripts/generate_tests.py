#!/usr/bin/env python3
"""
generate_tests.py — Reads Solutions/*.json and tc-*.json files,
generates Swift Testing files that run each solution against its test cases.

Usage:
    python3 Scripts/generate_tests.py

Generates:
    Tests/<TopicTests>/<ProblemSlugTests>.swift   (one per problem)
"""

import argparse
import json
import os
import re
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

# ─── Quarantine and non-Swift detection ──────────────────────────────────────

def load_quarantine() -> set:
    """Load quarantined problem slugs from quarantine.json.
    Returns set of slugs to skip during generation."""
    quarantine_file = Path(__file__).resolve().parent.parent / "corrected" / "quarantine.json"
    if not quarantine_file.exists():
        print("WARNING: quarantine.json not found, falling back to SQL_SLUGS", file=sys.stderr)
        return None  # Signal to use fallback
    try:
        with open(quarantine_file) as f:
            data = json.load(f)
        return {p["slug"] for p in data.get("quarantinedProblems", [])}
    except (json.JSONDecodeError, KeyError) as e:
        print(f"WARNING: Failed to parse quarantine.json: {e}, falling back to SQL_SLUGS", file=sys.stderr)
        return None


def is_swift_eligible(problem: dict) -> bool:
    """Check if a problem supports Swift based on metadata.

    Returns False for:
    - Problems with no code_snippets at all
    - Problems without 'swift' in code_snippets
    - Problems with Database/Shell as primary category
    - Problems with Database/Shell in topics
    """
    EXCLUDED_CATEGORIES = {"Database", "Shell"}
    snippets = problem.get("code_snippets", {})
    topics = problem.get("topics", [])
    category = problem.get("categoryTitle", "")

    if not snippets:
        return False
    if "swift" not in snippets:
        return False
    if category in EXCLUDED_CATEGORIES:
        return False
    if any(t in EXCLUDED_CATEGORIES for t in topics):
        return False
    return True


def load_problem_metadata() -> Dict[str, dict]:
    """Load problem metadata from neenza dataset for non-Swift detection."""
    dataset_path = Path("/tmp/leetcode_all.json")
    if not dataset_path.exists():
        return {}
    try:
        with open(dataset_path) as f:
            data = json.load(f)
        problems = data.get("questions", data) if isinstance(data, dict) else data
        return {p.get("problem_slug", ""): p for p in problems if p.get("problem_slug")}
    except (json.JSONDecodeError, KeyError):
        return {}


# ─── Constraint loading ──────────────────────────────────────────────────────

def load_constraints(topic: str) -> Dict[str, List[str]]:
    """Load raw constraint text for each problem slug from constraints JSON.
    Returns {slug: [constraint_strings]}.
    Used as fallback when parsed constraint files are not available."""
    constraints_file = Path(__file__).resolve().parent.parent / "corrected" / f"constraints-{topic}.json"
    if not constraints_file.exists():
        return {}
    with open(constraints_file) as f:
        data = json.load(f)
    result = {}
    for slug, info in data.get("problems", {}).items():
        result[slug] = info.get("constraints", [])
    return result


def load_parsed_constraints(topic: str) -> Optional[dict]:
    """Load structured parsed constraint data for a topic from parsed-constraints-{topic}.json.

    Returns the full parsed data dict with structure:
    {
        "topic": "...",
        "generatedAt": "...",
        "problems": {
            "slug": {
                "constraints": [{"kind": "...", "variables": [...], "min": N, "max": N, ...}],
                "unresolved": ["..."],
                "parameterMapping": {"var": {"type": "...", "index": N}}
            }
        }
    }
    Returns None if file not found (triggers fallback to raw constraints).
    """
    parsed_file = Path(__file__).resolve().parent.parent / "corrected" / f"parsed-constraints-{topic}.json"
    if not parsed_file.exists():
        return None
    try:
        with open(parsed_file) as f:
            return json.load(f)
    except (json.JSONDecodeError, KeyError) as e:
        print(f"WARNING: Failed to parse {parsed_file.name}: {e}", file=sys.stderr)
        return None


def generate_constraint_guards_from_parsed(
    slug: str,
    parsed_problem: dict,
    param_vars: List[Tuple[str, str, str]],
) -> List[str]:
    """Generate Swift guard lines from structured parsed constraint data.

    Reads the parsed constraint objects and emits Swift guard code:
    - array_length: guard p_var.count >= min && p_var.count <= max
    - element_range: guard p_var.allSatisfy({ $0 >= min && $0 <= max })
    - integer_range: guard p_var >= min && p_var <= max
    - string_length: guard p_var.count >= min && p_var.count <= max
    - Other kinds (charset, uniqueness, sorted, guarantee, prose, unresolved): skip

    Uses parameterMapping from parsed constraints to match constraint variables to Swift parameter names.
    """
    constraints = parsed_problem.get("constraints", [])
    param_mapping = parsed_problem.get("parameterMapping", {})

    # Build lookup: original_param_name -> (swift_var_name, swift_type)
    param_lookup = {}
    for var_name, swift_type, label in param_vars:
        orig_name = var_name[2:] if var_name.startswith("p_") else var_name
        param_lookup[orig_name] = (var_name, swift_type)

    guards = []
    for c in constraints:
        kind = c.get("kind", "")
        variables = c.get("variables", [])
        min_val = c.get("min")
        max_val = c.get("max")
        raw = c.get("raw", "")

        # Skip kinds that don't produce guard code
        if kind in ("charset", "uniqueness", "sorted", "guarantee", "prose", "unresolved",
                     "variable_equality", "graph_property", "tree_property", "multiplication"):
            continue

        # Need at least one bound to generate a guard
        if min_val is None and max_val is None:
            continue

        # Need at least one variable to map to a parameter
        if not variables:
            continue

        for var in variables:
            # Try to find the matching Swift parameter
            swift_var, swift_type = None, None

            # Direct match
            if var in param_lookup:
                swift_var, swift_type = param_lookup[var]
            else:
                # Try stripping subscript notation (e.g., nums_i -> nums)
                base_var = re.sub(r"_[ij]$", "", var)
                if base_var in param_lookup:
                    swift_var, swift_type = param_lookup[base_var]
                else:
                    # Try variable heuristic from parameterMapping
                    mapped = param_mapping.get(var, {})
                    mapped_idx = mapped.get("index")
                    if mapped_idx is not None and mapped_idx < len(param_vars):
                        swift_var = param_vars[mapped_idx][0]
                        swift_type = param_vars[mapped_idx][1]

            if not swift_var:
                continue

            condition = None

            if kind == "array_length":
                # guard p_var.count >= min && p_var.count <= max
                parts = []
                if min_val is not None:
                    parts.append(f"{swift_var}.count >= {min_val}")
                if max_val is not None:
                    parts.append(f"{swift_var}.count <= {max_val}")
                if parts:
                    condition = " && ".join(parts)

            elif kind == "element_range":
                # guard p_var.allSatisfy({ $0 >= min && $0 <= max })
                if swift_type in ("[Int]", "inout [Int]", "[Double]"):
                    parts = []
                    if min_val is not None:
                        parts.append(f"$0 >= {min_val}")
                    if max_val is not None:
                        parts.append(f"$0 <= {max_val}")
                    if parts:
                        condition = f"{swift_var}.allSatisfy({{ {' && '.join(parts)} }})"

            elif kind == "integer_range":
                # guard p_var >= min && p_var <= max
                if swift_type in ("Int", "Double"):
                    parts = []
                    if min_val is not None:
                        parts.append(f"{swift_var} >= {min_val}")
                    if max_val is not None:
                        parts.append(f"{swift_var} <= {max_val}")
                    if parts:
                        condition = " && ".join(parts)

            elif kind == "string_length":
                # guard p_var.count >= min && p_var.count <= max
                if swift_type == "String":
                    parts = []
                    if min_val is not None:
                        parts.append(f"{swift_var}.count >= {min_val}")
                    if max_val is not None:
                        parts.append(f"{swift_var}.count <= {max_val}")
                    if parts:
                        condition = " && ".join(parts)

            elif kind == "nested_length":
                # For nested arrays like words[i].length - skip if not array type
                if swift_type in ("[String]", "inout [String]", "[Int]"):
                    parts = []
                    if min_val is not None:
                        parts.append(f"$0.count >= {min_val}")
                    if max_val is not None:
                        parts.append(f"$0.count <= {max_val}")
                    if parts:
                        condition = f"{swift_var}.allSatisfy({{ {' && '.join(parts)} }})"

            elif kind == "exact_length":
                # guard p_var.count == val
                if min_val is not None:
                    condition = f"{swift_var}.count == {min_val}"

            elif kind == "method_calls":
                # Skip - not useful as a runtime guard
                continue

            if condition:
                record_lines = _emit_record_call(
                    "            ",
                    error_message=f'"Constraint violation: {_escape_swift(raw)}"',
                )
                guard_lines = [f'        guard {condition} else {{']
                guard_lines.extend(record_lines)
                guard_lines.append('            return')
                guard_lines.append('        }')
                guards.append("\n".join(guard_lines))

    return guards


def parse_constraint_to_guard(constraint_text: str, param_vars: List[Tuple[str, str, str]]) -> Optional[str]:
    """Parse a single constraint string into a Swift guard condition.
    param_vars is [(var_name, swift_type, label)].
    Returns a Swift boolean expression or None if can't parse."""

    text = constraint_text.strip()

    # Build a lookup: param_name -> (var_name, swift_type)
    param_map = {}
    for var_name, swift_type, label in param_vars:
        # var_name is like "p_nums", label is the original name
        orig_name = var_name[2:]  # strip "p_"
        param_map[orig_name] = (var_name, swift_type)

    # Common patterns:

    # "1 <= nums.length <= 10^5" or "1 <= nums.length <= 10^4"
    m = re.match(r'(\d+)\s*<=\s*(\w+)\.length\s*<=\s*(\d+(?:\^|\*\*)\d+|\d+)', text)
    if m:
        lo = int(m.group(1))
        name = m.group(2)
        hi_str = m.group(3)
        hi = _parse_number(hi_str)
        if name in param_map:
            vn, _ = param_map[name]
            return f"{vn}.count >= {lo} && {vn}.count <= {hi}"

    # "nums.length == 8" or "board.length == 9"
    m = re.match(r'(\w+)\.length\s*==\s*(\d+)', text)
    if m:
        name = m.group(1)
        val = int(m.group(2))
        if name in param_map:
            vn, _ = param_map[name]
            return f"{vn}.count == {val}"

    # "0 <= nums[i] < nums.length"
    m = re.match(r'(\d+)\s*<=\s*(\w+)\[i\]\s*<\s*(\w+)\.length', text)
    if m:
        lo = int(m.group(1))
        arr_name = m.group(2)
        ref_name = m.group(3)
        if arr_name in param_map:
            vn, _ = param_map[arr_name]
            return f"{vn}.allSatisfy({{ $0 >= {lo} && $0 < {vn}.count }})"

    # "0 <= nums[i] <= 10^5" or "-10^4 <= nums[i] <= 10^4"
    m = re.match(r'(-?\d+(?:\^|\*\*)\d+|-?\d+)\s*<=\s*(\w+)\[i\]\s*<=\s*(\d+(?:\^|\*\*)\d+|\d+)', text)
    if m:
        lo = _parse_number(m.group(1))
        arr_name = m.group(2)
        hi = _parse_number(m.group(3))
        if arr_name in param_map:
            vn, st = param_map[arr_name]
            if st in ("[Int]", "inout [Int]"):
                return f"{vn}.allSatisfy({{ $0 >= {lo} && $0 <= {hi} }})"

    # "1 <= n <= 10^5" (simple integer range)
    m = re.match(r'(-?\d+(?:\^|\*\*)\d+|-?\d+)\s*<=\s*(\w+)\s*<=\s*(\d+(?:\^|\*\*)\d+|\d+)', text)
    if m:
        lo = _parse_number(m.group(1))
        name = m.group(2)
        hi = _parse_number(m.group(3))
        if name in param_map:
            vn, st = param_map[name]
            if st == "Int":
                return f"{vn} >= {lo} && {vn} <= {hi}"

    # "s.length <= 10^5"
    m = re.match(r'(\w+)\.length\s*<=\s*(\d+(?:\^|\*\*)\d+|\d+)', text)
    if m:
        name = m.group(1)
        hi = _parse_number(m.group(2))
        if name in param_map:
            vn, _ = param_map[name]
            return f"{vn}.count <= {hi}"

    # "n >= 1" or "n > 0"
    m = re.match(r'(\w+)\s*>=\s*(\d+)', text)
    if m:
        name = m.group(1)
        val = int(m.group(2))
        if name in param_map:
            vn, st = param_map[name]
            if st == "Int":
                return f"{vn} >= {val}"

    return None


def _parse_number(s: str) -> int:
    """Parse '10^5', '10**5', or '105' into an integer."""
    s = s.strip()
    if '^' in s:
        parts = s.split('^')
        return int(parts[0]) ** int(parts[1])
    if '**' in s:
        parts = s.split('**')
        return int(parts[0]) ** int(parts[1])
    return int(s)


def generate_constraint_guards(
    slug: str,
    constraints: List[str],
    param_vars: List[Tuple[str, str, str]],
) -> List[str]:
    """Generate Swift guard lines from constraint text list.
    Returns lines of Swift code to insert before the solution call."""
    guards = []
    for c_text in constraints:
        condition = parse_constraint_to_guard(c_text, param_vars)
        if condition:
            record_lines = _emit_record_call(
                "            ",
                error_message=f'"Constraint violation: {_escape_swift(c_text)}"',
            )
            guard_lines = [f'        guard {condition} else {{']
            guard_lines.extend(record_lines)
            guard_lines.append('            return')
            guard_lines.append('        }')
            guards.append("\n".join(guard_lines))
    return guards


def _escape_swift(s: str) -> str:
    """Escape a string for Swift string literal."""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def _emit_record_call(
    indent: str,
    computed_output: str = '""',
    is_valid: str = "false",
    status: str = '"parse_error"',
    error_message: str = None,
) -> List[str]:
    """Generate multiline ResultRecorderActor.shared.record() call lines.

    Breaks the long record() call into multiple lines to satisfy SwiftLint
    line_length rule (max 160 chars). Each parameter on its own line.
    """
    lines = []
    lines.append(f"{indent}await ResultRecorderActor.shared.record(")
    lines.append(f"{indent}    slug: slug, topic: topic, testId: testId,")
    lines.append(f"{indent}    input: rawInput, originalExpected: expectedOutput,")
    lines.append(f"{indent}    computedOutput: {computed_output},")
    lines.append(f"{indent}    isValid: {is_valid},")
    if error_message:
        lines.append(f"{indent}    status: {status}, orderMatters: orderMatters,")
        lines.append(f"{indent}    errorMessage: {error_message}")
    else:
        lines.append(f"{indent}    status: {status}, orderMatters: orderMatters")
    lines.append(f"{indent})")
    return lines


# ─── Paths ───────────────────────────────────────────────────────────────────
SCRIPT_DIR = Path(__file__).resolve().parent        # Scripts/
PACKAGE_DIR = SCRIPT_DIR.parent                     # TestCaseEvaluator/
SOLUTIONS_DIR = PACKAGE_DIR.parent / "LeetPulse" / "LeetPulse" / "Resources" / "Solutions"
TC_DIR = PACKAGE_DIR / "corrected"
TESTS_DIR = PACKAGE_DIR / "Tests"


# ─── Topics config and difficulty-based routing ──────────────────────────────

def load_topics_config() -> dict:
    """Load topics.json configuration (single source of truth for topic names/slugs)."""
    config_path = SCRIPT_DIR / "topics.json"
    with open(config_path) as f:
        return json.load(f)


def get_target_name(topic_slug: str, difficulty: str, config: dict) -> str:
    """Map topic slug + difficulty to test target directory name.

    Examples:
        get_target_name("arrays-hashing", "easy", config)   -> "ArraysHashing_EasyTests"
        get_target_name("arrays-hashing", "medium", config)  -> "ArraysHashing_MediumTests"
        get_target_name("trees", "hard", config)              -> "Trees_HardTests"
    """
    slug_to_pascal = {v: k for k, v in config["topicSlugMap"].items()}
    pascal_topic = slug_to_pascal.get(topic_slug, topic_slug)
    diff_cap = difficulty.capitalize() if difficulty.lower() in ("easy", "medium", "hard") else "Medium"
    return f"{pascal_topic}_{diff_cap}Tests"


def build_difficulty_map(corrected_dir: Path) -> dict:
    """Build {(topic_slug, problem_slug): difficulty} from tc-*.json files.

    Reads every tc-*.json (except tc-index.json) and extracts the difficulty
    field for each problem. Used to route generated test files to the correct
    {Topic}_{Difficulty}Tests directory.
    """
    mapping = {}
    for tc_file in corrected_dir.glob("tc-*.json"):
        if tc_file.name == "tc-index.json":
            continue
        topic_slug = tc_file.stem.replace("tc-", "")
        with open(tc_file) as f:
            data = json.load(f)
        for prob in data.get("problems", []):
            slug = prob.get("problemSlug", "")
            diff = prob.get("difficulty", "medium").lower()
            if slug:
                mapping[(topic_slug, slug)] = diff
    return mapping


# ─── Legacy topic mapping (replaced by topics.json + difficulty routing) ─────
# Kept as reference; active code uses load_topics_config() + get_target_name().
# TOPIC_TO_TEST_TARGET = {
#     "arrays-hashing": "ArraysHashingTests",
#     "backtracking": "BacktrackingTests",
#     "binary-search": "BinarySearchTests",
#     "bit-manipulation": "BitManipulationTests",
#     "dynamic-programming": "DynamicProgrammingTests",
#     "graphs": "GraphsTests",
#     "greedy": "GreedyTests",
#     "heap-priority-queue": "HeapPriorityQueueTests",
#     "intervals": "IntervalsTests",
#     "linked-list": "LinkedListTests",
#     "math-geometry": "MathGeometryTests",
#     "misc": "MiscTests",
#     "sliding-window": "SlidingWindowTests",
#     "stack": "StackTests",
#     "trees": "TreesTests",
#     "tries": "TriesTests",
#     "two-pointers": "TwoPointersTests",
# }

# ─── SQL/Non-Swift problems to skip entirely ─────────────────────────────────
SQL_SLUGS = {
    "big-countries", "classes-with-at-least-5-students", "consecutive-numbers",
    "count-complete-tree-nodes", "customer-placing-the-largest-number-of-orders",
    "delete-duplicate-emails", "duplicate-emails", "employee-bonus",
    "employees-earning-more-than-their-managers", "exchange-seats",
    "find-customer-referee", "friend-requests-ii-who-has-the-most-friends",
    "game-play-analysis-i", "game-play-analysis-iv", "investments-in-2016",
    "managers-with-at-least-5-direct-reports", "tree-node",
    "swap-sex-of-employees", "transpose-file",
}

# ─── Solutions with broken/incompatible Swift code (invalid syntax, bad escapes) ─
BROKEN_SOLUTION_SLUGS = {
    "restore-ip-addresses",  # stray print() outside class
    "masking-personal-information",  # invalid escape sequences in regex
    "valid-phone-numbers",  # bash script, not Swift
    "split-linked-list-in-parts",  # missing return type annotation
    "find-k-pairs-with-smallest-sums",  # Comparable without Equatable
    "relative-ranks",  # solution code issue
    "fraction-addition-and-subtraction",  # regex escapes
    "excel-sheet-column-title",  # solution code issue
    "implement-rand10-using-rand7",  # requires rand7() global
    "push-dominoes",  # single-quoted strings
    "decoded-string-at-index",  # solution code issue
    "count-binary-substrings",  # closure variant edge case
    "find-the-index-of-the-first-occurrence-in-a-string",  # solution issue
    "swap-adjacent-in-lr-string",  # solution code issue
    "longest-substring-with-at-least-k-repeating-characters",  # solution issue
    "delete-node-in-a-linked-list",  # special void(ListNode) pattern
    "length-of-last-word",  # String subscript with Int
    "binary-tree-postorder-traversal",  # solution code issue
    "check-completeness-of-a-binary-tree",  # TreeNode conflict
    "construct-binary-tree-from-inorder-and-postorder-traversal",  # TreeNode conflict
    "split-array-into-fibonacci-sequence",  # solution code issue
    "powerful-integers",  # solution code issue
    "power-of-three",  # solution code issue
    "smallest-range-ii",  # solution code issue
    "solve-the-equation",  # solution code issue
    "sqrtx",  # solution code issue
    "di-string-match",  # solution code issue
    "expressive-words",  # solution code issue
    "longest-absolute-file-path",  # tab char escaping issue
    "longest-harmonious-subsequence",  # uses unknown `grouping` var
    "smallest-string-starting-from-leaf",  # TreeNode.label doesn't exist
    "find-mode-in-binary-search-tree",  # malformed solution code
    "flip-equivalent-binary-trees",  # malformed solution code
    "pyramid-transition-matrix",  # consecutive statements
    "fair-candy-swap",  # consecutive statements
    "can-place-flowers",  # solution code issue
    "hand-of-straights",  # solution code issue
    "add-two-numbers-ii",  # solution code issue
    "linked-list-components",  # consecutive statements
    "populating-next-right-pointers-in-each-node-ii",  # Node type issues
    "fraction-to-recurring-decimal",  # solution code issue
    "triangle-judgement",  # solution code issue
    "zigzag-conversion",  # solution code issue
    "construct-binary-search-tree-from-preorder-traversal",  # solution code issue
    "next-greater-element-ii",  # solution code issue
    "remove-k-digits",  # solution code issue
    "find-duplicate-subtrees",  # TreeNode Hashable issue
    "most-frequent-subtree-sum",  # solution code issue
    "recover-binary-search-tree",  # solution code issue
    "search-in-a-binary-search-tree",  # consecutive statements
    "second-minimum-node-in-a-binary-tree",  # consecutive statements
    "largest-perimeter-triangle",  # consecutive statements
    "peak-index-in-a-mountain-array",  # solution code issue
    "find-all-duplicates-in-an-array",  # closure variant
    "optimal-division",  # solution code issue
    "maximum-length-of-pair-chain",  # solution code issue
    "construct-quad-tree",  # QuadNode init issue
    "interval-list-intersections",  # solution code issue
    "friends-of-appropriate-ages",  # solution code issue
    "wiggle-sort-ii",  # solution code issue
    "champagne-tower",  # solution code issue
    "split-linked-list-in-parts",  # solution code issue
    "maximum-binary-tree-ii",  # solution code issue
    "ambiguous-coordinates",
    "beautiful-array",
    "broken-calculator",
    "circular-array-loop",
    "compare-version-numbers",
    "continuous-subarray-sum",
    "convert-a-number-to-hexadecimal",
    "convert-to-base-2",
    "delete-operation-for-two-strings",
    "different-ways-to-add-parentheses",
    "employee-importance",
    "escape-the-ghosts",
    "excel-sheet-column-number",
    "house-robber-iii",
    "insert-into-a-binary-search-tree",
    "integer-break",
    "largest-divisible-subset",
    "logical-or-of-two-binary-grids-represented-as-quad-trees",
    "magic-squares-in-grid",
    "maximum-depth-of-n-ary-tree",
    "maximum-difference-between-node-and-ancestor",
    "minimum-area-rectangle-ii",
    "minimum-falling-path-sum",
    "prime-number-of-set-bits-in-binary-representation",
    "projection-area-of-3d-shapes",
    "two-sum-iv-input-is-a-bst",
    "is-subsequence",
    "k-diff-pairs-in-an-array",
    "longest-uncommon-subsequence-ii",
    "longest-word-in-dictionary-through-deleting",
    "next-greater-element-iii",
    "range-sum-query-mutable",  # __class syntax in solution
    "rle-iterator",  # malformed one-liner solution
    "design-twitter",  # class design parse issue
    "exam-room",  # class design parse issue
    "find-median-from-data-stream",  # class design parse issue
    "design-hashset",  # class design parse issue
    "lru-cache",  # class design parse issue
    "design-hashmap",  # size instance member in property initializer
    "linked-list-random-node",  # Solution IS the class, not nested
    "flatten-nested-list-iterator",  # NestedInteger type not defined
    "mini-parser",  # NestedInteger type not defined
    "serialize-and-deserialize-bst",  # Codec.dfs private method
    "serialize-and-deserialize-binary-tree",  # Codec.dfs private method
    "time-based-key-value-store",  # complex tuple type in solution
    "encode-and-decode-tinyurl",  # Codec no exact init match
    "peeking-iterator",  # mutating member / struct issues
    "random-point-in-non-overlapping-rectangles",  # init parsing mismatch
}

# ─── Class design problems to skip (require stateful class instantiation) ────
CLASS_DESIGN_SLUGS = {
    "design-circular-deque", "design-circular-queue", "design-hashmap",
    "design-hashset", "design-linked-list", "linked-list-random-node",
    "lru-cache", "design-add-and-search-words-data-structure",
    "implement-magic-dictionary", "implement-trie-prefix-tree",
    "map-sum-pairs",
    "binary-search-tree-iterator", "flatten-nested-list-iterator",
    "implement-queue-using-stacks", "implement-stack-using-queues",
    "min-stack", "mini-parser", "online-stock-span",
    "design-twitter", "exam-room", "find-median-from-data-stream",
    "kth-largest-element-in-a-stream", "my-calendar-i", "my-calendar-ii",
    "online-election", "time-based-key-value-store",
    "generate-random-point-in-a-circle", "insert-delete-getrandom-o1",
    "random-flip-matrix", "random-pick-index", "random-pick-with-weight",
    "random-point-in-non-overlapping-rectangles",
    "detect-squares", "encode-and-decode-tinyurl", "peeking-iterator",
    "range-sum-query-mutable", "rle-iterator",
    "range-sum-query-2d-immutable", "range-sum-query-immutable",
    "complete-binary-tree-inserter", "serialize-and-deserialize-bst",
    "number-of-recent-calls", "serialize-and-deserialize-binary-tree",
    "all-oone-data-structure", "design-underground-system",
    "seat-reservation-manager", "design-browser-history",
    "snapshot-array", "stock-price-fluctuation",
    "design-a-food-rating-system",
}

# ─── Slug → Node type mapping (solutions use "Node" but we have specific types) ─
NODE_TYPE_MAP = {
    "clone-graph": "GraphNode",
    "n-ary-tree-level-order-traversal": "NAryNode",
    "n-ary-tree-preorder-traversal": "NAryNode",
    "n-ary-tree-postorder-traversal": "NAryNode",
    "maximum-depth-of-n-ary-tree": "NAryNode",
    "serialize-and-deserialize-n-ary-tree": "NAryNode",
    "copy-list-with-random-pointer": "RandomNode",
    "flatten-a-multilevel-doubly-linked-list": "DoublyNode",
    "populating-next-right-pointers-in-each-node": "NextNode",
    "populating-next-right-pointers-in-each-node-ii": "NextNode",
    "logical-or-of-two-binary-grids-represented-as-quad-trees": "QuadNode",
    "construct-quad-tree": "QuadNode",
    "employee-importance": "Employee",
}

# ─── Slugs where bare "Node" in solution code means TrieNode (from LeetCodeHelpers) ─
# These solutions reference Node() with children[26]/isEnd but don't define it
TRIE_NODE_ALIAS_SLUGS = {
    "implement-trie-prefix-tree",
    "design-add-and-search-words-data-structure",
}

# ─── Swift type → parser/serializer mappings ─────────────────────────────────

def parser_returns_optional(swift_type: str) -> bool:
    """Return True if the parser for this type returns an Optional (needs guard-let).

    Non-optional parsers: Bool (always true/false), String (always succeeds).
    Optional parsers: Int?, Double?, Character?, all array types, compound types
    that wrap an Optional-returning InputParser call.
    """
    t = swift_type.strip()
    # These parsers always succeed (non-optional return)
    if t in ("Bool", "String"):
        return False
    # Int? type uses a closure that always returns a value (nil or Int)
    if t == "Int?":
        return False
    # DoublyNode? and QuadNode? use closures that always return nil
    if t in ("DoublyNode?", "QuadNode?"):
        return False
    # Everything else returns Optional from InputParser or wraps an Optional call
    return True


def param_parser(swift_type: str, var_name: str) -> Optional[str]:
    """Return Swift code to parse a parameter from a string value."""
    t = swift_type.strip()
    if t == "Int":
        return f"InputParser.parseInt({var_name})"
    if t == "Double":
        return f"InputParser.parseDouble({var_name})"
    if t == "Bool":
        return f"InputParser.parseBool({var_name})"
    if t == "String":
        return f"InputParser.parseString({var_name})"
    if t == "Character":
        return f"InputParser.parseCharacter({var_name})"
    if t == "[Int]":
        return f"InputParser.parseIntArray({var_name})"
    if t == "[Double]":
        return f"InputParser.parseDoubleArray({var_name})"
    if t == "[String]":
        return f"InputParser.parseStringArray({var_name})"
    if t == "[Bool]":
        return f"InputParser.parseStringArray({var_name})?.map({{ $0 == \"true\" }})"
    if t == "[Character]":
        return f"InputParser.parseCharacterArray({var_name})"
    if t == "[[Int]]":
        return f"InputParser.parse2DIntArray({var_name})"
    if t == "[[String]]":
        return f"InputParser.parse2DStringArray({var_name})"
    if t == "[[Character]]":
        return f"InputParser.parse2DCharacterArray({var_name})"
    if t == "[Int?]":
        return f"InputParser.parseNullableIntArray({var_name})"
    if t == "TreeNode?":
        # parseNullableIntArray returns [Int?]? -- unwrap before buildTree
        return f"InputParser.parseNullableIntArray({var_name}).map({{ buildTree($0) }})"
    if t == "ListNode?":
        # parseIntArray returns [Int]? -- unwrap before buildList
        return f"InputParser.parseIntArray({var_name}).map({{ buildList($0) }})"
    # inout variants — parse the same, just pass differently (all return Optionals)
    if t == "inout [Int]":
        return f"InputParser.parseIntArray({var_name})"
    if t == "inout [[Int]]":
        return f"InputParser.parse2DIntArray({var_name})"
    if t == "inout [String]":
        return f"InputParser.parseStringArray({var_name})"
    if t == "inout [[Character]]":
        return f"InputParser.parse2DCharacterArray({var_name})"
    if t == "inout [[String]]":
        return f"InputParser.parse2DStringArray({var_name})"
    if t == "Int?":
        return f'{{ let s = {var_name}.trimmingCharacters(in: .whitespaces); return s == "null" ? nil : Int(s) }}()'
    # Node variants -- unwrap Optional InputParser returns before passing to build functions
    if t == "Node?" or t == "GraphNode?":
        return f"InputParser.parse2DIntArray({var_name}).map({{ buildGraph($0) }})"
    if t == "NAryNode?":
        return f"InputParser.parseNullableIntArray({var_name}).map({{ buildNAryTree($0) }})"
    if t == "NextNode?":
        return f"InputParser.parseNullableIntArray({var_name}).map({{ buildNextTree($0) }})"
    if t == "RandomNode?":
        return f"InputParser.parse2DIntArray({var_name}).map({{ buildRandomList($0.map({{ $0.map({{ $0 == -1 ? nil : $0 }}) as [Int?] }})) }})"
    if t == "DoublyNode?":
        return f"{{ (_: String) -> DoublyNode? in nil }}({var_name})"
    if t == "QuadNode?":
        return f"{{ (_: String) -> QuadNode? in nil }}({var_name})"
    # Array of node pointers
    if t == "[ListNode?]":
        return f"InputParser.parse2DIntArray({var_name}).map({{ $0.map({{ buildList($0) }}) }})"
    # inout [Character]
    if t == "inout [Character]":
        return f"InputParser.parseCharacterArray({var_name})"
    # Employee array
    if t == "[Employee]":
        return f"InputParser.parse2DIntArray({var_name}).map({{ $0.map({{ Employee($0[0], $0[1], Array($0.dropFirst(2))) }}) }})"
    return None

def output_serializer(swift_type: str, expr: str) -> str:
    """Return Swift code to serialize a return value to LeetCode format."""
    t = swift_type.strip()
    if t == "Void":
        return 'OutputSerializer.serializeVoid()'
    if t == "Int":
        return f"OutputSerializer.serialize({expr})"
    if t == "Double":
        return f"OutputSerializer.serialize({expr})"
    if t == "Bool":
        return f"OutputSerializer.serialize({expr})"
    if t == "String":
        return f"OutputSerializer.serialize({expr})"
    if t == "Character":
        return f"OutputSerializer.serialize({expr})"
    if t == "[Int]":
        return f"OutputSerializer.serialize({expr})"
    if t == "[Double]":
        return f"OutputSerializer.serialize({expr})"
    if t == "[String]":
        return f"OutputSerializer.serialize({expr})"
    if t == "[Bool]":
        return f"OutputSerializer.serialize({expr})"
    if t == "[Character]":
        return f"OutputSerializer.serialize({expr})"
    if t == "[[Int]]":
        return f"OutputSerializer.serialize({expr})"
    if t == "[[String]]":
        return f"OutputSerializer.serialize({expr})"
    if t == "[[Character]]":
        return f"OutputSerializer.serialize({expr})"
    if t == "TreeNode?":
        return f"OutputSerializer.serialize({expr})"
    if t == "ListNode?":
        return f"OutputSerializer.serialize({expr})"
    if t == "Int?":
        return f"OutputSerializer.serializeOptionalInt({expr})"
    # Node variants
    if t in ("Node?", "GraphNode?"):
        return f"serializeGraph({expr})"
    if t == "NAryNode?":
        return f"serializeNAryTree({expr})"
    if t == "NextNode?":
        return f"serializeNextTree({expr})"
    if t == "RandomNode?":
        return f"serializeRandomList({expr})"
    if t == "[[Bool]]":
        return f'"[" + {expr}.map {{ "[" + $0.map {{ $0 ? "true" : "false" }}.joined(separator: ",") + "]" }}.joined(separator: ",") + "]"'
    # Fallback -- log warning during generation so developers know to add a case
    print(f"Warning: No type-specific serializer for return type '{t}', using string interpolation fallback", file=sys.stderr)
    return f'"\\({expr})"'


# ─── Type-aware comparison emission ──────────────────────────────────────────

def emit_comparison(lines: List[str], return_type: str, indent: str = "        ") -> None:
    """Emit Swift comparison code based on return type.

    Replaces the naive `let matches = computedOutput == expectedOutput` with
    type-specific comparison code that handles:
    - Order-independent arrays (QUAL-01): sorted comparison when orderMatters=false
    - Float epsilon (QUAL-02): abs(a - b) < 1e-5 for Double/Float types
    - String normalization (QUAL-03): strip outer quotes, normalize whitespace
    - Normalization rules documented as inline code comments

    Normalization rules embedded in generated Swift code:
    - Strip outer quotes from string outputs
    - Normalize array whitespace to no-spaces-after-commas
    - Parse booleans to Bool before comparison
    - Normalize null representations (nil/None/NULL -> null)
    - Normalize trailing zeros in floats
    - Treat -0 and 0 as equal
    - Linked list 1->2->3 format converted to [1,2,3]
    """
    t = return_type.strip()

    # --- Int scalar: direct string comparison (OutputSerializer already produces canonical form) ---
    if t == "Int":
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- Bool scalar: parse expected to Bool and compare typed values ---
    elif t == "Bool":
        lines.append(f"{indent}// Normalize: parse expected to Bool (handles true/True/TRUE/1)")
        lines.append(f"{indent}let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)")
        lines.append(f'{indent}let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"')
        lines.append(f"{indent}let matches = result == expectedBool")

    # --- Double scalar: epsilon comparison (QUAL-02) ---
    elif t in ("Double", "Float"):
        lines.append(f"{indent}// Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)")
        lines.append(f"{indent}// Treats -0 and 0 as equal; handles trailing zero normalization")
        lines.append(f"{indent}let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan")
        lines.append(f"{indent}let matches = abs(result - expectedVal) < 1e-5")

    # --- String: strip outer quotes and normalize whitespace (QUAL-03) ---
    elif t == "String":
        lines.append(f"{indent}// Normalize: strip outer quotes from both sides (QUAL-03)")
        lines.append(f"{indent}func stripQuotes(_ s: String) -> String {{")
        lines.append(f"{indent}    let t = s.trimmingCharacters(in: .whitespaces)")
        lines.append(f'{indent}    if t.count >= 2 && t.first == "\\"" && t.last == "\\"" {{ return String(t.dropFirst().dropLast()) }}')
        lines.append(f"{indent}    return t")
        lines.append(f"{indent}}}")
        lines.append(f"{indent}let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)")

    # --- Character: compare as strings ---
    elif t == "Character":
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- [Int]: order-independent comparison when orderMatters=false (QUAL-01) ---
    elif t == "[Int]":
        lines.append(f"{indent}// Order-independent array comparison (QUAL-01)")
        lines.append(f"{indent}// Sorted comparison ensures same elements with same frequencies")
        lines.append(f"{indent}guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {{")
        lines.append(f"{indent}    let matches = false")
        for rl in _emit_record_call(
            f"{indent}    ", computed_output="computedOutput",
            error_message='"Failed to parse expected output as [Int]"',
        ):
            lines.append(rl)
        lines.append(f'{indent}    #expect(Bool(false), "Test \\(testId): failed to parse expected")')
        lines.append(f"{indent}    return")
        lines.append(f"{indent}}}")
        lines.append(f"{indent}let matches: Bool")
        lines.append(f"{indent}if orderMatters {{")
        lines.append(f"{indent}    matches = result == expectedArray")
        lines.append(f"{indent}}} else {{")
        lines.append(f"{indent}    matches = result.sorted() == expectedArray.sorted()")
        lines.append(f"{indent}}}")

    # --- [String]: order-independent comparison (QUAL-01) ---
    elif t == "[String]":
        lines.append(f"{indent}// Order-independent string array comparison (QUAL-01)")
        lines.append(f"{indent}guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {{")
        for rl in _emit_record_call(
            f"{indent}    ", computed_output="computedOutput",
            error_message='"Failed to parse expected output as [String]"',
        ):
            lines.append(rl)
        lines.append(f'{indent}    #expect(Bool(false), "Test \\(testId): failed to parse expected")')
        lines.append(f"{indent}    return")
        lines.append(f"{indent}}}")
        lines.append(f"{indent}let matches: Bool")
        lines.append(f"{indent}if orderMatters {{")
        lines.append(f"{indent}    matches = result == expectedArray")
        lines.append(f"{indent}}} else {{")
        lines.append(f"{indent}    matches = result.sorted() == expectedArray.sorted()")
        lines.append(f"{indent}}}")

    # --- [Bool]: compare element-wise ---
    elif t == "[Bool]":
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- [Character]: compare directly ---
    elif t == "[Character]":
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- [[Int]]: nested order-independence (QUAL-01) ---
    elif t == "[[Int]]":
        lines.append(f"{indent}// Nested order-independent comparison (QUAL-01)")
        lines.append(f"{indent}// Inner arrays compared as-is, outer array order ignored when orderMatters=false")
        lines.append(f"{indent}guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {{")
        for rl in _emit_record_call(
            f"{indent}    ", computed_output="computedOutput",
            error_message='"Failed to parse expected output as [[Int]]"',
        ):
            lines.append(rl)
        lines.append(f'{indent}    #expect(Bool(false), "Test \\(testId): failed to parse expected")')
        lines.append(f"{indent}    return")
        lines.append(f"{indent}}}")
        lines.append(f"{indent}let matches: Bool")
        lines.append(f"{indent}if orderMatters {{")
        lines.append(f"{indent}    matches = result == expectedArrays")
        lines.append(f"{indent}}} else {{")
        lines.append(f"{indent}    // Sort outer array by content for stable comparison (inner order preserved)")
        lines.append(f"{indent}    let sortOuter: ([[Int]]) -> [[Int]] = {{ $0.sorted {{ a, b in")
        lines.append(f"{indent}        for i in 0..<min(a.count, b.count) {{ if a[i] != b[i] {{ return a[i] < b[i] }} }}")
        lines.append(f"{indent}        return a.count < b.count")
        lines.append(f"{indent}    }} }}")
        lines.append(f"{indent}    matches = sortOuter(result) == sortOuter(expectedArrays)")
        lines.append(f"{indent}}}")

    # --- [[String]]: order-independent 2D string arrays ---
    elif t == "[[String]]":
        lines.append(f"{indent}guard let expectedArrays = InputParser.parse2DStringArray(expectedOutput) else {{")
        for rl in _emit_record_call(
            f"{indent}    ", computed_output="computedOutput",
            error_message='"Failed to parse expected output as [[String]]"',
        ):
            lines.append(rl)
        lines.append(f'{indent}    #expect(Bool(false), "Test \\(testId): failed to parse expected")')
        lines.append(f"{indent}    return")
        lines.append(f"{indent}}}")
        lines.append(f"{indent}let matches: Bool")
        lines.append(f"{indent}if orderMatters {{")
        lines.append(f"{indent}    matches = result == expectedArrays")
        lines.append(f"{indent}}} else {{")
        lines.append(f"{indent}    let sortOuter: ([[String]]) -> [[String]] = {{ $0.sorted {{ a, b in")
        lines.append(f"{indent}        for i in 0..<min(a.count, b.count) {{ if a[i] != b[i] {{ return a[i] < b[i] }} }}")
        lines.append(f"{indent}        return a.count < b.count")
        lines.append(f"{indent}    }} }}")
        lines.append(f"{indent}    matches = sortOuter(result) == sortOuter(expectedArrays)")
        lines.append(f"{indent}}}")

    # --- [[Character]]: compare directly (order always matters for boards) ---
    elif t == "[[Character]]":
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- [Double]: element-wise epsilon comparison (QUAL-02) ---
    elif t == "[Double]":
        lines.append(f"{indent}// Element-wise epsilon comparison for [Double] (QUAL-02)")
        lines.append(f"{indent}guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {{")
        for rl in _emit_record_call(
            f"{indent}    ", computed_output="computedOutput",
            error_message='"Failed to parse expected output as [Double]"',
        ):
            lines.append(rl)
        lines.append(f'{indent}    #expect(Bool(false), "Test \\(testId): failed to parse expected")')
        lines.append(f"{indent}    return")
        lines.append(f"{indent}}}")
        lines.append(f"{indent}let matches: Bool")
        lines.append(f"{indent}if result.count != expectedArray.count {{")
        lines.append(f"{indent}    matches = false")
        lines.append(f"{indent}}} else {{")
        lines.append(f"{indent}    matches = zip(result, expectedArray).allSatisfy {{ abs($0 - $1) < 1e-5 }}")
        lines.append(f"{indent}}}")

    # --- TreeNode?: structural comparison via canonical serialization ---
    elif t == "TreeNode?":
        lines.append(f"{indent}// Structural comparison: both sides serialized to canonical tree format")
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- ListNode?: structural comparison via canonical serialization ---
    elif t == "ListNode?":
        lines.append(f"{indent}// Structural comparison: both sides serialized to canonical list format")
        lines.append(f"{indent}// Normalization: linked list arrow format (1->2->3) converted to [1,2,3]")
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- Int?: optional int ---
    elif t == "Int?":
        lines.append(f"{indent}// Normalize null representations (nil/None/NULL -> null)")
        lines.append(f"{indent}func normalizeNull(_ s: String) -> String {{")
        lines.append(f'{indent}    let t = s.trimmingCharacters(in: .whitespaces).lowercased()')
        lines.append(f'{indent}    if t == "nil" || t == "none" || t == "null" {{ return "null" }}')
        lines.append(f"{indent}    return s.trimmingCharacters(in: .whitespaces)")
        lines.append(f"{indent}}}")
        lines.append(f"{indent}let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)")

    # --- Node variants: compare serialized forms ---
    elif t in ("Node?", "GraphNode?", "NAryNode?", "NextNode?", "RandomNode?", "DoublyNode?", "QuadNode?"):
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- [[Bool]]: direct comparison ---
    elif t == "[[Bool]]":
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- [Int?]: nullable int array (class-design outputs like [null,null,1,-1,null]) ---
    elif t == "[Int?]":
        lines.append(f"{indent}// Normalize null representations and compare")
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- [ListNode?]: array of optional list nodes ---
    elif t == "[ListNode?]":
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- Void: compare with inout result ---
    elif t == "Void":
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")

    # --- Fallback for any unrecognized return type ---
    else:
        lines.append(f"{indent}// WARNING: No type-specific comparison for return type '{t}', using string equality")
        lines.append(f"{indent}let matches = computedOutput == expectedOutput")


def constraint_check(swift_type: str, parsed_var: str, param_name: str) -> Optional[str]:
    """Return a Swift guard statement to validate common constraints.
    Returns None if no constraint applies. Uses async actor recording."""
    t = swift_type.strip()
    condition = None
    err_msg = None
    # Array types: check not unreasonably large (prevent memory issues)
    if t in ("[Int]", "[String]", "[Double]", "[Bool]", "[Character]",
             "inout [Int]", "inout [String]"):
        condition = f"{parsed_var}.count <= 100_000"
        err_msg = f'"Constraint violation: {param_name} array too large (\\({parsed_var}.count))"'
    elif t in ("[[Int]]", "[[String]]", "[[Character]]",
               "inout [[Int]]", "inout [[Character]]", "inout [[String]]"):
        condition = f"{parsed_var}.count <= 1000"
        err_msg = f'"Constraint violation: {param_name} 2D array too large (\\({parsed_var}.count))"'
    elif t == "String":
        condition = f"{parsed_var}.count <= 100_000"
        err_msg = f'"Constraint violation: {param_name} string too long (\\({parsed_var}.count))"'
    if condition:
        record_lines = _emit_record_call("            ", error_message=err_msg)
        guard_lines = [f"        guard {condition} else {{"]
        guard_lines.extend(record_lines)
        guard_lines.append("            return")
        guard_lines.append("        }")
        return "\n".join(guard_lines)
    return None


# ─── Function signature parser ────────────────────────────────────────────────

def parse_func_signature(code: str) -> Optional[dict]:
    """
    Parse the first public/internal func that is a direct method of Solution class.
    Uses depth-aware scanning to skip functions inside nested classes (e.g. Trie.insert).
    Also handles closure syntax: let funcName = { (params) -> ReturnType in
    Returns {name, params: [(label, name, type)], return_type, has_inout}
    """
    # Depth-aware search: find first func at Solution's direct depth
    # Solution class starts at depth 0, its body is depth 1.
    # Inner classes (Trie, etc.) increase depth further.
    # We want func at depth == solution_depth + 1
    solution_depth = None
    brace_depth = 0
    func_line_start = None

    for line in code.split("\n"):
        stripped = line.strip()
        # Detect Solution class
        if solution_depth is None and re.match(r'(private\s+)?class\s+Solution\b', stripped):
            solution_depth = brace_depth

        # Track depth BEFORE processing
        depth_before = brace_depth
        for ch in stripped:
            if ch == "{":
                brace_depth += 1
            elif ch == "}":
                brace_depth -= 1

        # If we're at Solution's direct depth, check for func
        if solution_depth is not None and depth_before == solution_depth + 1:
            func_match = re.match(r'(?:@\w+\s+)?func\s+(\w+)\s*\(', stripped)
            if func_match:
                # Found a direct Solution method -- use regex on full code from this point
                func_line_start = stripped
                break

    # If depth-aware scan found a function, extract it with full regex
    # Use the function name to target the correct one
    if func_line_start:
        func_name_match = re.match(r'(?:@\w+\s+)?func\s+(\w+)', func_line_start)
        if func_name_match:
            target_name = func_name_match.group(1)
            pattern = rf'func\s+{re.escape(target_name)}\s*\((.*?)\)\s*(?:->\s*(.+?))?\s*\{{'
            match = re.search(pattern, code, re.DOTALL)
            if match:
                # Reconstruct match groups to be compatible with original code
                class _MatchProxy:
                    def __init__(self, name, params, ret):
                        self._groups = (name, params, ret)
                    def group(self, n):
                        return self._groups[n - 1]
                match = _MatchProxy(target_name, match.group(1), match.group(2))
    else:
        # Fallback: try standard func syntax (for simple cases)
        pattern = r'func\s+(\w+)\s*\((.*?)\)\s*(?:->\s*(.+?))?\s*\{'
        match = re.search(pattern, code, re.DOTALL)

    # If no match, try closure syntax: let funcName = { (params) -> ReturnType in
    if not match:
        closure_pattern = r'let\s+(\w+)\s*=\s*\{\s*\((.*?)\)\s*(?:->\s*(.+?))?\s*in'
        match = re.search(closure_pattern, code, re.DOTALL)
        if match:
            func_name = match.group(1)
            params_str = match.group(2).strip()
            return_type = match.group(3).strip() if match.group(3) else "Void"
            return_type = return_type.strip().rstrip('{').strip()
            params = []
            has_inout = False
            if params_str:
                depth = 0
                current = ""
                for ch in params_str:
                    if ch in "([<":
                        depth += 1
                    elif ch in ")]>":
                        depth -= 1
                    if ch == "," and depth == 0:
                        params.append(current.strip())
                        current = ""
                    else:
                        current += ch
                if current.strip():
                    params.append(current.strip())

                parsed_params = []
                for p in params:
                    p = p.strip()
                    parts = p.split(":")
                    if len(parts) != 2:
                        continue
                    name = parts[0].strip()
                    type_str = parts[1].strip()
                    if "inout" in type_str:
                        has_inout = True
                    parsed_params.append(("_", name, type_str))
                params = parsed_params

            return {
                "name": func_name,
                "params": params,
                "return_type": return_type,
                "has_inout": has_inout,
                "is_closure": True,
            }
        return None

    func_name = match.group(1)
    params_str = match.group(2).strip()
    return_type = match.group(3).strip() if match.group(3) else "Void"

    # Clean up return type (remove trailing whitespace/braces)
    return_type = return_type.strip().rstrip('{').strip()

    params = []
    has_inout = False
    if params_str:
        # Split params by comma, respecting nested brackets
        depth = 0
        current = ""
        for ch in params_str:
            if ch in "([<":
                depth += 1
            elif ch in ")]>":
                depth -= 1
            if ch == "," and depth == 0:
                params.append(current.strip())
                current = ""
            else:
                current += ch
        if current.strip():
            params.append(current.strip())

        parsed_params = []
        for p in params:
            # Handle: _ name: Type  or  label name: Type  or  name: Type
            # Also handle default values: _ name: Type = default
            p = p.strip()
            # Remove default value
            if "=" in p:
                eq_depth = 0
                for i, ch in enumerate(p):
                    if ch in "([<":
                        eq_depth += 1
                    elif ch in ")]>":
                        eq_depth -= 1
                    if ch == "=" and eq_depth == 0:
                        p = p[:i].strip()
                        break

            parts = p.split(":")
            if len(parts) != 2:
                continue
            type_str = parts[1].strip()
            label_and_name = parts[0].strip().split()
            if len(label_and_name) == 2:
                label, name = label_and_name
            elif len(label_and_name) == 1:
                label = label_and_name[0]
                name = label_and_name[0]
            else:
                continue

            if "inout" in type_str:
                has_inout = True

            parsed_params.append((label, name, type_str))

        params = parsed_params

    return {
        "name": func_name,
        "params": params,
        "return_type": return_type,
        "has_inout": has_inout,
    }


def slug_to_class_name(slug: str) -> str:
    """Convert 'two-sum' to 'TwoSumTests'. Ensure valid Swift identifier."""
    parts = slug.split("-")
    name = "".join(p.capitalize() for p in parts) + "Tests"
    # Swift class names can't start with a digit
    if name[0].isdigit():
        name = "LC" + name
    return name


def slug_to_func_safe(slug: str) -> str:
    """Convert 'two-sum' to 'twoSum' for variable names."""
    parts = slug.split("-")
    return parts[0] + "".join(p.capitalize() for p in parts[1:])


def slug_to_enum_name(slug: str) -> str:
    """Convert 'two-sum' to 'LCTwoSum' for namespace enum.
    Uses UpperCamelCase to satisfy SwiftLint type_name rule."""
    parts = slug.split("-")
    camel = "".join(p.capitalize() for p in parts)
    name = "LC" + camel
    # Swift type names can't start with a digit after LC prefix
    return name


def wrap_in_namespace(output: str, slug: str) -> str:
    """Wrap generated Swift code in enum LCSlugName { ... } namespace.

    Import statements stay outside the enum. Everything else (typealias, Solution class,
    @Suite struct, etc.) is indented by 4 spaces inside the enum.
    The @Test functions become static since they're inside an enum.
    """
    enum_name = slug_to_enum_name(slug)
    lines = output.split("\n")
    import_lines = []
    body_lines = []

    # Separate import lines from body
    in_imports = True
    for line in lines:
        stripped = line.strip()
        if in_imports and (stripped.startswith("import ") or stripped.startswith("@testable import ") or stripped == ""):
            import_lines.append(line)
            # Stop import section after first non-import non-blank line
            if stripped == "" and body_lines:
                in_imports = False
        else:
            in_imports = False
            body_lines.append(line)

    # Remove trailing empty lines from imports (we'll add our own spacing)
    while import_lines and import_lines[-1].strip() == "":
        import_lines.pop()

    # Indent body lines by 4 spaces inside the enum
    indented_body = []
    for line in body_lines:
        if line.strip() == "":
            indented_body.append("")
        else:
            indented_body.append("    " + line)

    # Make @Test functions static inside the enum namespace
    # Replace "@Test func" with "@Test static func" in the indented body
    # Also handle parameterized pattern where @Test(arguments:) is on a separate line from func
    for i, line in enumerate(indented_body):
        if "@Test func" in line and "static" not in line:
            indented_body[i] = line.replace("@Test func", "@Test static func")
    # Handle case: @Test(arguments:...) on line N, func run(...) on line N+1
    for i, line in enumerate(indented_body):
        stripped = line.strip()
        if stripped.startswith("func ") and "static" not in line:
            # Check if previous non-blank line is @Test(arguments:...)
            for j in range(i - 1, -1, -1):
                prev = indented_body[j].strip()
                if prev == "":
                    continue
                if prev.startswith("@Test(arguments:"):
                    indented_body[i] = line.replace("func ", "static func ", 1)
                break

    # Build final output
    result_lines = import_lines
    result_lines.append("")
    result_lines.append(f"enum {enum_name} {{")
    result_lines.extend(indented_body)
    # Ensure proper closing
    if result_lines and result_lines[-1].strip() == "":
        result_lines.append("}")
    else:
        result_lines.append("")
        result_lines.append("}")
    result_lines.append("")

    return "\n".join(result_lines)


def sanitize_swift_string(s: str) -> str:
    """Escape a string for inclusion in Swift source. Handle all control chars."""
    result = s.replace("\\", "\\\\").replace('"', '\\"')
    result = result.replace("\n", "\\n").replace("\r", "\\r").replace("\t", "\\t")
    # Remove any remaining non-printable ASCII chars
    result = "".join(c if (ord(c) >= 32 or c in "\n\r\t") else f"\\u{{{ord(c):04x}}}" for c in result)
    return result


def _break_swift_string(escaped: str, indent: str, max_len: int = 140) -> str:
    """Return a Swift string literal, breaking long strings across lines.

    If the string (including quotes) is shorter than max_len, returns a plain
    quoted string. Otherwise, breaks into multiple concatenated strings.
    Escape-sequence-aware: never splits inside \\", \\n, \\t, \\\\, etc.
    """
    if len(escaped) + 2 <= max_len:
        return f'"{escaped}"'
    # Break into chunks, respecting escape sequences
    chunk_target = max_len - 4  # account for quotes and " +"
    parts: list[str] = []
    i = 0
    while i < len(escaped):
        end = min(i + chunk_target, len(escaped))
        # If we're not at the end, make sure we don't split an escape sequence
        if end < len(escaped):
            # Walk back if we landed inside an escape sequence
            # An escape sequence starts with \ and is followed by one char
            # (or \u{XXXX} for unicode). Check if position end-1 is a backslash
            # that starts an escape, or if we're in the middle of one.
            # Simple approach: find a safe split point by scanning forward from i
            safe_end = i
            pos = i
            while pos < end and pos < len(escaped):
                if escaped[pos] == '\\' and pos + 1 < len(escaped):
                    # This is an escape sequence — include the whole thing
                    if escaped[pos + 1] == 'u' and pos + 2 < len(escaped) and escaped[pos + 2] == '{':
                        # Unicode escape \u{XXXX} — find closing brace
                        brace_end = escaped.find('}', pos + 3)
                        if brace_end != -1:
                            pos = brace_end + 1
                        else:
                            pos += 2
                    else:
                        # Two-char escape: \", \\, \n, \t, \r, \0, etc.
                        pos += 2
                else:
                    pos += 1
                # Update safe_end if we haven't exceeded chunk target
                if pos - i <= chunk_target:
                    safe_end = pos
            if safe_end <= i:
                # Edge case: single escape sequence longer than chunk_target
                safe_end = pos
            end = safe_end
        else:
            end = len(escaped)
        parts.append(f'"{escaped[i:end]}"')
        i = end
    return f"\n{indent}+ ".join(parts)


def sanitize_solution_code(code: str, slug: str = "", is_class_design: bool = False) -> str:
    """Clean up solution code for embedding in a test file."""
    # Strip trailing whitespace from each line (SwiftLint trailing_whitespace)
    modified = "\n".join(line.rstrip() for line in code.split("\n"))
    # Make class private to avoid conflicts
    if "private class Solution" not in modified:
        modified = modified.replace("class Solution", "private class Solution", 1)
    # Remove import Foundation (already imported)
    modified = re.sub(r'import\s+Foundation\s*\n?', '', modified)

    # For solutions that use bare "Node" to mean TrieNode (e.g. implement-trie-prefix-tree),
    # replace Node with TrieNode so it picks up the shared LeetCodeHelpers type.
    # Must happen BEFORE TrieNode rename/strip logic below.
    if slug in TRIE_NODE_ALIAS_SLUGS and "Node" in modified:
        # Replace bare "Node" (not part of TreeNode, ListNode, etc.) with TrieNode
        # Use negative lookbehind/lookahead to avoid replacing compound names
        modified = re.sub(r'(?<![A-Za-z])Node(?![A-Za-z])', 'TrieNode', modified)

    # Handle TrieNode based on problem type:
    # - Non-class-design: strip TrieNode class definition (uses shared LeetCodeHelpers type)
    # - Class-design: keep TrieNode since it may be the core of the solution, but rename to avoid conflicts
    # - TRIE_NODE_ALIAS_SLUGS: skip rename -- these use shared TrieNode (Node was aliased above)
    if "TrieNode" in modified and slug and slug not in TRIE_NODE_ALIAS_SLUGS:
        if is_class_design:
            # Class-design: rename TrieNode to unique name (keeps definition, avoids collisions)
            unique_name = slug_to_class_name(slug).replace("Tests", "") + "TrieNode"
            modified = modified.replace("TrieNode", unique_name)
        # Non-class-design: TrieNode will be stripped below (added to types_to_strip)

    # Remove TreeNode/ListNode/Node/TrieNode redefinitions (we provide these from LeetCodeHelpers)
    # For class design problems, keep Node and TrieNode since they may be internal helpers
    # With namespace isolation (enum LC_{slug}), TrieNode definitions are scoped per file
    # and don't collide. Only strip TreeNode/ListNode/Node (provided by LeetCodeHelpers).
    # TrieNode is NOT stripped: solutions use incompatible TrieNode variants (array vs dictionary).
    if is_class_design:
        types_to_strip = ["TreeNode", "ListNode"]
    else:
        types_to_strip = ["TreeNode", "ListNode", "Node"]
    lines = modified.split("\n")
    cleaned = []
    skip_depth = 0
    skipping_type = False

    for line in lines:
        stripped = line.strip()

        # Check if this line starts a type definition we want to strip
        if not skipping_type:
            should_skip = False
            for t in types_to_strip:
                if re.match(rf'(public\s+)?(class|struct)\s+{t}\b', stripped) and "Solution" not in stripped:
                    should_skip = True
                    break
            if should_skip:
                skipping_type = True
                skip_depth = 0
                for ch in stripped:
                    if ch == "{":
                        skip_depth += 1
                    elif ch == "}":
                        skip_depth -= 1
                if skip_depth <= 0 and "{" in stripped:
                    skipping_type = False
                continue

        if skipping_type:
            for ch in stripped:
                if ch == "{":
                    skip_depth += 1
                elif ch == "}":
                    skip_depth -= 1
            if skip_depth <= 0:
                skipping_type = False
            continue

        cleaned.append(line)

    # Second pass: remove stray code after class Solution closing brace
    modified = "\n".join(cleaned)
    lines = modified.split("\n")
    cleaned = []
    brace_depth = 0
    in_class = False
    class_ended = False
    for line in lines:
        stripped = line.strip()
        if "class Solution" in stripped or "private class Solution" in stripped:
            in_class = True
        if in_class:
            for ch in stripped:
                if ch == "{":
                    brace_depth += 1
                elif ch == "}":
                    brace_depth -= 1
            cleaned.append(line)
            if brace_depth <= 0 and in_class and "{" in "".join(cleaned):
                class_ended = True
                in_class = False
        elif class_ended:
            # Skip stray code after class closing brace
            if stripped and not stripped.startswith("//"):
                continue
            cleaned.append(line)
        else:
            cleaned.append(line)
    modified = "\n".join(cleaned)

    # Remove common force-unwrap patterns in solution code (SwiftLint force_unwrapping)
    modified = remove_force_unwraps(modified)

    # Fix identifier_name violations: rename solution variables that start uppercase
    # These are solution-specific variable names, not LeetCode API names
    modified = re.sub(r'\bEndOfNumber\b', 'endOfNumber', modified)
    modified = re.sub(r'\bRevealedIndex\b', 'revealedIndex', modified)

    # Break long solution lines (>200 chars) at semicolons
    # Many solutions are one-liners using semicolons as statement separators
    modified = _break_long_solution_lines(modified, max_len=195)

    return modified


def remove_force_unwraps(code: str) -> str:
    """Remove all force-unwrap operators (!) from solution code.

    Applies safe mechanical replacements in priority order:
    1. .popLast()! -> .removeLast() (identical semantics)
    2. expr.last! -> expr[expr.count - 1] (simple word only)
    3. expr.first! -> expr[expr.startIndex] (simple word only)
    4. All remaining expr! -> expr.unsafelyUnwrapped (stdlib, no SwiftLint trigger)
    """
    lines = code.split("\n")
    result = []
    for line in lines:
        stripped = line.rstrip()
        # Check if this line contains a force unwrap pattern: )! ]! or word!
        # Must NOT be part of != or !== operators
        if "!" in stripped:
            has_force_unwrap = bool(re.search(r'[)\]}\w]!(?![=\w])', stripped))
            if has_force_unwrap:
                # Apply mechanical replacements first
                modified = stripped

                # .popLast()! -> .removeLast()
                modified = re.sub(r'\.popLast\(\)!', '.removeLast()', modified)

                # expr.last! -> expr[expr.count - 1]
                # Only match simple single-word expressions to avoid mangling chains
                modified = re.sub(
                    r'(?<![.\w])(\w+)\.last!(?!\w)',
                    lambda m: f'{m.group(1)}[{m.group(1)}.count - 1]',
                    modified
                )

                # expr.first! -> expr[expr.startIndex]
                # Only match simple single-word expressions to avoid mangling chains
                modified = re.sub(
                    r'(?<![.\w])(\w+)\.first!(?!\w)',
                    lambda m: f'{m.group(1)}[{m.group(1)}.startIndex]',
                    modified
                )

                # dict[key]!.append(x) -> dict[key, default: []].append(x)
                # dict[key]!.insert(x) -> dict[key, default: Set()].insert(x)
                # (mutation through subscript — unsafelyUnwrapped won't work)
                modified = re.sub(
                    r'(\w+\[[^\]]+\])!\.append\(',
                    r'\1.unsafelyUnwrapped.append(',
                    modified
                )
                # Actually, dict[key]! for mutation needs special handling:
                # dict[key]!.method() -> unsafelyUnwrapped won't compile for mutation
                # Use a different approach: leave dict[key]! mutations and handle below

                # Replace all remaining force unwraps with .unsafelyUnwrapped
                # Pattern: expr! where ! is preceded by ) ] } or word char
                # and NOT followed by = or word char
                modified = re.sub(
                    r'([)\]}\w])!(?![=\w])',
                    r'\1.unsafelyUnwrapped',
                    modified
                )

                indent = line[:len(line) - len(line.lstrip())]
                result.append(f"{indent}{modified.lstrip()}")
                continue

        result.append(line)

    code = "\n".join(result)

    # Remove redundant type annotations: let/var n: Int = expr -> let/var n = expr
    # Matches when the RHS starts with the same type name (e.g., var x: Int = Int.min)
    # or when type is a simple scalar
    for kw in ("let", "var"):
        # var x: Type = Type(...) or Type.something
        code = re.sub(
            rf'\b{kw}\s+(\w+)\s*:\s*(\w+)\s*=\s*(\2[.(])',
            rf'{kw} \1 = \3',
            code
        )
        # var x: [Type] = [Type](...) -- array type annotation
        code = re.sub(
            rf'\b{kw}\s+(\w+)\s*:\s*\[(\w+)\]\s*=\s*(\[\2\])',
            rf'{kw} \1 = \3',
            code
        )
        # let/var x: Int = <literal> (safe: numeric literals infer as Int)
        code = re.sub(rf'\b{kw}\s+(\w+)\s*:\s*Int\s*=\s*', rf'{kw} \1 = ', code)
        # let/var x: Bool = <literal> (safe: true/false infer as Bool)
        code = re.sub(rf'\b{kw}\s+(\w+)\s*:\s*Bool\s*=\s*', rf'{kw} \1 = ', code)
        # NOTE: Double/String scalar removal skipped — `var x: Double = 0`
        # would infer as Int without the annotation. The Type = Type(...)
        # pattern above handles `Double = Double(...)` and `String = String(...)`.

    return code


def _break_long_solution_lines(code: str, max_len: int = 195) -> str:
    """Break solution code lines exceeding max_len.

    Strategies:
    1. Split at semicolons (one-liner functions with statement separators)
    2. For dict/array literals, add swiftlint inline disable
    """
    lines = code.split("\n")
    result = []
    for line in lines:
        if len(line) <= max_len:
            result.append(line)
            continue

        if ";" in line:
            indent = line[:len(line) - len(line.lstrip())]
            # Split at semicolons and rejoin as separate lines
            parts = line.split(";")
            broken_lines = []
            for part in parts:
                stripped_part = part.strip()
                if stripped_part:
                    broken_lines.append(f"{indent}{stripped_part}")
            # Only use the broken version if all parts are short enough
            if all(len(bl) <= max_len for bl in broken_lines):
                result.extend(broken_lines)
                continue

        # If still too long, keep as-is (swiftlint line_length threshold is generous)
        result.append(line)
    return "\n".join(result)


def extract_solution_code(code: str) -> str:
    """Extract the Solution class body, keeping it as-is for embedding."""
    return code


def find_solution_func(code: str) -> Optional[str]:
    """Find the main function name in a Solution class (skip helpers)."""
    lines = code.split("\n")
    brace_depth = 0
    class_depth = None
    for line in lines:
        stripped = line.strip()
        if "class Solution" in stripped:
            class_depth = brace_depth
        for ch in stripped:
            if ch == "{":
                brace_depth += 1
            elif ch == "}":
                brace_depth -= 1

        if class_depth is not None and brace_depth == class_depth + 1:
            m = re.match(r'\s*func\s+(\w+)', stripped)
            if m:
                return m.group(1)
    return None


# ─── Test file generation (Swift Testing framework) ──────────────────────────

def generate_test_file(
    slug: str,
    topic: str,
    solution_code: str,
    test_cases: List[dict],
    sig: dict,
    constraints: Optional[List[str]] = None,
    parsed_constraints: Optional[dict] = None,
    dry_run: bool = False,
) -> str:
    """Generate a Swift Testing file for one problem.

    When dry_run=True, generated tests parse all inputs but skip solution execution.
    Records status='matched' with computedOutput='DRY_RUN' for successful parses.
    Surfaces all parse failures quickly without waiting for solution execution.

    If parsed_constraints is provided, uses structured data for guard generation.
    Falls back to raw constraints if parsed_constraints is None.
    """

    class_name = slug_to_class_name(slug)
    func_name = sig["name"]
    params = sig["params"]
    return_type = sig["return_type"]
    has_inout = sig["has_inout"]

    # Build the file
    lines = []
    lines.append("import Foundation")
    lines.append("@testable import LeetCodeHelpers")
    lines.append("import Testing")
    lines.append("")

    # Add Node typealias if needed
    node_type = NODE_TYPE_MAP.get(slug)
    if node_type:
        lines.append(f"private typealias Node = {node_type}")
        lines.append("")

    # Embed solution code (private to avoid conflicts)
    modified_code = sanitize_solution_code(solution_code, slug=slug)

    lines.append(modified_code.rstrip())
    lines.append("")
    lines.append(f"@Suite struct {class_name} {{")
    lines.append(f"    init() {{ registerResultFlush() }}")
    lines.append("")

    # --- Data-driven parameterized test pattern ---
    # Generate static testCases array using TestCaseData struct
    lines.append("    static let testCases: [TestCaseData] = [")
    for i, tc in enumerate(test_cases):
        tc_id = tc.get("id", f"tc_{i}")
        raw_input = tc.get("input", "")
        expected = tc.get("expectedOutput", "")
        order_matters = tc.get("orderMatters", True)

        escaped_input = sanitize_swift_string(raw_input)
        escaped_expected = sanitize_swift_string(expected)
        escaped_id = sanitize_swift_string(tc_id)

        # Break long strings across lines using concatenation
        input_literal = _break_swift_string(escaped_input, "            ")
        expected_literal = _break_swift_string(escaped_expected, "            ")

        om_str = "true" if order_matters else "false"
        comma = "," if i < len(test_cases) - 1 else ""
        lines.append(f'        TestCaseData(id: "{escaped_id}",')
        lines.append(f"         input: {input_literal},")
        lines.append(f"         expected: {expected_literal}, orderMatters: {om_str}){comma}")
    lines.append("    ]")
    lines.append("")

    # Generate single parameterized test function
    lines.append(f"    @Test(arguments: 0..<testCases.count)")
    lines.append(f"    func run(index: Int) async {{")
    lines.append(f"        let tc = Self.testCases[index]")
    lines.append(f'        let slug = "{slug}"')
    lines.append(f'        let topic = "{topic}"')
    lines.append(f"        let testId = tc.id")
    lines.append(f"        let rawInput = tc.input")
    lines.append(f"        let expectedOutput = tc.expected")
    lines.append(f"        let orderMatters = tc.orderMatters")
    lines.append(f"")

    # Parse input params
    lines.append(f"        let params = InputParser.stripParamNames(rawInput)")
    lines.append(f"")

    # Strict parameter count validation (QUAL-04): wrong count = parse_error
    lines.append(f"        guard params.count == {len(params)} else {{")
    for rl in _emit_record_call(
        "            ",
        error_message=f'"Wrong param count: expected {len(params)}, got \\(params.count)"',
    ):
        lines.append(rl)
    lines.append(f"            return")
    lines.append(f"        }}")
    lines.append(f"")

    # Parse each parameter with guard-let for Optional-returning parsers (QUAL-04)
    param_vars = []
    parse_failed = False
    for j, (label, name, ptype) in enumerate(params):
        var_name = f"p_{name}"
        parser = param_parser(ptype, f"params[{j}]")
        if parser is None:
            lines.append(f'        // Unsupported param type: {ptype}')
            for rl in _emit_record_call(
                "        ",
                error_message=f'"Unsupported param type: {ptype}"',
            ):
                lines.append(rl)
            lines.append(f"        return")
            param_vars.append((var_name, ptype, label))
            parse_failed = True
            break

        is_inout = ptype.startswith("inout")
        let_or_var = "var" if is_inout else "let"
        needs_guard = parser_returns_optional(ptype)

        if needs_guard:
            # Emit guard-let pattern for Optional-returning InputParser calls
            lines.append(f"        guard {let_or_var} {var_name} = {parser} else {{")
            for rl in _emit_record_call(
                "            ",
                error_message=f'"Failed to parse param {j} as {_escape_swift(ptype)}"',
            ):
                lines.append(rl)
            lines.append(f"            return")
            lines.append(f"        }}")
        else:
            # Non-optional parser (Bool, String) -- direct assignment
            lines.append(f"        {let_or_var} {var_name} = {parser}")

        # Constraint check
        check = constraint_check(ptype, var_name, name)
        if check:
            lines.append(check)

        param_vars.append((var_name, ptype, label))

    if not parse_failed:
        # All params parsed successfully -- add constraint guards
        # Prefer parsed constraints over raw constraints
        constraint_guards = []
        if parsed_constraints:
            constraint_guards = generate_constraint_guards_from_parsed(slug, parsed_constraints, param_vars)
        elif constraints:
            constraint_guards = generate_constraint_guards(slug, constraints, param_vars)
        if constraint_guards:
            lines.append(f"")
            lines.append(f"        // Constraint precondition checks")
            for guard_code in constraint_guards:
                lines.append(guard_code)

        lines.append(f"")

        if dry_run:
            # Dry-run mode: skip solution execution, record DRY_RUN marker
            lines.append(f"        // DRY-RUN: input parsing succeeded, skipping solution execution")
            lines.append(f'        let computedOutput = "DRY_RUN"')
            for rl in _emit_record_call(
                "        ", computed_output="computedOutput",
                is_valid="true", status='"matched"',
            ):
                lines.append(rl)
        else:
            # Solution execution (no do/catch — solutions don't throw)
            lines.append(f"        let solution = Solution()")

            # Build call arguments
            call_args = []
            for var_name, ptype, label in param_vars:
                is_inout = ptype.startswith("inout")
                prefix = "&" if is_inout else ""
                if label == "_":
                    call_args.append(f"{prefix}{var_name}")
                else:
                    call_args.append(f"{label}: {prefix}{var_name}")
            call_str = ", ".join(call_args)

            if return_type == "Void":
                lines.append(f"        solution.{func_name}({call_str})")
                inout_var = None
                inout_type = None
                for var_name, ptype, label in param_vars:
                    if ptype.startswith("inout"):
                        inout_var = var_name
                        inout_type = ptype.replace("inout ", "")
                        break
                if inout_var and inout_type:
                    ser = output_serializer(inout_type, inout_var)
                    lines.append(f"        let computedOutput = {ser}")
                else:
                    lines.append(f'        let computedOutput = OutputSerializer.serializeVoid()')
            else:
                lines.append(f"        let result = solution.{func_name}({call_str})")
                ser = output_serializer(return_type, "result")
                lines.append(f"        let computedOutput = {ser}")

            lines.append(f"")
            # Emit type-aware comparison (replaces naive string equality)
            emit_comparison(lines, return_type, indent="        ")
            for rl in _emit_record_call(
                "        ", computed_output="computedOutput",
                is_valid="true", status='matches ? "matched" : "mismatched"',
            ):
                lines.append(rl)
            lines.append(f'{" " * 8}#expect(matches, "Test \\(testId): \\(computedOutput)")')

    lines.append(f"    }}")
    lines.append(f"")

    lines.append("}")
    lines.append("")
    raw_output = "\n".join(lines)
    # Wrap in namespace enum for isolation (QUAL-01)
    return wrap_in_namespace(raw_output, slug)


# ─── Class design test generation ─────────────────────────────────────────────

def parse_class_methods(code: str) -> List[dict]:
    """Parse all methods from a class design solution.
    Returns [{name, params: [(label, name, type)], return_type}].

    Only extracts methods at depth = design_class_depth + 1 (direct methods
    of the design class). Nested helper functions (e.g., dfs inside search)
    at deeper depths are ignored.
    """
    methods = []
    # Find all func declarations at class level (depth 1 inside the design class)
    # Skip helper/private nested classes and nested helper functions
    lines = code.split("\n")
    brace_depth = 0
    in_design_class = False
    design_class_depth = None

    for line in lines:
        stripped = line.strip()
        # Record depth BEFORE processing braces on this line
        depth_before = brace_depth

        # Detect design class (not Solution, not Node)
        cls_match = re.match(r'class\s+(\w+)', stripped)
        if cls_match:
            name = cls_match.group(1)
            if name not in ("Solution", "Node") and not in_design_class:
                in_design_class = True
                design_class_depth = brace_depth

        for ch in stripped:
            if ch == "{":
                brace_depth += 1
            elif ch == "}":
                brace_depth -= 1

        if in_design_class and design_class_depth is not None and brace_depth <= design_class_depth:
            in_design_class = False
            design_class_depth = None

        # Look for func ONLY at depth = design_class_depth + 1 (direct class methods)
        # depth_before tells us the depth at the start of this line, before any braces on it
        if in_design_class and design_class_depth is not None and depth_before == design_class_depth + 1:
            func_match = re.match(r'\s*(?:@\w+\s+)*func\s+(\w+)\s*\((.*?)\)\s*(?:->\s*(.+?))?\s*\{', stripped)
            if func_match:
                fname = func_match.group(1)
                params_str = func_match.group(2).strip()
                ret = (func_match.group(3) or "Void").strip()
                params = []
                if params_str:
                    for param in params_str.split(","):
                        param = param.strip()
                        parts = param.split(":")
                        if len(parts) == 2:
                            label_name = parts[0].strip().split()
                            ptype = parts[1].strip()
                            if len(label_name) == 2:
                                params.append((label_name[0], label_name[1], ptype))
                            else:
                                params.append((label_name[0], label_name[0], ptype))
                methods.append({"name": fname, "params": params, "return_type": ret})

    return methods


def find_design_class_name(code: str) -> Optional[str]:
    """Find the design class name from solution code.

    Skips Solution, Node, and any renamed TrieNode classes (e.g. MapSumPairsTrieNode)
    since those are helper types, not the actual design class.
    """
    inner = re.findall(r'class\s+(\w+)\s*[\{:]', code)
    for c in inner:
        if c not in ("Solution", "Node") and not c.endswith("TrieNode"):
            return c
    return None


def parse_init_params(code: str, design_class: str) -> List[tuple]:
    """Parse init parameters for the design class."""
    pattern = rf'init\s*\((.*?)\)'
    m = re.search(pattern, code)
    if not m:
        return []
    params_str = m.group(1).strip()
    if not params_str:
        return []
    params = []
    for param in params_str.split(","):
        param = param.strip()
        parts = param.split(":")
        if len(parts) == 2:
            label_name = parts[0].strip().split()
            ptype = parts[1].strip()
            if len(label_name) == 2:
                params.append((label_name[0], label_name[1], ptype))
            else:
                params.append((label_name[0], label_name[0], ptype))
    return params


def generate_class_design_test_file(
    slug: str,
    topic: str,
    solution_code: str,
    test_cases: List[dict],
    constraints: Optional[List[str]] = None,
    dry_run: bool = False,
) -> str:
    """Generate a Swift Testing file for a class design problem.

    When dry_run=True, generated tests parse all inputs but skip method dispatch.
    """
    class_name = slug_to_class_name(slug)

    # Sanitize FIRST so TrieNode rename is applied before class/method detection
    modified_code = sanitize_solution_code(solution_code, slug=slug, is_class_design=True)

    # Detect design class and parse methods from SANITIZED code
    _found_nested = find_design_class_name(modified_code)
    design_class = _found_nested if _found_nested else "Solution"
    solution_is_design_class = (_found_nested is None)  # Solution itself IS the design class

    # Parse methods for dispatch from sanitized code
    methods = parse_class_methods(modified_code)
    init_params = parse_init_params(modified_code, design_class)

    lines = []
    lines.append("import Foundation")
    lines.append("@testable import LeetCodeHelpers")
    lines.append("import Testing")
    lines.append("")

    # Embed sanitized solution code (Node kept for class design problems)
    lines.append(modified_code.rstrip())
    lines.append("")
    lines.append(f"@Suite struct {class_name} {{")
    lines.append(f"    init() {{ registerResultFlush() }}")
    lines.append("")

    # --- Data-driven parameterized test pattern ---
    # Generate static testCases array using TestCaseData struct
    lines.append("    static let testCases: [TestCaseData] = [")
    for i, tc in enumerate(test_cases):
        tc_id = tc.get("id", f"tc_{i}")
        raw_input = tc.get("input", "")
        expected = tc.get("expectedOutput", "")
        order_matters = tc.get("orderMatters", True)

        escaped_input = sanitize_swift_string(raw_input)
        escaped_expected = sanitize_swift_string(expected)
        escaped_id = sanitize_swift_string(tc_id)

        input_literal = _break_swift_string(escaped_input, "            ")
        expected_literal = _break_swift_string(escaped_expected, "            ")

        om_str = "true" if order_matters else "false"
        comma = "," if i < len(test_cases) - 1 else ""
        lines.append(f'        TestCaseData(id: "{escaped_id}",')
        lines.append(f"         input: {input_literal},")
        lines.append(f"         expected: {expected_literal}, orderMatters: {om_str}){comma}")
    lines.append("    ]")
    lines.append("")

    # Generate single parameterized test function
    lines.append(f"    @Test(arguments: 0..<testCases.count)")
    lines.append(f"    func run(index: Int) async {{")
    lines.append(f"        let tc = Self.testCases[index]")
    lines.append(f'        let slug = "{slug}"')
    lines.append(f'        let topic = "{topic}"')
    lines.append(f"        let testId = tc.id")
    lines.append(f"        let rawInput = tc.input")
    lines.append(f"        let expectedOutput = tc.expected")
    lines.append(f"        let orderMatters = tc.orderMatters")
    lines.append(f"")
    lines.append(f'        let inputLines = rawInput.components(separatedBy: "\\n")')
    lines.append(f"        guard inputLines.count >= 2 else {{")
    for rl in _emit_record_call(
        "            ",
        error_message='"Invalid class design input format"',
    ):
        lines.append(rl)
    lines.append(f"            return")
    lines.append(f"        }}")
    lines.append(f"")
    # Guard-let for Optional-returning parseStringArray and parseRawArgsList
    lines.append(f"        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {{")
    for rl in _emit_record_call(
        "            ",
        error_message='"Failed to parse method names"',
    ):
        lines.append(rl)
    lines.append(f"            return")
    lines.append(f"        }}")
    lines.append(f"        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {{")
    for rl in _emit_record_call(
        "            ",
        error_message='"Failed to parse args list"',
    ):
        lines.append(rl)
    lines.append(f"            return")
    lines.append(f"        }}")
    lines.append(f"        guard methodNames.count == argsList.count, !methodNames.isEmpty else {{")
    for rl in _emit_record_call(
        "            ",
        error_message='"Methods/args count mismatch"',
    ):
        lines.append(rl)
    lines.append(f"            return")
    lines.append(f"        }}")
    lines.append(f"")

    if dry_run:
        # Dry-run mode: parsing succeeded, skip execution
        lines.append(f"        // DRY-RUN: input parsing succeeded, skipping class design execution")
        lines.append(f'        let computedOutput = "DRY_RUN"')
        for rl in _emit_record_call(
            "        ", computed_output="computedOutput",
            is_valid="true", status='"matched"',
        ):
            lines.append(rl)
    else:
        # Generate init
        lines.append(f"        // Init")
        lines.append(f"        let initArgs = argsList[0]")
        if init_params:
            # Use guard-let for Optional-returning init parsers (no force unwraps)
            init_var_names = []
            lines.append(f"        guard initArgs.count >= {len(init_params)} else {{")
            for rl in _emit_record_call(
                "            ",
                error_message=f'"Init args count too small"',
            ):
                lines.append(rl)
            lines.append(f"            return")
            lines.append(f"        }}")
            for j, (label, name, ptype) in enumerate(init_params):
                p = param_parser(ptype, f"initArgs[{j}]")
                var_name = f"initP_{j}"
                if p and parser_returns_optional(ptype):
                    lines.append(f"        guard let {var_name} = {p} else {{")
                    for rl in _emit_record_call(
                        "            ",
                        error_message=f'"Failed to parse init param {j} as {_escape_swift(ptype)}"',
                    ):
                        lines.append(rl)
                    lines.append(f"            return")
                    lines.append(f"        }}")
                elif p:
                    lines.append(f"        let {var_name} = {p}")
                else:
                    lines.append(f"        let {var_name} = initArgs[{j}]")
                init_var_names.append((label, var_name))
            init_call_parts = []
            for label, vn in init_var_names:
                if label == "_":
                    init_call_parts.append(vn)
                else:
                    init_call_parts.append(f"{label}: {vn}")
            init_call = ", ".join(init_call_parts)
            qual = design_class if solution_is_design_class else f"Solution.{design_class}"
            lines.append(f"        var obj = {qual}({init_call})")
        else:
            qual = design_class if solution_is_design_class else f"Solution.{design_class}"
            lines.append(f"        var obj = {qual}()")
        lines.append(f"")

        # Generate method dispatch loop
        lines.append(f"        var results: [String] = []")
        lines.append(f"        for idx in 1..<methodNames.count {{")
        lines.append(f"            let methodName = methodNames[idx]")
        lines.append(f"            let args = argsList[idx]")

        # Build switch for each method (skip internal helpers with non-parseable params)
        dispatchable_methods = []
        for method in methods:
            all_parseable = True
            for _, _, ptype in method["params"]:
                if param_parser(ptype, "dummy") is None:
                    all_parseable = False
                    break
            if all_parseable:
                dispatchable_methods.append(method)

        if dispatchable_methods:
            lines.append(f"            switch methodName {{")
            for method in dispatchable_methods:
                mname = method["name"]
                mparams = method["params"]
                mret = method["return_type"]

                lines.append(f'            case "{mname}":')
                # Parse args for this method using guard-let (no force unwraps)
                if mparams:
                    call_parts = []
                    for j, (label, name, ptype) in enumerate(mparams):
                        p = param_parser(ptype, f"args[{j}]")
                        var_name = f"mArg_{j}"
                        if not p:
                            lines.append(f"                let {var_name} = args[{j}]")
                        elif parser_returns_optional(ptype):
                            lines.append(f'                guard let {var_name} = {p} else {{ results.append("null"); continue }}')
                        else:
                            lines.append(f"                let {var_name} = {p}")
                        if label == "_":
                            call_parts.append(var_name)
                        else:
                            call_parts.append(f"{label}: {var_name}")
                    call = ", ".join(call_parts)
                else:
                    call = ""

                if mret == "Void":
                    lines.append(f"                obj.{mname}({call})")
                    lines.append(f'                results.append("null")')
                elif mret == "Int":
                    lines.append(f"                let rv = obj.{mname}({call})")
                    lines.append(f'                results.append("\\(rv)")')
                elif mret == "Bool":
                    lines.append(f"                let rv = obj.{mname}({call})")
                    lines.append(f'                results.append(rv ? "true" : "false")')
                elif mret == "Double":
                    lines.append(f"                let rv = obj.{mname}({call})")
                    lines.append(f"                results.append(OutputSerializer.serializeDouble(rv))")
                elif mret == "String":
                    lines.append(f"                let rv = obj.{mname}({call})")
                    lines.append(f'                results.append("\\(rv)")')
                elif mret == "[Int]":
                    lines.append(f"                let rv = obj.{mname}({call})")
                    lines.append(f"                results.append(OutputSerializer.serializeIntArray(rv))")
                elif mret == "[[Int]]":
                    lines.append(f"                let rv = obj.{mname}({call})")
                    lines.append(f"                results.append(OutputSerializer.serialize2DIntArray(rv))")
                elif mret == "Int?":
                    lines.append(f"                let rv = obj.{mname}({call})")
                    lines.append(f'                results.append(rv.map {{ "\\($0)" }} ?? "null")')
                else:
                    lines.append(f"                let rv = obj.{mname}({call})")
                    lines.append(f'                results.append("\\(rv)")')

            lines.append(f"            default:")
            lines.append(f'                results.append("null")')
            lines.append(f"            }}")
        else:
            lines.append(f'            results.append("null")')

        lines.append(f"        }}")
        lines.append(f"")
        lines.append(f'        let computedOutput = "[" + results.joined(separator: ",") + "]"')
        # Class-design outputs: always orderMatters=true (method call order matters)
        # Normalize null representations (nil/None/NULL -> null) and whitespace
        lines.append(f"        // Class-design comparison: normalize null representations and whitespace")
        lines.append(f"        func normalizeClassOutput(_ s: String) -> String {{")
        lines.append(f"            var result = s.replacingOccurrences(of: \" \", with: \"\")")
        lines.append(f'            result = result.replacingOccurrences(of: "nil", with: "null")')
        lines.append(f'            result = result.replacingOccurrences(of: "None", with: "null")')
        lines.append(f'            result = result.replacingOccurrences(of: "NULL", with: "null")')
        lines.append(f"            return result")
        lines.append(f"        }}")
        lines.append(f"        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)")
        for rl in _emit_record_call(
            "        ", computed_output="computedOutput",
            is_valid="true", status='matches ? "matched" : "mismatched"',
        ):
            lines.append(rl)
        lines.append(f'        #expect(matches, "Test \\(testId): \\(computedOutput)")')
    lines.append(f"    }}")
    lines.append(f"")

    lines.append("}")
    lines.append("")
    raw_output = "\n".join(lines)
    # Wrap in namespace enum for isolation (QUAL-01)
    return wrap_in_namespace(raw_output, slug)


def is_class_design_problem(slug: str, code: str, test_cases: List[dict]) -> bool:
    """Detect if a problem is a class design problem by checking test case format."""
    if slug in CLASS_DESIGN_SLUGS:
        return True
    # Check if first test case input has class design format:
    # Line 1: ["ClassName", "method1", "method2", ...]
    # Line 2: [[initArgs], [args1], [args2], ...]
    if test_cases:
        inp = test_cases[0].get("input", "")
        lines = [l.strip() for l in inp.split("\n") if l.strip()]
        if len(lines) >= 2:
            first_line = lines[0]
            second_line = lines[1]
            if (first_line.startswith("[\"") and not first_line.startswith("[[")
                    and second_line.startswith("[[")):
                # First element should be a class name (starts with uppercase)
                try:
                    methods = json.loads(first_line)
                    if methods and isinstance(methods[0], str) and methods[0][0].isupper():
                        return True
                except (json.JSONDecodeError, IndexError):
                    pass
    return False


# ─── Main ─────────────────────────────────────────────────────────────────────

def load_solutions(topic: str) -> Dict[str, dict]:
    """Load solutions for a topic. Returns {slug: {code, approaches}}."""
    path = SOLUTIONS_DIR / f"{topic}.json"
    if not path.exists():
        return {}
    with open(path) as f:
        data = json.load(f)

    result = {}
    for sol in data.get("solutions", []):
        slug = sol.get("problemSlug", "")
        approaches = sol.get("approaches", [])
        if not approaches:
            continue
        # Use the last (most efficient) approach
        best = approaches[-1]
        code = best.get("code", "")
        if not code:
            continue
        result[slug] = {"code": code, "approaches": approaches}
    return result


def load_test_cases(topic: str) -> Dict[str, List[dict]]:
    """Load test cases for a topic. Returns {slug: [test_cases]}."""
    path = TC_DIR / f"tc-{topic}.json"
    if not path.exists():
        return {}
    with open(path) as f:
        data = json.load(f)

    result = {}
    for prob in data.get("problems", []):
        slug = prob.get("problemSlug", "")
        tcs = prob.get("testCases", [])
        if tcs:
            result[slug] = tcs
    return result


def main():
    parser = argparse.ArgumentParser(
        description="Generate Swift Testing files for LeetCode problems"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        default=False,
        help="Generate parse-only test files that skip solution execution. "
             "Surfaces all parse failures quickly without waiting for solution runs."
    )
    args = parser.parse_args()
    dry_run = args.dry_run

    if dry_run:
        print("DRY-RUN MODE: Generated tests will parse inputs but skip solution execution")

    # Load quarantine list (replaces SQL_SLUGS)
    quarantine_slugs = load_quarantine()
    use_quarantine = quarantine_slugs is not None
    if use_quarantine:
        print(f"Quarantine loaded: {len(quarantine_slugs)} slugs to skip")
    else:
        print("WARNING: Using fallback SQL_SLUGS set (quarantine.json not available)")
        quarantine_slugs = set()  # Will use SQL_SLUGS below

    # Load metadata for non-Swift detection (replaces hardcoded SQL_SLUGS)
    problem_metadata = load_problem_metadata()
    if problem_metadata:
        print(f"Metadata loaded: {len(problem_metadata)} problems for non-Swift detection")

    stats = {
        "generated": 0,
        "skipped_quarantine": 0,
        "skipped_non_swift": 0,
        "skipped_sql_fallback": 0,
        "generated_design": 0,
        "skipped_no_solution": 0,
        "skipped_no_tests": 0,
        "skipped_parse_fail": 0,
        "skipped_unsupported_type": 0,
        "skipped_broken": 0,
        "total_test_methods": 0,
        "used_parsed_constraints": 0,
        "used_raw_constraints": 0,
    }

    # Load topics.json as single source of truth for topic configuration
    config = load_topics_config()
    topic_slugs = sorted(config["topicSlugMap"].values())
    print(f"Loaded topics.json: {len(topic_slugs)} topics")

    # Build difficulty map from all tc-*.json files
    difficulty_map = build_difficulty_map(TC_DIR)
    print(f"Built difficulty map: {len(difficulty_map)} problem entries")

    # Track which target directories have been cleaned this run
    cleaned_dirs = set()

    for topic in topic_slugs:
        print(f"\n{'='*60}")
        print(f"Processing topic: {topic}")
        print(f"{'='*60}")

        solutions = load_solutions(topic)
        test_cases = load_test_cases(topic)

        # Try to load structured parsed constraints first
        parsed_data = load_parsed_constraints(topic)
        if parsed_data:
            print(f"  Using parsed constraints from parsed-constraints-{topic}.json")
        else:
            print(f"  WARNING: parsed-constraints-{topic}.json not found, using raw constraints", file=sys.stderr)

        # Also load raw constraints as fallback
        raw_topic_constraints = load_constraints(topic)

        topic_generated = 0

        # Iterate over all problems with test cases
        all_slugs = set(solutions.keys()) | set(test_cases.keys())
        for slug in sorted(all_slugs):
            # Skip quarantined problems (replaces SQL_SLUGS check)
            if use_quarantine:
                if slug in quarantine_slugs:
                    stats["skipped_quarantine"] += 1
                    continue
                # Metadata-based non-Swift detection
                if problem_metadata:
                    prob_meta = problem_metadata.get(slug, {})
                    if prob_meta and not is_swift_eligible(prob_meta):
                        stats["skipped_non_swift"] += 1
                        continue
            else:
                # Fallback to old SQL_SLUGS behavior
                if slug in SQL_SLUGS:
                    stats["skipped_sql_fallback"] += 1
                    continue

            if slug in BROKEN_SOLUTION_SLUGS:
                stats["skipped_broken"] += 1
                continue

            sol = solutions.get(slug)
            tcs = test_cases.get(slug)

            if not sol:
                stats["skipped_no_solution"] += 1
                print(f"  SKIP {slug}: no solution code")
                continue
            if not tcs:
                stats["skipped_no_tests"] += 1
                print(f"  SKIP {slug}: no test cases")
                continue

            code = sol["code"]

            # Determine difficulty and target directory for this problem
            difficulty = difficulty_map.get((topic, slug), "medium")
            test_target = get_target_name(topic, difficulty, config)
            target_dir = TESTS_DIR / test_target
            target_dir.mkdir(parents=True, exist_ok=True)

            # Clean existing generated files from target dir (only first time encountered)
            if test_target not in cleaned_dirs:
                for f in target_dir.glob("*.swift"):
                    # Do NOT clean PlaceholderTests.swift files
                    if f.name == "PlaceholderTests.swift":
                        continue
                    f.unlink()
                cleaned_dirs.add(test_target)

            # Handle class design problems
            if is_class_design_problem(slug, code, tcs):
                slug_constraints = raw_topic_constraints.get(slug, [])
                swift_code = generate_class_design_test_file(slug, topic, code, tcs, constraints=slug_constraints, dry_run=dry_run)
                file_name = slug_to_class_name(slug)
                file_path = target_dir / f"{file_name}.swift"
                with open(file_path, "w") as f:
                    f.write(swift_code)
                stats["generated"] += 1
                stats["total_test_methods"] += len(tcs)
                topic_generated += 1
                stats["generated_design"] += 1
                print(f"  OK {slug}: {len(tcs)} tests (class design) -> {test_target}/{file_path.name}")
                continue

            sig = parse_func_signature(code)
            if not sig:
                stats["skipped_parse_fail"] += 1
                print(f"  SKIP {slug}: couldn't parse function signature")
                continue

            # Remap Node? to specific types for problems in NODE_TYPE_MAP
            node_type = NODE_TYPE_MAP.get(slug)
            if node_type:
                remapped_params = []
                for label, name, ptype in sig["params"]:
                    if ptype == "Node?":
                        remapped_params.append((label, name, f"{node_type}?"))
                    elif ptype == "[Node?]":
                        remapped_params.append((label, name, f"[{node_type}?]"))
                    elif ptype == "[Node]":
                        remapped_params.append((label, name, f"[{node_type}]"))
                    elif ptype == "[Employee]":
                        remapped_params.append((label, name, "[Employee]"))
                    else:
                        remapped_params.append((label, name, ptype))
                sig["params"] = remapped_params
                if sig["return_type"] == "Node?":
                    sig["return_type"] = f"{node_type}?"

            # Check if all param types are supported
            unsupported = False
            for label, name, ptype in sig["params"]:
                if param_parser(ptype, "x") is None:
                    stats["skipped_unsupported_type"] += 1
                    print(f"  SKIP {slug}: unsupported param type '{ptype}'")
                    unsupported = True
                    break
            if unsupported:
                continue

            # Determine constraint source: prefer parsed, fall back to raw
            slug_constraints = None
            parsed_problem = None
            if parsed_data:
                parsed_problems = parsed_data.get("problems", {})
                if slug in parsed_problems:
                    parsed_problem = parsed_problems[slug]
                    stats["used_parsed_constraints"] += 1

            if parsed_problem is None:
                # Fallback to raw constraints
                slug_constraints = raw_topic_constraints.get(slug, [])
                if slug_constraints:
                    stats["used_raw_constraints"] += 1

            # Generate test file -- topic slug stays as original (e.g., "arrays-hashing")
            swift_code = generate_test_file(
                slug, topic, code, tcs, sig,
                constraints=slug_constraints,
                parsed_constraints=parsed_problem,
                dry_run=dry_run,
            )
            class_name = slug_to_class_name(slug)
            file_path = target_dir / f"{class_name}.swift"
            with open(file_path, "w") as f:
                f.write(swift_code)

            stats["generated"] += 1
            stats["total_test_methods"] += len(tcs)
            topic_generated += 1
            print(f"  OK {slug}: {len(tcs)} tests -> {test_target}/{file_path.name}")

        print(f"  Topic total: {topic_generated} problems generated")

    print(f"\n{'='*60}")
    print("GENERATION COMPLETE")
    print(f"{'='*60}")
    print(f"  Generated:              {stats['generated']} problems")
    print(f"  Total test methods:     {stats['total_test_methods']}")
    if use_quarantine:
        print(f"  Skipped (quarantine):   {stats['skipped_quarantine']}")
        print(f"  Skipped (non-Swift):    {stats['skipped_non_swift']}")
    else:
        print(f"  Skipped (SQL fallback): {stats['skipped_sql_fallback']}")
    print(f"  Generated (class design): {stats['generated_design']}")
    print(f"  Skipped (no solution):  {stats['skipped_no_solution']}")
    print(f"  Skipped (no tests):     {stats['skipped_no_tests']}")
    print(f"  Skipped (parse fail):   {stats['skipped_parse_fail']}")
    print(f"  Skipped (unsup. type):  {stats['skipped_unsupported_type']}")
    print(f"  Skipped (broken code):  {stats['skipped_broken']}")
    print(f"  Constraints (parsed):   {stats['used_parsed_constraints']}")
    print(f"  Constraints (raw):      {stats['used_raw_constraints']}")


if __name__ == "__main__":
    main()
