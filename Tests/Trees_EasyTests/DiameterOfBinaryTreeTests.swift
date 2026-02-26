import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDiameterOfBinaryTree {
    private class Solution {
        func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
            var diameter = 0

            func height(_ node: TreeNode?) -> Int {
                guard let node = node else { return 0 }
                let left = height(node.left)
                let right = height(node.right)
                diameter = max(diameter, left + right)
                return 1 + max(left, right)
            }

            _ = height(root)
            return diameter
        }
    }

    @Suite struct DiameterOfBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ef71377b-835d-4933-af9a-371bd3548a86",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "280c748a-a618-4e82-b4ba-3e05feaea87d",
             input: "root = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b0effee9-cc76-4460-b0db-414f6d81599e",
             input: "root = [1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3c3145ea-8388-4a43-8d7c-2e22a22bd68a",
             input: "root = [1,null,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1429df9e-2855-46a7-bc18-ca561cca5329",
             input: "root = [1,null,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ac3e18ca-a9ea-4565-88fa-abd4164b1da8",
             input: "root = [1,2,3,null,4]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "db0f2e17-948e-4a98-9bf5-10fb3273e70a",
             input: "root = [1,null,2,null,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "282d60de-5336-4641-a6e0-24d74df28290",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "3e04dd7c-7beb-4851-a939-8aae7a1f2c9e",
             input: "root = [-1,-2,-3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2666e66f-3a74-42cc-be54-f8b601310276",
             input: "root = [1,2,2,3,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a109e789-3530-4e30-92a5-30f81a1e3e63",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "f8dc1cfb-ab32-40cd-82b6-7656fd517ca2",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "0fc3c80b-52af-4da7-aba5-234a54ecacd4",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "8225607c-add6-4408-b2c6-14eec414a2f8",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "c3599dfb-7240-4a38-84eb-b9a434f02718",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "cfe5baf6-c861-4a89-807e-51721e50f1e9",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "504d36c5-ca6f-478f-bf3e-23dd942355e2",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "ea53b6ae-e37a-4227-a976-962c032bef16",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "2e6b7ec5-a8bf-487f-8038-22030599911e",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "559709ff-1aaf-4007-bdc1-5f2a4cadcbc3",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14]",
             expected: "13", orderMatters: true),
            TestCaseData(id: "7a581ecd-8543-4690-b53b-09fc1b848db1",
             input: "root = [1,null,2,null,null,3,null,null,4,null,null,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "6e823bef-666b-4b85-aba5-559fe2e95f18",
             input: "root = [1,2,3,4]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f6d4ee56-2007-4ab2-acf1-7a38c7b34b40",
             input: "root = [1,2,3,4,5,6]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "e40e1332-d096-4afd-bb67-4fbd1c98b581",
             input: "root = [1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "04402ea8-cbd4-4224-b38e-225e32b6939c",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "diameter-of-binary-tree"
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
            let result = solution.diameterOfBinaryTree(p_root)
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
