import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryTreeTilt {
    private class Solution {
        func findTilt(_ root: TreeNode?) -> Int {
            var tilt = 0
            func postorder(_ node: TreeNode?) -> Int {
                guard let node = node else { return 0 }
                let leftSum = postorder(node.left)
                let rightSum = postorder(node.right)
                tilt += abs(leftSum - rightSum)
                return node.val + leftSum + rightSum
            }
            postorder(root)
            return tilt
        }
    }

    @Suite struct BinaryTreeTiltTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f57a96fa-b8b7-4fa4-b0b5-8179947007f2",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c91f9ceb-82fb-4fd1-afeb-d289ddd9b15d",
             input: "root = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9c8704ac-e2e3-4d99-8e07-4e7d27db7f44",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cf1da79e-0fd2-4271-b97f-0a61dfb0d80e",
             input: "root = [1,-1,1,-1,1,-1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "90477db0-5ca5-471d-8195-b78f88b54823",
             input: "root = [1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3fddf297-63d2-494c-85a3-344b01c31aa7",
             input: "root = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2db58671-e6c8-46b9-b1e0-0e7aaaac3e99",
             input: "root = [1,null,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "bd993fdf-c9e2-4e4a-a54e-644d58620609",
             input: "root = [1,2,3,4,5]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "df4f7149-2364-4e52-84a9-9d847b23b35d",
             input: "root = [1,null,2,3]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "e17df661-adbb-4b50-9c80-81bcc4acf66b",
             input: "root = [1,2,3,4,null,5]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "8d504b91-7e77-4464-9736-7d22830888bd",
             input: "root = [1,2,3,null,4,5]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "106f7314-0772-4c42-b2b7-aed434a959bb",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "7e57b3e7-4e81-4922-ab4a-e53d9789f42b",
             input: "root = [1,-2,3]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "8075804b-59c5-4a10-8c2c-22bf5d10cd3d",
             input: "root = [1,2,-3]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "84acdde6-7ede-42dc-9af0-5fa938fe180b",
             input: "root = [1,-2,-3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7d9ae5b0-2102-4874-a889-afd3bef7a99c",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "68", orderMatters: true),
            TestCaseData(id: "2690a1d0-cc9b-48a5-a32a-c8589a9005ad",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "957a94b5-8b33-4291-98fc-d801b98a4352",
             input: "root = [1,2,null,3,null,4,null,5]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "d52c6971-7538-41c4-95ef-cb0de095fb09",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "35", orderMatters: true),
            TestCaseData(id: "d6db042b-833b-4837-a4cf-4064b268b396",
             input: "root = [1,2,2,3,3,3]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "c0295e8c-ddda-4e1b-8f79-9bbd06e3f74c",
             input: "root = [1,1,1,1,1,1,1,1,1,1]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "4efd7416-ba29-4c69-a6a0-9cd9072a4950",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "56", orderMatters: true),
            TestCaseData(id: "a733af82-a980-46d7-9380-94726d50dbec",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "eb0500bf-59ac-4446-a201-ffe569bc4570",
             input: "root = [1,2,null,3,null,4,null,5,null,6]",
             expected: "70", orderMatters: true),
            TestCaseData(id: "8c089f07-b15d-474d-8e71-5c4c838b7840",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]",
             expected: "83", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-tree-tilt"
            let topic = "trees"
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

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as TreeNode?"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findTilt(p_root)
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

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
