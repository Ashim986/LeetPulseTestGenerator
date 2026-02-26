import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryTreeInorderTraversal {
    private class Solution {
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            var result: [Int] = []
            var stack: [TreeNode] = []
            var current = root

            while current != nil || !stack.isEmpty {
                while current != nil {
                    stack.append(current.unsafelyUnwrapped)
                    current = current?.left
                }
                current = stack.removeLast()
                result.append(current.unsafelyUnwrapped.val)
                current = current?.right
            }

            return result
        }
    }

    @Suite struct BinaryTreeInorderTraversalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2E1DB71C-C47A-4FD4-9A14-9E0192427BCB",
             input: "[1,null,2,3]",
             expected: "[1,3,2]", orderMatters: true),
            TestCaseData(id: "24AD9FF5-7B47-47F0-A1F9-7F7A2B026A11",
             input: "[1,2,3,4,5,null,8,null,null,6,7,9]",
             expected: "[4,2,5,1,6,3,7,9,8]", orderMatters: true),
            TestCaseData(id: "3D4536A1-6996-46B6-AB47-57CD2485691E",
             input: "[1,null,2,null,3]",
             expected: "[1,3,2]", orderMatters: true),
            TestCaseData(id: "332FEB9F-7377-4447-AACE-CA8854A2BCDF",
             input: "[1,null,2,3,null,null,4]",
             expected: "[1,3,2,4]", orderMatters: true),
            TestCaseData(id: "10426155-8133-4AD0-8BA4-DAA192884B82",
             input: "[]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "F9D52A39-1CF3-404C-B063-0CAC27E0CA71",
             input: "[1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "BD0BB7A2-10DF-4A66-8D35-4D6874137407",
             input: "[1,2]",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "BAB96268-E719-4DDC-8B6B-9F45B945A7D3",
             input: "[1,null,2]",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "0760D022-6E03-40E3-AF84-25C122A0D9E9",
             input: "[1,2,3]",
             expected: "[2,1,3]", orderMatters: true),
            TestCaseData(id: "709B93F4-CA72-4934-AEEC-25CF72D33399",
             input: "[1,2,3,4]",
             expected: "[2,1,4,3]", orderMatters: true),
            TestCaseData(id: "5C6CFEC7-EB24-432C-A2E6-36836BBB6934",
             input: "[1,null,2,3,4]",
             expected: "[1,3,2,4]", orderMatters: true),
            TestCaseData(id: "B9869FB0-A3BB-4ED9-8170-5A1E3021BA6E",
             input: "[1,2,3,4,5]",
             expected: "[2,1,4,3,5]", orderMatters: true),
            TestCaseData(id: "36D958F4-104C-4672-948A-2E88D268889F",
             input: "[-1]",
             expected: "[-1]", orderMatters: true),
            TestCaseData(id: "2B6805B3-B02C-4300-A126-FA791B4EC27F",
             input: "[0]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "C1A37D79-1E23-4A1E-84DA-5B4CD66CFB49",
             input: "[1,0]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "6C7049C5-3929-4C7A-B296-6DC831966B9D",
             input: "[1,2,0,3,4]",
             expected: "[2,1,4,0,3]", orderMatters: true),
            TestCaseData(id: "310CA59B-3E13-4B65-927E-333879BE1458",
             input: "[1,null,0,2,3]",
             expected: "[1,0,2,3]", orderMatters: true),
            TestCaseData(id: "6847C8A4-F89F-43D6-B007-0FEDEB6D18A8",
             input: "[1,-2,3]",
             expected: "[-2,1,3]", orderMatters: true),
            TestCaseData(id: "1AE49AEE-4D75-480E-9F8F-5FD6302E8AB6",
             input: "[1,-2,-3]",
             expected: "[-2,1,-3]", orderMatters: true),
            TestCaseData(id: "408C18F2-6270-42D7-8491-21170D21B81A",
             input: "[1,2,-3,-4]",
             expected: "[-4,2,1,-3]", orderMatters: true),
            TestCaseData(id: "DADB0BF2-0194-4F28-996B-B24DB95F4AB3",
             input: "[1,-2,3,4,5]",
             expected: "[-2,1,4,3,5]", orderMatters: true),
            TestCaseData(id: "5A44C242-8407-4CE4-8121-1AC95BC9B080",
             input: "[0,1,null,null,2]",
             expected: "[1,0,2]", orderMatters: true),
            TestCaseData(id: "5595F632-1426-4F23-93D8-434E4D121D2E",
             input: "[0,1,2,null,null,3]",
             expected: "[1,0,3,2]", orderMatters: true),
            TestCaseData(id: "5992377B-B670-43D8-896F-7785BFB2074D",
             input: "[0,1,2,3,null,null,4]",
             expected: "[3,1,0,4,2]", orderMatters: true),
            TestCaseData(id: "5E99C564-1064-48A0-8821-BCF295BA5E6D",
             input: "[1,2,3,4,5,6,7,null,null,null,null,8,null,null,null,null]",
             expected: "[4,2,5,1,6,3,7,8]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-tree-inorder-traversal"
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
            let result = solution.inorderTraversal(p_root)
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
