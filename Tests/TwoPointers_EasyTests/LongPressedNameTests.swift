import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_long_pressed_name {
    private class Solution {
        func isLongPressedName(_ name: String, _ typed: String) -> Bool {
            var p1 = 0
            var p2 = 0
            while p2 < typed.count {
                if p1 < name.count && name[name.index(name.startIndex, offsetBy: p1)] == typed[typed.index(typed.startIndex, offsetBy: p2)] {
                    p1 += 1
                } else if p1 == 0 || typed[typed.index(typed.startIndex, offsetBy: p2)] != name[name.index(name.startIndex, offsetBy: p1 - 1)] {
                    return false
                }
                p2 += 1
            }
            return p1 == name.count
        }
    }

    @Suite struct LongPressedNameTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "6d4f4ccd-c240-4b14-9958-1adc5bccb4d6"
            let rawInput = "name = 'a', typed = 'a'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_1() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "29326d46-1101-4019-a21e-b82181b54d72"
            let rawInput = "name = '', typed = ''"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_2() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "0546cb36-05ce-4fc8-a4ea-9ef3c8f800de"
            let rawInput = "name = 'abc', typed = 'abc'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_3() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "cf2f14d6-d355-46b3-ab66-9797b0d78800"
            let rawInput = "name = 'abc', typed = 'abcd'"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_4() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "4211aae9-0568-43a8-b43b-02ad4b326e27"
            let rawInput = "name = 'a', typed = 'aa'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_5() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "5f8dcb18-6ed2-4ab8-af63-b0e40e8d8433"
            let rawInput = "name = 'ab', typed = 'aab'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_6() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "2e7dbb08-0ee3-44fb-91e2-5dd2c12c0462"
            let rawInput = "name = 'ab', typed = 'aba'"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_7() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "2e6d6b81-a5ae-4698-a8ee-e7213b36db7d"
            let rawInput = "name = 'abc', typed = 'abbc'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_8() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "28b90957-7c34-49d2-9019-d2e5bcb7a4bf"
            let rawInput = "name = 'abcd', typed = 'abbbcd'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_9() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "ee8efb8a-28f6-4695-a7fd-e291c712154e"
            let rawInput = "name = 'abc', typed = 'abcc'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_10() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "010c5f0d-4b88-4de2-94f8-753daea4fe21"
            let rawInput = "name = 'a', typed = 'b'"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_11() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "e7c7d1a9-fa83-47eb-80e6-4d9173edb3d5"
            let rawInput = "name = 'ab', typed = 'ba'"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_12() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "5eb0d079-3d10-483d-b836-15a24afce99b"
            let rawInput = "name = 'abc', typed = 'bca'"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_13() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "fc30ad3d-de41-4cd6-8d82-3f7cc92ea2fc"
            let rawInput = "name = 'abcd', typed = 'dcba'"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_14() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "409aa5b2-9bb6-4e0c-9109-82fa7d1feb2f"
            let rawInput = "name = 'a', typed = 'aaa'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_15() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "0b1eaf41-bf9a-4563-a56f-85a1a14a5e49"
            let rawInput = "name = 'ab', typed = 'aabbb'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_16() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "c2ba8945-f7e5-42f3-9c6f-7cee4667d92f"
            let rawInput = "name = 'abc', typed = 'aabbbccc'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_17() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "690a4811-f55c-4cc0-97eb-cbfd1a81704c"
            let rawInput = "name = 'abc', typed = 'abcccc'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_18() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "2042fc3b-5592-4a18-9853-fe38df184d6a"
            let rawInput = "name = 'a', typed = 'aaaa'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_19() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "912a51ba-2e36-414c-a8d8-f1b26be09d7d"
            let rawInput = "name = 'ab', typed = 'abab'"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_20() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "15789143-5aa8-47fe-be84-b18db6f21240"
            let rawInput = "name = 'abc', typed = 'abcabc'"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_21() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "635b0cb5-954f-41d1-92d4-82c37827feeb"
            let rawInput = "name = 'abcd', typed = 'abcdabcd'"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_22() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "b0b1d60a-d0c8-4e55-8a02-4e9376951697"
            let rawInput = "name = 'abc', typed = 'ababab'"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_23() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "8821fc86-aa55-47dd-844a-06bf839aca34"
            let rawInput = "name = 'a', typed = 'aaaaa'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_24() async {
            let slug = "long-pressed-name"
            let topic = "two-pointers"
            let testId = "4bbcb690-bf22-4d74-9fd6-a8005b55a58f"
            let rawInput = "name = 'ab', typed = 'aaaaab'"
            let expectedOutput = "true"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: name string too long (\(p_name.count))")
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: typed string too long (\(p_typed.count))")
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.isLongPressedName(p_name, p_typed)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: parse expected to Bool (handles true/True/TRUE/1)
                let expectedBool = expectedOutput.trimmingCharacters(in: .whitespaces).lowercased() == "true" || expectedOutput.trimmingCharacters(in: .whitespaces) == "1"
                let matches = result == expectedBool
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

    }

}
