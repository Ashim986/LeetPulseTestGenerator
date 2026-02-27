import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSlidingWindowMaximum {
    private class Solution {
        func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
            var deque: [Int] = []
            var result: [Int] = []
            for i in 0..<nums.count {
                while !deque.isEmpty && deque[deque.startIndex] < i - k + 1 { deque.removeFirst() }
                while !deque.isEmpty && nums[deque[deque.count - 1]] < nums[i] { deque.removeLast() }
                deque.append(i)
                if i >= k - 1 { result.append(nums[deque[deque.startIndex]]) }
            }
            return result
        }
    }

    @Suite struct SlidingWindowMaximumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "22ae1065-a380-411d-898d-23d1297263ec",
             input: "nums = [1,2,3], k = 1",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "82e8eead-1c08-49c5-8f75-7eeb5e858307",
             input: "nums = [1,2,3], k = 2",
             expected: "[2,3]", orderMatters: true),
            TestCaseData(id: "30c59262-a1a0-49ef-aa80-7214df05e0c2",
             input: "nums = [1,2,3], k = 3",
             expected: "[3]", orderMatters: true),
            TestCaseData(id: "ca842ae7-329a-441c-acc6-4983459dee43",
             input: "nums = [], k = 1",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "a5a77dc4-f1a7-43a7-828a-fb3a0af0f475",
             input: "nums = [1], k = 1",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "edac511d-ed4c-4f06-b4fc-8e09d2a0416e",
             input: "nums = [1,2,3,4,5], k = 5",
             expected: "[5]", orderMatters: true),
            TestCaseData(id: "71f09af3-cf0f-4232-9450-3ea3b17bdab0",
             input: "nums = [5,4,3,2,1], k = 1",
             expected: "[5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "ea6cdc1b-46e3-4755-9c96-63134a7d6418",
             input: "nums = [1,1,1,1,1], k = 3",
             expected: "[1,1,1]", orderMatters: true),
            TestCaseData(id: "7f953db2-9009-432f-9cd8-c68c7dc9a7c0",
             input: "nums = [-1,-2,-3,-4,-5], k = 2",
             expected: "[-1,-2,-3,-4]", orderMatters: true),
            TestCaseData(id: "945a13a0-465d-4ae1-be37-82b6047cc460",
             input: "nums = [1,2,3,4,5], k = 1",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "2f7c395b-f600-480e-b069-8390cbb82ae0",
             input: "nums = [10,20,30,40,50], k = 3",
             expected: "[30,40,50]", orderMatters: true),
            TestCaseData(id: "fb56ca61-c5dc-47f1-8c26-3c0938c0a74e",
             input: "nums = [1,3,5,7,9], k = 2",
             expected: "[3,5,7,9]", orderMatters: true),
            TestCaseData(id: "a71738bf-4f6f-4e00-9c45-54dfd1c3969a",
             input: "nums = [1,1,1,1,1], k = 5",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "c1832a6c-938e-408d-bf03-2ec9669a574f",
             input: "nums = [1,-1,1,-1,1], k = 2",
             expected: "[1,1,1,1]", orderMatters: true),
            TestCaseData(id: "c256f877-a134-4bd4-bb77-959f72432ea0",
             input: "nums = [10,-10,10,-10,10], k = 3",
             expected: "[10,10,10]", orderMatters: true),
            TestCaseData(id: "51f0bf4f-abe7-4466-8e2f-fb063e72c240",
             input: "nums = [1000,2000,3000,4000,5000], k = 1",
             expected: "[1000,2000,3000,4000,5000]", orderMatters: true),
            TestCaseData(id: "77a0123e-00bc-4669-acb3-c84b236156de",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], k = 5",
             expected: "[5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "8a4d08a1-de01-429f-a059-830a552636c3",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], k = 10",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "bed36666-b3bf-46fe-9fad-de8b3e9d91f7",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], k = 10",
             expected: "[10]", orderMatters: true),
            TestCaseData(id: "ab7e3947-1f16-4009-a3fb-2bff9b342502",
             input: "nums = [10,20,30,40,50,60,70,80,90,100], k = 5",
             expected: "[50,60,70,80,90,100]", orderMatters: true),
            TestCaseData(id: "82146af5-1f95-4e49-b619-d5756d14f8c7",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], k = 1",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "286ea971-0948-4693-a9f2-6e9b6d9128ac",
             input: "nums = [10,9,8,7,6,5,4,3,2,1], k = 1",
             expected: "[10,9,8,7,6,5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "7af2cb72-db1b-45ee-a238-8c9a52c6b780",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], k = 1",
             expected: "[1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "f7bdcf1a-217d-42f5-b7d3-14957b2aa062",
             input: "nums = [10,20,30,40,50,60,70,80,90,100], k = 1",
             expected: "[10,20,30,40,50,60,70,80,90,100]", orderMatters: true),
            TestCaseData(id: "656ec9ac-f423-4f11-9fcd-1bd8dcb6d0f2",
             input: "nums = [100,200,300,400,500,600,700,800,900,1000], k = 5",
             expected: "[500,600,700,800,900,1000]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sliding-window-maximum"
            let topic = "sliding-window"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
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
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxSlidingWindow(p_nums, p_k)
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
