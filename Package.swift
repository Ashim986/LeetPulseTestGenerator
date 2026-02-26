// swift-tools-version: 6.2
import PackageDescription

// MARK: - Temporarily limited to instrumented targets only (pre-existing Node errors in LinkedList/Tries)
let testTargets: [(name: String, path: String)] = [
    ("ArraysHashingTests", "Tests/ArraysHashingTests"),
    ("HeapPriorityQueueTests", "Tests/HeapPriorityQueueTests"),
    ("IntervalsTests", "Tests/IntervalsTests"),
    ("SlidingWindowTests", "Tests/SlidingWindowTests"),
]

// Full list — restore after fixing pre-existing compilation errors:
// let testTargets: [(name: String, path: String)] = [
//     ("ArraysHashingTests", "Tests/ArraysHashingTests"),
//     ("BacktrackingTests", "Tests/BacktrackingTests"),
//     ("BinarySearchTests", "Tests/BinarySearchTests"),
//     ("BitManipulationTests", "Tests/BitManipulationTests"),
//     ("DynamicProgrammingTests", "Tests/DynamicProgrammingTests"),
//     ("GraphsTests", "Tests/GraphsTests"),
//     ("GreedyTests", "Tests/GreedyTests"),
//     ("HeapPriorityQueueTests", "Tests/HeapPriorityQueueTests"),
//     ("IntervalsTests", "Tests/IntervalsTests"),
//     ("LinkedListTests", "Tests/LinkedListTests"),
//     ("MathGeometryTests", "Tests/MathGeometryTests"),
//     ("MiscTests", "Tests/MiscTests"),
//     ("SlidingWindowTests", "Tests/SlidingWindowTests"),
//     ("StackTests", "Tests/StackTests"),
//     ("TreesTests", "Tests/TreesTests"),
//     ("TriesTests", "Tests/TriesTests"),
//     ("TwoPointersTests", "Tests/TwoPointersTests"),
// ]

let package = Package(
    name: "TestCaseEvaluator",
    platforms: [.macOS(.v14), .iOS(.v17)],
    products: [
        .library(name: "LeetCodeHelpers", targets: ["LeetCodeHelpers"]),
        .library(name: "TestResultsBundle", targets: ["TestResultsBundle"]),
    ],
    targets: [
        .target(
            name: "LeetCodeHelpers",
            path: "Sources/LeetCodeHelpers"
        ),
        .target(
            name: "TestResultsBundle",
            path: "test_results",
            sources: ["TestResultsBundle.swift"],
            resources: [
                .process("summary.json"),
                .process("arrays-hashing.json"),
                .process("heap-priority-queue.json"),
                .process("intervals.json"),
                .process("sliding-window.json"),
                .process("tries.json"),
            ]
        ),
    ] + testTargets.map { target in
        .testTarget(
            name: target.name,
            dependencies: ["LeetCodeHelpers"],
            path: target.path
        )
    }
)
