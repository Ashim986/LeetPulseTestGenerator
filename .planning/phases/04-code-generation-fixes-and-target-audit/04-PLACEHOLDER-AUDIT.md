# Placeholder Target Audit

**Date:** 2026-02-26
**Phase:** 04 - Code Generation Fixes and Target Audit
**Auditor:** Claude (automated)

## Overview

19 test target directories contain only `PlaceholderTests.swift` with no generated test files. This audit determines which targets have problems available at their topic/difficulty combination and recommends whether to keep, remove, or populate each target.

**Data sources:**
- `corrected/tc-*.json` -- project test case data (primary, authoritative)
- `LeetPulse/Resources/Solutions/*.json` -- project solution data
- `/tmp/leetcode_all.json` -- NeetCode/LeetCode dataset (2913 problems, external reference)

## Audit Results

| # | Target Name | Topic | Difficulty | Problems in tc-*.json | Solutions Available | Problems Exist (External) | Example Slugs (External) | Recommendation |
|---|-------------|-------|------------|----------------------|--------------------|--------------------------|-----------------------------|----------------|
| 1 | ArraysHashing_HardTests | ArraysHashing | Hard | 0 | 0 | Yes (462) | median-of-two-sorted-arrays, substring-with-concatenation-of-all-words, sudoku-solver | Keep |
| 2 | Backtracking_HardTests | Backtracking | Hard | 0 | 0 | Yes (27) | sudoku-solver, n-queens, n-queens-ii | Keep |
| 3 | BinarySearch_HardTests | BinarySearch | Hard | 0 | 0 | Yes (104) | median-of-two-sorted-arrays, find-minimum-in-rotated-sorted-array-ii | Keep |
| 4 | BitManipulation_HardTests | BitManipulation | Hard | 0 | 0 | Yes (78) | stickers-to-spell-word, transform-to-chessboard | Keep |
| 5 | DynamicProgramming_HardTests | DynamicProgramming | Hard | 0 | 0 | Yes (268) | regular-expression-matching, longest-valid-parentheses, trapping-rain-water | Keep |
| 6 | Graphs_HardTests | Graphs | Hard | 0 | 0 | Yes (137) | binary-tree-maximum-path-sum, word-ladder-ii, word-ladder | Keep |
| 7 | Greedy_HardTests | Greedy | Hard | 0 | 0 | Yes (85) | wildcard-matching, candy, create-maximum-number | Keep |
| 8 | HeapPriorityQueue_HardTests | HeapPriorityQueue | Hard | 0 | 0 | Yes (61) | merge-k-sorted-lists, the-skyline-problem, sliding-window-maximum | Keep |
| 9 | Intervals_HardTests | Intervals | Hard | 0 | 0 | Yes (7) | minimum-interval-to-include-each-query, data-stream-as-disjoint-intervals, meeting-rooms-iii | Keep |
| 10 | LinkedList_HardTests | LinkedList | Hard | 0 | 0 | Yes (7) | merge-k-sorted-lists, reverse-nodes-in-k-group | Keep |
| 11 | MathGeometry_HardTests | MathGeometry | Hard | 0 | 0 | Yes (143) | permutation-sequence, max-points-on-a-line, basic-calculator | Keep |
| 12 | Misc_HardTests | Misc | Hard | 0 | 0 | Likely | Misc is a NeetCode-specific catch-all; Hard problems in covered areas exist | Keep |
| 13 | SlidingWindow_HardTests | SlidingWindow | Hard | 0 | 0 | Yes (37) | substring-with-concatenation-of-all-words, minimum-window-substring | Keep |
| 14 | Stack_HardTests | Stack | Hard | 0 | 0 | Yes (42) | longest-valid-parentheses, trapping-rain-water, largest-rectangle-in-histogram | Keep |
| 15 | Trees_HardTests | Trees | Hard | 0 | 0 | Yes (48) | binary-tree-maximum-path-sum, serialize-and-deserialize-binary-tree | Keep |
| 16 | Tries_HardTests | Tries | Hard | 0 | 0 | Yes (20) | word-break-ii, word-search-ii, palindrome-pairs | Keep |
| 17 | TwoPointers_HardTests | TwoPointers | Hard | 0 | 0 | Yes (24) | trapping-rain-water, find-median-from-data-stream | Keep |
| 18 | Intervals_EasyTests | Intervals | Easy | 0 | 0 | No (0) | None found with Interval topic tag at Easy | Remove |
| 19 | Tries_EasyTests | Tries | Easy | 0 | 0 | Yes (3) | longest-common-prefix, maximum-strong-pair-xor-i, count-prefix-and-suffix-pairs-i | Keep |

## Analysis

### Problems in Our Data (tc-*.json)
- All 19 placeholder targets have **0 problems** in the project's test case data
- All 19 placeholder targets have **0 solutions** in the project's solution files
- Difficulty distribution in our data: Easy and Medium only (no Hard problems across any topic)

### External Problem Existence (leetcode_all.json, 2913 problems)
- **17 Hard targets:** Hard problems exist externally for all 17 topic categories (ranging from 7 to 462 problems per topic)
- **Intervals_Easy:** No Easy problems found with Interval-related tags. The "Intervals" category is a NeetCode-specific grouping that maps to problems tagged Array/Sorting on LeetCode. All known interval problems (merge-intervals, insert-interval, non-overlapping-intervals, meeting-rooms, meeting-rooms-ii) are Medium difficulty.
- **Tries_Easy:** 3 Easy problems exist with Trie tag (longest-common-prefix, maximum-strong-pair-xor-i, count-prefix-and-suffix-pairs-i)

### Methodology Notes
- "Intervals" is a NeetCode-specific topic grouping, not a native LeetCode tag. External counts for Intervals_Hard were determined by searching for interval-related problems by slug name and Line Sweep tag.
- "Misc" is a catch-all NeetCode category with no direct LeetCode tag mapping. Hard problems certainly exist in the covered areas (Design, Simulation, etc.), so Misc_Hard is kept.
- External problem counts may include overlap with other topics (a problem can be tagged with multiple topics).

## Summary

| Action | Count | Targets |
|--------|-------|---------|
| **Remove** | 1 | Intervals_EasyTests |
| **Keep** (problems exist, not yet sourced) | 18 | All 17 Hard targets + Tries_EasyTests |
| **Populate** | 0 | None (populating with external data is Phase 5+ scope) |

### Recommendation
- **Remove Intervals_EasyTests:** No Easy interval problems exist. This is a legitimately empty category.
- **Keep all 17 Hard targets + Tries_EasyTests:** Hard problems and Tries Easy problems exist externally but are not yet in our test case data. These placeholders should remain for future population (Phase 5+).

---
*Generated during Phase 4 Plan 02 execution*
