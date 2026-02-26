#!/usr/bin/env python3
"""
generate_tests.py — Reads Solutions/*.json and tc-*.json files,
generates Swift Testing files that run each solution against its test cases.

Usage:
    python3 Scripts/generate_tests.py

Generates:
    Tests/<TopicTests>/<ProblemSlugTests>.swift   (one per problem)
"""

import json
import os
import re
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

# ─── Constraint loading ──────────────────────────────────────────────────────

def load_constraints(topic: str) -> Dict[str, List[str]]:
    """Load constraint text for each problem slug from constraints JSON.
    Returns {slug: [constraint_strings]}."""
    constraints_file = Path(__file__).resolve().parent.parent / "corrected" / f"constraints-{topic}.json"
    if not constraints_file.exists():
        return {}
    with open(constraints_file) as f:
        data = json.load(f)
    result = {}
    for slug, info in data.get("problems", {}).items():
        result[slug] = info.get("constraints", [])
    return result


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
            guard = (
                f'        guard {condition} else {{\n'
                f'            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, '
                f'input: rawInput, originalExpected: expectedOutput, computedOutput: "", '
                f'isValid: false, outputMatches: false, orderMatters: orderMatters, '
                f'errorMessage: "Constraint violation: {_escape_swift(c_text)}")\n'
                f'            return\n'
                f'        }}'
            )
            guards.append(guard)
    return guards


def _escape_swift(s: str) -> str:
    """Escape a string for Swift string literal."""
    return s.replace("\\", "\\\\").replace('"', '\\"')

# ─── Paths ───────────────────────────────────────────────────────────────────
PACKAGE_DIR = Path(__file__).resolve().parent.parent  # TestCaseEvaluator/
SOLUTIONS_DIR = PACKAGE_DIR.parent / "LeetPulse" / "LeetPulse" / "Resources" / "Solutions"
TC_DIR = PACKAGE_DIR / "corrected"
TESTS_DIR = PACKAGE_DIR / "Tests"

# ─── Topic mapping ───────────────────────────────────────────────────────────
TOPIC_TO_TEST_TARGET = {
    "arrays-hashing": "ArraysHashingTests",
    "backtracking": "BacktrackingTests",
    "binary-search": "BinarySearchTests",
    "bit-manipulation": "BitManipulationTests",
    "dynamic-programming": "DynamicProgrammingTests",
    "graphs": "GraphsTests",
    "greedy": "GreedyTests",
    "heap-priority-queue": "HeapPriorityQueueTests",
    "intervals": "IntervalsTests",
    "linked-list": "LinkedListTests",
    "math-geometry": "MathGeometryTests",
    "misc": "MiscTests",
    "sliding-window": "SlidingWindowTests",
    "stack": "StackTests",
    "trees": "TreesTests",
    "tries": "TriesTests",
    "two-pointers": "TwoPointersTests",
}

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
    "longest-word-in-dictionary", "map-sum-pairs", "replace-words",
    "short-encoding-of-words", "word-search-ii",
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

# ─── Swift type → parser/serializer mappings ─────────────────────────────────

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
        return f"InputParser.parseStringArray({var_name}).map {{ $0 == \"true\" }}"
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
        return f"buildTree(InputParser.parseNullableIntArray({var_name}))"
    if t == "ListNode?":
        return f"buildList(InputParser.parseIntArray({var_name}))"
    # inout variants — parse the same, just pass differently
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
    # Node variants
    if t == "Node?" or t == "GraphNode?":
        return f"buildGraph(InputParser.parse2DIntArray({var_name}))"
    if t == "NAryNode?":
        return f"buildNAryTree(InputParser.parseNullableIntArray({var_name}))"
    if t == "NextNode?":
        return f"buildNextTree(InputParser.parseNullableIntArray({var_name}))"
    if t == "RandomNode?":
        return f"buildRandomList(InputParser.parse2DIntArray({var_name}).map {{ $0.map {{ $0 == -1 ? nil : $0 }} as [Int?] }})"
    if t == "DoublyNode?":
        return f"{{ (_: String) -> DoublyNode? in nil }}({var_name})"
    if t == "QuadNode?":
        return f"{{ (_: String) -> QuadNode? in nil }}({var_name})"
    # Array of node pointers
    if t == "[ListNode?]":
        return f"InputParser.parse2DIntArray({var_name}).map {{ buildList($0) }}"
    # inout [Character]
    if t == "inout [Character]":
        return f"InputParser.parseCharacterArray({var_name})"
    # Employee array
    if t == "[Employee]":
        return f"InputParser.parse2DIntArray({var_name}).map {{ Employee($0[0], $0[1], Array($0.dropFirst(2))) }}"
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
    # Fallback
    return f'"\\({expr})"'


def constraint_check(swift_type: str, parsed_var: str, param_name: str) -> Optional[str]:
    """Return a Swift guard statement to validate common constraints.
    Returns None if no constraint applies. Uses async actor recording."""
    t = swift_type.strip()
    # Array types: check not unreasonably large (prevent memory issues)
    if t in ("[Int]", "[String]", "[Double]", "[Bool]", "[Character]",
             "inout [Int]", "inout [String]"):
        return (
            f'        guard {parsed_var}.count <= 100_000 else {{\n'
            f'            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, '
            f'input: rawInput, originalExpected: expectedOutput, computedOutput: "", '
            f'isValid: false, outputMatches: false, orderMatters: orderMatters, '
            f'errorMessage: "Constraint violation: {param_name} array too large (\\({parsed_var}.count))")\n'
            f'            return\n'
            f'        }}'
        )
    if t in ("[[Int]]", "[[String]]", "[[Character]]",
             "inout [[Int]]", "inout [[Character]]", "inout [[String]]"):
        return (
            f'        guard {parsed_var}.count <= 1000 else {{\n'
            f'            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, '
            f'input: rawInput, originalExpected: expectedOutput, computedOutput: "", '
            f'isValid: false, outputMatches: false, orderMatters: orderMatters, '
            f'errorMessage: "Constraint violation: {param_name} 2D array too large (\\({parsed_var}.count))")\n'
            f'            return\n'
            f'        }}'
        )
    if t == "String":
        return (
            f'        guard {parsed_var}.count <= 100_000 else {{\n'
            f'            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, '
            f'input: rawInput, originalExpected: expectedOutput, computedOutput: "", '
            f'isValid: false, outputMatches: false, orderMatters: orderMatters, '
            f'errorMessage: "Constraint violation: {param_name} string too long (\\({parsed_var}.count))")\n'
            f'            return\n'
            f'        }}'
        )
    return None


# ─── Function signature parser ────────────────────────────────────────────────

def parse_func_signature(code: str) -> Optional[dict]:
    """
    Parse the first public/internal func in a Solution class.
    Also handles closure syntax: let funcName = { (params) -> ReturnType in
    Returns {name, params: [(label, name, type)], return_type, has_inout}
    """
    # Try standard func syntax first
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


def sanitize_swift_string(s: str) -> str:
    """Escape a string for inclusion in Swift source. Handle all control chars."""
    result = s.replace("\\", "\\\\").replace('"', '\\"')
    result = result.replace("\n", "\\n").replace("\r", "\\r").replace("\t", "\\t")
    # Remove any remaining non-printable ASCII chars
    result = "".join(c if (ord(c) >= 32 or c in "\n\r\t") else f"\\u{{{ord(c):04x}}}" for c in result)
    return result


def sanitize_solution_code(code: str, slug: str = "", is_class_design: bool = False) -> str:
    """Clean up solution code for embedding in a test file."""
    modified = code
    # Make class private to avoid conflicts
    if "private class Solution" not in modified:
        modified = modified.replace("class Solution", "private class Solution", 1)
    # Remove import Foundation (already imported)
    modified = re.sub(r'import\s+Foundation\s*\n?', '', modified)

    # Rename TrieNode to a unique name per slug to avoid collisions across test files
    if "TrieNode" in modified and slug:
        unique_name = slug_to_class_name(slug).replace("Tests", "") + "TrieNode"
        modified = modified.replace("TrieNode", unique_name)

    # Remove TreeNode/ListNode/Node redefinitions (we provide these from LeetCodeHelpers)
    # For class design problems, keep Node since it may be an internal helper (e.g., doubly linked list node)
    types_to_strip = ["TreeNode", "ListNode"] if is_class_design else ["TreeNode", "ListNode", "Node"]
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
    return "\n".join(cleaned)


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
) -> str:
    """Generate a Swift Testing file for one problem."""

    class_name = slug_to_class_name(slug)
    func_name = sig["name"]
    params = sig["params"]
    return_type = sig["return_type"]
    has_inout = sig["has_inout"]

    # Build the file
    lines = []
    lines.append("import Foundation")
    lines.append("import Testing")
    lines.append("@testable import LeetCodeHelpers")
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

    for i, tc in enumerate(test_cases):
        tc_id = tc.get("id", f"tc_{i}")
        raw_input = tc.get("input", "")
        expected = tc.get("expectedOutput", "")
        order_matters = tc.get("orderMatters", True)

        escaped_input = sanitize_swift_string(raw_input)
        escaped_expected = sanitize_swift_string(expected)
        escaped_id = sanitize_swift_string(tc_id)

        lines.append(f"    @Test func test_{i}() async {{")
        lines.append(f'        let slug = "{slug}"')
        lines.append(f'        let topic = "{topic}"')
        lines.append(f'        let testId = "{escaped_id}"')
        lines.append(f'        let rawInput = "{escaped_input}"')
        lines.append(f'        let expectedOutput = "{escaped_expected}"')
        lines.append(f"        let orderMatters = {str(order_matters).lower()}")
        lines.append(f"")

        # Parse input params
        lines.append(f"        let params = InputParser.stripParamNames(rawInput)")
        lines.append(f"")

        # Guard: correct number of params
        lines.append(f"        guard params.count >= {len(params)} else {{")
        lines.append(f'            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, '
                      f'input: rawInput, originalExpected: expectedOutput, computedOutput: "", '
                      f'isValid: false, outputMatches: false, orderMatters: orderMatters, '
                      f'errorMessage: "Wrong number of params: expected {len(params)}, got \\(params.count)")')
        lines.append(f"            return")
        lines.append(f"        }}")
        lines.append(f"")

        # Parse each parameter
        param_vars = []
        for j, (label, name, ptype) in enumerate(params):
            var_name = f"p_{name}"
            parser = param_parser(ptype, f"params[{j}]")
            if parser is None:
                lines.append(f'        // Unsupported param type: {ptype}')
                lines.append(f'        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, '
                              f'input: rawInput, originalExpected: expectedOutput, computedOutput: "", '
                              f'isValid: false, outputMatches: false, orderMatters: orderMatters, '
                              f'errorMessage: "Unsupported param type: {ptype}")')
                lines.append(f"        return")
                param_vars.append((var_name, ptype, label))
                break

            is_inout = ptype.startswith("inout")
            let_or_var = "var" if is_inout else "let"
            lines.append(f"        {let_or_var} {var_name} = {parser}")

            # Constraint check
            check = constraint_check(ptype, var_name, name)
            if check:
                lines.append(check)

            param_vars.append((var_name, ptype, label))
        else:
            # All params parsed successfully — add constraint guards
            if constraints:
                constraint_guards = generate_constraint_guards(slug, constraints, param_vars)
                if constraint_guards:
                    lines.append(f"")
                    lines.append(f"        // Constraint precondition checks")
                    for guard_code in constraint_guards:
                        lines.append(guard_code)

            lines.append(f"")

            # Create solution instance locally (avoids Sendable issues)
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
            lines.append(f"        let matches = computedOutput == expectedOutput")
            lines.append(f"        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, "
                          f"input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, "
                          f"isValid: true, outputMatches: matches, orderMatters: orderMatters)")
            lines.append(f'        #expect(computedOutput == expectedOutput, "Test \\(testId): input=\\(rawInput)")')

        lines.append(f"    }}")
        lines.append(f"")

    lines.append("}")
    lines.append("")
    return "\n".join(lines)


# ─── Class design test generation ─────────────────────────────────────────────

def parse_class_methods(code: str) -> List[dict]:
    """Parse all methods from a class design solution.
    Returns [{name, params: [(label, name, type)], return_type}]."""
    methods = []
    # Find all func declarations at class level (depth 1 inside the design class)
    # Skip helper/private nested classes
    lines = code.split("\n")
    brace_depth = 0
    in_design_class = False
    design_class_depth = None

    for line in lines:
        stripped = line.strip()
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

        # Look for func at depth = design_class_depth + 1
        if in_design_class and design_class_depth is not None:
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
    """Find the design class name from solution code."""
    inner = re.findall(r'class\s+(\w+)\s*[\{:]', code)
    for c in inner:
        if c not in ("Solution", "Node"):
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
) -> str:
    """Generate a Swift Testing file for a class design problem."""
    class_name = slug_to_class_name(slug)
    _found_nested = find_design_class_name(solution_code)
    design_class = _found_nested if _found_nested else "Solution"
    solution_is_design_class = (_found_nested is None)  # Solution itself IS the design class

    # Parse methods for dispatch
    methods = parse_class_methods(solution_code)
    init_params = parse_init_params(solution_code, design_class)

    lines = []
    lines.append("import Foundation")
    lines.append("import Testing")
    lines.append("@testable import LeetCodeHelpers")
    lines.append("")

    # Embed solution code (keep Node for class design problems)
    modified_code = sanitize_solution_code(solution_code, slug=slug, is_class_design=True)
    lines.append(modified_code.rstrip())
    lines.append("")
    lines.append(f"@Suite struct {class_name} {{")
    lines.append(f"    init() {{ registerResultFlush() }}")
    lines.append("")

    for i, tc in enumerate(test_cases):
        tc_id = tc.get("id", f"tc_{i}")
        raw_input = tc.get("input", "")
        expected = tc.get("expectedOutput", "")
        order_matters = tc.get("orderMatters", True)

        escaped_input = sanitize_swift_string(raw_input)
        escaped_expected = sanitize_swift_string(expected)
        escaped_id = sanitize_swift_string(tc_id)

        lines.append(f"    @Test func test_{i}() async {{")
        lines.append(f'        let slug = "{slug}"')
        lines.append(f'        let topic = "{topic}"')
        lines.append(f'        let testId = "{escaped_id}"')
        lines.append(f'        let rawInput = "{escaped_input}"')
        lines.append(f'        let expectedOutput = "{escaped_expected}"')
        lines.append(f"        let orderMatters = {str(order_matters).lower()}")
        lines.append(f"")
        lines.append(f"        let inputLines = rawInput.components(separatedBy: \"\\n\")")
        lines.append(f"        guard inputLines.count >= 2 else {{")
        lines.append(f'            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, '
                      f'input: rawInput, originalExpected: expectedOutput, computedOutput: "", '
                      f'isValid: false, outputMatches: false, orderMatters: orderMatters, '
                      f'errorMessage: "Invalid class design input format")')
        lines.append(f"            return")
        lines.append(f"        }}")
        lines.append(f"")
        lines.append(f"        let methodNames = InputParser.parseStringArray(inputLines[0])")
        lines.append(f"        let argsList = InputParser.parseRawArgsList(inputLines[1])")
        lines.append(f"        guard methodNames.count == argsList.count, !methodNames.isEmpty else {{")
        lines.append(f'            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, '
                      f'input: rawInput, originalExpected: expectedOutput, computedOutput: "", '
                      f'isValid: false, outputMatches: false, orderMatters: orderMatters, '
                      f'errorMessage: "Methods/args count mismatch")')
        lines.append(f"            return")
        lines.append(f"        }}")
        lines.append(f"")

        # Generate init
        lines.append(f"        // Init")
        lines.append(f"        let initArgs = argsList[0]")
        if init_params:
            init_parsers = []
            for j, (label, name, ptype) in enumerate(init_params):
                p = param_parser(ptype, f"initArgs[{j}]")
                if p:
                    init_parsers.append((label, p))
                else:
                    init_parsers.append((label, f"initArgs[{j}]"))
            init_call_parts = []
            for label, parsed in init_parsers:
                if label == "_":
                    init_call_parts.append(parsed)
                else:
                    init_call_parts.append(f"{label}: {parsed}")
            init_call = ", ".join(init_call_parts)
            lines.append(f"        guard initArgs.count >= {len(init_params)} else {{ return }}")
            qual = design_class if solution_is_design_class else f"Solution.{design_class}"
            lines.append(f"        var obj = {qual}({init_call})")
        else:
            qual = design_class if solution_is_design_class else f"Solution.{design_class}"
            lines.append(f"        var obj = {qual}()")
        lines.append(f"")

        # Generate method dispatch loop
        lines.append(f"        var results: [String] = []")
        lines.append(f"        for i in 1..<methodNames.count {{")
        lines.append(f"            let m = methodNames[i]")
        lines.append(f"            let a = argsList[i]")

        # Build switch for each method
        if methods:
            lines.append(f"            switch m {{")
            for method in methods:
                mname = method["name"]
                mparams = method["params"]
                mret = method["return_type"]

                lines.append(f'            case "{mname}":')
                # Parse args for this method
                call_parts = []
                for j, (label, name, ptype) in enumerate(mparams):
                    p = param_parser(ptype, f"a[{j}]")
                    if not p:
                        p = f"a[{j}]"
                    if label == "_":
                        call_parts.append(p)
                    else:
                        call_parts.append(f"{label}: {p}")
                call = ", ".join(call_parts)

                if mret == "Void":
                    lines.append(f"                obj.{mname}({call})")
                    lines.append(f'                results.append("null")')
                elif mret == "Int":
                    lines.append(f"                let r = obj.{mname}({call})")
                    lines.append(f'                results.append("\\(r)")')
                elif mret == "Bool":
                    lines.append(f"                let r = obj.{mname}({call})")
                    lines.append(f'                results.append(r ? "true" : "false")')
                elif mret == "Double":
                    lines.append(f"                let r = obj.{mname}({call})")
                    lines.append(f"                results.append(OutputSerializer.serializeDouble(r))")
                elif mret == "String":
                    lines.append(f"                let r = obj.{mname}({call})")
                    lines.append(f'                results.append("\\(r)")')
                elif mret == "[Int]":
                    lines.append(f"                let r = obj.{mname}({call})")
                    lines.append(f"                results.append(OutputSerializer.serializeIntArray(r))")
                elif mret == "[[Int]]":
                    lines.append(f"                let r = obj.{mname}({call})")
                    lines.append(f"                results.append(OutputSerializer.serialize2DIntArray(r))")
                elif mret == "Int?":
                    lines.append(f"                let r = obj.{mname}({call})")
                    lines.append(f'                results.append(r != nil ? "\\(r!)" : "null")')
                else:
                    lines.append(f"                let r = obj.{mname}({call})")
                    lines.append(f'                results.append("\\(r)")')

            lines.append(f"            default:")
            lines.append(f'                results.append("null")')
            lines.append(f"            }}")
        else:
            lines.append(f'            results.append("null")')

        lines.append(f"        }}")
        lines.append(f"")
        lines.append(f'        let computedOutput = "[" + results.joined(separator: ",") + "]"')
        lines.append(f"        let matches = computedOutput == expectedOutput")
        lines.append(f"        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, "
                      f"input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, "
                      f"isValid: true, outputMatches: matches, orderMatters: orderMatters)")
        lines.append(f'        #expect(computedOutput == expectedOutput, "Test \\(testId): input=\\(rawInput)")')
        lines.append(f"    }}")
        lines.append(f"")

    lines.append("}")
    lines.append("")
    return "\n".join(lines)


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
    stats = {
        "generated": 0,
        "skipped_sql": 0,
        "generated_design": 0,
        "skipped_no_solution": 0,
        "skipped_no_tests": 0,
        "skipped_parse_fail": 0,
        "skipped_unsupported_type": 0,
        "skipped_broken": 0,
        "total_test_methods": 0,
    }

    for topic, test_target in sorted(TOPIC_TO_TEST_TARGET.items()):
        print(f"\n{'='*60}")
        print(f"Processing topic: {topic} -> {test_target}")
        print(f"{'='*60}")

        solutions = load_solutions(topic)
        test_cases = load_test_cases(topic)
        topic_constraints = load_constraints(topic)

        target_dir = TESTS_DIR / test_target
        target_dir.mkdir(parents=True, exist_ok=True)

        # Clean existing generated files
        for f in target_dir.glob("*.swift"):
            f.unlink()

        topic_generated = 0

        # Iterate over all problems with test cases
        all_slugs = set(solutions.keys()) | set(test_cases.keys())
        for slug in sorted(all_slugs):
            if slug in SQL_SLUGS:
                stats["skipped_sql"] += 1
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

            # Handle class design problems
            if is_class_design_problem(slug, code, tcs):
                slug_constraints = topic_constraints.get(slug, [])
                swift_code = generate_class_design_test_file(slug, topic, code, tcs, constraints=slug_constraints)
                file_name = slug_to_class_name(slug)
                file_path = target_dir / f"{file_name}.swift"
                with open(file_path, "w") as f:
                    f.write(swift_code)
                stats["generated"] += 1
                stats["total_test_methods"] += len(tcs)
                topic_generated += 1
                stats["generated_design"] += 1
                print(f"  OK {slug}: {len(tcs)} tests (class design) -> {file_path.name}")
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

            # Generate test file
            slug_constraints = topic_constraints.get(slug, [])
            swift_code = generate_test_file(slug, topic, code, tcs, sig, constraints=slug_constraints)
            class_name = slug_to_class_name(slug)
            file_path = target_dir / f"{class_name}.swift"
            with open(file_path, "w") as f:
                f.write(swift_code)

            stats["generated"] += 1
            stats["total_test_methods"] += len(tcs)
            topic_generated += 1
            print(f"  OK {slug}: {len(tcs)} tests -> {file_path.name}")

        print(f"  Topic total: {topic_generated} problems generated")

    print(f"\n{'='*60}")
    print("GENERATION COMPLETE")
    print(f"{'='*60}")
    print(f"  Generated:              {stats['generated']} problems")
    print(f"  Total test methods:     {stats['total_test_methods']}")
    print(f"  Skipped (SQL):          {stats['skipped_sql']}")
    print(f"  Generated (class design): {stats['generated_design']}")
    print(f"  Skipped (no solution):  {stats['skipped_no_solution']}")
    print(f"  Skipped (no tests):     {stats['skipped_no_tests']}")
    print(f"  Skipped (parse fail):   {stats['skipped_parse_fail']}")
    print(f"  Skipped (unsup. type):  {stats['skipped_unsupported_type']}")
    print(f"  Skipped (broken code):  {stats['skipped_broken']}")


if __name__ == "__main__":
    main()
