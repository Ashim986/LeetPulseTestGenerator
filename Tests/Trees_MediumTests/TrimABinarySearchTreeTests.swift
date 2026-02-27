import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTrimABinarySearchTree {
    private class Solution {
        func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
            if root == nil {
                return nil
            }
            if root.unsafelyUnwrapped.val < low {
                return trimBST(root.unsafelyUnwrapped.right, low, high)
            }
            if root.unsafelyUnwrapped.val > high {
                return trimBST(root.unsafelyUnwrapped.left, low, high)
            }
            root.unsafelyUnwrapped.left = trimBST(root.unsafelyUnwrapped.left, low, high)
            root.unsafelyUnwrapped.right = trimBST(root.unsafelyUnwrapped.right, low, high)
            return root
        }
    }

    @Suite struct TrimABinarySearchTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "dd49b6d1-522b-4113-a114-597e85fa91db",
             input: "root = [1], low = 1, high = 1",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "3e1b6684-a8c6-4a88-9388-b144994578df",
             input: "root = [1], low = 2, high = 3",
             expected: "null", orderMatters: true),
            TestCaseData(id: "85b58bf9-d1a5-431c-83d1-5e910e9c177c",
             input: "root = [1,2,3,null,null,4,5], low = 1, high = 3",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "dce254cc-b912-43aa-ae92-4cde1ccf3b17",
             input: "root = [10,5,15,3,8,13,18], low = 3, high = 5",
             expected: "[5,3]", orderMatters: true),
            TestCaseData(id: "5c2cf038-073b-4384-b07e-4cfe5d02aa03",
             input: "root = [10,5,15,3,8,13,18], low = 13, high = 15",
             expected: "[15,13]", orderMatters: true),
            TestCaseData(id: "9d26564f-cfbd-445f-8088-7d5d1a8dad91",
             input: "root = [10,5,15,3,8,13,18], low = 18, high = 20",
             expected: "[18]", orderMatters: true),
            TestCaseData(id: "930be2fb-af0e-4fd1-bb06-346bc48189e2",
             input: "root = [10,5,15,3,8,13,18], low = 1, high = 2",
             expected: "null", orderMatters: true),
            TestCaseData(id: "e398937a-f8e8-4046-9323-01bcd10af70f",
             input: "root = [10,5,15,3,8,13,18], low = 20, high = 25",
             expected: "null", orderMatters: true),
            TestCaseData(id: "cd78106e-7c1a-42a9-98b0-e6251546c1e0",
             input: "root = [10,5,15,3,8,13,18], low = -5, high = 0",
             expected: "null", orderMatters: true),
            TestCaseData(id: "b5f512bc-54d5-45e8-ab07-6c6a903714ef",
             input: "root = [10,5,15,3,8,13,18], low = 0, high = 5",
             expected: "[5,3]", orderMatters: true),
            TestCaseData(id: "9bff75a9-7e4f-4533-b8b3-6cb2413617db",
             input: "root = [10,5,15,3,8,13,18], low = -10, high = 0",
             expected: "null", orderMatters: true),
            TestCaseData(id: "46e5cd12-397d-4347-b783-a900629418ef",
             input: "root = [10,5,15,3,8,13,18], low = -10, high = 20",
             expected: "[10,5,15,3,8,13,18]", orderMatters: true),
            TestCaseData(id: "7bbb8bad-d4b4-4749-98bc-01b4b5553223",
             input: "root = [10,5,15,3,8,13,18], low = 0, high = 20",
             expected: "[10,5,15,3,8,13,18]", orderMatters: true),
            TestCaseData(id: "a37f1846-1f1a-4715-a7d4-ddfe60653f6f",
             input: "root = [10,5,15,3,8,13,18], low = 18, high = 18",
             expected: "[18]", orderMatters: true),
            TestCaseData(id: "85f5b3c6-a1ac-4f8a-822c-1ffef2c7d795",
             input: "root = [10,5,15,3,8,13,18], low = 3, high = 18",
             expected: "[10,5,15,3,8,13,18]", orderMatters: true),
            TestCaseData(id: "ab04e9b4-21dc-400c-bbf7-972b55cde59c",
             input: "root = [1,2,3,null,null,4,5], low = 3, high = 4",
             expected: "[3,4]", orderMatters: true),
            TestCaseData(id: "c28da759-aba1-4009-ad71-5d20de4e6934",
             input: "root = [5,3,8,null,null,4,9], low = 4, high = 8",
             expected: "[5,null,8,4]", orderMatters: true),
            TestCaseData(id: "78e60cda-faf9-45ad-aed0-99968747db73",
             input: "root = [1,0,2], low = 2, high = 3",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "3b420988-8f87-4e32-a00c-0cb5824e7960",
             input: "root = [3,0,4,null,2,null,null,1], low = 2, high = 4",
             expected: "[3,2,4]", orderMatters: true),
            TestCaseData(id: "02fd1c22-ce6a-413a-978d-6d9ebbb5e1e1",
             input: "root = [1,2,3,4,5,6,7], low = 4, high = 6",
             expected: "null", orderMatters: true),
            TestCaseData(id: "27cae02c-1dd4-4721-a520-06ab41d8e816",
             input: "root = [10,5,15,3,8,13,18], low = 5, high = 15",
             expected: "[10,5,15,null,8,13,null]", orderMatters: true),
            TestCaseData(id: "ca77acf4-4ff1-41c5-b6ab-f56b0c239f57",
             input: "root = [10,5,15,3,8,13,18], low = 3, high = 13",
             expected: "[10,8,13]", orderMatters: true),
            TestCaseData(id: "8e847607-afb7-4daa-8e4a-452b79f46fd0",
             input: "root = [10,5,15,3,8,13,18], low = 8, high = 18",
             expected: "[10,8,15,null,null,13,18]", orderMatters: true),
            TestCaseData(id: "7a495d50-4b98-466b-a1fc-b53ed41c58c4",
             input: "root = [10,5,15,3,8,13,18], low = 15, high = 18",
             expected: "[15,null,18]", orderMatters: true),
            TestCaseData(id: "47d5168e-25d7-4d03-8541-d60207e6c0f3",
             input: "root = [10,5,15,3,8,13,18], low = 8, high = 13",
             expected: "[10,8,13]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "trim-a-binary-search-tree"
            let topic = "trees"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
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
            guard let p_low = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_high = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_low >= 0 && p_low <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= Node.val <= 104"
                )
                return
            }
            guard p_low >= 0 && p_low <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= low <= high <= 104"
                )
                return
            }
            guard p_high >= 0 && p_high <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= low <= high <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: TreeNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.trimBST(p_root, p_low, p_high)
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

            // Structural comparison: both sides serialized to canonical tree format
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
