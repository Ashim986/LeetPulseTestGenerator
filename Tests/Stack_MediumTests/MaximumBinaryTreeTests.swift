import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumBinaryTree {
    private class Solution {
        func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
            let n = nums.count
            if n == 0 {
                return nil
            }
            var stack: [TreeNode] = []
            for num in nums {
                let node = TreeNode(num)
                while !stack.isEmpty, stack.last?.val ?? 0 < num {
                    node.left = stack.removeLast()
                }
                if !stack.isEmpty {
                    stack.last?.right = node
                }
                stack.append(node)
            }
            return stack.first
        }
    }

    @Suite struct MaximumBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "82fe9f37-8c93-4951-bb0e-8f265da8bbe5",
             input: "nums = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "6ad0ce19-d1a3-4d45-b81b-3d82bc846985",
             input: "nums = [5,3,8,4,9]",
             expected: "[9,8,null,5,4,null,3]", orderMatters: true),
            TestCaseData(id: "62420ba2-8a48-4a5f-aa2e-fccbc1b41201",
             input: "nums = [-1,-2,-3]",
             expected: "[-1,null,-2,null,-3]", orderMatters: true),
            TestCaseData(id: "5e1d6051-49e1-4eec-9a42-97f855e53175",
             input: "nums = [1,2,3,4,5,6,7]",
             expected: "[7,6,null,5,null,4,null,3,null,2,null,1]", orderMatters: true),
            TestCaseData(id: "6ba46c0e-5078-45a8-8a86-d0a3a45d79d6",
             input: "nums = [7,6,5,4,3,2,1]",
             expected: "[7,null,6,null,5,null,4,null,3,null,2,null,1]", orderMatters: true),
            TestCaseData(id: "db3e92af-e90c-43fc-a20f-039870b97690",
             input: "nums = [10,5,15,3,8,12,18]",
             expected: "[18,15,null,10,12,null,5,8,null,null,3]", orderMatters: true),
            TestCaseData(id: "e33f1138-342c-437e-ab6a-2052ff945e92",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[10,9,null,8,null,7,null,6,null,5,null,4,null,3,null,2,null,1]", orderMatters: true),
            TestCaseData(id: "a092693c-b814-4ac1-805a-b4dac3a72335",
             input: "nums = [10,20,30,40,50]",
             expected: "[50,40,null,30,null,20,null,10]", orderMatters: true),
            TestCaseData(id: "9236a39a-f380-4a94-927f-4ead9199394d",
             input: "nums = [50,40,30,20,10]",
             expected: "[50,null,40,null,30,null,20,null,10]", orderMatters: true),
            TestCaseData(id: "3a2e18c2-f424-465c-b60e-054e82a43488",
             input: "nums = [10,20]",
             expected: "[20,10]", orderMatters: true),
            TestCaseData(id: "3bd07cb9-50b4-4f46-b227-772baa5026f4",
             input: "nums = [20,10]",
             expected: "[20,null,10]", orderMatters: true),
            TestCaseData(id: "cc189c37-e7f6-460e-be7d-3f060b784d13",
             input: "nums = [5,10,15]",
             expected: "[15,10,null,5]", orderMatters: true),
            TestCaseData(id: "a011b155-5f00-4cbd-9261-66c280657cad",
             input: "nums = [15,10,5]",
             expected: "[15,null,10,null,5]", orderMatters: true),
            TestCaseData(id: "595c2204-2501-439c-9c75-ac7cabe7d198",
             input: "nums = [-10,-20,-30]",
             expected: "[-10,null,-20,null,-30]", orderMatters: true),
            TestCaseData(id: "d123ab75-0aca-40e7-a538-5028b01ed7e7",
             input: "nums = [-30,-20,-10]",
             expected: "[-10,-20,null,-30]", orderMatters: true),
            TestCaseData(id: "5d5bed03-d910-4a87-90d1-f724787015fe",
             input: "nums = [10,-20,30]",
             expected: "[30,10,null,null,-20]", orderMatters: true),
            TestCaseData(id: "4d2c6599-57b0-4daa-a9d0-583833d77715",
             input: "nums = [30,10,-20]",
             expected: "[30,null,10,null,-20]", orderMatters: true),
            TestCaseData(id: "c1caddee-e072-4c44-be0a-05b51e1c3427",
             input: "nums = [10,20,-30]",
             expected: "[20,10,-30]", orderMatters: true),
            TestCaseData(id: "02810f9c-4f6f-4268-aac0-3ffef307faac",
             input: "nums = [-30,20,10]",
             expected: "[20,-30,10]", orderMatters: true),
            TestCaseData(id: "5c24b970-8a94-4ad6-9950-f744e79c7bf6",
             input: "nums = [10,-20,30,-40]",
             expected: "[30,10,-40,null,-20]", orderMatters: true),
            TestCaseData(id: "a83cbfe9-23a7-48f1-a454-04136729320c",
             input: "nums = [-40,-30,-20,-10]",
             expected: "[-10,-20,null,-30,null,-40]", orderMatters: true),
            TestCaseData(id: "839eee64-1b1e-4134-a79f-86edffaf30fa",
             input: "nums = [40,30,20,10]",
             expected: "[40,null,30,null,20,null,10]", orderMatters: true),
            TestCaseData(id: "49576e00-dcb2-4efc-8a32-643375e3349c",
             input: "nums = [10,20,30,40,50,60]",
             expected: "[60,50,null,40,null,30,null,20,null,10]", orderMatters: true),
            TestCaseData(id: "c7ab4f0e-0574-4ae5-ab5b-497c8bf3f4cd",
             input: "nums = [60,50,40,30,20,10]",
             expected: "[60,null,50,null,40,null,30,null,20,null,10]", orderMatters: true),
            TestCaseData(id: "2a70f917-43ec-4559-9860-351ac70e9faf",
             input: "nums = [3,2,1,6,0,5]",
             expected: "[6,3,5,null,2,0,null,null,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-binary-tree"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
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
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 1000"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.constructMaximumBinaryTree(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical tree format
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
