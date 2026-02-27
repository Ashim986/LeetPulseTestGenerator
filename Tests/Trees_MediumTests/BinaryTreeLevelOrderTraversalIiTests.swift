import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryTreeLevelOrderTraversalIi {
    private class Solution {
        func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
            guard let root = root else {
                return []
            }
            var queue = [root], result = [[Int]]()
            while !queue.isEmpty {
                var levelValues = [Int]()
                let levelSize = queue.count
                for _ in 1...levelSize {
                    let node = queue.removeFirst()
                    levelValues.append(node.val)
                    if let left = node.left {
                        queue.append(left)
                    }
                    if let right = node.right {
                        queue.append(right)
                    }
                }
                result.append(levelValues)
            }
            return result.reversed()
        }
    }

    @Suite struct BinaryTreeLevelOrderTraversalIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c9689b9b-11c7-4032-be28-90f9ba649f7c",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "[[4, 5], [2, 3], [1]]", orderMatters: true),
            TestCaseData(id: "ff5e2b05-474a-495f-96a0-5f16d1f1a564",
             input: "root = [1,null,2,null,null,3]",
             expected: "[[3], [2], [1]]", orderMatters: true),
            TestCaseData(id: "614d75d7-c519-4a30-8b4d-8bdd0bed77d1",
             input: "root = [1,2,null,4]",
             expected: "[[4], [2], [1]]", orderMatters: true),
            TestCaseData(id: "3a78cebb-b1be-4a8d-9c0e-f1d80203819e",
             input: "root = [1,null,2,3]",
             expected: "[[3], [2], [1]]", orderMatters: true),
            TestCaseData(id: "bdce6946-7535-48de-b1f6-24b3e025a039",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[[4, 5, 6, 7], [2, 3], [1]]", orderMatters: true),
            TestCaseData(id: "d5f6367b-d85e-42bb-b4c6-cf28869dd578",
             input: "root = [1,null,null]",
             expected: "[[1]]", orderMatters: true),
            TestCaseData(id: "5d9b8cb5-3938-4c3c-a472-88c7e56a30a3",
             input: "root = [1,2,3,4,null,5,6]",
             expected: "[[4, 5, 6], [2, 3], [1]]", orderMatters: true),
            TestCaseData(id: "00019793-df7a-41f3-91e2-b82d77f2bc51",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[[8, 9, 10], [4, 5, 6, 7], [2, 3], [1]]", orderMatters: true),
            TestCaseData(id: "434f204d-172c-411c-9289-c242b77e68cc",
             input: "root = [1,-2,3]",
             expected: "[[-2, 3], [1]]", orderMatters: true),
            TestCaseData(id: "0054aa10-c7c8-46d1-96d0-8fd59e1aea33",
             input: "root = [1,2,3,4,4,5,5]",
             expected: "[[4, 4, 5, 5], [2, 3], [1]]", orderMatters: true),
            TestCaseData(id: "36a69e60-37f8-4e98-8a65-b062a2bd8248",
             input: "root = [1,null,2,null,3]",
             expected: "[[3], [2], [1]]", orderMatters: true),
            TestCaseData(id: "4e39834b-8215-4df6-89d7-a8edfa9b5b04",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[[8, 9, 10, 11, 12, 13, 14, 15], [4, 5, 6, 7], [2, 3], [1]]", orderMatters: true),
            TestCaseData(id: "6d017aac-5417-49dc-a14d-a8aa94597e34",
             input: "root = [1,-2,-3]",
             expected: "[[-2, -3], [1]]", orderMatters: true),
            TestCaseData(id: "650c1c0a-fa37-48db-bdb4-67f0045721db",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "[[4], [3], [2], [1]]", orderMatters: true),
            TestCaseData(id: "38820d02-e72f-4468-aa84-03da9c1376c9",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "[[5], [4], [3], [2], [1]]", orderMatters: true),
            TestCaseData(id: "89fe8c88-d454-48ec-9f68-7b26244c8518",
             input: "root = [1,2,2]",
             expected: "[[2,2],[1]]", orderMatters: true),
            TestCaseData(id: "63d11b56-6d9d-43ae-8032-0a6604bb9c71",
             input: "root = [1,2,3,null,null,4,5,6]",
             expected: "[[6],[4,5],[2,3],[1]]", orderMatters: true),
            TestCaseData(id: "d257d3a8-4a39-49ae-8b4e-bd4dbab4b7f7",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "[[8,9,10,11,12],[4,5,6,7],[2,3],[1]]", orderMatters: true),
            TestCaseData(id: "b9be5739-897c-42b8-ba4d-ac3ac936aa6f",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "[[8,9,10,11,12,13,14],[4,5,6,7],[2,3],[1]]", orderMatters: true),
            TestCaseData(id: "7d7b2e5b-c076-4430-a7f7-e95bd535e4fe",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "[[16],[8,9,10,11,12,13,14,15],[4,5,6,7],[2,3],[1]]", orderMatters: true),
            TestCaseData(id: "d270327b-0439-4e8a-9818-24e490d1072d",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]",
             expected: "[[16,17,18,19,20,21,22,23,24],[8,9,10,11,12,13,14,15],[4,5,6,7],[2,3],[1]]", orderMatters: true),
            TestCaseData(id: "6679fa7a-f986-42c7-b1de-9ec58b569725",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]",
             expected: "[[],[9],[8],[7],[6],[5],[4],[3],[2],[1]]", orderMatters: true),
            TestCaseData(id: "06d18cbe-61bd-4ba6-a0ef-746ecd236f8d",
             input: "root = [1,null,2,null,null,3,null,null,4]",
             expected: "[[],[2],[1]]", orderMatters: true),
            TestCaseData(id: "60258174-f3d3-4712-9095-458bd3c87918",
             input: "root = [0,-1,1,null,null,0,-2,-3]",
             expected: "[[],[-3],[0,-2],[-1,1],[0]]", orderMatters: true),
            TestCaseData(id: "b8469fba-4d24-4faf-91b1-754a50aa6e70",
             input: "root = [3,9,20,null,null,15,7]",
             expected: "[[15,7],[9,20],[3]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-tree-level-order-traversal-ii"
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
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.levelOrderBottom(p_root)
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

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[Int]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
