import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFruitIntoBaskets {
    private class Solution {
        func totalFruit(_ fruits: [Int]) -> Int {
            var maxFruits = 0
            var left = 0
            var fruitCount = [Int: Int]()
            for right in 0..<fruits.count {
                fruitCount[fruits[right], default: 0] += 1
                while fruitCount.keys.count > 2 {
                    fruitCount[fruits[left], default: 0] -= 1
                    if fruitCount[fruits[left]] == 0 {
                        fruitCount.removeValue(forKey: fruits[left])
                    }
                    left += 1
                }
                maxFruits = max(maxFruits, right - left + 1)
            }
            return maxFruits
        }
    }

    @Suite struct FruitIntoBasketsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "adc97203-bd79-4621-814e-f8652ba99d78",
             input: "fruits = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "62f3dab8-0c9a-4c4c-b6ec-3bc6c7f3871b",
             input: "fruits = [1,1,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "19734e82-e9d1-4ecf-8ecf-3bda01882c1d",
             input: "fruits = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e59bd2f2-a8b2-49fd-991e-c2106fe97bdc",
             input: "fruits = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ce9ef274-9c24-4265-b477-db1d58eb6078",
             input: "fruits = [-1,-1,-1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "fd13afed-9699-4290-8fa0-17b573045356",
             input: "fruits = [1,1,2,2,1,1,2,2]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "e09a9e48-6be4-4214-8bfa-843b78de1e53",
             input: "fruits = [1,2,3,4,5,6,7,8,9,10]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "32c86afc-7e34-47d1-95a0-abd75861b50f",
             input: "fruits = [1,1,1,1,1,1,1,1,1,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "7b5d4b82-0982-4957-bde2-030cb72806af",
             input: "fruits = [1,2,1,2,1,2,1,2,1,2]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "5497e322-a3d6-4382-a9d5-2206646251b6",
             input: "fruits = [1,1,1,2,2,2,3,3,3]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "ac69e03b-ef89-4715-abe3-2d96f76f073d",
             input: "fruits = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "d1652353-9633-42ed-9b84-124a72745c0b",
             input: "fruits = [1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "dfa9a538-389b-48c4-97ff-4afc3ac57d20",
             input: "fruits = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "f56e5f47-b776-4b58-a323-6c0a652d52ee",
             input: "fruits = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e6b67e3b-667d-4143-a0a0-fe78f0d4a8a1",
             input: "fruits = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b271c1b0-8b5e-4e9d-8ff2-10432aeb9676",
             input: "fruits = [1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "c180ed47-f98e-4009-b1ae-b8678530a802",
             input: "fruits = [1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c664477e-84e0-4f80-ad0b-9d5addb7c528",
             input: "fruits = [10,9,8,7,6,5,4,3,2,1,10,9,8,7,6,5,4,3,2,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7a612776-4a08-4338-bc7c-acd8730edaed",
             input: "fruits = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "39eb0e11-131f-4830-8f55-be4a6eb5e689",
             input: "fruits = [30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "0ca32e66-3bd0-46de-abb1-64f0940a6530",
             input: "fruits = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5d7c152c-0f09-4ab1-9340-1bfc80ffa715",
             input: "fruits = [40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "40f2eecf-db38-4bb3-a864-ecad4562934b",
             input: "fruits = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,"
                + "46,47,48,49,50]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "71595bdb-7e0a-4b0b-810e-20ce9173cb5b",
             input: "fruits = [50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8"
                + ",7,6,5,4,3,2,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a30d1c07-3266-485b-907a-d121df8f6c12",
             input: "fruits = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,"
                + "46,47,48,49,50,51,52,53,54,55,56,57,58,59,60]",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "fruit-into-baskets"
            let topic = "sliding-window"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_fruits = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_fruits.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: fruits array too large (\(p_fruits.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_fruits.count >= 1 && p_fruits.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= fruits.length <= 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.totalFruit(p_fruits)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
