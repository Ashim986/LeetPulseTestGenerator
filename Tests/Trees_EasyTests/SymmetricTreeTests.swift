import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSymmetricTree {
    private class Solution {
        func isSymmetric(_ root: TreeNode?) -> Bool {
            func isMirror(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
                if t1 == nil && t2 == nil { return true }
                if t1 == nil || t2 == nil { return false }
                if t1.unsafelyUnwrapped.val != t2.unsafelyUnwrapped.val { return false }

                return isMirror(t1?.left, t2?.right) && isMirror(t1?.right, t2?.left)
            }

            return isMirror(root, root)
        }
    }

    @Suite struct SymmetricTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "02e6feae-20a0-401f-b50a-8b35d3f594ed",
             input: "root = []",
             expected: "True", orderMatters: true),
            TestCaseData(id: "f57c92af-48b8-4fc9-8bd6-818b162e7651",
             input: "root = [1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "ae218634-6a78-452c-82a2-d330ce6dd242",
             input: "root = [1,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "d25b9579-bef6-4e2e-aeb9-8db086fc49e4",
             input: "root = [1,null,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "f4764a79-04e6-4a47-b27d-82143b5c133a",
             input: "root = [1,2,2]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "84e39869-efb5-454e-9f84-93fbfef40596",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "f2c31303-95e5-4d8e-82d5-d51de64c5b20",
             input: "root = [1,-2,-2]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "76d03786-8929-4294-abcf-003a7107f1a3",
             input: "root = [1,-2,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "0b582074-1115-4f96-bb53-b12bfbe2c426",
             input: "root = [1,2,2,3,4,3,4]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "a7a6a0bd-7486-45ee-9be1-ea5465558d29",
             input: "root = [1,2,2,null,3,null,3,null,null,4,4]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "9b99daff-8265-426b-8781-b25d8fe4e71a",
             input: "root = [1,2,2,null,3,null,3,null,null,null,4,4]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "bf7be6e6-9360-4921-a0a6-e4ec9c0afe9f",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "6f0d01dd-e240-426d-9af5-f76d2b64dce7",
             input: "root = [1,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "9668cb4b-0c49-43c5-abab-7089a4540891",
             input: "root = [1,2,null,null,3]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "5c4d9e32-bd8f-46e2-b132-84882db8f730",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "1d0b55a6-4c78-4df6-989e-4b6e95933c18",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "71a9a2b8-8d0e-4979-b3f2-2933a79ab824",
             input: "root = [1,2,3,4,5,6,7,8,9]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "d49e62af-db2a-4e04-a985-7eb3708af564",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "d99ccbd4-a8d7-4f3e-89b6-708db0e63e80",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "a5b7b49b-8ea9-47ce-bdbb-1114afe7981b",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "da14a10c-1ac5-4a8d-9978-7f7bac556bc9",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "6e087a1f-5edd-49f9-bc24-08359629d0c9",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "27ef1ff3-b6c6-492b-b6a2-80235543f69f",
             input: "root = [1,2,2,3,4,3,4,5,6,5,6]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "ed143197-57ab-416f-8e6c-62ccdb9da1f3",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "56b58a4d-187a-4924-b50a-70e799265990",
             input: "root = [1,2,2,3,3,4,4,5,6,5,6]",
             expected: "False", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "symmetric-tree"
            let topic = "trees"
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

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as TreeNode?"
                )
                return
            }

            let solution = Solution()
            let result = solution.isSymmetric(p_root)
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
