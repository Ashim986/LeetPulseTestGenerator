import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result: [[Int]] = []
        var combo: [Int] = []
        func backtrack(_ start: Int) {
            if combo.count == k { result.append(combo); return }
            for i in start...n {
                combo.append(i)
                backtrack(i + 1)
                combo.removeLast()
            }
        }
        backtrack(1)
        return result
    }
}

@Suite struct CombinationsTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "8e421ed9-d8af-40c1-b8c9-9daee00413a0"
        let rawInput = "n = 10, k = 11"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "83c5998d-9234-4028-90b0-2ab11f7d9519"
        let rawInput = "n = -1, k = 1"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "bdb28fe3-25b3-472a-98ea-2e20d0c1d5a4"
        let rawInput = "n = 1, k = -1"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "39ab59ce-d118-4396-8838-9bffbc980bf4"
        let rawInput = "n = -1, k = -1"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "61ee5203-a7a5-4e5e-87f1-baadd4764458"
        let rawInput = "n = 5, k = 0"
        let expectedOutput = "[[]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "253756a1-6441-45a7-9364-c2f46ff44238"
        let rawInput = "n = 100, k = 50"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "25efe8ec-e2fd-44c6-8bdd-6afcb87188ab"
        let rawInput = "n = 1000, k = 500"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "392ca0af-258b-4a38-9396-db6d61323ff0"
        let rawInput = "n = 10000, k = 5000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "f176815c-c0cc-4112-b061-5ff9b543be74"
        let rawInput = "n = 100000, k = 50000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "21602bd5-0514-4a72-87c5-9e8b4da39751"
        let rawInput = "n = 1000000, k = 500000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "8bf83167-4e21-4d8c-8819-2aef149ecef5"
        let rawInput = "n = 10000000, k = 5000000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "34d405b7-6fde-4204-9300-8d0bc47024f5"
        let rawInput = "n = 100000000, k = 50000000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "a6eb9def-b67d-4852-9bed-e820900e6fba"
        let rawInput = "n = 1000000000, k = 500000000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "cb9bebec-e778-4eef-af1f-8092f6ae4c5f"
        let rawInput = "n = 10000000000, k = 5000000000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "e3d1f2f4-cf18-4d05-8f41-dc224ef0bc56"
        let rawInput = "n = 100000000000, k = 50000000000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "16bbed1a-3a88-4cf2-809e-2e091ebdcdb4"
        let rawInput = "n = 1000000000000, k = 500000000000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "0a467d06-006d-484f-ae4f-6082f636fa8e"
        let rawInput = "n = 10000000000000, k = 5000000000000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "2ed84f4e-d03b-4bc2-928a-011bc5631ac3"
        let rawInput = "n = 100000000000000, k = 50000000000000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "9f9456af-6502-4537-b091-bde1b26f0580"
        let rawInput = "n = 1000000000000000, k = 500000000000000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "dd61d3fe-8ba4-4bf1-899d-e960a2eece13"
        let rawInput = "n = 10000000000000000, k = 5000000000000000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "c8a563cd-4a21-4b57-8e56-2da52d424f4d"
        let rawInput = "n = 100000000000000000, k = 50000000000000000"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "cee9545d-5bc9-428e-bf94-c7781e3035ee"
        let rawInput = "n = 1000000000000000000, k = 500000000000000000"
        let expectedOutput = "null"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "0b3e914d-3e2c-481d-b9b5-7badffa34560"
        let rawInput = "n = 4, k = 2"
        let expectedOutput = "[[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "combinations"
        let topic = "backtracking"
        let testId = "b546c3d7-3203-4400-a15c-a561382bb601"
        let rawInput = "n = 1, k = 1"
        let expectedOutput = "[[1]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        let solution = Solution()
        let result = solution.combine(p_n, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
