import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSameTree {
    private class Solution {
        func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            var stack: [(TreeNode?, TreeNode?)] = [(p, q)]
            while let (left, right) = stack.popLast() {
                if left == nil && right == nil { continue }
                guard let l = left, let r = right else { return false }
                if l.val != r.val { return false }
                stack.append((l.left, r.left))
                stack.append((l.right, r.right))
            }
            return true
        }
    }

    @Suite struct SameTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "FD271C4D-1BD6-49D6-9C14-E7A1FE2C1AF8",
             input: "p = [1,2,3], q = [1,2,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "F75EE0E7-B0A2-4BB8-844A-FA2158FB3B6B",
             input: "p = [], q = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "603C0F32-1E9F-418C-A230-2FEAB7343FBE",
             input: "p = [1], q = [1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "B5C92277-9666-4F22-83F6-8EC86FD86B62",
             input: "p = [1,2,3,4,5,6,7], q = [1,2,3,4,5,6,7]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3DE469EF-7455-4548-AA42-470F399F91E2",
             input: "p = [1,2,3,null,4,null,5], q = [1,2,3,null,4,null,5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "A888DA79-3E1A-4313-86E8-72C905CA23E9",
             input: "p = [0,-5,-6,null,-3,null,-4,0,null,null,-5], q = [0,-5,-6,null,-3,null,-4,0,null,null,-5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "35D20433-D180-4044-BA21-819D956E8519",
             input: "p = [1,2,null,3], q = [1,2,null,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "37C66D69-89AB-486E-B65D-4D8DFA26E142",
             input: "p = [0,-5,10,null,null,6,20], q = [0,-5,10,null,null,6,20]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "57E1E818-E0BA-4773-A4D2-EA54F300AA6D",
             input: "p = [1,2,null,null,3], q = [1,2,null,null,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "47F5974F-1A2E-4BFE-AA9B-616A5A556481",
             input: "p = [0,-5,9,1,null,4,null,null,null,8,2,null,null,null,7], q = [0,-5,9,1,null,4,null,null,null,8,2,null,null,null,7]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "FEF45EAC-D7A9-4FEA-B78C-807DB585C223",
             input: "p = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], q = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1EE10254-3580-43E5-83A6-C93FE2E97FD2",
             input: "p = [0,-5,10,null,-10,null,20], q = [0,-5,10,null,-10,null,20]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3c35df72-af5f-46f0-8fde-ca53f57b8ca9",
             input: "p = [1,2,3,null,null,4,5], q = [1,2,3,null,null,4,5]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "f9b822c7-a504-4fe0-8c96-37ba915e2612",
             input: "p = [1,2,3], q = [1,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "ebce16c0-dec8-4ea8-8b44-fc047e2726f4",
             input: "p = [1,null,2], q = [1,2,null]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "359a09f8-3c3b-415f-b942-77ec3847043f",
             input: "p = [-1,0,1], q = [-1,0,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "56a09b1e-22bd-47e4-8a96-9bf77dfb13a1",
             input: "p = [1,1,1], q = [1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "687edef0-a7de-463e-86b2-185ff83a3b14",
             input: "p = [1,2,3,4,5,6,7], q = [1,2,3,4,5,6,8]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "25684495-7528-4504-a619-20bb3e82d8d5",
             input: "p = [1,null,2,null,3], q = [1,null,2,null,3]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "69ae94e8-f335-4f7d-9c40-286485fe75b7",
             input: "p = [1,null,2,null,3], q = [1,null,2,null,4]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "965e0997-67e2-475a-b4e8-6984cfd1e7ff",
             input: "p = [1,2,3,4,5,6,7,8,9,10], q = [1,2,3,4,5,6,7,8,9,10]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "f3587f6f-2c21-48c2-92e6-bebc1ac4285c",
             input: "p = [1,2,3,4,5,6,7,8,9,10], q = [1,2,3,4,5,6,7,8,9,11]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "cb2fb579-c48e-4846-b9db-238fcf68e816",
             input: "p = [1,null,null], q = [1,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "88229987-b3cd-4b23-a3f1-9405186c2625",
             input: "p = [1,null,null], q = [1,2,null]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "76294e7e-6c93-4382-825d-c701592e6aab",
             input: "p = [1,2,null,4,null,5], q = [1,2,null,4,null,5]",
             expected: "True", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "same-tree"
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

            guard let p_p = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
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
            guard let p_q = InputParser.parseNullableIntArray(params[1]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as TreeNode?"
                )
                return
            }

            let solution = Solution()
            let result = solution.isSameTree(p_p, p_q)
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
