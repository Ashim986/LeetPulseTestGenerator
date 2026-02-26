import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func smallestRepunitDivisibleByK(_ k: Int) -> Int? { 
        var remainder: Int = 0
        for lengthN in 1...k {
            remainder = (remainder * 10 + 1) % k
            if remainder == 0 {
                return lengthN
            }
        }
        return nil
    }
}

@Suite struct SmallestIntegerDivisibleByKTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "9ba5d228-01b2-44c7-ba55-090aa512f177"
        let rawInput = "k = 3"
        let expectedOutput = "3"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "31665ef5-0bf7-4c5c-aa9b-d0700b625762"
        let rawInput = "k = 9"
        let expectedOutput = "9"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_2() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "43f5d04d-e8e0-4c62-9b78-f670ea06eff0"
        let rawInput = "k = 4"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_3() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "ce98c8ed-ccd5-4f51-b806-d0f88cb7233d"
        let rawInput = "k = 5"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_4() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "6597803c-f44c-454a-93c0-5d62ce555d05"
        let rawInput = "k = 6"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_5() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "e9907a7e-391b-4722-a78e-5130491dc018"
        let rawInput = "k = 7"
        let expectedOutput = "6"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_6() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "5061c4c3-d4ea-430e-8fb0-fac3b27ea41d"
        let rawInput = "k = 8"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_7() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "1cb02f1e-c8e8-4b6b-82a8-01405b5c7acd"
        let rawInput = "k = 10"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_8() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "855d2476-f06c-412a-9eda-dfb3570a140f"
        let rawInput = "k = 11"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_9() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "5a66e3ea-f01e-4faf-a685-9faa9ee73d0f"
        let rawInput = "k = 12"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_10() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "a392b091-a38e-4a83-91b3-815db149faf1"
        let rawInput = "k = 13"
        let expectedOutput = "6"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_11() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "b5fa21d4-1188-44ee-aad8-3e2841a4846b"
        let rawInput = "k = 14"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_12() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "8debab8d-6bdd-4f2c-86c8-3bcab2865012"
        let rawInput = "k = 15"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_13() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "0ad39063-844e-4f15-a05b-25493f3eda24"
        let rawInput = "k = 16"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_14() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "4638efdb-5e13-4caf-886e-5c9dc95a6788"
        let rawInput = "k = 17"
        let expectedOutput = "16"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_15() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "28a6d8e2-6af0-4842-95ad-80205d1e6e64"
        let rawInput = "k = 18"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_16() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "819bfe42-649f-435c-a502-867d925b7217"
        let rawInput = "k = 19"
        let expectedOutput = "18"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_17() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "233aef41-681d-4397-8a6c-c6c15f44c7e5"
        let rawInput = "k = 20"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_18() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "5d19de3e-4051-4387-9ff3-916d92b94c31"
        let rawInput = "k = 21"
        let expectedOutput = "6"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_19() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "49bb440b-2ad7-438f-826f-cb69690e6fd7"
        let rawInput = "k = 22"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_20() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "b200721c-d1ee-4676-9460-54e04db51893"
        let rawInput = "k = 23"
        let expectedOutput = "22"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_21() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "8e730cf2-89ac-4e91-8aec-fb5ce8615e91"
        let rawInput = "k = 24"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_22() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "46941736-0363-434a-8b01-35fc41290ad3"
        let rawInput = "k = 25"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_23() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "d7951c20-d500-4456-8e52-74915884365f"
        let rawInput = "k = 26"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_24() async {
        let slug = "smallest-integer-divisible-by-k"
        let topic = "math-geometry"
        let testId = "2941303c-037f-4f2e-8954-4d55156a133b"
        let rawInput = "k = 27"
        let expectedOutput = "27"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_k = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_k >= 1 && p_k <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 105")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.smallestRepunitDivisibleByK(p_k)
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
