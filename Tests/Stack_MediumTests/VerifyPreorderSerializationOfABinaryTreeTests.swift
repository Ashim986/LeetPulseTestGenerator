import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCVerifyPreorderSerializationOfABinaryTree {
    private class Solution {
        func isValidSerialization(_ preorder: String) -> Bool {
            var nodes = preorder.components(separatedBy: ",")
            var count = 1

            for node in nodes {
                count -= 1
                if count < 0 {
                    return false
                }
                if node != "#" {
                    count += 2
                }
            }

            return count == 0
        }
    }

    @Suite struct VerifyPreorderSerializationOfABinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4f5c1cbb-08b7-4ad7-bc7e-6ac7a0249949",
             input: "1,null,null,null,null",
             expected: "False", orderMatters: true),
            TestCaseData(id: "5bc296d1-a14f-4feb-96ab-5279b5b3059c",
             input: "1,2,3,null,null,4,5,6",
             expected: "False", orderMatters: true),
            TestCaseData(id: "6e9a11cf-2d36-4777-b015-3a29ce0aec97",
             input: "1,2,null,null,null,null",
             expected: "False", orderMatters: true),
            TestCaseData(id: "7cc2b70e-f8e2-44e6-a7c3-fa6856d4363b",
             input: "1,2,3,null,null,null,null",
             expected: "False", orderMatters: true),
            TestCaseData(id: "af15c0ae-b878-418b-a6d5-e9bcb52e8ef8",
             input: "1,null,2,null,null,null",
             expected: "False", orderMatters: true),
            TestCaseData(id: "7590ee00-39da-4c94-9b09-b7fde000fbcc",
             input: "1,null,null,null,null,null,null",
             expected: "False", orderMatters: true),
            TestCaseData(id: "e09960a1-698a-49a6-96f4-c8704c0cbe2a",
             input: "1,2,3,null,null,4,5,6,7",
             expected: "False", orderMatters: true),
            TestCaseData(id: "0f3bc053-f8db-4144-89e9-d763381d37f8",
             input: "null",
             expected: "False", orderMatters: true),
            TestCaseData(id: "c65fdda6-ff58-4b61-a243-f606224ef2cd",
             input: "1,2",
             expected: "False", orderMatters: true),
            TestCaseData(id: "70b30071-d65a-4b47-9379-e3e34d375fb9",
             input: "1,2,3,null,null,null",
             expected: "False", orderMatters: true),
            TestCaseData(id: "9970746f-66a5-4a91-ae7a-9817751ce2c4",
             input: "1,2,3,null,null,4,5",
             expected: "false", orderMatters: true),
            TestCaseData(id: "11cc2a8d-50a1-4ab6-90e3-6b54330ac8e1",
             input: "1,null,2,null,null",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1e21398b-5e87-461c-96be-bfac2db49d5a",
             input: "1,2,null,null,null",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9ef624a7-766d-4f83-aade-8a539cb74ffc",
             input: "1,null,2,3,null,null",
             expected: "false", orderMatters: true),
            TestCaseData(id: "47943938-9d92-4d42-ac03-7f0f9927e77e",
             input: "1,2,3,4,5,6,7",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6583cff6-d447-43b8-bf6d-fde795688074",
             input: "1,null,null",
             expected: "false", orderMatters: true),
            TestCaseData(id: "69748bb1-9981-4dd7-9862-6ac969f3720c",
             input: "1,2,3,null,null,4,null",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0ba87c29-5106-4a18-892d-bb9dbe837e6b",
             input: "1,2,null,null,3,null",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1735116a-6129-40f8-9bda-76d1fd2b4ad9",
             input: "1,null,2,null,3,null",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f58fc59e-f6b8-4479-88c1-be5f043a34d6",
             input: "1,2,3,4,null,5,6",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c2470419-e52c-4a19-8cae-8f5e60601efa",
             input: "1,null,2,3,4,5,6,7,8",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3662ff41-b7c4-4aca-90dc-ff98246a9d47",
             input: "1,2,3,4,5,6,7,8,9,10",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b9c95e8c-23ae-4919-8777-aad50630a32d",
             input: "-1,null,null",
             expected: "false", orderMatters: true),
            TestCaseData(id: "87f81d28-1e2d-4b35-8915-21d9f993139d",
             input: "1,-2,3,-4,5,-6",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6c4d645c-67df-4032-9731-01d8de4751e6",
             input: "1,1,1,1,1,1,1",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "verify-preorder-serialization-of-a-binary-tree"
            let topic = "stack"
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

            let p_preorder = InputParser.parseString(params[0])
            guard p_preorder.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: preorder string too long (\(p_preorder.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_preorder.count >= 1 && p_preorder.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= preorder.length <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.isValidSerialization(p_preorder)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
