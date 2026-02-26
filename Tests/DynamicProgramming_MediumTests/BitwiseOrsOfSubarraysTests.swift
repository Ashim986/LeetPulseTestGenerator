import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBitwiseOrsOfSubarrays {
    private class Solution {
        func subarrayBitwiseORs(_ A: [Int]) -> [Int] {
            let n = A.count
            var prefixOR = Array(repeating: 0, count: n)
            prefixOR[0] = A[0]
            var ORs: [Int] = [A[0]]
            for i in 1..<n {
                prefixOR[i] = prefixOR[i-1] | A[i]
                if !ORs.contains(prefixOR[i]) {
                    ORs.append(prefixOR[i])
                }
            }
            for i in 0..<n {
                for j in i..<n {
                    let runningOR = A[i..<j+1].reduce(0, {
                        $0 | $1
                    }
                    )
                    if !ORs.contains(runningOR) {
                        ORs.append(runningOR)
                    }
                }
            }
            return ORs
        }
    }

    @Suite struct BitwiseOrsOfSubarraysTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "09e0ce1a-51da-40a1-8581-36184f04b2e6",
             input: "nums = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "9284af9f-298c-4ae0-bf4b-3d36f28932c3",
             input: "nums = [1,1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "91a7eb14-f286-4c15-81be-dcecd3c34c7c",
             input: "nums = [0,1]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "3f3114cd-0384-47d5-9294-722372f453c7",
             input: "nums = [1,1,1,1,1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "d5c65b16-d4aa-4da1-bc67-63dfd1565cd4",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "bbe52476-cb9d-4d62-8d52-c43b8a33fc60",
             input: "nums = [0]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "00a554a8-2455-4269-a045-4cc4bb67835a",
             input: "nums = [1,0]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "fe8e7a9e-e8cb-4b68-a35c-0d26ef7bbae9",
             input: "nums = [0,1,0]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "881e44a8-4653-48c9-8376-c64cdfb415c0",
             input: "nums = [1,0,1]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "d170742c-9d99-4146-afe7-f113bdb878ee",
             input: "nums = [1,2,0]",
             expected: "[0,1,2,3]", orderMatters: true),
            TestCaseData(id: "73682ba5-f35f-475a-8562-1834f17bc0f7",
             input: "nums = [0,0,0,0,0]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "a1132698-17da-4d58-8c3f-10d980d0af4e",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "76dc4440-1a93-4126-b386-efb515368ca6",
             input: "nums = [2,2,2,2,2]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "b34b45f2-a35d-4a05-9c3d-d7a2b6d9933f",
             input: "nums = [4,4,4,4,4]",
             expected: "[4]", orderMatters: true),
            TestCaseData(id: "34212d25-5213-47d0-b7de-5048a9ef2f78",
             input: "nums = [8,8,8,8,8]",
             expected: "[8]", orderMatters: true),
            TestCaseData(id: "22fecad9-6f6b-43b6-a39d-a665872cc226",
             input: "nums = [16,16,16,16,16]",
             expected: "[16]", orderMatters: true),
            TestCaseData(id: "c2d0e5fb-2f0e-4725-8670-b43817ced25e",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "c88cd021-8c51-4845-ad02-e8f9aec85fbc",
             input: "nums = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "cc473eba-99dd-4907-8950-a09615a4368f",
             input: "nums = [4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]",
             expected: "[4]", orderMatters: true),
            TestCaseData(id: "dd0de1de-315a-42d2-ba28-6ff7afa11638",
             input: "nums = [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8]",
             expected: "[8]", orderMatters: true),
            TestCaseData(id: "b22e794a-3c30-40d1-9240-47ddf084d2bf",
             input: "nums = [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16]",
             expected: "[16]", orderMatters: true),
            TestCaseData(id: "1b7b2d6b-cbd8-46ad-ad43-3ee803c46067",
             input: "nums = [1,2,3,4,5]",
             expected: "[1,3,7,2,4,5]", orderMatters: true),
            TestCaseData(id: "a88ed7a3-d781-4f0d-85f2-018d797456b4",
             input: "nums = [-1,-2,-3]",
             expected: "[-1,-2,-3]", orderMatters: true),
            TestCaseData(id: "03d6741c-ca42-46b6-8362-c326339f5a90",
             input: "nums = [0,-1,-2]",
             expected: "[0,-1,-2]", orderMatters: true),
            TestCaseData(id: "c0a2457e-e1f5-46f4-8a56-c039ccd8051f",
             input: "nums = [2,4,8,16]",
             expected: "[2,6,14,30,4,12,28,8,24,16]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "bitwise-ors-of-subarrays"
            let topic = "dynamic-programming"
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

            guard let p_A = InputParser.parseIntArray(params[0]) else {
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
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_A.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= arr.length <= 5 * 104"
                )
                return
            }
            guard p_A.allSatisfy({ $0 >= 0 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= arr[i] <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.subarrayBitwiseORs(p_A)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
