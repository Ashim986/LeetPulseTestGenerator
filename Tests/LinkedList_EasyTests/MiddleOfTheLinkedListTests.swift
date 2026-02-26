import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_middle_of_the_linked_list {
    private class Solution {
        func middleNode(_ head: ListNode?) -> ListNode? {
            var slow = head
            var fast = head

            while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
            }

            return slow
        }
    }

    @Suite struct MiddleOfTheLinkedListTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "45f11803-1bda-409d-b2e5-0bfcffd4209f"
            let rawInput = "head = [1]"
            let expectedOutput = "[1]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_1() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "a472fc5c-ca09-4b86-8146-aca9e3be1d75"
            let rawInput = "head = [1,2]"
            let expectedOutput = "[2]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_2() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "20ffe8bd-18c2-44f3-bacf-a9d3d8cac7d5"
            let rawInput = "head = [1,2,3,4,5,6,7]"
            let expectedOutput = "[4,5,6,7]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_3() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "a8f28e08-799b-4217-9de1-b997012a927d"
            let rawInput = "head = [1,1,1,1,1]"
            let expectedOutput = "[1,1,1]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_4() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "01701440-f69a-4cda-a353-ad38f6ef92cb"
            let rawInput = "head = [-1,-2,-3,-4,-5]"
            let expectedOutput = "[-3,-4,-5]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_5() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "26e7e6f7-88af-4dc2-b0fb-48785c59f14d"
            let rawInput = "head = [1,1,1,1,1,1,1,1,1,1]"
            let expectedOutput = "[1,1,1,1,1]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_6() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "bb8af9b4-31fa-4a76-82fe-3123e6d93fc2"
            let rawInput = "head = [0,0,0,0,0,0,0,0,0,0]"
            let expectedOutput = "[0,0,0,0,0]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_7() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "b047b063-ff49-46a8-850b-00b953532406"
            let rawInput = "head = [1,2,3,4,5,6,7,8,9]"
            let expectedOutput = "[5,6,7,8,9]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_8() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "a28e9c54-48dd-489f-a402-3904716d25c6"
            let rawInput = "head = [1,1,1,1,1,1,1,1,1]"
            let expectedOutput = "[1,1,1,1,1]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_9() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "f782b03a-aadf-41c4-9ab9-c3bd93fade39"
            let rawInput = "head = [10,10,10,10,10,10,10,10,10]"
            let expectedOutput = "[10,10,10,10,10]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_10() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "4193ba5b-8385-497d-895a-98c8fb07923d"
            let rawInput = "head = [1,2,3,4,5,6,7,8]"
            let expectedOutput = "[5,6,7,8]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_11() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "b18c5a1c-f71c-446d-ab48-9a309c1b4e53"
            let rawInput = "head = [1,1,1,1,1,1,1,1]"
            let expectedOutput = "[1,1,1,1]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_12() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "9ecb3284-6170-410d-9adf-97792437d360"
            let rawInput = "head = [0,0,0,0,0,0,0,0]"
            let expectedOutput = "[0,0,0,0]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_13() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "1db8b0bd-a8d4-44bc-a7e2-f1ea0fc97e47"
            let rawInput = "head = [-10,-9,-8,-7,-6,-5,-4,-3]"
            let expectedOutput = "[-6,-5,-4,-3]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_14() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "6ea68ea4-3e1f-477f-92a4-5ebe4b5946ba"
            let rawInput = "head = [1,1,1,1,1,1,1]"
            let expectedOutput = "[1,1,1,1]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_15() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "7d352c0e-0d65-4517-ace8-2ec1072fde59"
            let rawInput = "head = [10,10,10,10,10,10,10]"
            let expectedOutput = "[10,10,10,10]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_16() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "1c633dc1-0234-4b42-80c1-bbda0a5228b5"
            let rawInput = "head = [1,1,1,1,1,1]"
            let expectedOutput = "[1,1,1]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_17() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "7ba4f5b2-d6e6-4530-a7f9-f35fe55891fc"
            let rawInput = "head = [0,0,0,0,0,0]"
            let expectedOutput = "[0,0,0]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_18() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "b83f5f5f-d5fe-49df-98a3-9a0c01881c24"
            let rawInput = "head = [-10,-9,-8,-7,-6,-5]"
            let expectedOutput = "[-7,-6,-5]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_19() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "ea4ec890-4c49-4d8c-8fd6-180886a096e5"
            let rawInput = "head = [1,3,5,7,9]"
            let expectedOutput = "[5,7,9]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_20() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "8de42320-2f64-4f83-92c1-61a91a4c088f"
            let rawInput = "head = [2,4,6,8,10]"
            let expectedOutput = "[6,8,10]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_21() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "4c88c89b-6118-462a-b0a8-a4d1439e60c6"
            let rawInput = "head = [1,2,3,4]"
            let expectedOutput = "[3,4]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_22() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "8ad1844c-73ff-49c7-9ae2-239bbfe391fc"
            let rawInput = "head = [1,1,1,1]"
            let expectedOutput = "[1,1]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_23() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "9caa86e9-1095-478a-af1d-d609f8d4ae7c"
            let rawInput = "head = [0,0,0,0]"
            let expectedOutput = "[0,0]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_24() async {
            let slug = "middle-of-the-linked-list"
            let topic = "linked-list"
            let testId = "2d6069d7-b2b0-4aae-afb5-1ab648acf3f9"
            let rawInput = "head = []"
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.middleNode(p_head)
                let computedOutput = OutputSerializer.serialize(result)

                // Structural comparison: both sides serialized to canonical list format
                // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

    }

}
