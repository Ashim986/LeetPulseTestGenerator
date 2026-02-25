import Foundation
import Testing
@testable import LeetCodeHelpers

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
            graph[node!.val, default: []].append(node!.left!.val)
            graph[node!.left!.val, default: []].append(node!.val)
        }
        if node?.right != nil {
            graph[node!.val, default: []].append(node!.right!.val)
            graph[node!.right!.val, default: []].append(node!.val)
        }
        buildGraph(node?.left)
        buildGraph(node?.right)
    }
}

@Suite struct AllNodesDistanceKInBinaryTreeTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "4e160599-f6e6-49a8-af4f-8e95bed0390a"
        let rawInput = "root = [1,2,3,null,null,4,5], target = 1, k = 2"
        let expectedOutput = "[4,5]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "8094b5bd-bf7d-4cd0-934b-d936302c0f44"
        let rawInput = "root = [1], target = 1, k = 0"
        let expectedOutput = "[1]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "138e6a11-051e-4668-8d90-b1b965ed4b55"
        let rawInput = "root = [], target = null, k = 1"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "00a941e4-4963-490d-92b9-d38526b994ca"
        let rawInput = "root = [1,null,2,null,3,null,4,null,5], target = 1, k = 4"
        let expectedOutput = "[5]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "9b7929aa-3955-4200-84f9-576c02e954f7"
        let rawInput = "root = [1,2,3,null,4,5]"
        let expectedOutput = "[2,3]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "5a6b9831-15b3-4845-a2f6-82fb25837687"
        let rawInput = "root = [1,null,2,null,3]"
        let expectedOutput = "[2]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "88f71b5c-9485-4f9f-a335-461e24200202"
        let rawInput = "root = [1,2,3,4,5,6,7]"
        let expectedOutput = "[2,3]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "c9f8da35-8798-484b-a25e-183a425c45f4"
        let rawInput = "root = [1,2,3,null,null,4,5]"
        let expectedOutput = "[2,3]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "ddc825ff-d4f0-4df6-8910-56f98763cec8"
        let rawInput = "root = [1,2,3,null,4,null,5]"
        let expectedOutput = "[2,3]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "b08bc14a-69bf-4b2b-a310-fe257dd3ac9e"
        let rawInput = "root = [1,null,2,null,3,null,4]"
        let expectedOutput = "[2]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "7fb28475-1676-4fe7-9c89-81766c0bf684"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10]"
        let expectedOutput = "[2,3]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "fa5af7df-6968-4350-bd1c-e3ba4ca33fee"
        let rawInput = "root = [1,null,2,null,3,null,4,null,5]"
        let expectedOutput = "[2]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "2f1bf696-ef94-4cda-abf8-5772180633eb"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12]"
        let expectedOutput = "[2,3]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "c6facee1-d8a9-4429-82ac-d822ecfe0bcc"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]"
        let expectedOutput = "[2,3]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "238e6970-19ec-46dd-bce0-efe23c1c9d0a"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]"
        let expectedOutput = "[4,5,6,7]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "40a2280a-b9ff-4559-872a-b0cfa15ab353"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]"
        let expectedOutput = "[4,5,6,7]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "c29e5f6f-ce12-48f4-a4b3-bcbdb2ea99b9"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]"
        let expectedOutput = "[4,5,6,7]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "c9cd82e4-5888-4690-b175-ce817ef14871"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]"
        let expectedOutput = "[4,5,6,7]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "81677154-f158-4486-8bd0-fd55950c74d2"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]"
        let expectedOutput = "[4,5,6,7]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "025baeed-2376-49b6-93b3-79e1f74a1393"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]"
        let expectedOutput = "[4,5,6,7]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "06801d02-807b-47f9-9e26-0d0af8ca52f7"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]"
        let expectedOutput = "[4,5,6,7]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "32ead20f-af33-48f4-a19b-253051d25baf"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]"
        let expectedOutput = "[4,5,6,7]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "53fb8440-596a-410f-9985-59aacada4b7f"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]"
        let expectedOutput = "[4,5,6,7]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "e824fb4f-3f20-4f3f-845a-dadca1cfb816"
        let rawInput = "root = [1,null,2,null,3,null,4,null,5], target = 2, k = 1"
        let expectedOutput = "[3]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "all-nodes-distance-k-in-binary-tree"
        let topic = "trees"
        let testId = "5b128f73-10dc-41d0-b116-0c9c63351799"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10], target = 5, k = 3"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_target = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_k = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_k >= 0 && p_k <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= k <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.distanceK(p_root, p_target, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
