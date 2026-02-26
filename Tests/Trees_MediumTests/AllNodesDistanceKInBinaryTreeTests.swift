import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAllNodesDistanceKInBinaryTree {
    private class Solution {
        var graph: [Int: [Int]] = [:]

        func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
            buildGraph(root)
            var queue: [(Int, Int)] = [(target?.val ?? 0, 0)]
            var result: [Int] = []
            var visited: Set<Int> = [target?.val ?? 0]

            while !queue.isEmpty {
                let (node, dist) = queue.removeFirst()
                if dist == k {
                    result.append(node)
                }
                if dist > k {
                    break
                }
                if let neighbors = graph[node] {
                    for neighbor in neighbors {
                        if !visited.contains(neighbor) {
                            queue.append((neighbor, dist + 1))
                            visited.insert(neighbor)
                        }
                    }
                }
            }
            return result
        }

        func buildGraph(_ node: TreeNode?) {
            if node == nil {
                return
            }
            if node?.left != nil {
                graph[node.unsafelyUnwrapped.val, default: []].append(node.unsafelyUnwrapped.left.unsafelyUnwrapped.val)
                graph[node.unsafelyUnwrapped.left.unsafelyUnwrapped.val, default: []].append(node.unsafelyUnwrapped.val)
            }
            if node?.right != nil {
                graph[node.unsafelyUnwrapped.val, default: []].append(node.unsafelyUnwrapped.right.unsafelyUnwrapped.val)
                graph[node.unsafelyUnwrapped.right.unsafelyUnwrapped.val, default: []].append(node.unsafelyUnwrapped.val)
            }
            buildGraph(node?.left)
            buildGraph(node?.right)
        }
    }

    @Suite struct AllNodesDistanceKInBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4e160599-f6e6-49a8-af4f-8e95bed0390a",
             input: "root = [1,2,3,null,null,4,5], target = 1, k = 2",
             expected: "[4,5]", orderMatters: false),
            TestCaseData(id: "8094b5bd-bf7d-4cd0-934b-d936302c0f44",
             input: "root = [1], target = 1, k = 0",
             expected: "[1]", orderMatters: false),
            TestCaseData(id: "138e6a11-051e-4668-8d90-b1b965ed4b55",
             input: "root = [], target = null, k = 1",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "00a941e4-4963-490d-92b9-d38526b994ca",
             input: "root = [1,null,2,null,3,null,4,null,5], target = 1, k = 4",
             expected: "[5]", orderMatters: false),
            TestCaseData(id: "9b7929aa-3955-4200-84f9-576c02e954f7",
             input: "root = [1,2,3,null,4,5]",
             expected: "[2,3]", orderMatters: false),
            TestCaseData(id: "5a6b9831-15b3-4845-a2f6-82fb25837687",
             input: "root = [1,null,2,null,3]",
             expected: "[2]", orderMatters: false),
            TestCaseData(id: "88f71b5c-9485-4f9f-a335-461e24200202",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[2,3]", orderMatters: false),
            TestCaseData(id: "c9f8da35-8798-484b-a25e-183a425c45f4",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "[2,3]", orderMatters: false),
            TestCaseData(id: "ddc825ff-d4f0-4df6-8910-56f98763cec8",
             input: "root = [1,2,3,null,4,null,5]",
             expected: "[2,3]", orderMatters: false),
            TestCaseData(id: "b08bc14a-69bf-4b2b-a310-fe257dd3ac9e",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "[2]", orderMatters: false),
            TestCaseData(id: "7fb28475-1676-4fe7-9c89-81766c0bf684",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[2,3]", orderMatters: false),
            TestCaseData(id: "fa5af7df-6968-4350-bd1c-e3ba4ca33fee",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "[2]", orderMatters: false),
            TestCaseData(id: "2f1bf696-ef94-4cda-abf8-5772180633eb",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "[2,3]", orderMatters: false),
            TestCaseData(id: "c6facee1-d8a9-4429-82ac-d822ecfe0bcc",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "[2,3]", orderMatters: false),
            TestCaseData(id: "238e6970-19ec-46dd-bce0-efe23c1c9d0a",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[4,5,6,7]", orderMatters: false),
            TestCaseData(id: "40a2280a-b9ff-4559-872a-b0cfa15ab353",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "[4,5,6,7]", orderMatters: false),
            TestCaseData(id: "c29e5f6f-ce12-48f4-a4b3-bcbdb2ea99b9",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]",
             expected: "[4,5,6,7]", orderMatters: false),
            TestCaseData(id: "c9cd82e4-5888-4690-b175-ce817ef14871",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "[4,5,6,7]", orderMatters: false),
            TestCaseData(id: "81677154-f158-4486-8bd0-fd55950c74d2",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]",
             expected: "[4,5,6,7]", orderMatters: false),
            TestCaseData(id: "025baeed-2376-49b6-93b3-79e1f74a1393",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]",
             expected: "[4,5,6,7]", orderMatters: false),
            TestCaseData(id: "06801d02-807b-47f9-9e26-0d0af8ca52f7",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]",
             expected: "[4,5,6,7]", orderMatters: false),
            TestCaseData(id: "32ead20f-af33-48f4-a19b-253051d25baf",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]",
             expected: "[4,5,6,7]", orderMatters: false),
            TestCaseData(id: "53fb8440-596a-410f-9985-59aacada4b7f",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]",
             expected: "[4,5,6,7]", orderMatters: false),
            TestCaseData(id: "e824fb4f-3f20-4f3f-845a-dadca1cfb816",
             input: "root = [1,null,2,null,3,null,4,null,5], target = 2, k = 1",
             expected: "[3]", orderMatters: false),
            TestCaseData(id: "5b128f73-10dc-41d0-b116-0c9c63351799",
             input: "root = [1,2,3,4,5,6,7,8,9,10], target = 5, k = 3",
             expected: "[]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "all-nodes-distance-k-in-binary-tree"
            let topic = "trees"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
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
            guard let p_target = InputParser.parseNullableIntArray(params[1]).map({ buildTree($0) }) else {
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
            guard let p_k = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_k >= 0 && p_k <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= k <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.distanceK(p_root, p_target, p_k)
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
