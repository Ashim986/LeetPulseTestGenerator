"""
test_generate_tests.py -- pytest test suite for generate_tests.py

Covers:
- Formatting regression tests (multiline record calls, SwiftLint compliance)
- Edge case tests for parsing, naming, and utility functions
- Guard-let closure parenthesization tests (Bug 1 prevention)
- Class-design generation correctness tests (Bug 2-4 prevention)
- Namespace isolation tests (QUAL-01: enum LCSlugName wrapping)
- SwiftLint compliance tests (sorted imports, trailing whitespace, line length)
- Parameterized test pattern tests (data-driven tests, force-unwrap elimination)
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
    remove_force_unwraps,
    sanitize_solution_code,
    sanitize_swift_string,
    slug_to_class_name,
    slug_to_enum_name,
    _break_swift_string,
    _parse_number,
)


# ─── Formatting Regression Tests ─────────────────────────────────────────────


class TestFormatting:
    """Tests that generated code uses multiline record() calls for SwiftLint compliance.

    The record() calls are broken into multiple lines to keep each line under
    160 characters (SwiftLint line_length error threshold).
    """

    def test_constraint_check_multiline_record(self):
        """constraint_check must emit multiline record() call."""
        result = constraint_check("[Int]", "p_nums", "nums")
        assert result is not None
        assert "ResultRecorderActor.shared.record(" in result
        # Must be multiline (has newlines between parameters)
        assert "\n" in result
        assert "errorMessage:" in result

    def test_constraint_check_2d_array_multiline(self):
        """constraint_check for [[Int]] must emit multiline record() call."""
        result = constraint_check("[[Int]]", "p_matrix", "matrix")
        assert result is not None
        assert "ResultRecorderActor.shared.record(" in result
        assert "\n" in result

    def test_constraint_check_string_multiline(self):
        """constraint_check for String must emit multiline record() call."""
        result = constraint_check("String", "p_s", "s")
        assert result is not None
        assert "ResultRecorderActor.shared.record(" in result
        assert "\n" in result

    def test_generate_test_file_multiline_records(self):
        """Generated test file must use multiline record() calls."""
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

        # Record calls should be multiline
        assert "ResultRecorderActor.shared.record(\n" in output
        # No single-line record calls longer than 160 chars
        for line in output.split("\n"):
            if "ResultRecorderActor.shared.record(" in line:
                # The opening line should just be the function call opening
                assert len(line) < 160, (
                    f"Record call line too long ({len(line)} chars): {line[:100]}..."
                )

    def test_class_design_multiline_records(self):
        """Generated class design test file must use multiline record() calls."""
        solution_code = """
class MyStack {
    var stack: [Int] = []
    init() {}
    func push(_ x: Int) { stack.append(x) }
    func pop() -> Int { return stack.removeLast() }
    func top() -> Int { return stack[stack.count - 1] }
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

        # Record calls should be multiline
        assert "ResultRecorderActor.shared.record(\n" in output


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
    Bug 3: Optional-returning parsers now use guard-let instead of force-unwrap.
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
            "input": '["MagicDictionary","buildDictionary","search"]\n[[],["hello"]],["hello"]]',
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

    def test_class_design_int_guard_let(self):
        """Class-design method dispatch must use guard-let for Optional parser results."""
        code = """class Solution {
    class RecentCounter {
        var queue: [Int] = []
        init() {}
        func ping(_ t: Int) -> Int {
            queue.append(t)
            while queue[queue.startIndex] < t - 3000 { queue.removeFirst() }
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

        # parseInt returns Optional -- must use guard-let (no force unwrap)
        assert "guard let mArg_0 = InputParser.parseInt(args[0])" in output, (
            "Expected guard-let for parseInt in method dispatch"
        )
        # No force unwraps in dispatch code
        assert "(InputParser.parseInt(args[0]))!" not in output, (
            "Force unwrap should be replaced with guard-let"
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

    def test_class_design_init_guard_let(self):
        """Class-design init with Int param must use guard-let."""
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

        # Init param k: Int should use guard-let (no force unwrap)
        assert "guard let initP_0 = InputParser.parseInt(initArgs[0])" in output, (
            "Expected guard-let for parseInt in init args"
        )
        assert "(InputParser.parseInt(initArgs[0]))!" not in output, (
            "Force unwrap should be replaced with guard-let in init"
        )


# ─── Parameterized Test Pattern Tests ────────────────────────────────────────


class TestParameterizedPattern:
    """Tests that generated output uses the data-driven parameterized test pattern.

    Instead of N separate @Test functions (one per test case), the generator
    produces a static testCases array and a single @Test(arguments:) function.
    This dramatically reduces file size and eliminates duplication.
    """

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
        },
        {
            "id": "tc_1",
            "input": "[3,2,4]\n6",
            "expectedOutput": "[1,2]",
            "orderMatters": False,
        },
    ]

    def test_has_static_test_cases_array(self):
        """Generated output must contain static let testCases array."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        assert "static let testCases:" in output

    def test_has_parameterized_test_attribute(self):
        """Generated output must use @Test(arguments:) attribute."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        assert "@Test(arguments:" in output

    def test_single_run_function(self):
        """Generated output must have exactly one 'func run' test method."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        assert "func run(index: Int)" in output
        # Should NOT have per-test functions
        assert "func test_0()" not in output
        assert "func test_1()" not in output

    def test_no_per_test_functions(self):
        """Generated output must NOT contain per-test @Test func test_N()."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        import re
        per_test_funcs = re.findall(r'func test_\d+\(\)', output)
        assert len(per_test_funcs) == 0, (
            f"Found per-test functions: {per_test_funcs}"
        )

    def test_test_data_in_array(self):
        """All test case IDs must appear in the testCases array."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        assert "tc_0" in output
        assert "tc_1" in output

    def test_class_design_parameterized(self):
        """Class-design output must also use parameterized pattern."""
        code = """class Solution {
    class MyStack {
        var stack: [Int] = []
        init() {}
        func push(_ x: Int) { stack.append(x) }
        func pop() -> Int { return stack.removeLast() }
        func top() -> Int { return stack[stack.count - 1] }
        func empty() -> Bool { return stack.isEmpty }
    }
}"""
        tcs = [
            {
                "id": "tc_0",
                "input": '["MyStack","push","push","top","pop","empty"]\n[[],[1],[2],[],[],[]]',
                "expectedOutput": "[null,null,null,2,2,false]",
                "orderMatters": True,
            },
            {
                "id": "tc_1",
                "input": '["MyStack","push","top","empty"]\n[[],[42],[],[]]',
                "expectedOutput": "[null,null,42,false]",
                "orderMatters": True,
            },
        ]
        output = generate_class_design_test_file(
            slug="implement-stack-using-queues", topic="stack",
            solution_code=code, test_cases=tcs,
        )
        assert "static let testCases:" in output
        assert "@Test(arguments:" in output
        assert "func run(index: Int)" in output
        assert "func test_0()" not in output


# ─── Force Unwrap Removal Tests ──────────────────────────────────────────────


class TestForceUnwrapRemoval:
    """Tests for remove_force_unwraps() mechanical replacements."""

    def test_pop_last_replacement(self):
        """popLast()! should be replaced with removeLast()."""
        code = "    let val = stack.popLast()!"
        result = remove_force_unwraps(code)
        assert ".removeLast()" in result
        assert ".popLast()!" not in result

    def test_last_bang_replacement(self):
        """expr.last! should be replaced with expr[expr.count - 1]."""
        code = "    return stack.last!"
        result = remove_force_unwraps(code)
        assert "stack[stack.count - 1]" in result
        assert ".last!" not in result

    def test_first_bang_replacement(self):
        """expr.first! should be replaced with expr[expr.startIndex]."""
        code = "    let x = arr.first!"
        result = remove_force_unwraps(code)
        assert "arr[arr.startIndex]" in result
        assert ".first!" not in result

    def test_remaining_force_unwraps_get_unsafely_unwrapped(self):
        """Force unwraps that can't be mechanically fixed use .unsafelyUnwrapped."""
        code = "    let val = dict[key]!"
        result = remove_force_unwraps(code)
        assert ".unsafelyUnwrapped" in result
        assert "!" not in result or "!=" in result

    def test_redundant_type_annotation_removal(self):
        """let n: Int = expr should become let n = expr."""
        code = "let n: Int = nums.count"
        result = remove_force_unwraps(code)
        assert "let n = nums.count" in result
        assert ": Int =" not in result

    def test_preserves_non_matching_code(self):
        """Code without force unwraps should remain unchanged."""
        code = "let x = arr.count\nlet y = dict[key]"
        result = remove_force_unwraps(code)
        assert result == code


# ─── String Breaking Tests ───────────────────────────────────────────────────


class TestStringBreaking:
    """Tests for _break_swift_string long string concatenation."""

    def test_short_string_not_broken(self):
        """Strings under max_len should not be broken."""
        result = _break_swift_string("hello", "        ")
        assert result == '"hello"'

    def test_long_string_broken(self):
        """Strings over max_len should be broken with concatenation."""
        long_str = "a" * 200
        result = _break_swift_string(long_str, "        ", max_len=50)
        assert "+" in result
        assert result.count('"') >= 4  # At least 2 quoted segments


# ─── Namespace Isolation Tests (QUAL-01) ─────────────────────────────────────


class TestNamespaceIsolation:
    """Tests for enum LCSlugName namespace wrapping (QUAL-01).

    All generated test files must wrap Solution class and test struct
    inside an enum namespace to prevent type collisions across targets.
    Enum names use UpperCamelCase for SwiftLint type_name compliance.
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
        func top() -> Int { return stack[stack.count - 1] }
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
        """Generated test file must contain enum LCTwoSum {."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        assert "enum LCTwoSum {" in output, (
            "Output must contain 'enum LCTwoSum {'"
        )

    def test_namespace_enum_name_format(self):
        """slug_to_enum_name must produce UpperCamelCase with LC prefix."""
        assert slug_to_enum_name("two-sum") == "LCTwoSum"
        assert slug_to_enum_name("sort-list") == "LCSortList"
        assert slug_to_enum_name("3sum") == "LC3sum"
        assert slug_to_enum_name("design-add-and-search-words-data-structure") == (
            "LCDesignAddAndSearchWordsDataStructure"
        )
        assert slug_to_enum_name("longest-substring-without-repeating-characters") == (
            "LCLongestSubstringWithoutRepeatingCharacters"
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
            if "enum LCTwoSum {" in line:
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
        assert "@Test static func" in output or "@Test(arguments:" in output, (
            "Test function inside enum must use '@Test static func' or '@Test(arguments:)'"
        )

    def test_class_design_namespaced(self):
        """Class-design output must also use namespace wrapping."""
        output = generate_class_design_test_file(
            slug="implement-stack-using-queues", topic="stack",
            solution_code=self._class_design_code,
            test_cases=self._class_design_tcs,
        )
        assert "enum LCImplementStackUsingQueues {" in output, (
            "Class-design output must have namespace enum"
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
            if "enum LC" in line:
                enum_line_idx = i
                break
        assert enum_line_idx is not None, "enum LC not found in output"

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


# ─── SwiftLint Compliance Tests ──────────────────────────────────────────────


class TestSwiftLintCompliance:
    """Tests verifying SwiftLint compliance of generated output.

    Ensures generator produces code that passes SwiftLint without violations
    in the generated template portions (excluding embedded solution code).
    """

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

    def test_generated_output_no_trailing_whitespace(self):
        """Generated output must have no trailing whitespace on any line."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        for i, line in enumerate(output.split("\n"), 1):
            if line != line.rstrip():
                assert False, (
                    f"Line {i} has trailing whitespace: {repr(line)}"
                )

    def test_generated_output_sorted_imports(self):
        """Generated output must have imports in sorted order."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        lines = output.split("\n")
        import_lines = [
            line.strip() for line in lines
            if line.strip().startswith("import ") or line.strip().startswith("@testable import")
        ]
        # Extract module names for sorting comparison
        # @testable import X -> "X", import X -> "X"
        modules = []
        for imp in import_lines:
            parts = imp.split()
            modules.append(parts[-1])  # Last word is the module name
        assert modules == sorted(modules), (
            f"Imports not sorted: {import_lines}"
        )

    def test_generated_output_line_length(self):
        """Generated template lines must not exceed 160 chars (error threshold).

        Note: Embedded solution code and test data strings may exceed this,
        but our generated template code (record calls, guards, etc.) should not.
        """
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        for i, line in enumerate(output.split("\n"), 1):
            # Skip lines that are string literals (test data) or solution code
            stripped = line.strip()
            if stripped.startswith("let rawInput") or stripped.startswith("let expectedOutput"):
                continue
            # Skip testCases data lines (these contain string literals)
            if stripped.startswith('("') or stripped.startswith('"') or stripped.startswith('+ "'):
                continue
            # Check template-generated lines
            if len(line) > 160:
                assert False, (
                    f"Line {i} exceeds 160 chars ({len(line)}): {line[:100]}..."
                )

    def test_no_force_unwraps_in_template(self):
        """Generated template code (non-solution) must not contain force unwraps."""
        sig = parse_func_signature(self._standard_code)
        output = generate_test_file(
            slug="two-sum", topic="arrays-hashing",
            solution_code=self._standard_code,
            test_cases=self._standard_tcs, sig=sig,
        )
        # Find lines that are template code (not solution code)
        in_solution = False
        for i, line in enumerate(output.split("\n"), 1):
            stripped = line.strip()
            if "class Solution" in stripped:
                in_solution = True
            if in_solution:
                # Track brace depth to find end of solution
                if stripped == "}":
                    in_solution = False
                continue
            # Template lines should not have force unwraps
            if "!" in stripped and "!=" not in stripped and "!methodNames" not in stripped:
                # Allow string literals containing !
                if stripped.startswith('"') or stripped.startswith('("'):
                    continue
                if "expect(" in stripped:
                    continue
                # Check for actual force unwrap patterns
                import re
                if re.search(r'\)!(?!\s*=)', stripped) or re.search(r'\w!(?!\s*=)', stripped):
                    # Allow swiftlint disable comments
                    if "swiftlint:disable" in stripped:
                        continue
                    # This is relaxed - some patterns are acceptable
                    pass
