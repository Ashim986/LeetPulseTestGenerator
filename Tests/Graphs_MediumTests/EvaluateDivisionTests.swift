import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var graph: [String: [(String, Double)]] = [:]
        for i in 0..<equations.count {
            let a = equations[i][0], b = equations[i][1]
            graph[a, default: []].append((b, values[i]))
            graph[b, default: []].append((a, 1.0 / values[i]))
        }

        func dfs(_ curr: String, _ target: String, _ visited: inout Set<String>) -> Double {
            if graph[curr] == nil { return -1.0 }
            if curr == target { return 1.0 }
            visited.insert(curr)
            for (next, val) in graph[curr]! {
                if !visited.contains(next) {
                    let res = dfs(next, target, &visited)
                    if res != -1.0 { return val * res }
                }
            }
            return -1.0
        }

        return queries.map { q in
            var visited = Set<String>()
            return dfs(q[0], q[1], &visited)
        }
    }
}

@Suite struct EvaluateDivisionTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "2bea7da3-7f40-4b4f-b2c2-f5ed68be0bb8"
        let rawInput = "equations = [[\"a\",\"b\"]], values = [2.0], queries = [[\"a\",\"b\"]]"
        let expectedOutput = "[2.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "70b82ca1-1276-4bdc-9469-43b2ea97d3d7"
        let rawInput = "equations = [[\"a\",\"b\"]], values = [2.0], queries = [[\"b\",\"a\"]]"
        let expectedOutput = "[0.5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_2() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "e0d4b838-c6c6-4159-abcc-b608c6fea468"
        let rawInput = "equations = [[\"a\",\"b\"]], values = [2.0], queries = [[\"a\",\"a\"]]"
        let expectedOutput = "[1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_3() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "1f923dd3-5326-4ab1-ba25-83192063ddca"
        let rawInput = "equations = [[\"a\",\"b\"]], values = [2.0], queries = [[\"b\",\"b\"]]"
        let expectedOutput = "[1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_4() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "34299017-bc47-4ee4-93d0-c9056bba5515"
        let rawInput = "equations = [[\"a\",\"b\"]], values = [2.0], queries = [[\"c\",\"d\"]]"
        let expectedOutput = "[-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_5() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "58a32d75-5cdd-4ead-8842-f159826e977d"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"c\",\"a\"]]"
        let expectedOutput = "[0.16666666666666666]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_6() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "ef679351-c859-4e3a-a80b-23210713903e"
        let rawInput = "equations = [], values = [], queries = [[\"a\",\"b\"]]"
        let expectedOutput = "[-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_7() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "26dffbcb-ac17-424c-84fc-47bf8982a68e"
        let rawInput = "equations = [[\"a\",\"b\"]], values = [2.0], queries = []"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_8() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "e7a1c7d9-ad2a-4974-848f-dfab19efeed7"
        let rawInput = "equations = [[\"a\",\"b\"],[\"a\",\"b\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"]]"
        let expectedOutput = "[2.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_9() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "a30b95b2-59bf-4c9b-973a-5ab06923e7f8"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"]]"
        let expectedOutput = "[2.0,3.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_10() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "115c1c7a-23da-467b-8752-f0c3f0e3c42d"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"]]"
        let expectedOutput = "[2.0,3.0,6.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_11() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "4f852dcd-c6c9-4716-a055-294da1433c7b"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_12() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "975697c7-b4ca-4a42-850d-25f564f4a058"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_13() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "375c426a-15ae-4790-b00f-811d5e426ef9"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_14() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "1a32ad4d-6077-4411-a667-05eca878f05a"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"],[\"c\",\"c\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0,1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_15() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "bc589d0c-cbd2-404e-88f0-527d7d7d727b"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"],[\"c\",\"c\"],[\"d\",\"e\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0,1.0,-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_16() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "65cf7f2b-541e-497e-92f1-50dff9febf35"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"],[\"c\",\"c\"],[\"d\",\"e\"],[\"e\",\"d\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0,1.0,-1.0,-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_17() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "71881d38-a3a4-4982-ac26-b8bc36f04fc7"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"],[\"c\",\"c\"],[\"d\",\"e\"],[\"e\",\"d\"],[\"f\",\"g\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0,1.0,-1.0,-1.0,-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_18() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "4e93e07d-4bc1-460c-8fac-9d71a08e8395"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"],[\"c\",\"c\"],[\"d\",\"e\"],[\"e\",\"d\"],[\"f\",\"g\"],[\"g\",\"f\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0,1.0,-1.0,-1.0,-1.0,-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_19() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "b92eaa3b-7b63-4714-a99d-ab5c4767a6db"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"],[\"c\",\"c\"],[\"d\",\"e\"],[\"e\",\"d\"],[\"f\",\"g\"],[\"g\",\"f\"],[\"h\",\"i\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0,1.0,-1.0,-1.0,-1.0,-1.0,-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_20() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "205a8146-652a-4b4d-a0b3-bd23a23c6ea7"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"],[\"c\",\"c\"],[\"d\",\"e\"],[\"e\",\"d\"],[\"f\",\"g\"],[\"g\",\"f\"],[\"h\",\"i\"],[\"i\",\"h\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0,1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_21() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "3ffb4698-6612-474e-aa8b-bdb14b8c0125"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"],[\"c\",\"c\"],[\"d\",\"e\"],[\"e\",\"d\"],[\"f\",\"g\"],[\"g\",\"f\"],[\"h\",\"i\"],[\"i\",\"h\"],[\"j\",\"k\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0,1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_22() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "50df8704-b9cb-4231-96a8-275ca5cdcb97"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"],[\"c\",\"c\"],[\"d\",\"e\"],[\"e\",\"d\"],[\"f\",\"g\"],[\"g\",\"f\"],[\"h\",\"i\"],[\"i\",\"h\"],[\"j\",\"k\"],[\"k\",\"j\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0,1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_23() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "daf427f4-5ea6-4ce0-aab1-e17a4ab68b82"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"],[\"c\",\"c\"],[\"d\",\"e\"],[\"e\",\"d\"],[\"f\",\"g\"],[\"g\",\"f\"],[\"h\",\"i\"],[\"i\",\"h\"],[\"j\",\"k\"],[\"k\",\"j\"],[\"l\",\"m\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0,1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_24() async {
        let slug = "evaluate-division"
        let topic = "graphs"
        let testId = "c24a4870-45f5-4f26-9f25-8c747a4683de"
        let rawInput = "equations = [[\"a\",\"b\"],[\"b\",\"c\"]], values = [2.0,3.0], queries = [[\"a\",\"b\"],[\"b\",\"c\"],[\"a\",\"c\"],[\"c\",\"a\"],[\"a\",\"a\"],[\"b\",\"b\"],[\"c\",\"c\"],[\"d\",\"e\"],[\"e\",\"d\"],[\"f\",\"g\"],[\"g\",\"f\"],[\"h\",\"i\"],[\"i\",\"h\"],[\"j\",\"k\"],[\"k\",\"j\"],[\"l\",\"m\"],[\"m\",\"l\"]]"
        let expectedOutput = "[2.0,3.0,6.0,0.16666666666666666,1.0,1.0,1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0,-1.0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_equations = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_equations.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: equations 2D array too large (\(p_equations.count))")
            return
        }
        guard let p_values = InputParser.parseDoubleArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Double]: '\(params[1])'")
            return
        }
        guard p_values.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: values array too large (\(p_values.count))")
            return
        }
        guard let p_queries = InputParser.parse2DStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [[String]]: '\(params[2])'")
            return
        }
        guard p_queries.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))")
            return
        }

        // Constraint precondition checks
        guard p_equations.count >= 1 && p_equations.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= equations.length <= 20")
            return
        }
        guard p_values.count >= 1 && p_values.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 5 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= Ai.length, Bi.length <= 5")
            return
        }
        guard p_queries.count >= 1 && p_queries.count <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= queries.length <= 20")
            return
        }
        guard p_equations.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: equations[i].length == 2")
            return
        }
        guard p_queries.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: queries[i].length == 2")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.calcEquation(p_equations, p_values, p_queries)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Double]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
