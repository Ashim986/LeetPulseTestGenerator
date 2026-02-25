#!/usr/bin/env python3 -u
"""
fetch_constraints.py — Builds per-topic constraint files from the
neenza/leetcode-problems GitHub dataset.

Usage:
    python3 Scripts/fetch_constraints.py
"""

import json
import glob
import sys
from pathlib import Path
from typing import List, Dict

BASE_DIR = Path(__file__).resolve().parent.parent
TC_DIR = BASE_DIR / "corrected"
DATASET_PATH = Path("/tmp/leetcode_all.json")
DATASET_URL = "https://raw.githubusercontent.com/neenza/leetcode-problems/master/merged_problems.json"


def download_dataset():
    """Download the full LeetCode dataset if not already cached."""
    if DATASET_PATH.exists():
        print(f"Dataset already at {DATASET_PATH}")
        return
    import urllib.request
    print(f"Downloading dataset from GitHub...")
    urllib.request.urlretrieve(DATASET_URL, DATASET_PATH)
    print(f"Downloaded to {DATASET_PATH}")


def load_dataset() -> Dict[str, dict]:
    """Load dataset and index by slug."""
    with open(DATASET_PATH) as f:
        data = json.load(f)
    problems = data.get("questions", data) if isinstance(data, dict) else data
    by_slug = {}
    for p in problems:
        slug = p.get("problem_slug", "")
        if slug:
            by_slug[slug] = p
    print(f"Loaded {len(by_slug)} problems from dataset")
    return by_slug


def get_slugs_by_topic() -> Dict[str, List[str]]:
    """Get problem slugs grouped by topic from test case files."""
    topics = {}
    for f in sorted(glob.glob(str(TC_DIR / "tc-*.json"))):
        if "index" in f:
            continue
        with open(f) as fh:
            data = json.load(fh)
        topic = data.get("topic", "")
        if not topic:
            continue
        slugs = []
        for p in data.get("problems", []):
            slug = p.get("problemSlug", "")
            if slug:
                slugs.append(slug)
        if slugs:
            topics[topic] = slugs
    return topics


def main():
    download_dataset()
    dataset = load_dataset()

    topics = get_slugs_by_topic()
    total_slugs = sum(len(s) for s in topics.values())
    print(f"Found {total_slugs} problems across {len(topics)} topics\n")

    total_matched = 0
    total_missing = 0

    for topic, slugs in sorted(topics.items()):
        output_file = TC_DIR / f"constraints-{topic}.json"
        results = {}
        matched = 0
        missing = 0

        print(f"{'='*50}")
        print(f"Topic: {topic} ({len(slugs)} problems)")
        print(f"{'='*50}")

        for slug in slugs:
            p = dataset.get(slug)
            if p and p.get("constraints"):
                results[slug] = {
                    "questionId": str(p.get("frontend_id", "")),
                    "title": p.get("title", ""),
                    "difficulty": p.get("difficulty", ""),
                    "constraints": p.get("constraints", []),
                    "description": p.get("description", ""),
                }
                matched += 1
            else:
                missing += 1
                print(f"  MISSING: {slug}")

        with open(output_file, "w") as f:
            json.dump({"topic": topic, "problems": results}, f, indent=2)

        total_matched += matched
        total_missing += missing
        print(f"  {matched} matched, {missing} missing → {output_file.name}")

    print(f"\nDone! {total_matched}/{total_matched + total_missing} problems matched")


if __name__ == "__main__":
    main()
