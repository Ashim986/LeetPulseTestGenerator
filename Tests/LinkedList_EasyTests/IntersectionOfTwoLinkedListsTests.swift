import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_intersection_of_two_linked_lists {
    // Definition for singly-linked list.

    private class Solution {
        func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            var pA = headA
            var pB = headB
            while pA !== pB {
                pA = pA != nil ? pA?.next : headB
                pB = pB != nil ? pB?.next : headA
            }
            return pA
        }
    }

    @Suite struct IntersectionOfTwoLinkedListsTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "a277cc89-bb48-427c-b787-48fbb90c329c"
            let rawInput = "headA = [], headB = [1,2,3]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "7334824a-99c6-4b60-83c0-dc304dcdd8f4"
            let rawInput = "headA = [1,2,3], headB = [4,5,6]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "e850f175-2c95-46e7-beb3-1bcda76be13f"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "fe39095c-ea9d-466f-a69e-5265d4b19e6d"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "f4d47049-c669-4bcb-922d-0dffe6b915b6"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "89969345-1eab-4f2c-b617-5cd470d79d5a"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "40b19561-08c0-4fe0-b2da-a3e2cad3a303"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "e66658b8-5f50-44bb-b2e8-1e86175c11c4"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "1d31bb08-29af-472e-9783-6a67693ba057"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "1858465d-a174-4fdf-8447-57ab2783a32b"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "9beb6859-5000-4548-8430-8505704f3704"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "0f41234d-e465-45f9-87a6-49c53ab24a41"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "0e2cb30c-7919-42cb-825a-362b02a7994b"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "1d698424-b3eb-4534-b148-fbd7c08bce1b"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "397cc32e-0007-488f-a53c-2941c2a4015e"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "e15a75ec-efb7-41b1-ac72-fdee9b2eff32"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "07a56198-9b83-4e4c-9668-a9c084d5a798"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "e1ee11e2-b268-4bca-a8a6-74e31ccc97d0"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "711c5a30-133f-4644-9fa3-58b9cc00d704"
            let rawInput = "headA = [1,2,3,4,5], headB = [-1,-2,-3,-4,-5]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "009884cf-abf1-438f-b09e-61fab222a206"
            let rawInput = "headA = [1,2,3,4,5], headB = [10,9,8,7,6]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "78b3e8f7-4e5e-4cb6-a39f-ba6f25f726a3"
            let rawInput = "headA = [10,9,8,7,6], headB = [1,2,3,4,5]"
            let expectedOutput = "nil"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "39d83187-cc82-4aa3-85bf-d1e50f4f7928"
            let rawInput = "headA = [1,2,3,4,5], headB = [6,7,8,4,5]"
            let expectedOutput = "4"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "44aff8b3-ca3f-47bc-929e-e52c69525d0a"
            let rawInput = "headA = [1], headB = [1]"
            let expectedOutput = "1"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "e5259d65-e105-42d7-aaf5-b8198f5ca74c"
            let rawInput = "headA = [1,2,3], headB = [4,5,3]"
            let expectedOutput = "3"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = "48bea05b-ace1-450f-aac2-848ca64b0e80"
            let rawInput = "headA = [1,2,3,4,5], headB = [1,2,3,4,5]"
            let expectedOutput = "null"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as ListNode?: '\(params[1])'")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.getIntersectionNode(p_headA, p_headB)
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
