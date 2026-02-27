import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindRightInterval {
    private class Solution {
        func findRightInterval(intervals: [[Int]]) -> [Int] {
            let sortedIntervals = intervals.enumerated().sorted(by: {
                $0.element[0] < $1.element[0]
            }
            )
            var result = [Int]()
            for i in 0..<intervals.count {
                let index = binarySearch(intervals: sortedIntervals, target: intervals[i][1])
                if index != -1 {
                    result.append(sortedIntervals[index].offset)
                }
                else {
                    result.append(-1)
                }
            }
            return result
        }
        func binarySearch(intervals: [(offset: Int, element: [Int])], target: Int) -> Int {
            var left = 0
            var right = intervals.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if intervals[mid].element[0] == target {
                    return mid
                }
                else if intervals[mid].element[0] < target {
                    left = mid + 1
                }
                else {
                    right = mid - 1
                }
            }
            if left < intervals.count && intervals[left].element[0] > target {
                return left
            }
            return -1
        }
    }

    @Suite struct FindRightIntervalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1fed7b44-ab95-4822-a68b-d15cae3bb297",
             input: "intervals = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "9297cba0-e506-4530-b71f-8428200ddbc1",
             input: "intervals = [[1,1],[2,2]]",
             expected: "[1,0]", orderMatters: true),
            TestCaseData(id: "fdef2937-a111-43d4-81f2-5889a0485405",
             input: "intervals = [[10,20],[20,30],[30,40],[40,50]]",
             expected: "[1,2,3,-1]", orderMatters: true),
            TestCaseData(id: "94e9f209-8aa1-4d55-8d4e-0542795698c4",
             input: "intervals = [[1,1]]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "05ab48e8-41bc-41cd-9bcd-79f0fd93117a",
             input: "intervals = [[1,2],[2,3]]",
             expected: "[1,-1]", orderMatters: true),
            TestCaseData(id: "d0122ac3-ca50-4d89-bbd5-10fc716b63c6",
             input: "intervals = [[1,2],[3,4],[5,6]]",
             expected: "[1,2,-1]", orderMatters: true),
            TestCaseData(id: "0987c2e4-656e-4d81-abcc-14f3cf82dea6",
             input: "intervals = [[1,4],[2,3],[3,4],[4,5]]",
             expected: "[3,2,3,-1]", orderMatters: true),
            TestCaseData(id: "1d249d9d-c569-4698-9b84-eeaaef73a4eb",
             input: "intervals = [[-1,0],[0,1],[1,2]]",
             expected: "[1,2,-1]", orderMatters: true),
            TestCaseData(id: "60e7f0bb-ee65-4711-8b12-22acc1497250",
             input: "intervals = [[1,1],[1,1],[1,1]]",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "45a6a69d-deed-4e4d-bfe1-fe12b4d98e22",
             input: "intervals = [[1,2],[2,3],[3,4],[4,5],[5,6]]",
             expected: "[1,2,3,4,-1]", orderMatters: true),
            TestCaseData(id: "5a24d9b7-6f39-43bb-8b21-d7615a25776d",
             input: "intervals = [[10,20],[20,30],[30,40]]",
             expected: "[1,2,-1]", orderMatters: true),
            TestCaseData(id: "58d8d015-6beb-42c9-b848-92f21d85ec1b",
             input: "intervals = [[100,200],[200,300],[300,400]]",
             expected: "[1,2,-1]", orderMatters: true),
            TestCaseData(id: "f2163db1-0b97-4664-aa6f-67797195f0c6",
             input: "intervals = [[1,1000],[2,2000],[3,3000]]",
             expected: "[-1,-1,-1]", orderMatters: true),
            TestCaseData(id: "08ee0b39-5c1f-4da3-aa84-306594cfe690",
             input: "intervals = [[-100,-50],[-50,0],[0,50]]",
             expected: "[1,2,-1]", orderMatters: true),
            TestCaseData(id: "07d69b17-c1fe-4e37-b84f-6620f199bd2d",
             input: "intervals = [[-1000,-500],[-500,0],[0,500]]",
             expected: "[1,2,-1]", orderMatters: true),
            TestCaseData(id: "afc6fb11-9c86-4c9e-a926-4fa9dee32e38",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8]]",
             expected: "[1,2,3,-1]", orderMatters: true),
            TestCaseData(id: "a1f80fd0-acce-4359-ab41-84ca11aed475",
             input: "intervals = [[1,10],[2,3],[3,4],[4,5]]",
             expected: "[-1,2,3,-1]", orderMatters: true),
            TestCaseData(id: "7a2efeb0-8219-41bc-859a-b1303777c6ad",
             input: "intervals = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]",
             expected: "[1,2,3,4,5,-1]", orderMatters: true),
            TestCaseData(id: "4e6f4061-8f9c-499c-81de-bd5ba3d0686b",
             input: "intervals = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8]]",
             expected: "[1,2,3,4,5,6,-1]", orderMatters: true),
            TestCaseData(id: "2f36e633-3c26-4f4c-a97f-90c3da7a0a2a",
             input: "intervals = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9]]",
             expected: "[1,2,3,4,5,6,7,-1]", orderMatters: true),
            TestCaseData(id: "b178fe99-e2ea-4512-8dbe-2082f7fc86bd",
             input: "intervals = [[1,2],[1,2]]",
             expected: "[-1,-1]", orderMatters: true),
            TestCaseData(id: "727c599b-0422-4b7d-ae9e-ac6330f6ec77",
             input: "intervals = [[1,2],[2,3],[1,2]]",
             expected: "[1,-1,1]", orderMatters: true),
            TestCaseData(id: "50e2f3df-246b-4917-a09f-875e6641e8d4",
             input: "intervals = [[1,2],[2,3],[3,4],[1,2]]",
             expected: "[1,2,-1,1]", orderMatters: true),
            TestCaseData(id: "81305c4b-8a8f-4c60-90c5-6d35685c677e",
             input: "intervals = [[1,2],[2,3],[3,4],[4,5],[1,2]]",
             expected: "[1,2,3,-1,1]", orderMatters: true),
            TestCaseData(id: "e7500579-d2db-4644-8590-dfbcd53943d1",
             input: "intervals = [[1,2],[2,3],[3,4],[4,5],[5,6],[1,2]]",
             expected: "[1,2,3,4,-1,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-right-interval"
            let topic = "binary-search"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_intervals = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_intervals.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: intervals 2D array too large (\(p_intervals.count))"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.findRightInterval(intervals: p_intervals)
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

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
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
