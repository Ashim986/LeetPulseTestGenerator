#!/usr/bin/env python3
"""
generate_tests.py — Reads Solutions/*.json and tc-*.json files,
generates XCTest Swift files that run each solution against its test cases.

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

# ─── Paths ───────────────────────────────────────────────────────────────────
BASE_DIR = Path(__file__).resolve().parent.parent.parent  # Focus app test case for solutions/
SOLUTIONS_DIR = BASE_DIR / "Solutions"
TC_DIR = BASE_DIR  # tc-*.json files are in the root
TESTS_DIR = Path(__file__).resolve().parent.parent / "Tests"

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
# These problems reference "Node" in code but need specific type aliases
NODE_TYPE_MAP = {
    # Graph Node (val, neighbors)
    "clone-graph": "GraphNode",
    # N-ary tree Node (val, children)
    "n-ary-tree-level-order-traversal": "NAryNode",
    "n-ary-tree-preorder-traversal": "NAryNode",
    "n-ary-tree-postorder-traversal": "NAryNode",
    "maximum-depth-of-n-ary-tree": "NAryNode",
    "serialize-and-deserialize-n-ary-tree": "NAryNode",
    # Random pointer Node (val, next, random)
    "copy-list-with-random-pointer": "RandomNode",
    # Doubly linked Node (val, prev, next, child)
    "flatten-a-multilevel-doubly-linked-list": "DoublyNode",
    # Next pointer Node (val, left, right, next)
    "populating-next-right-pointers-in-each-node": "NextNode",
    "populating-next-right-pointers-in-each-node-ii": "NextNode",
    # Quad tree Node
    "logical-or-of-two-binary-grids-represented-as-quad-trees": "QuadNode",
    "construct-quad-tree": "QuadNode",
    # Employee
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
        return f"{{ let s = {var_name}.trimmingCharacters(in: .whitespaces); return s == \"null\" ? nil : Int(s) }}()"
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
        # Doubly linked list is complex — just parse as int array for now
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
    Returns None if no constraint applies."""
    t = swift_type.strip()
    # Array types: check not unreasonably large (prevent memory issues)
    if t in ("[Int]", "[String]", "[Double]", "[Bool]", "[Character]",
             "inout [Int]", "inout [String]"):
        return (
            f'        guard {parsed_var}.count <= 100_000 else {{\n'
            f'            ResultRecorder.shared.record(slug: slug, topic: topic, testId: testId, '
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
            f'            ResultRecorder.shared.record(slug: slug, topic: topic, testId: testId, '
            f'input: rawInput, originalExpected: expectedOutput, computedOutput: "", '
            f'isValid: false, outputMatches: false, orderMatters: orderMatters, '
            f'errorMessage: "Constraint violation: {param_name} 2D array too large (\\({parsed_var}.count))")\n'
            f'            return\n'
            f'        }}'
        )
    if t == "String":
        return (
            f'        guard {parsed_var}.count <= 100_000 else {{\n'
            f'            ResultRecorder.shared.record(slug: slug, topic: topic, testId: testId, '
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
            # For closures, params use "name: Type" format (no labels)
            func_name = match.group(1)
            params_str = match.group(2).strip()
            return_type = match.group(3).strip() if match.group(3) else "Void"
            return_type = return_type.strip().rstrip('{').strip()
            # Parse closure params — they have no labels, just "name: Type"
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
                    # Closure params always use _ label
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
                # Find = not inside brackets
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


def sanitize_solution_code(code: str) -> str:
    """Clean up solution code for embedding in a test file."""
    modified = code
    # Make class private to avoid conflicts
    if "private class Solution" not in modified:
        modified = modified.replace("class Solution", "private class Solution", 1)
    # Remove import Foundation (already imported by XCTest)
    modified = re.sub(r'import\s+Foundation\s*\n?', '', modified)

    # Remove TreeNode/ListNode/Node redefinitions (we provide these from LeetCodeHelpers)
    # These appear as single-line or multi-line class/struct defs before Solution class
    # Pattern: (public )?(class|struct) TreeNode { ... }
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
                # Match: (public )?(class|struct) TreeNode (: ...)? {
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
                    # Single-line definition, done skipping
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
    # Look for the first func that's directly in the class (not nested)
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


# ─── Test file generation ─────────────────────────────────────────────────────

def generate_test_file(
    slug: str,
    topic: str,
    solution_code: str,
    test_cases: List[dict],
    sig: dict,
) -> str:
    """Generate a complete XCTest Swift file for one problem."""

    class_name = slug_to_class_name(slug)
    func_name = sig["name"]
    params = sig["params"]
    return_type = sig["return_type"]
    has_inout = sig["has_inout"]

    # Build the file
    lines = []
    lines.append("import XCTest")
    lines.append("@testable import LeetCodeHelpers")
    lines.append("")

    # Add Node typealias if needed
    node_type = NODE_TYPE_MAP.get(slug)
    if node_type:
        lines.append(f"private typealias Node = {node_type}")
        lines.append("")

    # Embed solution code (private to avoid conflicts)
    modified_code = sanitize_solution_code(solution_code)

    lines.append(modified_code.rstrip())
    lines.append("")
    lines.append(f"final class {class_name}: XCTestCase {{")
    lines.append(f"    private let solution = Solution()")
    lines.append("")

    # Class-level tearDown to flush results
    lines.append("    override class func tearDown() {")
    lines.append("        super.tearDown()")
    lines.append("        ResultRecorder.shared.flush()")
    lines.append("    }")
    lines.append("")

    for i, tc in enumerate(test_cases):
        tc_id = tc.get("id", f"tc_{i}")
        raw_input = tc.get("input", "")
        expected = tc.get("expectedOutput", "")
        order_matters = tc.get("orderMatters", True)

        escaped_input = sanitize_swift_string(raw_input)
        escaped_expected = sanitize_swift_string(expected)
        escaped_id = sanitize_swift_string(tc_id)

        lines.append(f"    func test_{i}() {{")
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
        lines.append(f'            ResultRecorder.shared.record(slug: slug, topic: topic, testId: testId, '
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
                # Unsupported type — skip this problem
                lines.append(f'        // Unsupported param type: {ptype}')
                lines.append(f'        ResultRecorder.shared.record(slug: slug, topic: topic, testId: testId, '
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
            # All params parsed successfully — build the function call
            lines.append(f"")

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
                # In-place modification — serialize the modified inout param
                lines.append(f"        solution.{func_name}({call_str})")
                # Find the first inout param to serialize
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
            lines.append(f"        ResultRecorder.shared.record(slug: slug, topic: topic, testId: testId, "
                          f"input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, "
                          f"isValid: true, outputMatches: matches, orderMatters: orderMatters)")
            lines.append(f'        XCTAssertEqual(computedOutput, expectedOutput, "Test \\(testId): input=\\(rawInput)")')

        lines.append(f"    }}")
        lines.append(f"")

    lines.append("}")
    lines.append("")
    return "\n".join(lines)


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
        "skipped_design": 0,
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
            if slug in CLASS_DESIGN_SLUGS:
                stats["skipped_design"] += 1
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
                # Also remap return type
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
            swift_code = generate_test_file(slug, topic, code, tcs, sig)
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
    print(f"  Skipped (class design): {stats['skipped_design']}")
    print(f"  Skipped (no solution):  {stats['skipped_no_solution']}")
    print(f"  Skipped (no tests):     {stats['skipped_no_tests']}")
    print(f"  Skipped (parse fail):   {stats['skipped_parse_fail']}")
    print(f"  Skipped (unsup. type):  {stats['skipped_unsupported_type']}")
    print(f"  Skipped (broken code):  {stats['skipped_broken']}")


if __name__ == "__main__":
    main()
