import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCKthSmallestElementInABst {
    private class Solution {
        func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
            var stack: [TreeNode] = []
            var node = root
            var remaining = k

            while node != nil || !stack.isEmpty {
                while let current = node {
                    stack.append(current)
                    node = current.left
                }
                let current = stack.removeLast()
                remaining -= 1
                if remaining == 0 { return current.val }
                node = current.right
            }
            return 0
        }
    }

    @Suite struct KthSmallestElementInABstTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "39f4c305-13d7-4812-a8ad-5b1a9f09b69e",
             input: "root = [1,null,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5c26dda3-1ac9-415a-89a5-d2f57938166e",
             input: "root = [2,1,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d0246510-9197-4bf5-ab73-7dda753546a5",
             input: "root = [1,null,2,null,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d06e6ee9-9338-4763-9ef2-72f09f7607c7",
             input: "root = [5,3,6,2,4,null,7]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "aed49c9e-b82c-4f6c-84f8-4bdae4d5f910",
             input: "root = [10,5,15,3,7,12,20]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "89349f99-5394-4089-bf8b-677c5bfeef5f",
             input: "root = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5f738ed8-77a6-4829-acdc-63c478a23d45",
             input: "root = [-1,null,0]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "a9dc4773-2fed-4988-a730-9d658ee45cd9",
             input: "root = [1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4b8dfbc4-97ac-4b6d-9b38-7ae3b91e7448",
             input: "root = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "72b42237-8fa1-47b2-8272-0bd096891b19",
             input: "root = null",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6137fc2b-5c69-4fa1-b5a7-1887a40b687f",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "07f7feee-56e4-4f5d-9977-94275368ad3d",
             input: "root = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2d18373f-8119-414e-aeed-8c3f105d9b51",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "94bbf5b6-4153-41ae-8801-c14cfcc8037a",
             input: "root = [5,5,5,5,5,5,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a705164c-9d9f-4fb3-9366-aa2e6f2230f7",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "065fcd35-6ef1-4a32-a6ce-cc4e93058d4c",
             input: "root = [2,2,2,2,2,2,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "50737818-f8d1-4f9a-8b6e-f5765cddd7b2",
             input: "root = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d8ebf300-89e2-4e0e-a39f-ecc3c5efe187",
             input: "root = [1,2,3,4,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "2636244c-f423-49fc-a44f-78316629a3da",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2a6673c6-b9ee-462a-a7b3-181e23c27050",
             input: "root = [-10,-5,0,5,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "8e33de40-a8ed-4739-a360-536e7ef5a49c",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "854687b1-edc0-4d66-9ab8-75b9c2a91154",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,11,13,21,22]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f4cd978b-25d2-4d8d-93ad-e8f0408d5f06",
             input: "root = [5,3,6,2,4,null,null,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c693620d-5727-4cc5-9a3c-506f202c08b6",
             input: "root = [10,5,15,3,7,13,18]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f1371c93-5a4e-40dd-8fc4-371a34798d5c",
             input: "root = [10,5,15,3,7,13,18,2,4,6,8,9,11,12,14,16,17,19]",
             expected: "16", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "kth-smallest-element-in-a-bst"
            let topic = "trees"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= n <= 104"
                )
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= n <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.kthSmallest(p_root, p_k)
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
