#!/usr/bin/env python3
"""
export_results.py — Reads test_results.json and updates tc-*.json files
with corrected expected outputs from actual solution execution.

Usage:
    python3 Scripts/export_results.py [--results path/to/test_results.json]

What it does:
    1. Reads test_results.json (from swift test run)
    2. For each valid test result, updates expectedOutput in tc-*.json
    3. Removes test cases where the solution failed (is_valid = false)
    4. Removes SQL/non-Swift problems
    5. Regenerates tc-index.json with updated counts
"""

import argparse
import json
import os
import sys
from copy import deepcopy
from datetime import datetime, timezone
from pathlib import Path
from typing import Dict, List, Optional, Set

BASE_DIR = Path(__file__).resolve().parent.parent.parent  # Focus app test case for solutions/
EVALUATOR_DIR = Path(__file__).resolve().parent.parent
TC_DIR = BASE_DIR  # tc-*.json source files
OUTPUT_DIR = EVALUATOR_DIR / "corrected"  # output directory for corrected files

# SQL/Non-Swift problems to remove from all files
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

TOPIC_FILES = [
    "arrays-hashing", "backtracking", "binary-search", "bit-manipulation",
    "dynamic-programming", "graphs", "greedy", "heap-priority-queue",
    "intervals", "linked-list", "math-geometry", "misc",
    "sliding-window", "stack", "trees", "tries", "two-pointers",
]


def load_results(results_path: str) -> dict:
    """Load test_results.json."""
    with open(results_path) as f:
        return json.load(f)


def build_results_index(results: dict) -> Dict[str, Dict[str, dict]]:
    """Build {slug: {test_id: result}} lookup from test results."""
    index: Dict[str, Dict[str, dict]] = {}
    for r in results.get("test_results", []):
        slug = r["slug"]
        test_id = r["test_id"]
        if slug not in index:
            index[slug] = {}
        index[slug][test_id] = r
    return index


def update_topic_file(
    topic: str,
    results_index: Dict[str, Dict[str, dict]],
    output_dir: Path = OUTPUT_DIR,
    dry_run: bool = False,
) -> dict:
    """Read tc-{topic}.json and write corrected copy to output_dir. Returns stats."""
    tc_path = TC_DIR / f"tc-{topic}.json"
    if not tc_path.exists():
        return {"topic": topic, "error": "file not found"}

    with open(tc_path) as f:
        data = json.load(f)

    stats = {
        "topic": topic,
        "problems_before": len(data.get("problems", [])),
        "problems_after": 0,
        "tests_before": 0,
        "tests_after": 0,
        "outputs_corrected": 0,
        "tests_removed_invalid": 0,
        "problems_removed_sql": 0,
        "problems_removed_no_results": 0,
    }

    updated_problems = []
    for prob in data.get("problems", []):
        slug = prob.get("problemSlug", "")

        # Remove SQL problems
        if slug in SQL_SLUGS:
            stats["problems_removed_sql"] += 1
            continue

        slug_results = results_index.get(slug)

        # Keep problems that weren't evaluated (class design, broken, etc.)
        # They'll retain their original test cases
        if slug_results is None:
            updated_problems.append(prob)
            stats["tests_before"] += len(prob.get("testCases", []))
            stats["tests_after"] += len(prob.get("testCases", []))
            stats["problems_removed_no_results"] += 0  # keeping, not removing
            continue

        # Process test cases for evaluated problems
        updated_tcs = []
        for tc in prob.get("testCases", []):
            tc_id = tc.get("id", "")
            stats["tests_before"] += 1

            result = slug_results.get(tc_id)
            if result is None:
                # Test case wasn't in the results — keep as-is
                updated_tcs.append(tc)
                stats["tests_after"] += 1
                continue

            if not result.get("is_valid", False):
                # Solution failed on this input — remove the test case
                stats["tests_removed_invalid"] += 1
                continue

            # Valid result — update expectedOutput with computed output
            new_tc = deepcopy(tc)
            old_expected = tc.get("expectedOutput", "")
            new_expected = result.get("computed_output", "")

            if old_expected != new_expected:
                stats["outputs_corrected"] += 1

            new_tc["expectedOutput"] = new_expected
            updated_tcs.append(new_tc)
            stats["tests_after"] += 1

        if updated_tcs:
            updated_prob = deepcopy(prob)
            updated_prob["testCases"] = updated_tcs
            updated_prob["testCaseCount"] = len(updated_tcs)
            updated_problems.append(updated_prob)

    data["problems"] = updated_problems
    data["version"] = data.get("version", "1.0") + "-corrected"
    data["correctedAt"] = datetime.now(timezone.utc).isoformat()
    stats["problems_after"] = len(updated_problems)

    if not dry_run:
        output_dir.mkdir(parents=True, exist_ok=True)
        out_path = output_dir / f"tc-{topic}.json"
        with open(out_path, "w") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
        print(f"  Written: {out_path}")

    return stats


def update_index_file(output_dir: Path = OUTPUT_DIR, dry_run: bool = False):
    """Regenerate tc-index.json from corrected tc-*.json files."""
    topics = []

    for topic in TOPIC_FILES:
        tc_path = output_dir / f"tc-{topic}.json"
        if not tc_path.exists():
            continue
        with open(tc_path) as f:
            data = json.load(f)
        problem_count = len(data.get("problems", []))
        test_count = sum(
            len(p.get("testCases", []))
            for p in data.get("problems", [])
        )
        topics.append({
            "topic": topic,
            "file": f"tc-{topic}.json",
            "problemCount": problem_count,
            "testCaseCount": test_count,
        })

    index_data = {"topics": topics}

    if not dry_run:
        index_path = output_dir / "tc-index.json"
        with open(index_path, "w") as f:
            json.dump(index_data, f, indent=2, ensure_ascii=False)
        print(f"\nWritten: {index_path}")

    return index_data


def main():
    parser = argparse.ArgumentParser(description="Export test results to tc-*.json files")
    parser.add_argument(
        "--results",
        default=str(EVALUATOR_DIR / "test_results.json"),
        help="Path to test_results.json",
    )
    parser.add_argument(
        "--output",
        default=str(OUTPUT_DIR),
        help="Output directory for corrected tc-*.json files (default: TestCaseEvaluator/corrected/)",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print changes without writing files",
    )
    args = parser.parse_args()
    output_dir = Path(args.output)

    # Load results
    print(f"Loading results from: {args.results}")
    results = load_results(args.results)
    results_index = build_results_index(results)

    total_results = results.get("total_results", 0)
    total_problems = len(results.get("problems", []))
    print(f"  {total_results} test results for {total_problems} problems")
    print()

    if args.dry_run:
        print("DRY RUN — no files will be modified\n")

    # Process each topic
    all_stats = []
    for topic in TOPIC_FILES:
        print(f"Processing: tc-{topic}.json")
        stats = update_topic_file(topic, results_index, output_dir=output_dir, dry_run=args.dry_run)
        all_stats.append(stats)

    # Update index
    print("\nRegenerating tc-index.json")
    update_index_file(output_dir=output_dir, dry_run=args.dry_run)

    # Print summary
    print(f"\n{'='*60}")
    print("EXPORT SUMMARY")
    print(f"{'='*60}")

    total_corrected = sum(s.get("outputs_corrected", 0) for s in all_stats)
    total_removed_invalid = sum(s.get("tests_removed_invalid", 0) for s in all_stats)
    total_removed_sql = sum(s.get("problems_removed_sql", 0) for s in all_stats)
    total_tests_before = sum(s.get("tests_before", 0) for s in all_stats)
    total_tests_after = sum(s.get("tests_after", 0) for s in all_stats)

    print(f"  Outputs corrected:      {total_corrected}")
    print(f"  Tests removed (invalid): {total_removed_invalid}")
    print(f"  Problems removed (SQL):  {total_removed_sql}")
    print(f"  Tests before:           {total_tests_before}")
    print(f"  Tests after:            {total_tests_after}")
    print()

    # Per-topic breakdown
    for s in all_stats:
        if s.get("outputs_corrected", 0) > 0 or s.get("tests_removed_invalid", 0) > 0:
            print(f"  {s['topic']}: "
                  f"{s.get('outputs_corrected', 0)} corrected, "
                  f"{s.get('tests_removed_invalid', 0)} removed")


if __name__ == "__main__":
    main()
