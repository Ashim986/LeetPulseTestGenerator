// swift-tools-version: 6.2
import PackageDescription

let testTargets: [(name: String, path: String)] = [
    ("ArraysHashingTests", "Tests/ArraysHashingTests"),
    ("BacktrackingTests", "Tests/BacktrackingTests"),
    ("BinarySearchTests", "Tests/BinarySearchTests"),
    ("BitManipulationTests", "Tests/BitManipulationTests"),
    ("DynamicProgrammingTests", "Tests/DynamicProgrammingTests"),
    ("GraphsTests", "Tests/GraphsTests"),
    ("GreedyTests", "Tests/GreedyTests"),
    ("HeapPriorityQueueTests", "Tests/HeapPriorityQueueTests"),
    ("IntervalsTests", "Tests/IntervalsTests"),
    ("LinkedListTests", "Tests/LinkedListTests"),
    ("MathGeometryTests", "Tests/MathGeometryTests"),
    ("MiscTests", "Tests/MiscTests"),
    ("SlidingWindowTests", "Tests/SlidingWindowTests"),
    ("StackTests", "Tests/StackTests"),
    ("TreesTests", "Tests/TreesTests"),
    ("TriesTests", "Tests/TriesTests"),
    ("TwoPointersTests", "Tests/TwoPointersTests"),
]

let package = Package(
    name: "TestCaseEvaluator",
    platforms: [.macOS(.v14), .iOS(.v17)],
    products: [
        .library(name: "LeetCodeHelpers", targets: ["LeetCodeHelpers"]),
    ],
    targets: [
        .target(
            name: "LeetCodeHelpers",
            path: "Sources/LeetCodeHelpers"
        ),
    ] + testTargets.map { target in
        .testTarget(
            name: target.name,
            dependencies: ["LeetCodeHelpers"],
            path: target.path
        )
    }
)
