import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution { 
    func generateTrees(_ n: Int) -> [TreeNode?] { 
        var memo: [[TreeNode?]] = Array(repeating: [], count: n + 1) 
        return generateTreesHelper(1, n, &memo) 
    } 

    private func generateTreesHelper(_ start: Int, _ end: Int, _ memo: inout [[TreeNode?]]) -> [TreeNode?] { 
        if start > end { 
            return [nil] 
        } 
        if !memo[start].isEmpty { 
            return memo[start] 
        } 
        var result: [TreeNode?] = [] 
        for i in start...end { 
            let leftSubtrees = generateTreesHelper(start, i - 1, &memo) 
            let rightSubtrees = generateTreesHelper(i + 1, end, &memo) 
            for leftSubtree in leftSubtrees { 
                for rightSubtree in rightSubtrees { 
                    let root = TreeNode(i) 
                    root.left = leftSubtree 
                    root.right = rightSubtree 
                    result.append(root) 
                } 
            } 
        } 
        memo[start] = result 
        return result 
    } 
}

@Suite struct UniqueBinarySearchTreesIiTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "ef6c51f2-415b-417f-b186-c3366f4d0980"
        let rawInput = "n = 11"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "ac5559f9-a4b1-40b3-8a4f-5ce9984ce821"
        let rawInput = "n = 12"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "44fb89e3-4243-4534-ad5e-9d037a1c5467"
        let rawInput = "n = 13"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "42cdc70d-58e1-454b-a862-f24da3994b54"
        let rawInput = "n = 14"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "cd30683c-8877-4320-a505-413e5a8b0a9a"
        let rawInput = "n = -2"
        let expectedOutput = "[null]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "51592693-2b01-4e9f-bf30-a315885c064c"
        let rawInput = "n = -3"
        let expectedOutput = "[null]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "1957a999-7468-49c1-bb00-d0c659116b22"
        let rawInput = "n = -4"
        let expectedOutput = "[null]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "706e2033-5602-4ab1-95ca-2772c4a70cf9"
        let rawInput = "n = -5"
        let expectedOutput = "[null]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "8f3d7391-ed70-4734-b55e-d6b386eda597"
        let rawInput = "root = [1,2,3]"
        let expectedOutput = "[[1,null,2,null,null,null,3],[1,null,3,2,null],[2,1,3],[3,1,null,null,2],[3,2,null,1,null]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "15ec4661-b087-4f20-ab67-a9cc729a7bc7"
        let rawInput = "head = [1,2,3]"
        let expectedOutput = "[[1,null,2,null,null,null,3],[1,null,3,2,null],[2,1,3],[3,1,null,null,2],[3,2,null,1,null]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "25b8cc1e-19f5-46d4-8055-febf31a9d3fb"
        let rawInput = "n = 15"
        let expectedOutput = "<output too large to display>"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "6caa0b81-d11d-4e6b-91dd-8e279a0e5609"
        let rawInput = "n = 3"
        let expectedOutput = "[[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "unique-binary-search-trees-ii"
        let topic = "dynamic-programming"
        let testId = "49a91251-ac29-48d2-9d57-71d09570d8e9"
        let rawInput = "n = 1"
        let expectedOutput = "[[1]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        let solution = Solution()
        let result = solution.generateTrees(p_n)
        let computedOutput = "\(result)"

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
