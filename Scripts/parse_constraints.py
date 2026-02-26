#!/usr/bin/env python3 -u
"""
parse_constraints.py -- Modular constraint parsing pipeline for LeetCode problems.

Reads constraint text from API-cached or neenza constraint files, applies a chain
of 23+ regex pattern matchers with confidence scoring, detects non-Swift problems,
and produces structured per-topic JSON output.

Usage:
    python3 Scripts/parse_constraints.py                           # Parse all topics
    python3 Scripts/parse_constraints.py --topic arrays-hashing    # Single topic
    python3 Scripts/parse_constraints.py --use-neenza              # Use neenza data instead of API cache
"""

import argparse
import glob
import json
import re
import sys
import time
from dataclasses import dataclass, field, asdict
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Union

BASE_DIR = Path(__file__).resolve().parent.parent
TC_DIR = BASE_DIR / "corrected"
API_CACHE_DIR = TC_DIR / "constraints-api-cache"
DATASET_PATH = Path("/tmp/leetcode_all.json")

# ---------------------------------------------------------------------------
# Data model
# ---------------------------------------------------------------------------


class Confidence(str, Enum):
    HIGH = "high"       # Exact regex match
    MEDIUM = "medium"   # Heuristic / inferred
    LOW = "low"         # Prose / ambiguous


class ConstraintKind(str, Enum):
    ARRAY_LENGTH = "array_length"
    ELEMENT_RANGE = "element_range"
    INTEGER_RANGE = "integer_range"
    STRING_LENGTH = "string_length"
    EXACT_LENGTH = "exact_length"
    VARIABLE_EQUALITY = "variable_equality"
    CHARSET = "charset"
    UNIQUENESS = "uniqueness"
    SORTED = "sorted"
    GUARANTEE = "guarantee"
    GRAPH_PROPERTY = "graph_property"
    TREE_PROPERTY = "tree_property"
    MULTIPLICATION = "multiplication"
    NESTED_LENGTH = "nested_length"
    METHOD_CALLS = "method_calls"
    PROSE = "prose"
    UNRESOLVED = "unresolved"


@dataclass
class ParsedConstraint:
    kind: ConstraintKind
    raw_text: str
    confidence: Confidence
    variables: List[str] = field(default_factory=list)
    min_value: Optional[int] = None
    max_value: Optional[int] = None
    charset: Optional[str] = None
    property_name: Optional[str] = None
    metadata: Dict = field(default_factory=dict)

    def to_dict(self) -> dict:
        """Convert to JSON-serializable dict, omitting None fields."""
        d: dict = {
            "kind": self.kind.value,
            "raw": self.raw_text,
            "confidence": self.confidence.value,
        }
        if self.variables:
            d["variables"] = self.variables
        if self.min_value is not None:
            d["min"] = self.min_value
        if self.max_value is not None:
            d["max"] = self.max_value
        if self.charset is not None:
            d["charset"] = self.charset
        if self.property_name is not None:
            d["property"] = self.property_name
        if self.metadata:
            d["metadata"] = self.metadata
        return d


# ---------------------------------------------------------------------------
# Number parser
# ---------------------------------------------------------------------------

def parse_number(s: str) -> Optional[int]:
    """Parse number expressions into integers.

    Handles: 10^5, 10^{5}, 2 * 10^4, 2^31 - 1, 50,000, plain integers.
    Returns None if parsing fails.
    """
    s = s.strip().replace("{", "").replace("}", "").replace(",", "")
    s = re.sub(r"\s+", " ", s)

    if not s:
        return None

    try:
        # Handle "A * B^C" (e.g., "2 * 10^4" -> 20000, "5 * 10^4" -> 50000)
        m = re.match(r"(-?\d+)\s*\*\s*(\d+)\^(\d+)$", s)
        if m:
            return int(m.group(1)) * (int(m.group(2)) ** int(m.group(3)))

        # Handle "A^B + C" (e.g., "2^31 + 1")
        m = re.match(r"(-?\d+)\^(\d+)\s*\+\s*(\d+)$", s)
        if m:
            return int(m.group(1)) ** int(m.group(2)) + int(m.group(3))

        # Handle "A^B - C" (e.g., "2^31 - 1" -> 2147483647)
        m = re.match(r"(-?\d+)\^(\d+)\s*-\s*(\d+)$", s)
        if m:
            return int(m.group(1)) ** int(m.group(2)) - int(m.group(3))

        # Handle "-A^B" (e.g., "-2^31")
        m = re.match(r"-(\d+)\^(\d+)$", s)
        if m:
            return -(int(m.group(1)) ** int(m.group(2)))

        # Handle "A^B" (e.g., "10^5" -> 100000)
        if "^" in s:
            parts = s.split("^", 1)
            return int(parts[0]) ** int(parts[1])
        if "**" in s:
            parts = s.split("**", 1)
            return int(parts[0]) ** int(parts[1])

        return int(s)
    except (ValueError, OverflowError):
        return None


def _safe_parse(s: str) -> Optional[int]:
    """Wrapper for parse_number that handles edge cases."""
    if s is None:
        return None
    return parse_number(s)


# ---------------------------------------------------------------------------
# Regex building blocks
# ---------------------------------------------------------------------------

# Number pattern: matches integers, exponents, and arithmetic expressions
# Captures the full numeric expression including "2 * 10^4", "2^31 - 1", etc.
NUM = r"(-?\d+(?:\s*\*\s*\d+)?\s*(?:\^[\d{}]+)?(?:\s*[-+]\s*\d+(?:\^[\d{}]+)?)?)"


# ---------------------------------------------------------------------------
# Pattern functions (23+ patterns)
# Each returns Optional[ParsedConstraint] or Optional[List[ParsedConstraint]]
# ---------------------------------------------------------------------------

def parse_array_length_range(text: str) -> Optional[ParsedConstraint]:
    """Parse '1 <= nums.length <= 10^5' pattern."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+)\.length\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        max_v = _safe_parse(m.group(3))
        return ParsedConstraint(
            kind=ConstraintKind.ARRAY_LENGTH,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(2)],
            min_value=min_v,
            max_value=max_v,
        )
    return None


def parse_element_range(text: str) -> Optional[ParsedConstraint]:
    """Parse '-10^4 <= nums[i] <= 10^4' pattern."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+)\[([\w]+)\]\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        var_name = m.group(2)
        max_v = _safe_parse(m.group(4))
        return ParsedConstraint(
            kind=ConstraintKind.ELEMENT_RANGE,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            min_value=min_v,
            max_value=max_v,
        )
    return None


def parse_element_range_strict_lt(text: str) -> Optional[ParsedConstraint]:
    """Parse '0 <= nums[i] < nums.length' or '0 <= click_r < m' with strict < on right."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+(?:\[[\w]+\])?)\s*<\s*([\w]+(?:\.[\w]+)?)\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        var_name = m.group(2).split("[")[0]
        upper_ref = m.group(3)
        # Try parsing the upper as a number, otherwise treat as variable reference
        max_v = _safe_parse(upper_ref)
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            min_value=min_v,
            max_value=max_v,
            metadata={"upper_exclusive": True, "upper_ref": upper_ref} if max_v is None else {"upper_exclusive": True},
        )
    return None


def parse_2d_element_range(text: str) -> Optional[ParsedConstraint]:
    """Parse '-10^5 <= mat[i][j] <= 10^5' pattern."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+)\[[\w]+\]\[[\w]+\]\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        var_name = m.group(2)
        max_v = _safe_parse(m.group(3))
        return ParsedConstraint(
            kind=ConstraintKind.ELEMENT_RANGE,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            min_value=min_v,
            max_value=max_v,
            metadata={"dimensions": 2},
        )
    return None


def parse_integer_range(text: str) -> Optional[ParsedConstraint]:
    """Parse '1 <= n <= 10^5' pattern (simple variable, no .length or [i])."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+(?:_[\w]+)?)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        var_name = m.group(2)
        if ".length" in var_name or "[" in var_name:
            return None
        min_v = _safe_parse(m.group(1))
        max_v = _safe_parse(m.group(3))
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            min_value=min_v,
            max_value=max_v,
        )
    return None


def parse_exact_length(text: str) -> Optional[ParsedConstraint]:
    """Parse 'nums.length == 8' or 'board[i].length == 3' pattern."""
    m = re.match(
        rf"([\w]+(?:\[[\w]+\])?)\.length\s*==\s*{NUM}\s*$",
        text,
    )
    if m:
        val = _safe_parse(m.group(2))
        var_expr = m.group(1)
        var_name = var_expr.split("[")[0]
        return ParsedConstraint(
            kind=ConstraintKind.EXACT_LENGTH,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            min_value=val,
            max_value=val,
            metadata={"nested": True} if "[" in var_expr else {},
        )
    return None


def parse_exact_expression(text: str) -> Optional[ParsedConstraint]:
    """Parse 'nums.length == 2 * n' or 'n == matrix.length == matrix[i].length' type expressions."""
    # Simple var == expr.length
    m = re.match(
        r"([\w]+)\s*==\s*([\w]+(?:\[[\w]+\])?\.length)\s*$",
        text,
    )
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.VARIABLE_EQUALITY,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(1)],
            property_name=m.group(2),
        )
    # Chained equality: a == b == c == ... (n == matrix.length == matrix[i].length)
    m = re.match(
        r"([\w]+)\s*==\s*([\w]+(?:\[[\w]+\])?\.length(?:\s*==\s*[\w]+(?:\[[\w]+\])?\.length)*)\s*$",
        text,
    )
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.VARIABLE_EQUALITY,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(1)],
            property_name=m.group(2),
        )
    # k == indices.length == sources.length == targets.length (mixed chains)
    m = re.match(
        r"([\w]+)\s*==\s*([\w]+(?:\[[\w]+\])?\.length(?:\s*==\s*[\w]+(?:\[[\w]+\])?\.length)*)\s*$",
        text,
    )
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.VARIABLE_EQUALITY,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(1)],
            property_name=m.group(2),
        )
    # a == b.length == c.length (any number of == chains)
    if "==" in text and ".length" in text:
        parts = [p.strip() for p in text.split("==")]
        if len(parts) >= 2:
            # First part is variable name, rest are length expressions
            return ParsedConstraint(
                kind=ConstraintKind.VARIABLE_EQUALITY,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[parts[0].split("[")[0]],
                property_name=" == ".join(parts[1:]),
            )
    # nums.length == 2 * n (algebraic)
    m = re.match(
        r"([\w]+)\.length\s*==\s*(.+)$",
        text,
    )
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.VARIABLE_EQUALITY,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(1)],
            property_name=m.group(2).strip(),
        )
    return None


def parse_variable_equality(text: str) -> Optional[ParsedConstraint]:
    """Parse 'm == grid.length' or 'n == grid[0].length' pattern."""
    m = re.match(
        r"([\w]+)\s*==\s*([\w]+(?:\[\d+\])?\.length)\s*$",
        text,
    )
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.VARIABLE_EQUALITY,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(1)],
            property_name=m.group(2),
        )
    return None


def parse_nested_length(text: str) -> Optional[ParsedConstraint]:
    """Parse '1 <= words[i].length <= 100' pattern."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+)\[[\w]+\]\.length\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        var_name = m.group(2)
        max_v = _safe_parse(m.group(3))
        return ParsedConstraint(
            kind=ConstraintKind.NESTED_LENGTH,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            min_value=min_v,
            max_value=max_v,
        )
    return None


def parse_multi_var_range(text: str) -> Optional[List[ParsedConstraint]]:
    """Parse '1 <= m, n <= 200' or '1 <= a_i, b_i <= n' pattern.
    Upper bound can be a number or a variable reference."""
    # Try with numeric upper bound first
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+(?:_[\w]+)?(?:\s*,\s*[\w]+(?:_[\w]+)?)+)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        vars_str = m.group(2)
        max_v = _safe_parse(m.group(3))
        var_names = [v.strip() for v in vars_str.split(",")]
        results = []
        for var_name in var_names:
            results.append(ParsedConstraint(
                kind=ConstraintKind.INTEGER_RANGE,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[var_name],
                min_value=min_v,
                max_value=max_v,
                metadata={"expanded_from_multi_var": True},
            ))
        return results
    # Try with variable upper bound: 1 <= a_i, b_i <= n
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+(?:_[\w]+)?(?:\s*,\s*[\w]+(?:_[\w]+)?)+)\s*<=\s*([\w]+(?:_[\w]+)?)\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        vars_str = m.group(2)
        upper_var = m.group(3)
        max_v = _safe_parse(upper_var)
        var_names = [v.strip() for v in vars_str.split(",")]
        results = []
        for var_name in var_names:
            results.append(ParsedConstraint(
                kind=ConstraintKind.INTEGER_RANGE,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[var_name],
                min_value=min_v,
                max_value=max_v,
                metadata={"expanded_from_multi_var": True, **({"upper_ref": upper_var} if max_v is None else {})},
            ))
        return results
    return None


def parse_multi_var_element_range(text: str) -> Optional[List[ParsedConstraint]]:
    """Parse '-2^28 <= nums1[i], nums2[i], nums3[i], nums4[i] <= 2^28' pattern."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+\[[\w]+\](?:\s*,\s*[\w]+\[[\w]+\])+)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        vars_str = m.group(2)
        max_v = _safe_parse(m.group(3))
        # Extract variable names from "nums1[i], nums2[i]" -> ["nums1", "nums2"]
        var_parts = [v.strip() for v in vars_str.split(",")]
        results = []
        for part in var_parts:
            var_name = part.split("[")[0].strip()
            results.append(ParsedConstraint(
                kind=ConstraintKind.ELEMENT_RANGE,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[var_name],
                min_value=min_v,
                max_value=max_v,
                metadata={"expanded_from_multi_var": True},
            ))
        return results
    return None


def parse_multi_var_length(text: str) -> Optional[List[ParsedConstraint]]:
    """Parse '1 <= s.length, t.length <= 10^5' pattern."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+\.length(?:\s*,\s*[\w]+\.length)+)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        vars_str = m.group(2)
        max_v = _safe_parse(m.group(3))
        var_parts = [v.strip() for v in vars_str.split(",")]
        results = []
        for part in var_parts:
            var_name = part.replace(".length", "").strip()
            results.append(ParsedConstraint(
                kind=ConstraintKind.ARRAY_LENGTH,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[var_name],
                min_value=min_v,
                max_value=max_v,
                metadata={"expanded_from_multi_var": True},
            ))
        return results
    return None


def parse_multi_var_nested_length(text: str) -> Optional[List[ParsedConstraint]]:
    """Parse '1 <= sources[i].length, targets[i].length <= 50' or
    '1 <= list1[i].length, list2[i].length <= 30' pattern."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+\[[\w]+\]\.length(?:\s*,\s*[\w]+\[[\w]+\]\.length)+)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        vars_str = m.group(2)
        max_v = _safe_parse(m.group(3))
        var_parts = [v.strip() for v in vars_str.split(",")]
        results = []
        for part in var_parts:
            var_name = re.match(r"([\w]+)", part).group(1)
            results.append(ParsedConstraint(
                kind=ConstraintKind.NESTED_LENGTH,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[var_name],
                min_value=min_v,
                max_value=max_v,
                metadata={"expanded_from_multi_var": True},
            ))
        return results
    return None


def parse_multi_var_comma_simple(text: str) -> Optional[List[ParsedConstraint]]:
    """Parse '0 <= timeSeries[i], duration <= 10^7' pattern (mixed var types with commas)."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+(?:\[[\w]+\])?(?:\.[\w]+)?(?:\s*,\s*[\w]+(?:\[[\w]+\])?(?:\.[\w]+)?)+)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        vars_str = m.group(2)
        max_v = _safe_parse(m.group(3))
        var_parts = [v.strip() for v in vars_str.split(",")]
        results = []
        for part in var_parts:
            var_name = part.split("[")[0].split(".")[0].strip()
            if ".length" in part:
                kind = ConstraintKind.ARRAY_LENGTH
            elif "[" in part:
                kind = ConstraintKind.ELEMENT_RANGE
            else:
                kind = ConstraintKind.INTEGER_RANGE
            results.append(ParsedConstraint(
                kind=kind,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[var_name],
                min_value=min_v,
                max_value=max_v,
                metadata={"expanded_from_multi_var": True},
            ))
        return results
    return None


def parse_multiplication(text: str) -> Optional[ParsedConstraint]:
    """Parse 'm * n <= 10^5' or '1 <= m * n <= 10^4' pattern."""
    # Full range: 1 <= m * n <= 10^4
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+)\s*\*\s*([\w]+)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        max_v = _safe_parse(m.group(4))
        return ParsedConstraint(
            kind=ConstraintKind.MULTIPLICATION,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(2), m.group(3)],
            min_value=min_v,
            max_value=max_v,
        )
    # Upper bound only: m * n <= 10^5
    m = re.match(
        rf"([\w]+)\s*\*\s*([\w]+)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        max_v = _safe_parse(m.group(3))
        return ParsedConstraint(
            kind=ConstraintKind.MULTIPLICATION,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(1), m.group(2)],
            max_value=max_v,
        )
    return None


def parse_sum_expression(text: str) -> Optional[ParsedConstraint]:
    """Parse '1 <= sum(wall[i].length) <= 2 * 10^4' or 'sum(paths[i].length) <= 5 * 10^5'."""
    m = re.match(
        rf"{NUM}\s*<=\s*sum\((.+?)\)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        expr = m.group(2)
        max_v = _safe_parse(m.group(3))
        var_name = re.match(r"([\w]+)", expr).group(1)
        return ParsedConstraint(
            kind=ConstraintKind.MULTIPLICATION,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            min_value=min_v,
            max_value=max_v,
            metadata={"sum_expression": expr},
        )
    # sum(X) <= Y
    m = re.match(
        rf"sum\((.+?)\)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        expr = m.group(1)
        max_v = _safe_parse(m.group(2))
        var_name = re.match(r"([\w]+)", expr).group(1)
        return ParsedConstraint(
            kind=ConstraintKind.MULTIPLICATION,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            max_value=max_v,
            metadata={"sum_expression": expr},
        )
    return None


def parse_upper_bound_only(text: str) -> Optional[ParsedConstraint]:
    """Parse 's.length <= 10^5' or 'n <= 10^5' pattern."""
    # .length variant
    m = re.match(
        rf"([\w]+(?:\[[\w]+\])?)\.length\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        max_v = _safe_parse(m.group(2))
        var_name = m.group(1).split("[")[0]
        return ParsedConstraint(
            kind=ConstraintKind.ARRAY_LENGTH,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            max_value=max_v,
        )
    # Simple variable variant
    m = re.match(
        rf"([\w]+(?:_[\w]+)?)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        max_v = _safe_parse(m.group(2))
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(1)],
            max_value=max_v,
        )
    return None


def parse_lower_bound_only(text: str) -> Optional[ParsedConstraint]:
    """Parse 'n >= 1' or '0 <= n' pattern."""
    m = re.match(
        rf"([\w]+(?:_[\w]+)?)\s*>=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(2))
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(1)],
            min_value=min_v,
        )
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+(?:_[\w]+)?)\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(2)],
            min_value=min_v,
        )
    return None


def parse_element_range_to_var(text: str) -> Optional[ParsedConstraint]:
    """Parse '1 <= nums[i] <= n' where upper bound is a variable, not a number."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+)\[([\w]+)\]\s*<=\s*([\w]+)\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        var_name = m.group(2)
        upper_var = m.group(4)
        # Check if upper bound is a number
        max_v = _safe_parse(upper_var)
        return ParsedConstraint(
            kind=ConstraintKind.ELEMENT_RANGE,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            min_value=min_v,
            max_value=max_v,
            metadata={"upper_ref": upper_var} if max_v is None else {},
        )
    return None


def parse_triple_inequality(text: str) -> Optional[ParsedConstraint]:
    """Parse '0 <= left <= right < nums.length' or '0 <= left <= right <= nums.length' patterns."""
    # 0 <= A <= B < C (or <=)
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+)\s*<=\s*([\w]+)\s*[<]=?\s*([\w]+(?:\.[\w]+)?)\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(2), m.group(3)],
            min_value=min_v,
            metadata={"triple_inequality": True, "upper_ref": m.group(4)},
        )
    return None


def parse_inequality(text: str) -> Optional[ParsedConstraint]:
    """Parse 'a_i != b_i' or simple variable inequality."""
    m = re.match(
        r"([\w]+(?:_[\w]+)?)\s*(!=)\s*([\w]+(?:_[\w]+)?)\s*$",
        text,
    )
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[m.group(1), m.group(3)],
            property_name="inequality_!=",
        )
    return None


def parse_method_calls(text: str) -> Optional[ParsedConstraint]:
    """Parse 'At most 10^4 calls will be made' pattern."""
    m = re.search(
        rf"[Aa]t most\s+{NUM}\s+calls?\s+will\s+be\s+made",
        text,
    )
    if m:
        max_v = _safe_parse(m.group(1))
        return ParsedConstraint(
            kind=ConstraintKind.METHOD_CALLS,
            raw_text=text,
            confidence=Confidence.HIGH,
            max_value=max_v,
        )
    m = re.search(
        rf"number of calls.*?(?:not exceed|at most)\s+{NUM}",
        text,
        re.IGNORECASE,
    )
    if m:
        max_v = _safe_parse(m.group(1))
        return ParsedConstraint(
            kind=ConstraintKind.METHOD_CALLS,
            raw_text=text,
            confidence=Confidence.HIGH,
            max_value=max_v,
        )
    # "All the calls to next and peek are valid." type
    m = re.match(
        r"[Aa]ll (?:the )?calls to .+ are valid",
        text,
    )
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.GUARANTEE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            property_name="valid_calls",
        )
    return None


def parse_charset_consists(text: str) -> Optional[ParsedConstraint]:
    """Parse 's consists of lowercase English letters' and 's and t consist of ...' patterns."""
    # "X and Y consist of Z"
    m = re.match(
        r"([\w]+(?:\[[\w]+\])?)\s+and\s+([\w]+(?:\[[\w]+\])?)\s+consists?\s+(?:of\s+)?(?:only\s+)?(.+)",
        text,
        re.IGNORECASE,
    )
    if m:
        desc = m.group(3).strip().rstrip(".")
        charset = _classify_charset(desc)
        return ParsedConstraint(
            kind=ConstraintKind.CHARSET,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[m.group(1), m.group(2)],
            charset=charset,
        )
    # "X consists of Y"
    m = re.match(
        r"([\w]+(?:\[[\w]+\])?)\s+consists?\s+(?:of\s+)?(?:only\s+)?(.+)",
        text,
        re.IGNORECASE,
    )
    if m:
        var_name = m.group(1)
        desc = m.group(2).strip().rstrip(".")
        charset = _classify_charset(desc)
        return ParsedConstraint(
            kind=ConstraintKind.CHARSET,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[var_name],
            charset=charset,
        )
    # "X contains only Y"
    m = re.match(
        r"([\w]+(?:\[[\w]+\])?)\s+contains?\s+only\s+(.+)",
        text,
        re.IGNORECASE,
    )
    if m:
        var_name = m.group(1)
        desc = m.group(2).strip().rstrip(".")
        charset = _classify_charset(desc)
        return ParsedConstraint(
            kind=ConstraintKind.CHARSET,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[var_name],
            charset=charset,
        )
    return None


def _classify_charset(desc: str) -> str:
    """Classify a charset description into a canonical name."""
    lower = desc.lower()
    if "lowercase english" in lower or "lower-case english" in lower:
        return "lowercase_english"
    if "uppercase english" in lower or "upper-case english" in lower:
        return "uppercase_english"
    if "english letters and digits" in lower or "alphanumeric" in lower:
        return "alphanumeric"
    if "lowercase and uppercase" in lower or "english letters" in lower:
        return "english_letters"
    if "lowercase letter" in lower:
        return "lowercase_english"
    if "digit" in lower:
        return "digits"
    if "printable ascii" in lower or "valid ascii" in lower:
        return "ascii"
    if "ascii" in lower:
        return "ascii"
    return desc


def parse_charset_is_either(text: str) -> Optional[ParsedConstraint]:
    """Parse 'board[i][j] is either '.' or 'X'' or 'board[i][j] is 0 or 1.' patterns."""
    # "X is either 'A', 'B', or 'C'" or "X is either 'A' or 'B'"
    m = re.match(
        r"([\w]+(?:\[[\w]+\])*)\s+is\s+either\s+(.+)",
        text,
    )
    if m:
        var_name = m.group(1).split("[")[0]
        choices = m.group(2).rstrip(".")
        return ParsedConstraint(
            kind=ConstraintKind.CHARSET,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[var_name],
            charset=f"either_{choices}",
        )
    # "X is 0 or 1." or "X is a digit 1-9 or '.'" or "X is '='"
    m = re.match(
        r"([\w]+(?:\[[\w]+\])*)\s+is\s+(?:a\s+)?(.+)",
        text,
    )
    if m:
        desc = m.group(2).strip().rstrip(".")
        if any(word in desc.lower() for word in ["or", "either", "digit", "'"]):
            var_name = m.group(1).split("[")[0]
            return ParsedConstraint(
                kind=ConstraintKind.CHARSET,
                raw_text=text,
                confidence=Confidence.MEDIUM,
                variables=[var_name],
                charset=desc,
            )
    return None


def parse_charset_multi_var(text: str) -> Optional[ParsedConstraint]:
    """Parse 'X and Y are lowercase English letters' or 'X and Y consist of lowercase English letters and spaces'."""
    m = re.match(
        r"([\w]+(?:\[[\w]+\])?)\s+and\s+([\w]+(?:\[[\w]+\])?)\s+(?:are|consist of|consist only of)\s+(.+)",
        text,
        re.IGNORECASE,
    )
    if m:
        desc = m.group(3).strip().rstrip(".")
        charset = _classify_charset(desc)
        return ParsedConstraint(
            kind=ConstraintKind.CHARSET,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[m.group(1), m.group(2)],
            charset=charset,
        )
    return None


def parse_uniqueness(text: str) -> Optional[ParsedConstraint]:
    """Parse 'All the values of nums are unique' and similar patterns."""
    patterns = [
        (r"[Aa]ll (?:the )?(?:values|elements|integers|numbers|strings|characters|entries|pairs) (?:of |in )?([\w]+) are (?:unique|distinct)", None),
        (r"([\w]+) (?:has|have|contains?) (?:all )?unique", None),
        (r"[Aa]ll (?:the )?(?:values|elements|integers) (?:of |in )?([\w]+) are distinct", None),
        (r"[Aa]ll pairs?\s+(?:\([\w]+,\s*[\w]+\)\s+)?(?:of |in )?([\w]+) are unique", None),
        (r"[Aa]ll (?:the )?(?:characters|values|elements) of ([\w]+) are unique", None),
        (r"[Nn]o (?:two|duplicate)", None),
        (r"[Aa]ll (?:the )?(?:strings|words) (?:are|in) .* (?:unique|distinct)", None),
        (r"[Aa]ll pairs? (?:are |)(unique|distinct)", None),
        (r"(?:element|value|number|integer|pair|string)\s+(?:in|of)\s+([\w]+)\s+is\s+unique", None),
        (r"(?:largest|smallest|minimum|maximum)\s+(?:element|value)\s+(?:in|of)\s+([\w]+)\s+is\s+unique", None),
    ]
    for pat, _ in patterns:
        m = re.search(pat, text)
        if m:
            var_name = m.group(1) if m.lastindex and m.lastindex >= 1 else ""
            # Don't capture "unique" or "distinct" as var name
            if var_name.lower() in ("unique", "distinct"):
                var_name = ""
            return ParsedConstraint(
                kind=ConstraintKind.UNIQUENESS,
                raw_text=text,
                confidence=Confidence.MEDIUM,
                variables=[var_name] if var_name else [],
                property_name="unique",
            )
    return None


def parse_sorted(text: str) -> Optional[ParsedConstraint]:
    """Parse 'nums is sorted in non-decreasing order' and similar patterns."""
    patterns = [
        r"([\w]+)\s+is\s+sorted",
        r"([\w]+)\s+(?:is|are)\s+(?:given\s+)?in\s+(?:non-decreasing|ascending|sorted|increasing)\s+order",
        r"([\w]+)\s+(?:is|are)\s+(?:sorted|ordered)\s+in",
    ]
    for pat in patterns:
        m = re.search(pat, text, re.IGNORECASE)
        if m:
            return ParsedConstraint(
                kind=ConstraintKind.SORTED,
                raw_text=text,
                confidence=Confidence.MEDIUM,
                variables=[m.group(1)],
                property_name="sorted",
            )
    return None


def parse_guarantee(text: str) -> Optional[ParsedConstraint]:
    """Parse guarantee/validity patterns like 'Only one valid answer exists.'"""
    patterns = [
        r"(?:the )?answer is guaranteed",
        r"guaranteed (?:to |that )",
        r"(?:it is |it's )?guaranteed",
        r"there (?:is|will be) (?:always )?(?:a |at least one )?(?:valid |unique )?(?:answer|solution)",
        r"[Oo]nly one (?:valid )?answer exists",
        r"[Ee]xactly one (?:valid )?(?:answer|solution)",
        r"[Aa] (?:unique|valid) (?:answer|solution) (?:exists|is guaranteed)",
        r"[Tt]he (?:given |input )?(?:input|data|array|graph) is (?:always )?(?:valid|non-empty)",
        r"is (?:guranteed|guaranteed) to be a valid",
        r"will not be in the list",
        r"[Tt]he input is generated such that",
    ]
    for pat in patterns:
        m = re.search(pat, text, re.IGNORECASE)
        if m:
            lower = text.lower()
            if "unique" in lower or "only one" in lower or "exactly one" in lower:
                prop = "unique_answer"
            elif "valid" in lower:
                prop = "valid_answer"
            elif "non-empty" in lower or "not empty" in lower:
                prop = "non_empty"
            elif "will not be" in lower:
                prop = "exclusion"
            else:
                prop = "guaranteed"
            return ParsedConstraint(
                kind=ConstraintKind.GUARANTEE,
                raw_text=text,
                confidence=Confidence.MEDIUM,
                property_name=prop,
            )
    return None


def parse_graph_property(text: str) -> Optional[ParsedConstraint]:
    """Parse graph-related constraints."""
    patterns = [
        (r"[Tt]he number of (?:edges|nodes|vertices)", "count"),
        (r"no (?:parallel|duplicate|repeated|self)[- ](?:edges|loops)", "no_parallel"),
        (r"(?:directed|undirected) graph", "directed"),
        (r"(?:connected|disconnected) graph", "connected"),
        (r"(?:weighted|unweighted)", "weighted"),
        (r"edges\.length", "edge_count"),
    ]
    for pat, prop_type in patterns:
        m = re.search(pat, text, re.IGNORECASE)
        if m:
            num_match = re.search(rf"<=\s*{NUM}", text)
            max_v = _safe_parse(num_match.group(1)) if num_match else None
            return ParsedConstraint(
                kind=ConstraintKind.GRAPH_PROPERTY,
                raw_text=text,
                confidence=Confidence.MEDIUM,
                property_name=prop_type,
                max_value=max_v,
            )
    return None


def parse_tree_property(text: str) -> Optional[ParsedConstraint]:
    """Parse tree-related constraints."""
    patterns = [
        r"[Tt]he number of nodes (?:in |of )?(?:the )?(?:binary )?tree",
        r"(?:binary tree|BST|binary search tree)",
        r"[Tt]he (?:height|depth) of the (?:binary )?tree",
        r"root (?:is|has|of)",
    ]
    for pat in patterns:
        m = re.search(pat, text, re.IGNORECASE)
        if m:
            num_match = re.search(rf"<=\s*{NUM}", text)
            max_v = _safe_parse(num_match.group(1)) if num_match else None
            return ParsedConstraint(
                kind=ConstraintKind.TREE_PROPERTY,
                raw_text=text,
                confidence=Confidence.MEDIUM,
                property_name="tree",
                max_value=max_v,
            )
    return None


def parse_between_prose(text: str) -> Optional[ParsedConstraint]:
    """Parse 'X will be between 1 and 50,000' or 'X will be an integer between 0 and 49,999'."""
    m = re.search(
        rf"([\w]+(?:\.[\w]+)?(?:\[[\w]+\])?)\s+(?:will be|is)\s+(?:an? )?(?:integer |number )?between\s+{NUM}\s+and\s+{NUM}",
        text,
        re.IGNORECASE,
    )
    if m:
        var_name = m.group(1)
        min_v = _safe_parse(m.group(2))
        max_v = _safe_parse(m.group(3))
        if ".length" in var_name:
            kind = ConstraintKind.ARRAY_LENGTH
            clean_var = var_name.replace(".length", "")
        elif "[" in var_name:
            kind = ConstraintKind.ELEMENT_RANGE
            clean_var = var_name.split("[")[0]
        else:
            kind = ConstraintKind.INTEGER_RANGE
            clean_var = var_name
        return ParsedConstraint(
            kind=kind,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[clean_var],
            min_value=min_v,
            max_value=max_v,
        )
    return None


def parse_range_bracket_prose(text: str) -> Optional[ParsedConstraint]:
    """Parse 'in the range [1, 10^5]' pattern."""
    m = re.search(
        rf"([\w]+(?:\.[\w]+)?)\s+(?:is\s+)?in\s+the\s+range\s+\[{NUM}\s*,\s*{NUM}\]",
        text,
        re.IGNORECASE,
    )
    if m:
        var_name = m.group(1)
        min_v = _safe_parse(m.group(2))
        max_v = _safe_parse(m.group(3))
        kind = ConstraintKind.ARRAY_LENGTH if ".length" in var_name else ConstraintKind.INTEGER_RANGE
        clean_var = var_name.replace(".length", "")
        return ParsedConstraint(
            kind=kind,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[clean_var],
            min_value=min_v,
            max_value=max_v,
        )
    return None


def parse_prose_property(text: str) -> Optional[ParsedConstraint]:
    """Parse various prose properties that don't extract numeric bounds.

    Catches: "n is even", "encoding.length is even", "There is exactly one island",
    "There are exactly two islands", "X does not contain leading/trailing spaces",
    "Every open block comment is eventually closed", etc.
    """
    # "X is even" / "X is odd"
    m = re.match(r"([\w]+(?:\.[\w]+)?)\s+is\s+(even|odd)\s*\.?\s*$", text, re.IGNORECASE)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[m.group(1).split(".")[0]],
            property_name=m.group(2).lower(),
        )
    # "There is exactly one/two X"
    m = re.match(r"[Tt]here (?:is|are) exactly (\w+) (.+?)\.?\s*$", text)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.GUARANTEE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            property_name=f"exactly_{m.group(1)}",
        )
    # "There is at least X"
    m = re.match(r"[Tt]here is at least (?:a |one )(.+?)\.?\s*$", text)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.GUARANTEE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            property_name="at_least_one",
        )
    # "At least one X" / "At least one seat is empty"
    m = re.match(r"[Aa]t least one (.+?)\.?\s*$", text)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.GUARANTEE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            property_name="at_least_one",
        )
    # "X does not contain/start with Y"
    m = re.match(r"([\w]+)\s+does?\s+not\s+(?:contain|start|have|include)\s+(.+?)\.?\s*$", text, re.IGNORECASE)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[m.group(1)],
            property_name="exclusion",
        )
    # "X do not have leading or trailing spaces"
    m = re.search(r"(?:do|does) not have (?:leading|trailing)", text, re.IGNORECASE)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            property_name="no_whitespace_padding",
        )
    # "Every X is eventually Y" / "No X or Y in the input"
    m = re.match(r"(?:[Ee]very|[Nn]o|[Ee]ach|[Aa]ll)\s+.+", text)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.LOW,
            property_name="prose_constraint",
        )
    # "X contains exactly one Y"
    m = re.search(r"contains?\s+exactly\s+(?:one|two|three|\d+)", text, re.IGNORECASE)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            property_name="cardinality",
        )
    # "X are separated by a single space"
    m = re.search(r"separated by a single space", text, re.IGNORECASE)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.LOW,
            property_name="separator",
        )
    # "X will be between ..." already covered by parse_between_prose
    # "You may assume X"
    m = re.match(r"[Yy]ou may assume\s+(.+)", text)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.GUARANTEE,
            raw_text=text,
            confidence=Confidence.LOW,
            property_name="assumption",
        )
    # "There are no X in the Y"
    m = re.match(r"[Tt]here (?:are|is) no\s+(.+?)\.?\s*$", text)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.LOW,
            property_name="exclusion",
        )
    # "The X element/value in Y is unique/largest/etc"
    m = re.match(r"[Tt]he (?:largest|smallest|minimum|maximum)\s+(?:element|value)\s+(?:in|of)\s+([\w]+)\s+is\s+(\w+)", text)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.UNIQUENESS if m.group(2).lower() == "unique" else ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[m.group(1)],
            property_name=m.group(2).lower(),
        )
    # "sum(X) is the same for each Y"
    m = re.search(r"is the same for each", text, re.IGNORECASE)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.LOW,
            property_name="uniformity",
        )
    # General property catch: "X contains Y", "X appears Y times"
    m = re.match(r"([\w]+)\s+(?:contains?|appears?|represents?|follows?)\s+(.+?)\.?\s*$", text, re.IGNORECASE)
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.LOW,
            variables=[m.group(1)],
            property_name="property",
        )
    return None


def parse_charset_broad(text: str) -> Optional[ParsedConstraint]:
    """Broad charset detection for patterns like 'X and Y are English lowercase letters'
    or 'jewels and stones consist of only English letters'."""
    # "X and Y consist of only Z" / "X and Y are Z"
    if re.search(r"consist(?:s)?\s+(?:of\s+)?(?:only\s+)?", text, re.IGNORECASE):
        charset = _classify_charset(text)
        if charset != text:
            # Extract variable names
            m = re.match(r"([\w]+(?:\[[\w]+\])?(?:\s+and\s+[\w]+(?:\[[\w]+\])?)*)", text)
            vars = []
            if m:
                var_str = m.group(1)
                vars = [v.strip().split("[")[0] for v in re.split(r"\s+and\s+|,\s*", var_str) if v.strip()]
            return ParsedConstraint(
                kind=ConstraintKind.CHARSET,
                raw_text=text,
                confidence=Confidence.MEDIUM,
                variables=vars,
                charset=charset,
            )
    # "X are English lowercase letters" / "X are lowercase English letters"
    if re.search(r"(?:lowercase|uppercase|english|digit|ascii|letter)", text, re.IGNORECASE):
        charset = _classify_charset(text)
        if charset != text:
            m = re.match(r"([\w]+(?:\[[\w]+\])?(?:(?:\s*,\s*|\s+and\s+)[\w]+(?:\[[\w]+\])?)*)", text)
            vars = []
            if m:
                var_str = m.group(1)
                vars = [v.strip().split("[")[0] for v in re.split(r"\s+and\s+|,\s*", var_str) if v.strip()]
            return ParsedConstraint(
                kind=ConstraintKind.CHARSET,
                raw_text=text,
                confidence=Confidence.MEDIUM,
                variables=vars,
                charset=charset,
            )
    return None


def parse_equality_length_chain(text: str) -> Optional[ParsedConstraint]:
    """Parse chained equalities like 'n == fronts.length == backs.length' or
    'secret.length == guess.length' or 'shifts.length == s.length' or 't.length == s.length'."""
    # X.length == Y.length
    m = re.match(
        r"([\w]+)\.length\s*==\s*([\w]+)\.length\s*$",
        text,
    )
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.VARIABLE_EQUALITY,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(1), m.group(2)],
            property_name="equal_length",
        )
    # trust[i].length == 2
    m = re.match(
        rf"([\w]+)\[[\w]+\]\.length\s*==\s*{NUM}\s*$",
        text,
    )
    if m:
        val = _safe_parse(m.group(2))
        return ParsedConstraint(
            kind=ConstraintKind.EXACT_LENGTH,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(1)],
            min_value=val,
            max_value=val,
            metadata={"nested": True},
        )
    return None


def parse_dotted_var_range(text: str) -> Optional[ParsedConstraint]:
    """Parse '-100 <= Node.val <= 100' or '0 <= Node.val <= 9' pattern (dotted var names)."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+\.[\w]+)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        var_name = m.group(2)
        max_v = _safe_parse(m.group(3))
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            min_value=min_v,
            max_value=max_v,
        )
    return None


def parse_dotted_var_upper(text: str) -> Optional[ParsedConstraint]:
    """Parse 'Node.val <= 10^5' or '0 < Node.val <= 100' patterns."""
    # Upper bound only: X.y <= N
    m = re.match(
        rf"([\w]+\.[\w]+)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        max_v = _safe_parse(m.group(2))
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[m.group(1)],
            max_value=max_v,
        )
    return None


def parse_dotted_var_charset(text: str) -> Optional[ParsedConstraint]:
    """Parse 'Node.val is either 0 or 1.' or 'Node.val is 0 or 1.' patterns."""
    m = re.match(
        r"([\w]+\.[\w]+)\s+is\s+(?:either\s+)?(.+)",
        text,
    )
    if m:
        desc = m.group(2).strip().rstrip(".")
        if any(word in desc.lower() for word in ["or", "either", "digit", "'"]):
            return ParsedConstraint(
                kind=ConstraintKind.CHARSET,
                raw_text=text,
                confidence=Confidence.MEDIUM,
                variables=[m.group(1)],
                charset=desc,
            )
    return None


def parse_strict_lt_lower_bound(text: str) -> Optional[ParsedConstraint]:
    """Parse '0 < target <= 10^6' or '0 < speed[i] <= 10^6' (strict < on left)."""
    m = re.match(
        rf"{NUM}\s*<\s*([\w]+(?:\[[\w]+\])?(?:\.[\w]+)?)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        var_expr = m.group(2)
        max_v = _safe_parse(m.group(3))
        var_name = var_expr.split("[")[0].split(".")[0]
        if "[" in var_expr:
            kind = ConstraintKind.ELEMENT_RANGE
        elif ".length" in var_expr:
            kind = ConstraintKind.ARRAY_LENGTH
        else:
            kind = ConstraintKind.INTEGER_RANGE
        return ParsedConstraint(
            kind=kind,
            raw_text=text,
            confidence=Confidence.HIGH,
            variables=[var_name],
            min_value=min_v,
            max_value=max_v,
            metadata={"lower_exclusive": True},
        )
    return None


def parse_chained_length_inequality(text: str) -> Optional[List[ParsedConstraint]]:
    """Parse '1 <= nums1.length <= nums2.length <= 1000' or
    '1 <= k <= nums.length <= 10^4' type chained length/var inequalities."""
    # Match: N <= A <= B ... <= M where M is a number
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+(?:\.length)?)\s*<=\s*([\w]+(?:\.length)?)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        var_a = m.group(2)
        var_b = m.group(3)
        max_v = _safe_parse(m.group(4))
        results = []
        for var_expr in [var_a, var_b]:
            if ".length" in var_expr:
                kind = ConstraintKind.ARRAY_LENGTH
                var_name = var_expr.replace(".length", "")
            else:
                kind = ConstraintKind.INTEGER_RANGE
                var_name = var_expr
            results.append(ParsedConstraint(
                kind=kind,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[var_name],
                min_value=min_v,
                max_value=max_v,
                metadata={"chained_inequality": True},
            ))
        return results
    return None


def parse_node_count_range_prose(text: str) -> Optional[ParsedConstraint]:
    """Parse 'The number of nodes in X is in the range [A, B]' prose patterns.

    Also handles variants:
    - 'The number of nodes in each linked list is in the range [1, 100].'
    - 'The number of nodes in the tree is in the range [1, 10^4].'
    - 'The number of Nodes will not exceed 1000.'
    """
    # "The number of X in Y is in the range [A, B]"
    m = re.search(
        rf"[Tt]he number of (?:the )?(?:nodes|Nodes|elements|vertices)\s+(?:in\s+)?(?:the\s+)?(?:each\s+)?(?:binary\s+)?(?:\w+\s+)?(?:is\s+)?in\s+the\s+range\s+\[{NUM}\s*,\s*{NUM}\]",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        max_v = _safe_parse(m.group(2))
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=["nodeCount"],
            min_value=min_v,
            max_value=max_v,
            metadata={"node_count": True},
        )
    # "The number of nodes will not exceed N"
    m = re.search(
        rf"[Tt]he (?:total )?number of (?:nodes|Nodes|elements|vertices)\s+(?:will\s+)?(?:not\s+)?exceed\s+{NUM}",
        text,
    )
    if m:
        max_v = _safe_parse(m.group(1))
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=["nodeCount"],
            max_value=max_v,
            metadata={"node_count": True},
        )
    # "The total number of nodes is between [0, 10^4]"
    m = re.search(
        rf"[Tt]he (?:total )?number of (?:nodes|Nodes|elements)\s+is\s+between\s+\[?{NUM}\s*,\s*{NUM}\]?",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        max_v = _safe_parse(m.group(2))
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=["nodeCount"],
            min_value=min_v,
            max_value=max_v,
            metadata={"node_count": True},
        )
    return None


def parse_height_depth_prose(text: str) -> Optional[ParsedConstraint]:
    """Parse 'The height/depth of the X tree is less than or equal to N' patterns."""
    m = re.search(
        rf"[Tt]he (?:height|depth) of the (?:binary |n-ary |)tree is (?:less than or equal to|at most)\s+{NUM}",
        text,
    )
    if m:
        max_v = _safe_parse(m.group(1))
        return ParsedConstraint(
            kind=ConstraintKind.TREE_PROPERTY,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            property_name="max_depth",
            max_value=max_v,
        )
    return None


def parse_comma_var_strict_lt(text: str) -> Optional[List[ParsedConstraint]]:
    """Parse '-10^4 < nums[i], target < 10^4' (strict < on both sides, comma vars)."""
    m = re.match(
        rf"{NUM}\s*<\s*([\w]+(?:\[[\w]+\])?(?:\s*,\s*[\w]+(?:\[[\w]+\])?)*)\s*<\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        vars_str = m.group(2)
        max_v = _safe_parse(m.group(3))
        var_parts = [v.strip() for v in vars_str.split(",")]
        results = []
        for part in var_parts:
            var_name = part.split("[")[0].strip()
            kind = ConstraintKind.ELEMENT_RANGE if "[" in part else ConstraintKind.INTEGER_RANGE
            results.append(ParsedConstraint(
                kind=kind,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[var_name],
                min_value=min_v,
                max_value=max_v,
                metadata={"both_exclusive": True, "expanded_from_multi_var": True},
            ))
        return results
    return None


def parse_chained_var_range(text: str) -> Optional[ParsedConstraint]:
    """Parse '1 <= depth <= the depth of tree + 1' or '1 <= k <= n' type expressions."""
    # Simple A <= B <= C where C is a variable
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+)\s*<=\s*([\w]+(?:\s*[\+\-]\s*\d+)?)\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        var_name = m.group(2)
        upper = m.group(3).strip()
        # Only match if upper is a variable (not a number)
        if _safe_parse(upper) is None:
            return ParsedConstraint(
                kind=ConstraintKind.INTEGER_RANGE,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[var_name],
                min_value=min_v,
                metadata={"upper_ref": upper},
            )
    return None


def parse_x_where_clause(text: str) -> Optional[ParsedConstraint]:
    """Parse 'n == 2^x where 0 <= x <= 6' type patterns."""
    m = re.match(
        rf"([\w]+)\s*==\s*(\d+)\^?([\w]+)\s+where\s+{NUM}\s*<=\s*([\w]+)\s*<=\s*{NUM}",
        text,
    )
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            variables=[m.group(1)],
            metadata={"where_clause": True},
        )
    # Simpler: "n == 2x where 0 <= x <= 6" (neenza corrupted exponent)
    m = re.match(
        r"([\w]+)\s*==\s*(\d+)([\w]+)\s+where\s+",
        text,
    )
    if m:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.LOW,
            variables=[m.group(1)],
            property_name="power_of",
        )
    return None


def parse_dotted_multi_var_range(text: str) -> Optional[List[ParsedConstraint]]:
    """Parse '1 <= Node.val, voyage[i] <= n' pattern (dotted vars in multi-var)."""
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+(?:\.[\w]+)?(?:\[[\w]+\])?(?:\s*,\s*[\w]+(?:\.[\w]+)?(?:\[[\w]+\])?)+)\s*<=\s*{NUM}\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        vars_str = m.group(2)
        max_v = _safe_parse(m.group(3))
        var_parts = [v.strip() for v in vars_str.split(",")]
        results = []
        for part in var_parts:
            var_name = part.split("[")[0].split(".")[0].strip()
            if "[" in part:
                kind = ConstraintKind.ELEMENT_RANGE
            elif ".length" in part:
                kind = ConstraintKind.ARRAY_LENGTH
            else:
                kind = ConstraintKind.INTEGER_RANGE
            results.append(ParsedConstraint(
                kind=kind,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[var_name],
                min_value=min_v,
                max_value=max_v,
                metadata={"expanded_from_multi_var": True},
            ))
        return results
    # Also try with variable upper bound
    m = re.match(
        rf"{NUM}\s*<=\s*([\w]+(?:\.[\w]+)?(?:\[[\w]+\])?(?:\s*,\s*[\w]+(?:\.[\w]+)?(?:\[[\w]+\])?)+)\s*<=\s*([\w]+)\s*$",
        text,
    )
    if m:
        min_v = _safe_parse(m.group(1))
        vars_str = m.group(2)
        upper_var = m.group(3)
        max_v = _safe_parse(upper_var)
        var_parts = [v.strip() for v in vars_str.split(",")]
        results = []
        for part in var_parts:
            var_name = part.split("[")[0].split(".")[0].strip()
            if "[" in part:
                kind = ConstraintKind.ELEMENT_RANGE
            elif ".length" in part:
                kind = ConstraintKind.ARRAY_LENGTH
            else:
                kind = ConstraintKind.INTEGER_RANGE
            results.append(ParsedConstraint(
                kind=kind,
                raw_text=text,
                confidence=Confidence.HIGH,
                variables=[var_name],
                min_value=min_v,
                max_value=max_v,
                metadata={"expanded_from_multi_var": True, **({"upper_ref": upper_var} if max_v is None else {})},
            ))
        return results
    return None


def parse_domain_specific_prose(text: str) -> Optional[ParsedConstraint]:
    """Last-resort pattern: catch remaining domain-specific prose constraints."""
    lower = text.lower()
    # "X end with Y" / "X must contain Y"
    if re.search(r"(?:end|start|begin)s?\s+with", lower):
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.LOW,
            property_name="format",
        )
    # "X must contain at least Y before Z"
    if re.search(r"must contain", lower):
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.LOW,
            property_name="format",
        )
    # "X follows either Y format"
    if re.search(r"follows?\s+(?:either\s+)?(?:the\s+)?", lower) and "format" in lower:
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.LOW,
            property_name="format",
        )
    # "X is a permutation of Y"
    if re.search(r"is a permutation of", lower):
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.LOW,
            property_name="permutation",
        )
    # "X is a valid Y" / "X is valid"
    if re.search(r"is (?:a )?valid\b", lower):
        return ParsedConstraint(
            kind=ConstraintKind.GUARANTEE,
            raw_text=text,
            confidence=Confidence.LOW,
            property_name="valid",
        )
    # "X won't exceed / will not exceed"
    m = re.search(rf"(?:won't|will not|shall not|does not) exceed\s+{NUM}", text, re.IGNORECASE)
    if m:
        max_v = _safe_parse(m.group(1))
        return ParsedConstraint(
            kind=ConstraintKind.INTEGER_RANGE,
            raw_text=text,
            confidence=Confidence.MEDIUM,
            max_value=max_v,
        )
    # "Both X and Y" type joint constraint (treat as prose)
    if re.match(r"[Bb]oth\s+", text):
        return ParsedConstraint(
            kind=ConstraintKind.PROSE,
            raw_text=text,
            confidence=Confidence.LOW,
            property_name="joint_constraint",
        )
    # "X and Y will only consist of" or "X and Y will consist of"
    if re.search(r"will (?:only )?consist", lower):
        charset = _classify_charset(text)
        if charset != text:
            return ParsedConstraint(
                kind=ConstraintKind.CHARSET,
                raw_text=text,
                confidence=Confidence.MEDIUM,
                charset=charset,
            )
    return None


# ---------------------------------------------------------------------------
# Pattern chain
# ---------------------------------------------------------------------------

# Functions that return a list of ParsedConstraints or None (must be checked first)
MULTI_PATTERNS = [
    parse_multi_var_element_range,
    parse_multi_var_nested_length,
    parse_multi_var_length,
    parse_multi_var_range,
    parse_multi_var_comma_simple,
    parse_chained_length_inequality,
    parse_comma_var_strict_lt,
    parse_dotted_multi_var_range,
]

# Functions that return a single ParsedConstraint or None
SINGLE_PATTERNS = [
    parse_array_length_range,
    parse_element_range,
    parse_2d_element_range,
    parse_nested_length,
    parse_exact_length,
    parse_equality_length_chain,
    parse_exact_expression,
    parse_variable_equality,
    parse_element_range_to_var,
    parse_triple_inequality,
    parse_element_range_strict_lt,
    parse_dotted_var_range,
    parse_strict_lt_lower_bound,
    parse_sum_expression,
    parse_multiplication,
    parse_integer_range,
    parse_upper_bound_only,
    parse_lower_bound_only,
    parse_dotted_var_upper,
    parse_method_calls,
    parse_node_count_range_prose,
    parse_height_depth_prose,
    parse_charset_consists,
    parse_charset_is_either,
    parse_charset_multi_var,
    parse_dotted_var_charset,
    parse_uniqueness,
    parse_sorted,
    parse_guarantee,
    parse_graph_property,
    parse_tree_property,
    parse_between_prose,
    parse_range_bracket_prose,
    parse_inequality,
    parse_x_where_clause,
    parse_chained_var_range,
    parse_charset_broad,
    parse_prose_property,
    parse_domain_specific_prose,
]


def parse_constraint(text: str) -> List[ParsedConstraint]:
    """Run text through pattern chain. Returns list of ParsedConstraints.

    Multi-variable patterns can expand to multiple constraints.
    Falls back to UNRESOLVED if no pattern matches.
    """
    text = text.strip()
    if not text:
        return []

    # Try multi-var patterns first (they return lists)
    for pattern_fn in MULTI_PATTERNS:
        result = pattern_fn(text)
        if result is not None:
            return result

    # Try single patterns
    for pattern_fn in SINGLE_PATTERNS:
        result = pattern_fn(text)
        if result is not None:
            return [result]

    # Fallback: unresolved
    return [ParsedConstraint(
        kind=ConstraintKind.UNRESOLVED,
        raw_text=text,
        confidence=Confidence.LOW,
    )]


# ---------------------------------------------------------------------------
# Non-Swift detection
# ---------------------------------------------------------------------------

EXCLUDED_CATEGORIES = {"Database", "Shell"}


def is_swift_eligible(problem: dict) -> bool:
    """Check if a problem supports Swift based on metadata.

    Returns False for:
    - Problems with no code_snippets at all (unclear metadata)
    - Problems without 'swift' in code_snippets
    - Problems with Database/Shell as primary category
    - Problems with excluded category in topics
    """
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


# ---------------------------------------------------------------------------
# Constraint consistency validation
# ---------------------------------------------------------------------------

def validate_consistency(constraints: List[ParsedConstraint]) -> List[ParsedConstraint]:
    """Validate and auto-merge constraints for consistency.

    - Merges separate bounds on same variable into unified ranges
    - Flags contradictions (min > max for same variable)
    """
    by_key: Dict[tuple, List[ParsedConstraint]] = {}
    standalone: List[ParsedConstraint] = []

    for c in constraints:
        if c.variables and c.kind in (
            ConstraintKind.ARRAY_LENGTH,
            ConstraintKind.ELEMENT_RANGE,
            ConstraintKind.INTEGER_RANGE,
            ConstraintKind.STRING_LENGTH,
            ConstraintKind.NESTED_LENGTH,
        ):
            key = (c.kind, tuple(c.variables))
            by_key.setdefault(key, []).append(c)
        else:
            standalone.append(c)

    merged: List[ParsedConstraint] = []
    for key, group in by_key.items():
        if len(group) == 1:
            merged.append(group[0])
        else:
            mins = [c.min_value for c in group if c.min_value is not None]
            maxs = [c.max_value for c in group if c.max_value is not None]
            final_min = max(mins) if mins else None
            final_max = min(maxs) if maxs else None

            contradiction = False
            if final_min is not None and final_max is not None and final_min > final_max:
                contradiction = True

            merged_constraint = ParsedConstraint(
                kind=group[0].kind,
                raw_text=group[0].raw_text,
                confidence=group[0].confidence,
                variables=group[0].variables,
                min_value=final_min,
                max_value=final_max,
                metadata={
                    "merged_from": [c.raw_text for c in group],
                    **({"contradiction": True} if contradiction else {}),
                },
            )
            merged.append(merged_constraint)

    return merged + standalone


# ---------------------------------------------------------------------------
# Variable-to-parameter mapping
# ---------------------------------------------------------------------------

VARIABLE_HEURISTICS = {
    "nums": {"type": "[Int]", "role": "array"},
    "arr": {"type": "[Int]", "role": "array"},
    "matrix": {"type": "[[Int]]", "role": "matrix"},
    "mat": {"type": "[[Int]]", "role": "matrix"},
    "grid": {"type": "[[Character]]", "role": "grid"},
    "board": {"type": "[[Character]]", "role": "grid"},
    "s": {"type": "String", "role": "string"},
    "t": {"type": "String", "role": "string"},
    "word": {"type": "String", "role": "string"},
    "words": {"type": "[String]", "role": "string_array"},
    "strs": {"type": "[String]", "role": "string_array"},
    "n": {"type": "Int", "role": "integer"},
    "m": {"type": "Int", "role": "integer"},
    "k": {"type": "Int", "role": "integer"},
    "target": {"type": "Int", "role": "target"},
    "val": {"type": "Int", "role": "value"},
    "head": {"type": "ListNode?", "role": "linked_list"},
    "root": {"type": "TreeNode?", "role": "tree"},
    "edges": {"type": "[[Int]]", "role": "edge_list"},
    "intervals": {"type": "[[Int]]", "role": "intervals"},
    "points": {"type": "[[Int]]", "role": "points"},
}


def build_parameter_mapping(constraints: List[ParsedConstraint]) -> Dict:
    """Build a variable-to-parameter mapping from parsed constraints."""
    mapping: Dict[str, dict] = {}
    seen_vars: List[str] = []

    for c in constraints:
        for var in c.variables:
            if var and var not in seen_vars:
                seen_vars.append(var)

    for idx, var in enumerate(seen_vars):
        clean_var = re.sub(r"_[ij]$", "", var)
        heuristic = VARIABLE_HEURISTICS.get(clean_var, VARIABLE_HEURISTICS.get(var, {}))
        mapping[var] = {
            "type": heuristic.get("type", "Unknown"),
            "index": idx,
            **({"role": heuristic["role"]} if "role" in heuristic else {}),
        }

    return mapping


# ---------------------------------------------------------------------------
# Overrides support
# ---------------------------------------------------------------------------

def load_overrides() -> Dict[str, List[str]]:
    """Load optional overrides.json for force-include/exclude."""
    overrides_path = TC_DIR / "overrides.json"
    if overrides_path.exists():
        try:
            with open(overrides_path) as f:
                data = json.load(f)
            return {
                "force_include": data.get("force_include", []),
                "force_exclude": data.get("force_exclude", []),
            }
        except (json.JSONDecodeError, KeyError):
            return {"force_include": [], "force_exclude": []}
    return {"force_include": [], "force_exclude": []}


# ---------------------------------------------------------------------------
# Data loading
# ---------------------------------------------------------------------------

def load_constraints_for_topic(topic: str, use_api_cache: bool = True) -> Dict[str, List[str]]:
    """Load constraint text for each slug in a topic.

    Prefers API-cached data (proper exponent notation) unless use_neenza is specified.
    """
    constraints_file = TC_DIR / f"constraints-{topic}.json"
    if not constraints_file.exists():
        return {}

    with open(constraints_file) as f:
        data = json.load(f)

    result: Dict[str, List[str]] = {}
    for slug, info in data.get("problems", {}).items():
        if use_api_cache:
            cache_file = API_CACHE_DIR / f"{slug}.json"
            if cache_file.exists():
                try:
                    with open(cache_file) as f:
                        cached = json.load(f)
                    result[slug] = cached.get("constraints", [])
                    continue
                except (json.JSONDecodeError, KeyError):
                    pass
        result[slug] = info.get("constraints", [])

    return result


def load_problem_metadata() -> Dict[str, dict]:
    """Load problem metadata from neenza dataset for non-Swift detection."""
    if not DATASET_PATH.exists():
        return {}
    try:
        with open(DATASET_PATH) as f:
            data = json.load(f)
        problems = data.get("questions", data) if isinstance(data, dict) else data
        return {p.get("problem_slug", ""): p for p in problems if p.get("problem_slug")}
    except (json.JSONDecodeError, KeyError):
        return {}


# ---------------------------------------------------------------------------
# NeetCode 150 loading
# ---------------------------------------------------------------------------

def load_neetcode150() -> set:
    """Load the NeetCode 150 problem slug set for FAANG frequency classification."""
    neetcode_path = TC_DIR / "neetcode150.json"
    if neetcode_path.exists():
        try:
            with open(neetcode_path) as f:
                data = json.load(f)
            return set(data.get("slugs", []))
        except (json.JSONDecodeError, KeyError):
            pass
    # Fallback: embedded minimal set of well-known NeetCode 150 slugs
    return set()


# ---------------------------------------------------------------------------
# Quarantine logic
# ---------------------------------------------------------------------------

def should_quarantine(
    slug: str,
    parsed_constraints: List[ParsedConstraint],
    raw_constraints: List[str],
    has_signature: bool,
) -> Optional[dict]:
    """Determine if a problem should be quarantined.

    Quarantine triggers:
    1. Zero numeric constraints parsed (no bounds extractable at all)
    2. Constraint parsing detects contradictions (min_value > max_value)
    3. No function signature available from dataset

    Returns quarantine info dict or None if problem passes.
    """
    # Check for contradictions
    for c in parsed_constraints:
        if c.metadata.get("contradiction"):
            return {
                "reason": "contradiction",
                "unresolvedConstraints": [c.raw_text for c in parsed_constraints if c.metadata.get("contradiction")],
            }

    # Check for zero numeric constraints
    numeric_kinds = {
        ConstraintKind.ARRAY_LENGTH,
        ConstraintKind.ELEMENT_RANGE,
        ConstraintKind.INTEGER_RANGE,
        ConstraintKind.STRING_LENGTH,
        ConstraintKind.EXACT_LENGTH,
        ConstraintKind.NESTED_LENGTH,
        ConstraintKind.MULTIPLICATION,
        ConstraintKind.METHOD_CALLS,
    }
    has_numeric = any(
        c.kind in numeric_kinds and (c.min_value is not None or c.max_value is not None)
        for c in parsed_constraints
    )
    if not has_numeric and raw_constraints:
        return {
            "reason": "no_numeric_constraints",
            "unresolvedConstraints": raw_constraints,
        }

    # Check for missing signature (only if we have metadata to check)
    if not has_signature and raw_constraints:
        return {
            "reason": "no_signature",
            "unresolvedConstraints": raw_constraints,
        }

    return None


def load_signatures_from_solutions() -> set:
    """Load slugs that have parseable function signatures from solution files.

    Used as a proxy for 'has_signature' -- if we can parse a solution's func
    signature, the problem has a usable signature.
    """
    solutions_dir = BASE_DIR.parent / "LeetPulse" / "LeetPulse" / "Resources" / "Solutions"
    slugs_with_sigs = set()

    if not solutions_dir.exists():
        return slugs_with_sigs

    for sol_file in sorted(solutions_dir.glob("*.json")):
        try:
            with open(sol_file) as f:
                data = json.load(f)
            for sol in data.get("solutions", []):
                slug = sol.get("problemSlug", "")
                approaches = sol.get("approaches", [])
                if approaches:
                    code = approaches[-1].get("code", "")
                    if code and ("func " in code or "let " in code):
                        slugs_with_sigs.add(slug)
        except (json.JSONDecodeError, KeyError):
            continue

    return slugs_with_sigs


# ---------------------------------------------------------------------------
# Main pipeline
# ---------------------------------------------------------------------------

def run_pipeline(topics: Optional[List[str]] = None, use_api_cache: bool = True):
    """Main entry point: filter non-Swift, parse constraints, quarantine, write output."""
    overrides = load_overrides()
    metadata = load_problem_metadata()
    neetcode150 = load_neetcode150()
    slugs_with_sigs = load_signatures_from_solutions()

    all_topics: Dict[str, List[str]] = {}
    for f in sorted(glob.glob(str(TC_DIR / "tc-*.json"))):
        if "index" in f:
            continue
        with open(f) as fh:
            data = json.load(fh)
        topic = data.get("topic", "")
        if not topic:
            continue
        slugs = [p.get("problemSlug", "") for p in data.get("problems", []) if p.get("problemSlug")]
        if slugs:
            all_topics[topic] = slugs

    if topics:
        all_topics = {t: s for t, s in all_topics.items() if t in topics}
        missing = set(topics) - set(all_topics.keys())
        if missing:
            print(f"WARNING: Topics not found: {sorted(missing)}")
            print(f"Available: {sorted(all_topics.keys())}")

    global_total = 0
    global_parsed = 0
    global_unresolved = 0
    global_skipped_non_swift = 0
    global_problems_processed = 0
    global_problems_with_numeric = 0

    # Track quarantined problems across all topics
    quarantined_problems: List[dict] = []

    # Track per-topic stats for coverage audit
    topic_stats: Dict[str, dict] = {}

    # Track all unresolved constraints for debugging
    all_unresolved_debug: List[dict] = []

    print(f"Constraint Parser Pipeline (with quarantine)")
    print(f"{'=' * 60}")
    print(f"Topics: {len(all_topics)}")
    print(f"API cache: {'enabled' if use_api_cache else 'disabled (using neenza)'}")
    print(f"NeetCode 150 loaded: {len(neetcode150)} slugs")
    print()

    for topic, slugs in sorted(all_topics.items()):
        print(f"{'=' * 60}")
        print(f"Topic: {topic} ({len(slugs)} problems)")
        print(f"{'=' * 60}")

        constraint_texts = load_constraints_for_topic(topic, use_api_cache)

        problems_output: Dict[str, dict] = {}
        topic_total = 0
        topic_parsed = 0
        topic_unresolved = 0
        topic_skipped = 0
        topic_problems = 0
        topic_problems_with_numeric = 0

        for slug in slugs:
            if slug in overrides.get("force_exclude", []):
                topic_skipped += 1
                continue

            if slug not in overrides.get("force_include", []):
                prob_meta = metadata.get(slug, {})
                if prob_meta and not is_swift_eligible(prob_meta):
                    topic_skipped += 1
                    global_skipped_non_swift += 1
                    continue

            topic_problems += 1

            raw_constraints = constraint_texts.get(slug, [])
            if not raw_constraints:
                problems_output[slug] = {
                    "constraints": [],
                    "unresolved": [],
                    "parameterMapping": {},
                }
                # Check quarantine for empty constraints
                has_sig = slug in slugs_with_sigs
                q_info = should_quarantine(slug, [], raw_constraints, has_sig)
                if q_info:
                    is_neetcode = slug in neetcode150
                    quarantined_problems.append({
                        "slug": slug,
                        "topic": topic,
                        "reason": q_info["reason"],
                        "unresolvedConstraints": q_info["unresolvedConstraints"],
                        "faangFrequency": "neetcode150" if is_neetcode else None,
                        "action": "ai_generate" if is_neetcode else "skip",
                    })
                continue

            all_parsed: List[ParsedConstraint] = []
            unresolved_texts: List[str] = []

            for ct in raw_constraints:
                results = parse_constraint(ct)
                for r in results:
                    if r.kind == ConstraintKind.UNRESOLVED:
                        unresolved_texts.append(r.raw_text)
                    all_parsed.append(r)
                topic_total += 1

            parsed_count = sum(1 for c in all_parsed if c.kind != ConstraintKind.UNRESOLVED)
            unresolved_count = sum(1 for c in all_parsed if c.kind == ConstraintKind.UNRESOLVED)
            topic_parsed += parsed_count
            topic_unresolved += unresolved_count

            all_parsed = validate_consistency(all_parsed)
            param_mapping = build_parameter_mapping(all_parsed)

            problems_output[slug] = {
                "constraints": [c.to_dict() for c in all_parsed if c.kind != ConstraintKind.UNRESOLVED],
                "unresolved": unresolved_texts,
                "parameterMapping": param_mapping,
            }

            # Check quarantine
            has_sig = slug in slugs_with_sigs
            q_info = should_quarantine(slug, all_parsed, raw_constraints, has_sig)
            if q_info:
                is_neetcode = slug in neetcode150
                quarantined_problems.append({
                    "slug": slug,
                    "topic": topic,
                    "reason": q_info["reason"],
                    "unresolvedConstraints": q_info["unresolvedConstraints"],
                    "faangFrequency": "neetcode150" if is_neetcode else None,
                    "action": "ai_generate" if is_neetcode else "skip",
                })
            else:
                topic_problems_with_numeric += 1

            # Track unresolved for debugging
            for ut in unresolved_texts:
                all_unresolved_debug.append({"slug": slug, "topic": topic, "text": ut})

        output_file = TC_DIR / f"parsed-constraints-{topic}.json"
        output_data = {
            "topic": topic,
            "generatedAt": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
            "problems": problems_output,
        }
        with open(output_file, "w") as f:
            json.dump(output_data, f, indent=2)

        total_constraints = topic_parsed + topic_unresolved
        pct = (topic_parsed / total_constraints * 100) if total_constraints > 0 else 0

        # Store per-topic stats
        topic_stats[topic] = {
            "problems": topic_problems,
            "problems_with_numeric": topic_problems_with_numeric,
            "parsed": topic_parsed,
            "total": total_constraints,
            "unresolved": topic_unresolved,
            "pct": pct,
            "skipped_non_swift": topic_skipped,
        }

        print(f"  Parsed: {topic_parsed}/{total_constraints} ({pct:.1f}%)")
        if topic_skipped:
            print(f"  Skipped (non-Swift): {topic_skipped}")
        topic_quarantined = [q for q in quarantined_problems if q["topic"] == topic]
        if topic_quarantined:
            print(f"  Quarantined: {len(topic_quarantined)} problems")
        if topic_unresolved > 0:
            topic_unresolved_texts = [u for u in all_unresolved_debug if u["topic"] == topic]
            for ut in topic_unresolved_texts[:5]:
                print(f"    UNRESOLVED: [{ut['slug']}] {ut['text']}")
            remaining = len(topic_unresolved_texts) - 5
            if remaining > 0:
                print(f"    ... and {remaining} more unresolved")
        print(f"  -> {output_file.name}")
        print()

        global_total += total_constraints
        global_parsed += topic_parsed
        global_unresolved += topic_unresolved
        global_problems_processed += topic_problems
        global_problems_with_numeric += topic_problems_with_numeric

    # -----------------------------------------------------------------------
    # Write quarantine.json
    # -----------------------------------------------------------------------
    quarantine_skip = sum(1 for q in quarantined_problems if q["action"] == "skip")
    quarantine_ai = sum(1 for q in quarantined_problems if q["action"] == "ai_generate")
    overall_pct = (global_parsed / global_total * 100) if global_total > 0 else 0
    problem_coverage_pct = (global_problems_with_numeric / global_problems_processed * 100) if global_problems_processed > 0 else 0

    quarantine_data = {
        "generatedAt": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "totalProblems": global_problems_processed,
        "swiftEligible": global_problems_processed,
        "parsed": global_problems_with_numeric,
        "quarantined": len(quarantined_problems),
        "coveragePercent": round(problem_coverage_pct, 1),
        "constraintCoveragePercent": round(overall_pct, 1),
        "quarantinedProblems": quarantined_problems,
    }

    quarantine_file = TC_DIR / "quarantine.json"
    with open(quarantine_file, "w") as f:
        json.dump(quarantine_data, f, indent=2)

    # -----------------------------------------------------------------------
    # Coverage audit report
    # -----------------------------------------------------------------------
    print(f"\n{'=' * 60}")
    print(f"=== Constraint Coverage Audit ===")
    print(f"{'=' * 60}")
    print(f"Total problems processed: {global_problems_processed}")
    print(f"Non-Swift excluded: {global_skipped_non_swift}")
    print(f"Swift-eligible: {global_problems_processed}")
    print()
    print(f"Per-topic breakdown:")
    for topic_name in sorted(topic_stats.keys()):
        ts = topic_stats[topic_name]
        topic_prob_pct = (ts["problems_with_numeric"] / ts["problems"] * 100) if ts["problems"] > 0 else 0
        quarantined_in_topic = sum(1 for q in quarantined_problems if q["topic"] == topic_name)
        print(f"    {topic_name}: {ts['problems_with_numeric']}/{ts['problems']} ({topic_prob_pct:.1f}%) - {quarantined_in_topic} quarantined [constraints: {ts['parsed']}/{ts['total']} ({ts['pct']:.1f}%)]")
    print()
    print(f"Overall constraint parse rate: {global_parsed}/{global_total} ({overall_pct:.1f}%)")
    print(f"Overall problem coverage: {global_problems_with_numeric}/{global_problems_processed} ({problem_coverage_pct:.1f}%)")
    print(f"Quarantined: {len(quarantined_problems)} problems ({quarantine_skip} skip, {quarantine_ai} ai_generate)")
    print()

    if overall_pct < 90:
        print(f"WARNING: Constraint coverage below 90% target ({overall_pct:.1f}%)")

    print(f"Quarantine file: {quarantine_file.name}")
    print(f"NeetCode 150 in quarantine: {quarantine_ai}")
    print()

    # List all unresolved constraints for debugging
    if all_unresolved_debug:
        print(f"--- Unresolved Constraints ({len(all_unresolved_debug)} total) ---")
        for entry in all_unresolved_debug:
            print(f"  [{entry['topic']}/{entry['slug']}] {entry['text']}")
        print()

    print(f"Done!")


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        description="Parse LeetCode constraint text into structured JSON",
    )
    parser.add_argument(
        "--topic",
        type=str,
        default=None,
        help="Parse a single topic (e.g., arrays-hashing)",
    )
    parser.add_argument(
        "--use-neenza",
        action="store_true",
        help="Use neenza dataset constraints instead of API cache",
    )
    args = parser.parse_args()

    topics_filter = [args.topic] if args.topic else None
    use_api_cache = not args.use_neenza

    run_pipeline(topics=topics_filter, use_api_cache=use_api_cache)


if __name__ == "__main__":
    main()
