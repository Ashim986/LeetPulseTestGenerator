import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCKClosestPointsToOrigin {
    private class Solution {
        func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
            var heap: [(Int, [Int])] = []  // (dist², point)
            for p in points {
                let dist = p[0]*p[0] + p[1]*p[1]
                heap.append((dist, p))
                heap.sort { $0.0 > $1.0 }  // Max heap
                if heap.count > k { heap.removeLast() }
            }
            return heap.map { $0.1 }
        }
    }

    @Suite struct KClosestPointsToOriginTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6ae9e40f-6021-490a-a839-7217a44289e5",
             input: "points = [[0,0]], k = 1",
             expected: "[[0,0]]", orderMatters: false),
            TestCaseData(id: "205ab388-de13-4af7-b1f2-a541c50846f5",
             input: "points = [[1,1]], k = 1",
             expected: "[[1,1]]", orderMatters: false),
            TestCaseData(id: "bc081b38-f26e-4f0a-8c14-b677547f7cb2",
             input: "points = [[-1,-1]], k = 1",
             expected: "[[-1,-1]]", orderMatters: false),
            TestCaseData(id: "98efb7ba-2fbe-43b3-be9a-a378aceac734",
             input: "points = [[1,2],[1,2]], k = 1",
             expected: "[[1,2]]", orderMatters: false),
            TestCaseData(id: "67842e2d-0f7a-4ad2-93ae-f5dafb879db8",
             input: "points = [[1,2],[1,2],[1,2]], k = 2",
             expected: "[[1,2],[1,2]]", orderMatters: false),
            TestCaseData(id: "cb6a9368-815a-4933-8c8b-8b3da8bb1209",
             input: "points = [[-1,0],[0,1],[1,0]], k = 2",
             expected: "[[-1,0],[0,1]]", orderMatters: false),
            TestCaseData(id: "54f03a19-8738-4b96-b56d-4d217d8ac1c0",
             input: "points = [[-1,0],[0,1],[1,0]], k = 1",
             expected: "[[-1,0]]", orderMatters: false),
            TestCaseData(id: "355f37de-619e-431f-9441-0ecb79de5ff2",
             input: "points = [[-1,0],[0,1],[1,0]], k = 3",
             expected: "[[-1,0],[0,1],[1,0]]", orderMatters: false),
            TestCaseData(id: "13367eaf-496e-46c1-9663-6a1181061f0d",
             input: "points = [[-10,-10],[-10,10],[10,-10],[10,10]], k = 1",
             expected: "[[-10,-10]]", orderMatters: false),
            TestCaseData(id: "363d241a-5b3c-40d2-8e8b-86dffa2b126d",
             input: "points = [[-10,-10],[-10,10],[10,-10],[10,10]], k = 2",
             expected: "[[-10,-10],[-10,10]]", orderMatters: false),
            TestCaseData(id: "3079ac63-4070-4e7f-843d-9a566f8ec340",
             input: "points = [[-10,-10],[-10,10],[10,-10],[10,10]], k = 3",
             expected: "[[-10,-10],[-10,10],[10,-10]]", orderMatters: false),
            TestCaseData(id: "d20ff1d4-aef6-4005-9a3e-a5725565ec67",
             input: "points = [[-10,-10],[-10,10],[10,-10],[10,10]], k = 4",
             expected: "[[-10,-10],[-10,10],[10,-10],[10,10]]", orderMatters: false),
            TestCaseData(id: "2b5c50ae-9b70-425d-ac03-e49806ec2c50",
             input: "points = [], k = 1",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "7934f984-0219-4fef-890a-e2fc6e7e9730",
             input: "points = [[1,1]], k = 0",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "fbf454d1-d13d-4130-a46d-2fe8aab2c590",
             input: "points = [[1,1],[2,2]], k = 0",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "31cc9e8e-7bef-42d3-8b09-6b26a2638ba5",
             input: "points = [[1,1],[1,1],[1,1]], k = 1",
             expected: "[[1,1]]", orderMatters: false),
            TestCaseData(id: "c15f7b20-9954-42d0-8fae-7453c06214b1",
             input: "points = [[1,1],[1,1],[1,1]], k = 2",
             expected: "[[1,1],[1,1]]", orderMatters: false),
            TestCaseData(id: "c5ca056d-3b5f-46b7-beb6-4f9122f366c8",
             input: "points = [[1,1],[1,1],[1,1]], k = 3",
             expected: "[[1,1],[1,1],[1,1]]", orderMatters: false),
            TestCaseData(id: "23759d88-0534-46ad-9894-3fb760354016",
             input: "points = [[1,2],[3,4]], k = 1",
             expected: "[[3,4]]", orderMatters: false),
            TestCaseData(id: "158510e7-7151-4728-a7d5-b7dcea2a1d92",
             input: "points = [[1,2],[3,4]], k = 2",
             expected: "[[3,4],[1,2]]", orderMatters: false),
            TestCaseData(id: "fb2a9ce7-0596-4907-922f-af50c244efd7",
             input: "points = [[1,2],[3,4],[5,6]], k = 1",
             expected: "[[5,6]]", orderMatters: false),
            TestCaseData(id: "fe58485f-4c33-494d-b210-60f6fc1f1b24",
             input: "points = [[1,2],[3,4],[5,6]], k = 2",
             expected: "[[5,6],[3,4]]", orderMatters: false),
            TestCaseData(id: "13fe16ed-ace3-49ec-a0b6-1e333c7bc198",
             input: "points = [[1,2],[3,4],[5,6]], k = 3",
             expected: "[[5,6],[3,4],[1,2]]", orderMatters: false),
            TestCaseData(id: "48f0cad1-090b-4eb5-a802-8fac9cb5a0e9",
             input: "points = [[0,0],[0,1],[1,0]], k = 2",
             expected: "[[0,1],[1,0]]", orderMatters: false),
            TestCaseData(id: "110b62d0-8d16-4d59-b77a-b756d76ef329",
             input: "points = [[0,0],[0,1],[1,0]], k = 1",
             expected: "[[0,1]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "k-closest-points-to-origin"
            let topic = "heap-priority-queue"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_points = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_points.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: points 2D array too large (\(p_points.count))"
                )
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= points.length <= 104"
                )
                return
            }
            guard p_points.count >= 1 && p_points.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= points.length <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.kClosest(p_points, p_k)
            }
            guard !didCrash, let result = resultHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = OutputSerializer.serialize(result)

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[Int]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
