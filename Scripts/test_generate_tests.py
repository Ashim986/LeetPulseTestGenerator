"""
test_generate_tests.py -- pytest test suite for generate_tests.py

Covers:
- Formatting regression tests (missing-space bug prevention)
- Edge case tests for parsing, naming, and utility functions
- Guard-let closure parenthesization tests (Bug 1 prevention)
- Class-design generation correctness tests (Bug 2-4 prevention)
- Namespace isolation tests (QUAL-01: enum LC_{slug} wrapping)
"""

import os
import sys

# Ensure the Scripts directory is importable
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from generate_tests import (
    constraint_check,
    find_design_class_name,
    generate_class_design_test_file,
    generate_test_file,
    param_parser,
    parse_func_signature,
    parser_returns_optional,
    sanitize_solution_code,
    sanitize_swift_string,
    slug_to_class_name,
    slug_to_enum_name,
    _parse_number,
)


# ─── Formatting Regression Tests ─────────────────────────────────────────────


class TestFormatting:
    """Tests that prevent the missing-space formatting bug from recurring.

    The bug: f-string concatenation produced 'orderMatters: orderMatters,errorMessage:'
    instead of 'orderMatters: orderMatters, errorMessage:' in Swift output.
    """

    def test_constraint_check_formatting_int_array(self):
        """constraint_check for [Int] must produce ', errorMessage:' (with space)."""
        result = constraint_check("[Int]", "p_nums", "nums")
        assert result is not None
        assert "orderMatters: orderMatters, errorMessage:" in result
        assert "orderMatters: orderMatters,errorMessage:" not in result

    def test_constraint_check_formatting_2d_array(self):
        """constraint_check for [[Int]] must produce ', errorMessage:' (with space)."""
        result = constraint_check("[[Int]]", "p_matrix", "matrix")
        assert result is not None
        assert "orderMatters: orderMatters, errorMessage:" in result
        assert "orderMatters: orderMatters,errorMessage:" not in result

    def test_constraint_check_formatting_string(self):
        """constraint_check for String must produce ', errorMessage:' (with space)."""
        result = constraint_check("String", "p_s", "s")
        assert result is not None
        assert "orderMatters: orderMatters, errorMessage:" in result
        assert "orderMatters: orderMatters,errorMessage:" not in result

    def test_generate_test_file_no_missing_space(self):
        """Generated test file must not contain ',errorMessage' (without space)."""
        solution_code = """
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        return []
    }
}
"""
        sig = parse_func_signature(solution_code)
        assert sig is not None

        test_cases = [
            {
                "id": "tc_0",
                "input": "[2,7,11,15]\n9",
                "expectedOutput": "[0,1]",
                "orderMatters": False,
            }
        ]

        output = generate_test_file(
            slug="two-sum",
            topic="arrays-hashing",
            solution_code=solution_code,
            test_cases=test_cases,
            sig=sig,
        )

        assert ",errorMessage" not in output, (
            "Found ',errorMessage' without space in generated test file"
        )
        # Positive check: the correct pattern should appear
        assert ", errorMessage" in output or "orderMatters: orderMatters)" in output

    def test_class_design_no_missing_space(self):
        """Generated class design test file must not contain ',errorMessage'."""
        solution_code = """
class MyStack {
    var stack: [Int] = []
    init() {}
    func push(_ x: Int) { stack.append(x) }
    func pop() -> Int { return stack.removeLast() }
    func top() -> Int { return stack.last! }
    func empty() -> Bool { return stack.isEmpty }
}
"""
        test_cases = [
            {
                "id": "tc_0",
                "input": '["MyStack","push","push","top","pop","empty"]\n[[],[1],[2],[],[],[]]',
                "expectedOutput": '[null,null,null,2,2,false]',
                "orderMatters": True,
            }
        ]

        output = generate_class_design_test_file(
            slug="implement-stack-using-queues",
            topic="stack",
            solution_code=solution_code,
            test_cases=test_cases,
        )

        assert ",errorMessage" not in output, (
            "Found ',errorMessage' without space in generated class design test file"
        )


# ─── Edge Case Tests ─────────────────────────────────────────────────────────


class TestEdgeCases:
    """Tests for parsing, naming, and utility edge cases in the generator."""

    def test_slug_to_class_name_digit_prefix(self):
        """slug_to_class_name('3sum') should produce a valid Swift identifier."""
        result = slug_to_class_name("3sum")
        assert result == "LC3sumTests"
        # Must not start with a digit (Swift requirement)
        assert not result[0].isdigit()

    def test_parse_func_signature_basic(self):
        """Parse a basic two-parameter function returning [Int]."""
        code = """
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        return []
    }
}
"""
        sig = parse_func_signature(code)
        assert sig is not None
        assert sig["name"] == "twoSum"
        assert len(sig["params"]) == 2
        assert sig["params"][0] == ("_", "nums", "[Int]")
        assert sig["params"][1] == ("_", "target", "Int")
        assert sig["return_type"] == "[Int]"
        assert sig["has_inout"] is False

    def test_parse_func_signature_inout(self):
        """Parse a function with inout parameter."""
        code = """
class Solution {
    func sortColors(_ nums: inout [Int]) {
        nums.sort()
    }
}
"""
        sig = parse_func_signature(code)
        assert sig is not None
        assert sig["name"] == "sortColors"
        assert len(sig["params"]) == 1
        assert sig["params"][0][2] == "inout [Int]"
        assert sig["has_inout"] is True

    def test_parse_func_signature_void(self):
        """Parse a function with no return type (Void)."""
        code = """
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        // rotate in place
    }
}
"""
        sig = parse_func_signature(code)
        assert sig is not None
        assert sig["return_type"] == "Void"

    def test_sanitize_swift_string_special_chars(self):
        """Verify backslash, quote, and newline escaping."""
        # Backslash
        assert "\\\\" in sanitize_swift_string("hello\\world")
        # Double quote
        assert '\\"' in sanitize_swift_string('say "hi"')
        # Newline
        assert "\\n" in sanitize_swift_string("line1\nline2")

    def test_parser_returns_optional_bool_string(self):
        """Bool and String parsers return False (non-optional)."""
        assert parser_returns_optional("Bool") is False
        assert parser_returns_optional("String") is False

    def test_parser_returns_optional_int_array(self):
        """Int and [Int] parsers return True (optional)."""
        assert parser_returns_optional("Int") is True
        assert parser_returns_optional("[Int]") is True

    def test_parse_number_exponents(self):
        """_parse_number('10^5') should return 100000."""
        assert _parse_number("10^5") == 100000
        assert _parse_number("2^10") == 1024

    def test_parse_number_double_star(self):
        """_parse_number('10**5') should return 100000."""
        assert _parse_number("10**5") == 100000

    def test_parse_number_plain(self):
        """_parse_number('42') should return 42."""
        assert _parse_number("42") == 42

    def test_slug_to_class_name_normal(self):
        """Normal slug converts to PascalCase + Tests suffix."""
        assert slug_to_class_name("two-sum") == "TwoSumTests"
        assert slug_to_class_name("longest-substring-without-repeating-characters") == (
            "LongestSubstringWithoutRepeatingCharactersTests"
        )


# ─── Guard-Let Closure Parenthesization Tests ──────────────────────────────


class TestGuardLetClosures:
    """Tests that all .map closures in param_parser use parenthesized form.

    Bug 1: Swift disallows trailing closures inside guard-let statements.
    All `.map { ... }` must be `.map({ ... })` to compile in guard-let context.
    """

    def test_param_parser_tree_node_parenthesized(self):
        """TreeNode? parser must use .map({ ... }) not .map { ... }."""
        result = param_parser("TreeNode?", "x")
        assert result is not None
        assert ".map({" in result, f"Expected .map({{ in: {result}"
        assert ".map {" not in result.replace(".map({", "")

    def test_param_parser_list_node_parenthesized(self):
        """ListNode? parser must use .map({ ... }) not .map { ... }."""
        result = param_parser("ListNode?", "x")
        assert result is not None
        assert ".map({" in result, f"Expected .map({{ in: {result}"
        assert ".map {" not in result.replace(".map({", "")

    def test_param_parser_graph_node_parenthesized(self):
        """Node?/GraphNode? parser must use .map({ ... }) not .map { ... }."""
        for t in ("Node?", "GraphNode?"):
            result = param_parser(t, "x")
            assert result is not None
            assert ".map({" in result, f"Expected .map({{ for {t} in: {result}"

    def test_param_parser_nary_node_parenthesized(self):
        """NAryNode? parser must use .map({ ... }) not .map { ... }."""
        result = param_parser("NAryNode?", "x")
        assert result is not None
        assert ".map({" in result, f"Expected .map({{ in: {result}"

    def test_param_parser_bool_array_parenthesized(self):
        """[Bool] parser must use ?.map({ ... }) not ?.map { ... }."""
        result = param_parser("[Bool]", "x")
        assert result is not None
        assert ".map({" in result, f"Expected .map({{ in: {result}"

    def test_param_parser_list_node_array_parenthesized(self):
        """[ListNode?] parser must use .map({ ... }) for both outer and inner .map."""
        result = param_parser("[ListNode?]", "x")
        assert result is not None
        # Should have two .map({ occurrences (outer and inner)
        assert result.count(".map(") >= 2, f"Expected 2+ .map( in: {result}"
        assert ".map {" not in result

    def test_all_map_calls_parenthesized(self):
        """All types that use .map in param_parser must use parenthesized form."""
        types_with_map = [
            "TreeNode?", "ListNode?", "Node?", "GraphNode?",
            "NAryNode?", "NextNode?", "RandomNode?",
            "[Bool]", "[ListNode?]", "[Employee]",
        ]
        for t in types_with_map:
            result = param_parser(t, "x")
            assert result is not None, f"param_parser returned None for {t}"
            # Check that no .map is followed by space+brace (trailing closure)
            import re
            trailing = re.findall(r'\.map\s*\{', result)
            assert not trailing, (
                f"Type {t} has trailing closure in: {result}"
            )


# ─── Class Design Fix Tests ────────────────────────────────────────────────


class TestClassDesignFixes:
    """Tests for class-design generation correctness after bug fixes.

    Bug 2: TrieNode rename must be consistent between sanitized code and design class.
    Bug 3: Optional-returning parsers must be unwrapped in method dispatch.
    Bug 4: Node class definitions must be preserved for class-design problems.
    """

    def test_class_design_trie_node_rename_consistent(self):
        """Class-design init must use post-sanitization class name for Trie problems."""
        code = """class Solution {
    class MagicDictionary {
        var root = TrieNode()
        func buildDictionary(_ dictionary: [String]) {}
        func search(_ searchWord: String) -> Bool { return false }
    }
    class TrieNode {
        var children: [TrieNode?] = Array(repeating: nil, count: 26)
        var isEnd: Bool = false
    }
}"""
        test_cases = [{
            "id": "tc_0",
            "input": '["MagicDictionary","buildDictionary","search"]\n[[],[["hello"]],["hello"]]',
            "expectedOutput": "[null,null,false]",
            "orderMatters": True,
        }]

        output = generate_class_design_test_file(
            slug="implement-magic-dictionary",
            topic="tries",
            solution_code=code,
            test_cases=test_cases,
        )

        # The TrieNode should be renamed in the embedded code
        assert "ImplementMagicDictionaryTrieNode" in output
        # Original TrieNode should NOT appear in class definitions
        assert "class TrieNode" not in output
        # The init should use MagicDictionary (the real design class), not the renamed TrieNode
        assert "Solution.MagicDictionary(" in output or "MagicDictionary(" in output

    def test_class_design_int_optional_unwrap(self):
        """Class-design method dispatch must force-unwrap Optional parser results."""
        code = """class Solution {
    class RecentCounter {
        var queue: [Int] = []
        init() {}
        func ping(_ t: Int) -> Int {
            queue.append(t)
            while queue.first! < t - 3000 { queue.removeFirst() }
            return queue.count
        }
    }
}"""
        test_cases = [{
            "id": "tc_0",
            "input": '["RecentCounter","ping","ping"]\n[[],[1],[100]]',
            "expectedOutput": "[null,1,2]",
            "orderMatters": True,
        }]

        output = generate_class_design_test_file(
            slug="number-of-recent-calls",
            topic="stack",
            solution_code=code,
            test_cases=test_cases,
        )

        # parseInt returns Optional -- must be force-unwrapped for ping(_ t: Int)
        assert "(InputParser.parseInt(a[0]))!" in output, (
            "Expected force-unwrap of parseInt in method dispatch"
        )

    def test_class_design_node_preserved(self):
        """sanitize_solution_code with is_class_design=True must keep Node class."""
        code = """class Solution {
    class MyCircularDeque {
        class Node {
            var val: Int
            var prev: Node?
            var next: Node?
            init(_ val: Int) { self.val = val }
        }
        var head: Node?
        var capacity: Int
        init(_ k: Int) { capacity = k }
    }
}"""
        sanitized = sanitize_solution_code(code, slug="design-circular-deque", is_class_design=True)
        assert "class Node" in sanitized, "Node class should be preserved for class-design"
        assert "class MyCircularDeque" in sanitized

    def test_class_design_node_stripped_non_class_design(self):
        """sanitize_solution_code with is_class_design=False must strip Node class."""
        code = """class Solution {
    func cloneGraph(_ node: Node?) -> Node? { return nil }
}
class Node {
    var val: Int
    var neighbors: [Node?]
    init(_ val: Int) { self.val = val; self.neighbors = [] }
}"""
        sanitized = sanitize_solution_code(code, slug="clone-graph", is_class_design=False)
        assert "class Node" not in sanitized, "Node class should be stripped for non-class-design"

    def test_class_design_trie_with_node_helper(self):
        """Trie solution with internal Node class: Node replaced with TrieNode for TRIE_NODE_ALIAS_SLUGS, Trie is design class."""
        code = """class Solution {
    class Trie {
        private let root = Node()
        func insert(_ word: String) {}
        func search(_ word: String) -> Bool { return false }
        func startsWith(_ prefix: String) -> Bool { return false }
    }
    class Node {
        var children: [Node?] = Array(repeating: nil, count: 26)
        var isEnd: Bool = false
    }
}"""
        sanitized = sanitize_solution_code(code, slug="implement-trie-prefix-tree", is_class_design=True)
        design_class = find_design_class_name(sanitized)
        assert design_class == "Trie", f"Design class should be Trie, got {design_class}"
        # Node is replaced with TrieNode for TRIE_NODE_ALIAS_SLUGS (uses shared LeetCodeHelpers type)
        assert "class TrieNode" in sanitized, "Node should be replaced with TrieNode for trie alias slugs"
        assert "class Node" not in sanitized, "Bare Node should not remain for trie alias slugs"

    def test_class_design_init_unwraps_optional_params(self):
        """Class-design init with Int param must force-unwrap the parser result."""
        code = """class Solution {
    class MyCircularDeque {
        var capacity: Int
        init(_ k: Int) { capacity = k }
        func insertFront(_ value: Int) -> Bool { return false }
    }
}"""
        test_cases = [{
            "id": "tc_0",
            "input": '["MyCircularDeque","insertFront"]\n[[3],[1]]',
            "expectedOutput": "[null,true]",
            "orderMatters": True,
        }]

        output = generate_class_design_test_file(
            slug="design-circular-deque",
            topic="design",
            solution_code=code,
            test_cases=test_cases,
        )

        # Init param k: Int should have force-unwrapped parseInt
        assert "(InputParser.parseInt(initArgs[0]))!" in output, (
            "Expected force-unwrap of parseInt in init args"
        )


# ─── Namespace Isolation Tests (QUAL-01) ─────────────────────────────────────


class TestNamespaceIsolation:
    """Tests for enum LC_{slug} namespace wrapping (QUAL-01).

    All generated test files must wrap Solution class and test struct
    inside an enum namespace to prevent type collisions across targets.
    """

    # Shared fixtures
    _standard_code = """
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        return []
    }
}
"""
    _standard_tcs = [
        {
            "id": "tc_0",
            "input": "[2,7,11,15]\n9",
            "expectedOutput": "[0,1]",
            "orderMatters": False,
        }
    ]

    _class_design_code = """class Solution {
    class MyStack {
        var stack: [Int] = []
        init() {}
        func push(_ x: Int) { stack.append(x) }
        func pop() -> Int { return stack.removeLast() }
        func top() -> Int { return stack.last! }
        func empty() -> Bool { return stack.isEmpty }
    }
}"""
    _class_design_tcs = [
        {
            "id": "tc_0",
            "input": '["MyStack","push","push","top","pop","empty"]\n[[],[1],[2],[],[],[]]',
            "expectedOutput": "[null,null,null,2,2,false]",
            "orderMatters": True,
        }
    ]

    def test_generated_output_wrapped_in_enum(self):
        """Generated test file for a known slug must contain enum LC_{slug} {."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        assert "enum LC_two_sum {" in output, (
            "Output must contain 'enum LC_two_sum {'"
        )

    def test_namespace_enum_name_format(self):
        """slug_to_enum_name must replace hyphens with underscores and add LC_ prefix."""
        assert slug_to_enum_name("two-sum") == "LC_two_sum"
        assert slug_to_enum_name("sort-list") == "LC_sort_list"
        assert slug_to_enum_name("3sum") == "LC_3sum"
        assert slug_to_enum_name("design-add-and-search-words-data-structure") == (
            "LC_design_add_and_search_words_data_structure"
        )
        assert slug_to_enum_name("longest-substring-without-repeating-characters") == (
            "LC_longest_substring_without_repeating_characters"
        )

    def test_solution_class_inside_enum(self):
        """Solution class must be indented inside the enum namespace."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        lines = output.split("\n")
        in_enum = False
        found_solution = False
        for line in lines:
            if "enum LC_two_sum {" in line:
                in_enum = True
                continue
            if in_enum and "class Solution" in line:
                found_solution = True
                assert line.startswith("    "), (
                    f"Solution class must be indented inside enum: {repr(line)}"
                )
                break
        assert found_solution, "Solution class not found inside enum"

    def test_test_function_is_static(self):
        """@Test function inside enum must be static."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        assert "@Test static func" in output, (
            "Test function inside enum must use '@Test static func'"
        )
        # Ensure no non-static @Test func remains
        lines = output.split("\n")
        in_enum = False
        for line in lines:
            if "enum LC_" in line:
                in_enum = True
            if in_enum and "@Test func" in line and "static" not in line:
                assert False, f"Found non-static @Test func inside enum: {repr(line)}"

    def test_class_design_namespaced(self):
        """Class-design output must also use namespace wrapping."""
        output = generate_class_design_test_file(
            slug="implement-stack-using-queues", topic="stack",
            solution_code=self._class_design_code,
            test_cases=self._class_design_tcs,
        )
        assert "enum LC_implement_stack_using_queues {" in output, (
            "Class-design output must have namespace enum"
        )
        assert "@Test static func" in output, (
            "Class-design test function must be static inside enum"
        )

    def test_imports_outside_enum(self):
        """Import statements must appear before the enum, not inside it."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        lines = output.split("\n")
        enum_line_idx = None
        for i, line in enumerate(lines):
            if "enum LC_" in line:
                enum_line_idx = i
                break
        assert enum_line_idx is not None, "enum LC_ not found in output"

        # All import lines must come before the enum
        for i, line in enumerate(lines):
            stripped = line.strip()
            if stripped.startswith("import ") or stripped.startswith("@testable import"):
                assert i < enum_line_idx, (
                    f"Import on line {i} appears after enum on line {enum_line_idx}: {repr(line)}"
                )
        # No import inside enum
        for i in range(enum_line_idx, len(lines)):
            stripped = lines[i].strip()
            if stripped.startswith("import ") or stripped.startswith("@testable import"):
                assert False, (
                    f"Import found inside enum on line {i}: {repr(lines[i])}"
                )
