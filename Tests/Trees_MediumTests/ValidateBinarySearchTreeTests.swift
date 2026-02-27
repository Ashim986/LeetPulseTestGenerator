import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCValidateBinarySearchTree {
    private class Solution {
        func isValidBST(_ root: TreeNode?) -> Bool {
            var prev: Int? = nil
            var stack: [TreeNode] = []
            var node = root

            while node != nil || !stack.isEmpty {
                while let current = node {
                    stack.append(current)
                    node = current.left
                }
                let current = stack.removeLast()
                if let prev = prev, current.val <= prev { return false }
                prev = current.val
                node = current.right
            }
            return true
        }
    }

    @Suite struct ValidateBinarySearchTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "406256CB-C9B7-4FA2-BD3E-FF707415CA37",
             input: "[2,1,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "33ABBE9C-F5EC-4E5B-A533-F5C7F983CDD2",
             input: "[]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "E9208C59-8ABE-4E32-AE39-00CFD73A6130",
             input: "[1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "BEB367FF-2DF1-4700-9E5E-C92D9D081B5C",
             input: "[3,1,5,0,2,4,6]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "08780211-4D1E-4E61-BCFD-F6B287B3CBB0",
             input: "[2147483647]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "CE3D5257-DD95-4C72-98FB-052D1A2A6470",
             input: "[4,2,6,1,3,5,7]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3F2277D0-F92A-4A0F-9285-B2181FC8B004",
             input: "[-2147483648,null,2147483647]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "21ed37f1-cb93-4937-a2f3-45e1484d6698",
             input: "root = []",
             expected: "True", orderMatters: true),
            TestCaseData(id: "e4d45784-a57d-4d21-9b1f-6103d9bd4e3c",
             input: "root = [1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "f0660039-7736-474e-8d91-bc4ea815ef9b",
             input: "root = [1,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "270619e3-4072-4b5d-9502-c51d33eabcfd",
             input: "root = [2,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "db3023df-dfc6-4d82-9507-56a3265f6528",
             input: "root = [1,null,1]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "ead0a53b-b2d4-42a8-b0e8-60e6285a7baf",
             input: "root = [10,5,15,null,null,6,20]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "184df0ee-a036-4cad-895b-579688053d11",
             input: "root = [0,-5,-10]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "2973ac63-0281-40ed-829f-b6f20772da8c",
             input: "root = [5,3,7,2,4,6,8]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "e34cea71-6a1e-473b-93a6-7db1247560f2",
             input: "root = [5,3,7,2,4,6,8,null,null,null,null,null,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "5350e4fc-9bda-465e-9803-56c6e178e140",
             input: "root = [5,3,7,2,4,6,8,null,null,null,null,null,null,null,null,null,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "dfb0e74c-4987-45a7-af2e-d9b762ec2e50",
             input: "root = [10,5,15,null,null,6,20,null,null,null,null,null,null]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "edfdf211-91bb-492b-8177-1f491f48af53",
             input: "root = [5,1,4,null,null,3,6,null,null,null,null,null,null]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "3d7aedcb-873a-4362-abb4-6d62e96f0f08",
             input: "root = [5,4,6,null,null,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "66e947eb-435d-4196-ac92-f05fdbe50aa0",
             input: "root = [5,3,6,2,4,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "2f13d60f-dd05-4d4c-8b56-015483dd3b33",
             input: "root = [5,3,6,2,4,7,8]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "6b00218a-5434-49c1-8024-1edf57a7a975",
             input: "root = [5,3,7,2,4,6,8,null,null,null,null,null,null,null,null,null,null,null,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "b05527f1-1ae6-4c65-9f04-aa9c4446e43c",
             input: "root = [1,null,2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "163a848f-047c-4807-a763-8074f4a30d96",
             input: "root = [-10,-5,0]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "validate-binary-search-tree"
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
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.isValidBST(p_root)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
