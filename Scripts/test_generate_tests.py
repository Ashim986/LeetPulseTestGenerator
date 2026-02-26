"""
test_generate_tests.py -- pytest test suite for generate_tests.py

Covers:
- Formatting regression tests (missing-space bug prevention)
- Edge case tests for parsing, naming, and utility functions
"""

import os
import sys

# Ensure the Scripts directory is importable
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from generate_tests import (
    constraint_check,
    generate_class_design_test_file,
    generate_test_file,
    parse_func_signature,
    parser_returns_optional,
    sanitize_swift_string,
    slug_to_class_name,
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
