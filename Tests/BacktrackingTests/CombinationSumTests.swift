import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var current: [Int] = []

        func backtrack(_ index: Int, _ remaining: Int) {
            if remaining == 0 {
                result.append(current)
                return
            }
            if remaining < 0 { return }

            for i in index..<candidates.count {
                current.append(candidates[i])
                backtrack(i, remaining - candidates[i])  // same i for reuse
                current.removeLast()
            }
        }

        backtrack(0, target)
        return result
    }
}

@Suite struct CombinationSumTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "C6AB81DA-C9E5-46E1-8C91-4F2461EEF64F"
        let rawInput = "candidates = [2,3,6,7], target = 7"
        let expectedOutput = "[[2,2,3],[7]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "CF950005-71A8-4CD8-9AD9-66C50AE50D0B"
        let rawInput = "candidates = [7,8], target = 2"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "1136D27D-D8F0-41F9-97FB-564A6CC187DB"
        let rawInput = "candidates = [1], target = 5"
        let expectedOutput = "[[1,1,1,1,1]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "763542F0-2986-47CD-AE9F-648BFECEEDD1"
        let rawInput = "candidates = [2,3,5], target = 8"
        let expectedOutput = "[[2,2,2,2],[2,3,3],[3,5]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "FA1462EB-6646-4DA2-B851-9473E6E5BCAE"
        let rawInput = "candidates = [2,4], target = 5"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "89D05FDD-A51E-4684-ABF4-FBAB883A2ECA"
        let rawInput = "candidates = [1,2,3], target = 4"
        let expectedOutput = "[[1,1,1,1],[1,1,2],[1,3],[2,2]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "4C819747-57C8-414A-AC66-35D7DD81DB9E"
        let rawInput = "candidates = [10,20,30], target = 10"
        let expectedOutput = "[[10]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "2AC48EB2-8F8B-4005-8CBE-DC2FC9C051D9"
        let rawInput = "candidates = [10,1,2], target = 3"
        let expectedOutput = "[[1,1,1],[1,2]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "82AD5604-5AAB-4598-9A19-6F90077E1C8B"
        let rawInput = "{\"candidates\": [2, 3, 6, 7], \"target\": 7}"
        let expectedOutput = "[[2, 2, 3], [7]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "EBAE92F6-3CE3-410E-9776-0C9BE937DC24"
        let rawInput = "{\"candidates\": [2, 3, 5], \"target\": 8}"
        let expectedOutput = "[[2, 2, 2, 2], [2, 3, 3], [3, 5]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "DE0D7081-5F2F-4ADF-9B18-363DFE5706C6"
        let rawInput = "{\"candidates\": [2, 4], \"target\": 3}"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "3B7A8EA8-EFDF-4BE5-B399-2A0F00DCE4C5"
        let rawInput = "{\"candidates\": [3], \"target\": 9}"
        let expectedOutput = "[[3, 3, 3]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "72A89EF3-E6FC-4885-B578-EECFA96C8C04"
        let rawInput = "{\"candidates\": [5], \"target\": 3}"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "A47D4574-D7D7-44B0-8A62-40F1EDA696F7"
        let rawInput = "{\"candidates\": [1, 2], \"target\": 4}"
        let expectedOutput = "[[1, 1, 1, 1], [1, 1, 2], [2, 2]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "6D6BFECB-FAEE-484E-A30B-6B315E3D8822"
        let rawInput = "{\"candidates\": [2, 4, 6], \"target\": 6}"
        let expectedOutput = "[[2, 2, 2], [2, 4], [6]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "70B26E04-0D46-46DF-93B4-25264BAEC6A9"
        let rawInput = "{\"candidates\": [2, 4, 6, 8], \"target\": 10}"
        let expectedOutput = "[[2, 2, 2, 2, 2], [2, 2, 2, 4], [2, 2, 6], [2, 4, 4], [2, 8], [4, 6]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "1C70B3C1-37B5-4B81-B710-6AF4A1003857"
        let rawInput = "{\"candidates\": [4, 5, 6, 7], \"target\": 10}"
        let expectedOutput = "[[4, 6], [5, 5]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "788BD738-59B7-4D7F-9278-EFD5D20CED57"
        let rawInput = "candidates = [3], target = 9"
        let expectedOutput = "[[3, 3, 3]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "6030E630-CBFF-4B77-81C6-BE16703076D4"
        let rawInput = "candidates = [5], target = 7"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "D5594ED9-DC0D-4854-A881-650E975C1C49"
        let rawInput = "candidates = [1, 2], target = 3"
        let expectedOutput = "[[1, 1, 1], [1, 2]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "29B25FA7-5F05-4859-B5A4-6AB238F326BC"
        let rawInput = "candidates = [8, 12, 16], target = 32"
        let expectedOutput = "[[8, 8, 8, 8], [8, 8, 16], [8, 12, 12], [16, 16]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "A8E2A647-2483-48D6-915D-A79288270C3B"
        let rawInput = "candidates = [10, 20, 30], target = 5"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "4DDB286F-052F-4428-9E2B-9D475630F7E8"
        let rawInput = "candidates = [1, 2, 3, 4], target = 5"
        let expectedOutput = "[[1, 1, 1, 1, 1], [1, 1, 1, 2], [1, 1, 3], [1, 2, 2], [1, 4], [2, 3]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "45DC1F31-2BA3-4676-8D4E-2089213D62D8"
        let rawInput = "candidates: [2,3,6,7], target: 7"
        let expectedOutput = "[[2,2,3],[7]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "combination-sum"
        let topic = "backtracking"
        let testId = "23B377D6-D783-4D17-9D52-E795781BFE4A"
        let rawInput = "candidates: [2,3,5], target: 8"
        let expectedOutput = "[[2,2,2,2],[2,3,3],[3,5]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_candidates = InputParser.parseIntArray(params[0])
        guard p_candidates.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 30")
            return
        }
        guard p_candidates.allSatisfy { $0 >= 2 && $0 <= 40 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 2 <= candidates[i] <= 40")
            return
        }
        guard p_target >= 1 && p_target <= 40 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 40")
            return
        }

        let solution = Solution()
        let result = solution.combinationSum(p_candidates, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
