#!/usr/bin/env python3
"""One-time migration of test files from 17 topic directories to 51 topic+difficulty directories.

Reads Scripts/topics.json for topic names and slugs, reads corrected/tc-*.json for
difficulty per problem, then copies each .swift test file from Tests/{Topic}Tests/ to
Tests/{Topic}_{Difficulty}Tests/.

Usage:
    python3 Scripts/migrate_tests.py              # Copy files to new dirs (safe)
    python3 Scripts/migrate_tests.py --delete-old  # Also delete old 17 directories
"""

import argparse
import json
import shutil
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_DIR = SCRIPT_DIR.parent
TOPICS_FILE = SCRIPT_DIR / "topics.json"
CORRECTED_DIR = PROJECT_DIR / "corrected"
TESTS_DIR = PROJECT_DIR / "Tests"


def load_config() -> dict:
    """Load the canonical topics.json configuration."""
    with open(TOPICS_FILE) as f:
        return json.load(f)


def slug_to_class_name(slug: str) -> str:
    """Convert 'two-sum' to 'TwoSumTests'. Matches generate_tests.py logic."""
    parts = slug.split("-")
    name = "".join(p.capitalize() for p in parts) + "Tests"
    # Swift class names can't start with a digit
    if name[0].isdigit():
        name = "LC" + name
    return name


def build_difficulty_map(config: dict) -> dict:
    """Build {topic_slug: {filename: difficulty}} mapping from tc-*.json files.

    For each topic, loads tc-{slug}.json, iterates problems, computes the
    expected Swift filename via slug_to_class_name(), and maps it to difficulty.
    """
    topic_slug_map = config["topicSlugMap"]
    mapping = {}  # {topic_slug: {filename.swift: difficulty}}

    for _pascal, slug in topic_slug_map.items():
        tc_file = CORRECTED_DIR / f"tc-{slug}.json"
        if not tc_file.exists():
            print(f"  WARNING: {tc_file.name} not found, skipping")
            continue

        with open(tc_file) as f:
            data = json.load(f)

        file_map = {}
        for prob in data.get("problems", []):
            problem_slug = prob.get("problemSlug", "")
            difficulty = prob.get("difficulty", "medium").lower()
            if not problem_slug:
                continue
            # Normalize difficulty
            if difficulty not in ("easy", "medium", "hard"):
                difficulty = "medium"
            class_name = slug_to_class_name(problem_slug)
            filename = f"{class_name}.swift"
            file_map[filename] = difficulty

        mapping[slug] = file_map

    return mapping


def create_target_directories(config: dict) -> list[str]:
    """Create all 51 target directories under Tests/."""
    topics = config["topics"]
    difficulties = config["difficulties"]
    created = []
    for topic in topics:
        for diff in difficulties:
            dir_name = f"{topic}_{diff}Tests"
            dir_path = TESTS_DIR / dir_name
            dir_path.mkdir(parents=True, exist_ok=True)
            created.append(dir_name)
    return created


def migrate_files(config: dict, difficulty_map: dict) -> dict:
    """Copy test files from old directories to new topic+difficulty directories.

    Returns stats dict with counts and orphan details.
    """
    topic_slug_map = config["topicSlugMap"]
    slug_to_pascal = {v: k for k, v in topic_slug_map.items()}

    stats = {
        "total_migrated": 0,
        "per_topic": {},
        "orphans": [],
    }

    for pascal_topic, slug in topic_slug_map.items():
        old_dir = TESTS_DIR / f"{pascal_topic}Tests"
        if not old_dir.exists():
            print(f"  WARNING: Old directory {old_dir.name} not found, skipping")
            continue

        topic_file_map = difficulty_map.get(slug, {})
        topic_stats = {"migrated": 0, "orphaned": 0}

        for swift_file in sorted(old_dir.glob("*.swift")):
            filename = swift_file.name
            difficulty = topic_file_map.get(filename, None)

            if difficulty is None:
                # Orphan: file not found in tc-*.json mapping
                # Default to Medium per project decision
                difficulty = "medium"
                stats["orphans"].append(f"{pascal_topic}Tests/{filename}")

            diff_cap = difficulty.capitalize()
            target_dir = TESTS_DIR / f"{pascal_topic}_{diff_cap}Tests"
            target_file = target_dir / filename

            shutil.copy2(swift_file, target_file)
            topic_stats["migrated"] += 1
            stats["total_migrated"] += 1

        stats["per_topic"][pascal_topic] = topic_stats

    return stats


def add_placeholders(config: dict) -> int:
    """Add PlaceholderTests.swift to target directories with zero .swift files."""
    topics = config["topics"]
    difficulties = config["difficulties"]
    count = 0

    placeholder_content = (
        "// Placeholder -- target has no problems at this difficulty level yet.\n"
        "import Testing\n"
        "\n"
        "@Suite struct PlaceholderTests {}\n"
    )

    for topic in topics:
        for diff in difficulties:
            dir_name = f"{topic}_{diff}Tests"
            dir_path = TESTS_DIR / dir_name
            swift_files = list(dir_path.glob("*.swift"))
            if len(swift_files) == 0:
                placeholder_path = dir_path / "PlaceholderTests.swift"
                placeholder_path.write_text(placeholder_content)
                count += 1

    return count


def delete_old_directories(config: dict) -> list[str]:
    """Delete the 17 old topic directories."""
    deleted = []
    for pascal_topic in config["topics"]:
        old_dir = TESTS_DIR / f"{pascal_topic}Tests"
        if old_dir.exists():
            shutil.rmtree(old_dir)
            deleted.append(old_dir.name)
    return deleted


def main():
    parser = argparse.ArgumentParser(description="Migrate test files to 51-directory structure")
    parser.add_argument("--delete-old", action="store_true",
                        help="Delete old 17 topic directories after migration")
    args = parser.parse_args()

    config = load_config()
    print("Loading configuration...")
    print(f"  Topics: {len(config['topics'])}")
    print(f"  Difficulties: {config['difficulties']}")

    # Step 1: Build difficulty mapping
    print("\nBuilding difficulty map from tc-*.json files...")
    difficulty_map = build_difficulty_map(config)
    total_mapped = sum(len(v) for v in difficulty_map.values())
    print(f"  Mapped {total_mapped} problem files across {len(difficulty_map)} topics")

    # Step 2: Create target directories
    print("\nCreating 51 target directories...")
    created = create_target_directories(config)
    print(f"  Created/verified {len(created)} directories")

    # Step 3: Migrate files
    print("\nMigrating test files...")
    stats = migrate_files(config, difficulty_map)
    print(f"\n  Total files migrated: {stats['total_migrated']}")
    print(f"\n  Per-topic breakdown:")
    for topic, ts in sorted(stats["per_topic"].items()):
        print(f"    {topic}: {ts['migrated']} files")
    if stats["orphans"]:
        print(f"\n  Orphan files (defaulted to Medium): {len(stats['orphans'])}")
        for orphan in stats["orphans"]:
            print(f"    {orphan}")
    else:
        print(f"\n  No orphan files -- all matched in tc-*.json")

    # Step 4: Add placeholders to empty directories
    print("\nAdding placeholders to empty directories...")
    placeholder_count = add_placeholders(config)
    print(f"  Added {placeholder_count} placeholder files")

    # Step 5: Delete old directories if requested
    if args.delete_old:
        print("\nDeleting old directories...")
        deleted = delete_old_directories(config)
        print(f"  Deleted {len(deleted)} old directories: {', '.join(deleted)}")
    else:
        print("\nSkipping deletion of old directories (use --delete-old to remove them)")

    print("\nDone!")


if __name__ == "__main__":
    main()
