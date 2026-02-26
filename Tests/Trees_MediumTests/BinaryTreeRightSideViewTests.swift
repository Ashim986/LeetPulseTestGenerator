import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryTreeRightSideView {
    private class Solution {
        func rightSideView(_ root: TreeNode?) -> [Int] {
            var result: [Int] = []

            func dfs(_ node: TreeNode?, _ depth: Int) {
                guard let node = node else { return }

                if depth == result.count {
                    result.append(node.val)
                }

                dfs(node.right, depth + 1)
                dfs(node.left, depth + 1)
            }

            dfs(root, 0)
            return result
        }
    }

    @Suite struct BinaryTreeRightSideViewTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2a54c2f4-2d97-4531-a07c-cacc2823e181",
             input: "root = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "d5b0cd47-af98-46c1-857c-f01583da5618",
             input: "root = [1,2]",
             expected: "[1, 2]", orderMatters: true),
            TestCaseData(id: "1404ec98-4d47-42dc-a4c4-66373971f047",
             input: "root = [1,null,2]",
             expected: "[1, 2]", orderMatters: true),
            TestCaseData(id: "055a61ca-65e7-4830-b87e-1d716ab628c7",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[1, 3, 7]", orderMatters: true),
            TestCaseData(id: "3d73946d-d42c-4851-8080-176e840886de",
             input: "root = [1,null,2,null,3]",
             expected: "[1, 2, 3]", orderMatters: true),
            TestCaseData(id: "cebf41ba-84cb-4720-8ef5-3cf6912e1c56",
             input: "root = [1,2,null,4]",
             expected: "[1, 2, 4]", orderMatters: true),
            TestCaseData(id: "057d5792-afb1-4fcd-8024-3850128a9c20",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1, 3, 7, 10]", orderMatters: true),
            TestCaseData(id: "fb96f0be-7417-467f-8b1c-1566380d7996",
             input: "root = [-1,-2,-3]",
             expected: "[-1, -3]", orderMatters: true),
            TestCaseData(id: "8582bed8-b1f6-4ae3-af12-05931e79e4c6",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "[1, 1, 1]", orderMatters: true),
            TestCaseData(id: "33fb84c7-be50-4480-89e3-c960ae394bde",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[1, 3, 7, 15]", orderMatters: true),
            TestCaseData(id: "e0ebb86e-0cb9-4c9f-9648-f1049d40e8d0",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "[1, 2, 3, 4]", orderMatters: true),
            TestCaseData(id: "aeedcdef-4042-4817-a51f-f28d14fc6897",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]",
             expected: "[1, 3, 7, 15, 17]", orderMatters: true),
            TestCaseData(id: "2cee9fbb-619f-4288-a81f-1203bda40400",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "2acdbe2d-7869-4eb6-bcaa-c7aab2351837",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6]",
             expected: "[1, 2, 3, 4, 5, 6]", orderMatters: true),
            TestCaseData(id: "a37fd353-5bfe-472e-8f67-bf46b0b875e4",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7]",
             expected: "[1, 2, 3, 4, 5, 6, 7]", orderMatters: true),
            TestCaseData(id: "cfdcd931-2591-41de-b915-3c7e972704b8",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8]", orderMatters: true),
            TestCaseData(id: "f5b01672-0280-4c0a-8f9c-117329e27eef",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9]", orderMatters: true),
            TestCaseData(id: "b60ac71d-381e-4fab-8bc0-d6f5fa8970e1",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]", orderMatters: true),
            TestCaseData(id: "09cf3ea5-1178-4b20-a271-63952bd37962",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]", orderMatters: true),
            TestCaseData(id: "0b90fbd4-96bc-4953-b0e0-102bf22b59bc",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]", orderMatters: true),
            TestCaseData(id: "dc81f0cd-a789-4ca9-9757-93b60cad6d7f",
             input: "root = [1,-2,-3,null,null,-4,-5]",
             expected: "[1, -3, -5]", orderMatters: true),
            TestCaseData(id: "1919ca0e-7a0c-4bff-a1bb-f1d75655eb58",
             input: "root = [1]",
             expected: "[1ズ]", orderMatters: true),
            TestCaseData(id: "250207ab-fe3f-493f-a4be-0a09e0836dbf",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "[1,3,7,15,16]", orderMatters: true),
            TestCaseData(id: "7c507584-b113-439b-aa78-5aab6f5e3a90",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "[1,3,7,15,20]", orderMatters: true),
            TestCaseData(id: "884dfc9f-5bfd-4136-a9e9-3c9756250bd2",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]",
             expected: "[1,3,7,15,21]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-tree-right-side-view"
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
            let result = solution.rightSideView(p_root)
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
