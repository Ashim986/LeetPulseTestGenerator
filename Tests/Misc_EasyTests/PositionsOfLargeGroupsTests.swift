import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_positions_of_large_groups {
    private class Solution {
        func largeGroupPositions(s: String) -> [[Int]] {
            var res: [[Int]] = []
            var left = 0
            var count = 1
            let sArray = Array(s)
            for i in 1...sArray.count - 1 {
                if sArray[i] == sArray[i - 1] {
                    count += 1
                }
                else {
                    if count >= 3 {
                        res.append([left, i - 1])
                    }
                    left = i
                    count = 1
                }
            }
            if count >= 3 {
                res.append([left, sArray.count - 1])
            }
            return res
        }
    }

    @Suite struct PositionsOfLargeGroupsTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "4046acc3-b908-4509-b772-234640299ae5"
            let rawInput = "s = \"aaa\""
            let expectedOutput = "[[0,2]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_1() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "19521228-f74b-43ce-8af3-11ef1617d82f"
            let rawInput = "s = \"aaab\""
            let expectedOutput = "[[0,2]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_2() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "d1bcf046-6196-4d6c-a7ee-471221b14108"
            let rawInput = "s = \"\""
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_3() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "33256fb7-39fd-4696-8818-b853ba2ba809"
            let rawInput = "s = \"a\""
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_4() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "b245a40f-fb0f-4cde-b811-09c77440d45b"
            let rawInput = "s = \"ab\""
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_5() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "c29d8ce4-f4ab-4dea-9d0b-8d7ff164081e"
            let rawInput = "s = \"aabbbcc\""
            let expectedOutput = "[[2,4]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_6() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "72126440-9d98-4d61-a171-eef076317c33"
            let rawInput = "s = \"abcabcabc\""
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_7() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "764126e5-9a8d-4e8d-b271-2715efa4b66c"
            let rawInput = "s = \"aaaaaa\""
            let expectedOutput = "[[0,5]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_8() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "535fa21b-d030-4a71-a2e9-e2d896f7a3e2"
            let rawInput = "s = \"abababab\""
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_9() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "59d63d4b-c7fd-4db9-a395-fd2573112e8e"
            let rawInput = "s = \"aaaaaaaaaa\""
            let expectedOutput = "[[0,9]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_10() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "2a25a3c1-e6a9-4df3-ba47-8534fa252856"
            let rawInput = "s = \"bbbbbbbbbb\""
            let expectedOutput = "[[0,9]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_11() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "d6910c39-c36e-4cc7-9685-d5cf22ee4c92"
            let rawInput = "s = \"cccccccccc\""
            let expectedOutput = "[[0,9]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_12() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "51179ee4-4237-44a4-946f-b4df217cf42e"
            let rawInput = "s = \"dddddddddd\""
            let expectedOutput = "[[0,9]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_13() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "f9fc0c42-b271-481d-b11e-5c74871b3c52"
            let rawInput = "s = \"abbbbbbbbb\""
            let expectedOutput = "[[1,9]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_14() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "ffc85277-a143-4bfb-b0bb-549cf31268ea"
            let rawInput = "s = \"ababababab\""
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_15() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "82b93edc-518c-4f60-82e8-d0ee788afb4c"
            let rawInput = "s = \"aaaaaabbbbb\""
            let expectedOutput = "[[0,5],[6,10]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_16() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "a204527e-6529-411a-9735-828cdd999712"
            let rawInput = "s = \"bbbbbbbaaaa\""
            let expectedOutput = "[[0,6],[7,10]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_17() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "a31ad0de-c88e-4bb4-bcee-a9cd31fe29cc"
            let rawInput = "s = \"ababababababab\""
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_18() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "80271fb3-300d-453b-a5f4-672c932fe2cd"
            let rawInput = "s = \"aaaaaaaaaaaaaaa\""
            let expectedOutput = "[[0,14]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_19() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "c6a9f3b2-bd94-42a6-822d-87e3ac718512"
            let rawInput = "s = \"bbbbbbbbbbbbbbb\""
            let expectedOutput = "[[0,14]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_20() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "f1bdbc3b-1685-45bc-9410-9fe974e62dd3"
            let rawInput = "s = \"ccccccccccccccc\""
            let expectedOutput = "[[0,14]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_21() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "05b8e9a7-80f7-4e0d-b7b4-f034cadec08b"
            let rawInput = "s = \"ddddddddddddddd\""
            let expectedOutput = "[[0,14]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_22() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "9b139ec5-962a-4eed-a540-3fc19324c713"
            let rawInput = "s = \"abababababababab\""
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_23() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "9436d63c-1a4f-43df-a70b-567d761efde6"
            let rawInput = "s = \"ccccccccccccccccc\""
            let expectedOutput = "[[0,16]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_24() async {
            let slug = "positions-of-large-groups"
            let topic = "misc"
            let testId = "2ede6dae-9385-430a-b68e-3abffc56f2de"
            let rawInput = "s = \"abba\""
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.largeGroupPositions(s: p_s)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
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
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

    }

}
