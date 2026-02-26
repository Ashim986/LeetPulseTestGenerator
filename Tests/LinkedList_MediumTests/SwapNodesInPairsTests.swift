import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_swap_nodes_in_pairs {
    private class Solution {
        func swapPairs(_ head: ListNode?) -> ListNode? {
            let dummy = ListNode(0)
            dummy.next = head
            var prev: ListNode? = dummy
            while prev?.next != nil && prev?.next?.next != nil {
                let first = prev?.next
                let second = first?.next
                first?.next = second?.next
                second?.next = first
                prev?.next = second
                prev = first
            }
            return dummy.next
        }
    }

    @Suite struct SwapNodesInPairsTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "81F8B304-CFAB-486B-AF8A-96CA36C86A6C"
            let rawInput = "[]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "1307E59E-269E-47F1-B798-534249EEF9A0"
            let rawInput = "[1]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "63830629-8699-41DD-8EFE-19EDA5E443CE"
            let rawInput = "[1,2]"
            let expectedOutput = "[2,1]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "BD2009F9-2244-4B19-B8B5-B82862CAE279"
            let rawInput = "[1,2,3]"
            let expectedOutput = "[2,1,3]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "B86E0266-46A7-409A-AA0F-AF35830C01B1"
            let rawInput = "[1,2,3,4]"
            let expectedOutput = "[2,1,4,3]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "0ACABD0D-2505-4C92-B39F-92B9D2CD2E26"
            let rawInput = "[1,2,3,4,5,6]"
            let expectedOutput = "[2,1,4,3,6,5]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "9636474B-22BA-4D08-A861-F47D5473F19B"
            let rawInput = "[1,2,3,4,5,6,7]"
            let expectedOutput = "[2,1,4,3,6,5,7]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "D40732B6-E6A6-4223-B120-3DD0EA794FBA"
            let rawInput = "[10,9,8,7,6,5,4,3,2,1]"
            let expectedOutput = "[9,10,7,8,5,6,3,4,1,2]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "A361915D-2040-465E-97DF-C9EBC493030E"
            let rawInput = "[5,5,5,5]"
            let expectedOutput = "[5,5,5,5]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "ACB52BE1-5155-4282-830F-A0F97E430BD9"
            let rawInput = "[1,2,2,1]"
            let expectedOutput = "[2,1,1,2]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "9557E065-6A2F-4746-B8F0-D6969E1C1DEF"
            let rawInput = "[1,2,3,4,5]"
            let expectedOutput = "[2,1,4,3,5]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "3CED5EEE-5EF1-47B3-834A-09B9EA5942C6"
            let rawInput = "[10,20,30,40,50,60,70]"
            let expectedOutput = "[20,10,40,30,60,50,70]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "AAD566DC-081F-48FC-BBC4-E412EBBD6A51"
            let rawInput = "[1,1,1,1]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "6941E4E1-194E-4CE7-A0C1-CD5E768A2636"
            let rawInput = "[2,1,4,3]"
            let expectedOutput = "[1,2,3,4]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "7356EBCC-8F3E-4755-AB24-05135CE480ED"
            let rawInput = "[10,20,30,40,50,60,70,80,90]"
            let expectedOutput = "[20,10,40,30,60,50,80,70,90]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "74D5DEF9-BE77-4272-A8EA-F45D1C66F891"
            let rawInput = "[5,5,4,4,3,3]"
            let expectedOutput = "[5,5,4,4,3,3]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "CFA69D11-4BC7-4015-AFBA-2FD7F0E29274"
            let rawInput = "[100,200,300,400]"
            let expectedOutput = "[200,100,400,300]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "48AECC6D-D817-40A5-8F56-B3DF39E375D6"
            let rawInput = "[1,1,2,2]"
            let expectedOutput = "[1,1,2,2]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "A03CF92D-0708-4199-B772-8BC41E3396D6"
            let rawInput = "[-1,-2,-3,-4]"
            let expectedOutput = "[-2,-1,-4,-3]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "36898AD3-14BE-4625-9F36-B1A64816CA9E"
            let rawInput = "[1,2,3,4,5,6,7,8,9,10]"
            let expectedOutput = "[2,1,4,3,6,5,8,7,10,9]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "259072E9-E55D-4597-8984-9B7D1252B5B9"
            let rawInput = "[5,5,5,5,5]"
            let expectedOutput = "[5,5,5,5,5]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "772FB5D7-A333-4CCE-BDFF-2446CDAB0C13"
            let rawInput = "[10,20,30,40,50,60]"
            let expectedOutput = "[20,10,40,30,60,50]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "E53F954C-7CB1-4952-876D-FC7BFB337531"
            let rawInput = "[100,200,300,400,500,600,700]"
            let expectedOutput = "[200,100,400,300,600,500,700]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "10CE3898-F271-4529-A932-1EE063F8AE7C"
            let rawInput = "[4,3,2,1]"
            let expectedOutput = "[2,1,4,3]"
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
                let result = solution.swapPairs(p_head)
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
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
            let testId = "B2D6BBCF-2A28-4C6E-A3F6-EE9EF5433B4E"
            let rawInput = "[5,1,8,2,7,4,9,3]"
            let expectedOutput = "[1,5,2,8,4,7,3,9]"
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
                let result = solution.swapPairs(p_head)
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
