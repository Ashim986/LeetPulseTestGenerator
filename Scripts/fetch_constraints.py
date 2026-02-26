#!/usr/bin/env python3 -u
"""
fetch_constraints.py -- Builds per-topic constraint files from either the
LeetCode GraphQL API (--api) or the neenza/leetcode-problems GitHub dataset (default).

Usage:
    python3 Scripts/fetch_constraints.py                          # neenza dataset (existing)
    python3 Scripts/fetch_constraints.py --api                    # LeetCode API (all topics)
    python3 Scripts/fetch_constraints.py --api --topic arrays-hashing  # Single topic
"""

import argparse
import glob
import html as html_module
import json
import re
import sys
import time
import urllib.request
import urllib.error
from pathlib import Path
from typing import Dict, List, Optional

BASE_DIR = Path(__file__).resolve().parent.parent
TC_DIR = BASE_DIR / "corrected"
API_CACHE_DIR = TC_DIR / "constraints-api-cache"
DATASET_PATH = Path("/tmp/leetcode_all.json")
DATASET_URL = "https://raw.githubusercontent.com/neenza/leetcode-problems/master/merged_problems.json"


# ---------------------------------------------------------------------------
# Neenza dataset functions (existing behavior, preserved)
# ---------------------------------------------------------------------------

def download_dataset():
    """Download the full LeetCode dataset if not already cached."""
    if DATASET_PATH.exists():
        print(f"Dataset already at {DATASET_PATH}")
        return
    print("Downloading dataset from GitHub...")
    urllib.request.urlretrieve(DATASET_URL, DATASET_PATH)
    print(f"Downloaded to {DATASET_PATH}")


def load_dataset() -> Dict[str, dict]:
    """Load dataset and index by slug."""
    with open(DATASET_PATH) as f:
        data = json.load(f)
    problems = data.get("questions", data) if isinstance(data, dict) else data
    by_slug: Dict[str, dict] = {}
    for p in problems:
        slug = p.get("problem_slug", "")
        if slug:
            by_slug[slug] = p
    print(f"Loaded {len(by_slug)} problems from dataset")
    return by_slug


def get_slugs_by_topic() -> Dict[str, List[str]]:
    """Get problem slugs grouped by topic from test case files."""
    topics: Dict[str, List[str]] = {}
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


# ---------------------------------------------------------------------------
# LeetCode GraphQL API functions (new --api mode)
# ---------------------------------------------------------------------------

def fetch_constraint_html(slug: str) -> str:
    """Fetch raw problem HTML from LeetCode GraphQL API.

    Returns the HTML content string for the problem, or empty string on failure.
    """
    query = json.dumps({
        "query": """query questionContent($titleSlug: String!) {
            question(titleSlug: $titleSlug) { content }
        }""",
        "variables": {"titleSlug": slug},
    })
    req = urllib.request.Request(
        "https://leetcode.com/graphql",
        data=query.encode(),
        headers={
            "Content-Type": "application/json",
            "User-Agent": "Mozilla/5.0",
        },
    )
    with urllib.request.urlopen(req, timeout=10) as resp:
        result = json.loads(resp.read())
    content = result.get("data", {}).get("question", {}).get("content", "")
    return content or ""


def extract_constraints(content_html: str) -> List[str]:
    """Extract constraint strings from problem HTML with proper exponent handling.

    Converts <sup>X</sup> to ^X (critical for exponent notation like 10^5)
    and <sub>X</sub> to _X (for subscript variables like a_i).
    Strips all remaining HTML tags and unescapes HTML entities.
    """
    if not content_html:
        return []

    match = re.search(r"Constraints:.*?</ul>", content_html, re.DOTALL)
    if not match:
        return []

    items = re.findall(r"<li>(.*?)</li>", match.group(0), re.DOTALL)
    clean: List[str] = []
    for item in items:
        text = re.sub(r"<sup>(.*?)</sup>", r"^\1", item)
        text = re.sub(r"<sub>(.*?)</sub>", r"_\1", text)
        text = re.sub(r"<[^>]+>", "", text)
        text = html_module.unescape(text)
        text = text.strip()
        if text:
            clean.append(text)
    return clean


def fetch_all_constraints(
    slugs: List[str],
    cache_dir: Path,
    delay: float = 1.0,
) -> Dict[str, List[str]]:
    """Fetch constraints for a list of slugs from LeetCode API with caching.

    For each slug:
    1. Checks cache_dir/{slug}.json for cached results
    2. If not cached, fetches from API, extracts constraints, caches to disk
    3. Sleeps `delay` seconds between API calls
    4. Retries with exponential backoff on HTTP 429 (max 3 retries, 2x backoff from 5s)
    5. Falls back to neenza dataset data on persistent API failure

    Returns {slug: [constraint_strings]}.
    """
    cache_dir.mkdir(parents=True, exist_ok=True)
    results: Dict[str, List[str]] = {}

    # Pre-load neenza dataset for fallback
    neenza_data: Optional[Dict[str, dict]] = None

    total = len(slugs)
    fetched_from_api = 0
    fetched_from_cache = 0
    fell_back = 0

    for i, slug in enumerate(slugs, 1):
        cache_file = cache_dir / f"{slug}.json"

        # Check cache first
        if cache_file.exists():
            try:
                with open(cache_file) as f:
                    cached = json.load(f)
                results[slug] = cached.get("constraints", [])
                fetched_from_cache += 1
                continue
            except (json.JSONDecodeError, KeyError):
                pass  # Re-fetch if cache is corrupt

        # Fetch from API
        max_retries = 3
        backoff = 5.0
        success = False

        for attempt in range(max_retries):
            try:
                print(f"  [{i}/{total}] Fetching {slug}...", end=" ", flush=True)
                content_html = fetch_constraint_html(slug)
                constraints = extract_constraints(content_html)

                # Cache the result
                cache_data = {
                    "slug": slug,
                    "constraints": constraints,
                    "fetched_at": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
                }
                with open(cache_file, "w") as f:
                    json.dump(cache_data, f, indent=2)

                results[slug] = constraints
                fetched_from_api += 1
                success = True
                print(f"{len(constraints)} constraints")
                break

            except urllib.error.HTTPError as e:
                if e.code == 429:
                    wait = backoff * (2 ** attempt)
                    print(f"rate limited, retrying in {wait:.0f}s...")
                    time.sleep(wait)
                else:
                    print(f"HTTP {e.code}")
                    break
            except (urllib.error.URLError, TimeoutError, OSError) as e:
                print(f"error: {e}")
                break

        if not success:
            # Fall back to neenza dataset
            if neenza_data is None:
                try:
                    download_dataset()
                    neenza_data = load_dataset()
                except Exception:
                    neenza_data = {}
                    print(f"  WARNING: neenza fallback also unavailable")

            p = neenza_data.get(slug, {}) if neenza_data else {}
            fallback_constraints = p.get("constraints", [])
            if fallback_constraints:
                results[slug] = fallback_constraints
                fell_back += 1
                print(f"  [{i}/{total}] {slug}: fell back to neenza ({len(fallback_constraints)} constraints)")
            else:
                results[slug] = []
                fell_back += 1
                print(f"  [{i}/{total}] {slug}: no constraints from either source")

        # Rate limiting delay between API calls
        if success and i < total:
            time.sleep(delay)

    print(f"\n  API: {fetched_from_api}, cached: {fetched_from_cache}, fallback: {fell_back}")
    return results


# ---------------------------------------------------------------------------
# Main entry points
# ---------------------------------------------------------------------------

def run_neenza(topic_filter: Optional[str] = None):
    """Original behavior: build constraint files from neenza dataset."""
    download_dataset()
    dataset = load_dataset()

    topics = get_slugs_by_topic()
    if topic_filter:
        if topic_filter not in topics:
            print(f"Topic '{topic_filter}' not found. Available: {sorted(topics.keys())}")
            sys.exit(1)
        topics = {topic_filter: topics[topic_filter]}

    total_slugs = sum(len(s) for s in topics.values())
    print(f"Found {total_slugs} problems across {len(topics)} topics\n")

    total_matched = 0
    total_missing = 0

    for topic, slugs in sorted(topics.items()):
        output_file = TC_DIR / f"constraints-{topic}.json"
        results = {}
        matched = 0
        missing = 0

        print(f"{'=' * 50}")
        print(f"Topic: {topic} ({len(slugs)} problems)")
        print(f"{'=' * 50}")

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
        print(f"  {matched} matched, {missing} missing -> {output_file.name}")

    print(f"\nDone! {total_matched}/{total_matched + total_missing} problems matched")


def run_api(topic_filter: Optional[str] = None):
    """New behavior: fetch constraints from LeetCode GraphQL API."""
    topics = get_slugs_by_topic()
    if topic_filter:
        if topic_filter not in topics:
            print(f"Topic '{topic_filter}' not found. Available: {sorted(topics.keys())}")
            sys.exit(1)
        topics = {topic_filter: topics[topic_filter]}

    total_slugs = sum(len(s) for s in topics.values())
    print(f"Fetching constraints via LeetCode API for {total_slugs} problems across {len(topics)} topics\n")

    for topic, slugs in sorted(topics.items()):
        print(f"{'=' * 50}")
        print(f"Topic: {topic} ({len(slugs)} problems)")
        print(f"{'=' * 50}")

        # Fetch constraints (with caching)
        constraint_map = fetch_all_constraints(slugs, API_CACHE_DIR, delay=1.0)

        # Write per-topic constraint file in the same format as neenza
        output_file = TC_DIR / f"constraints-{topic}.json"
        results = {}
        for slug in slugs:
            constraints = constraint_map.get(slug, [])
            results[slug] = {
                "constraints": constraints,
            }

        with open(output_file, "w") as f:
            json.dump({"topic": topic, "problems": results}, f, indent=2)

        # Report
        has_constraints = sum(1 for s in slugs if constraint_map.get(s))
        print(f"  -> {output_file.name}: {has_constraints}/{len(slugs)} with constraints\n")

    print("Done!")


def main():
    parser = argparse.ArgumentParser(
        description="Fetch LeetCode problem constraints (neenza dataset or LeetCode API)",
    )
    parser.add_argument(
        "--api",
        action="store_true",
        help="Fetch from LeetCode GraphQL API instead of neenza dataset",
    )
    parser.add_argument(
        "--topic",
        type=str,
        default=None,
        help="Process a single topic (e.g., arrays-hashing)",
    )
    args = parser.parse_args()

    if args.api:
        run_api(topic_filter=args.topic)
    else:
        run_neenza(topic_filter=args.topic)


if __name__ == "__main__":
    main()
