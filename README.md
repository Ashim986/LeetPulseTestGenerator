# TestCaseEvaluator

Swift XCTest suite for evaluating and fixing LeetCode test cases.

## Usage

1. Generate test files: `python3 Scripts/generate_tests.py`
2. Build: `swift build`
3. Run tests: `swift test`

## Structure

- `Sources/LeetCodeHelpers/` — Shared types (TreeNode, ListNode, InputParser, OutputSerializer, ResultRecorder)
- `Tests/` — 17 test targets, one per LeetCode topic
- `Scripts/` — Python code generator and results exporter
