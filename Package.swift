// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TestCaseEvaluator",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "LeetCodeHelpers", targets: ["LeetCodeHelpers"]),
    ],
    targets: [
        .target(
            name: "LeetCodeHelpers",
            path: "Sources/LeetCodeHelpers"
        ),
        .testTarget(name: "ArraysHashingTests", dependencies: ["LeetCodeHelpers"], path: "Tests/ArraysHashingTests"),
        .testTarget(name: "BacktrackingTests", dependencies: ["LeetCodeHelpers"], path: "Tests/BacktrackingTests"),
        .testTarget(name: "BinarySearchTests", dependencies: ["LeetCodeHelpers"], path: "Tests/BinarySearchTests"),
        .testTarget(name: "BitManipulationTests", dependencies: ["LeetCodeHelpers"], path: "Tests/BitManipulationTests"),
        .testTarget(name: "DynamicProgrammingTests", dependencies: ["LeetCodeHelpers"], path: "Tests/DynamicProgrammingTests"),
        .testTarget(name: "GraphsTests", dependencies: ["LeetCodeHelpers"], path: "Tests/GraphsTests"),
        .testTarget(name: "GreedyTests", dependencies: ["LeetCodeHelpers"], path: "Tests/GreedyTests"),
        .testTarget(name: "HeapPriorityQueueTests", dependencies: ["LeetCodeHelpers"], path: "Tests/HeapPriorityQueueTests"),
        .testTarget(name: "IntervalsTests", dependencies: ["LeetCodeHelpers"], path: "Tests/IntervalsTests"),
        .testTarget(name: "LinkedListTests", dependencies: ["LeetCodeHelpers"], path: "Tests/LinkedListTests"),
        .testTarget(name: "MathGeometryTests", dependencies: ["LeetCodeHelpers"], path: "Tests/MathGeometryTests"),
        .testTarget(name: "MiscTests", dependencies: ["LeetCodeHelpers"], path: "Tests/MiscTests"),
        .testTarget(name: "SlidingWindowTests", dependencies: ["LeetCodeHelpers"], path: "Tests/SlidingWindowTests"),
        .testTarget(name: "StackTests", dependencies: ["LeetCodeHelpers"], path: "Tests/StackTests"),
        .testTarget(name: "TreesTests", dependencies: ["LeetCodeHelpers"], path: "Tests/TreesTests"),
        .testTarget(name: "TriesTests", dependencies: ["LeetCodeHelpers"], path: "Tests/TriesTests"),
        .testTarget(name: "TwoPointersTests", dependencies: ["LeetCodeHelpers"], path: "Tests/TwoPointersTests"),
    ]
)
