import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_flatten_a_multilevel_doubly_linked_list {
    private typealias Node = DoublyNode

    private class Solution {
        func flatten(_ head: Node?) -> Node? {
            if head == nil {
                return nil
            }

            var stack: [Node] = [head!]
            var prev: Node? = nil

            while !stack.isEmpty {
                let curr = stack.removeLast()
                curr.prev = prev

                if prev != nil {
                    prev?.next = curr
                }

                if curr.next != nil {
                    stack.append(curr.next!)
                }

                if curr.child != nil {
                    stack.append(curr.child!)
                    curr.child = nil
                }

                prev = curr
            }

            return head
        }
    }

    @Suite struct FlattenAMultilevelDoublyLinkedListTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "f7b4ca24-f81f-4516-a44c-712165cc7213"
            let rawInput = "head = [1,2,3,4,5,6,7]"
            let expectedOutput = "[1,2,3,4,5,6,7]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_1() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "01db7729-c3b6-4749-a81c-b408c06f33d0"
            let rawInput = "head = [1]"
            let expectedOutput = "[1]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_2() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "88b0e54a-d77b-4d1e-b75a-9e4d86d8d4b0"
            let rawInput = "head = [1,2,3,4,5,6,7,8,9,10]"
            let expectedOutput = "[1,2,3,4,5,6,7,8,9,10]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_3() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "81543e2e-f43e-4577-9a8f-2019067e3c6a"
            let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12]"
            let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_4() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "f5d318b6-5e12-422e-bfaa-70f3ca79d928"
            let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]"
            let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_5() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "1338a2ad-2865-4c73-8603-86b63af4bd3f"
            let rawInput = "head = [1,-2,3,-4,5,-6]"
            let expectedOutput = "[1,-2,3,-4,5,-6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_6() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "89d68d2e-19bc-4038-93ba-1e415d06963b"
            let rawInput = "head = [1,1,1,1,1,1]"
            let expectedOutput = "[1,1,1,1,1,1]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_7() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "a1a42660-bbf1-4aef-b3a7-69e272b318df"
            let rawInput = "head = [1,2,3,4,5,6] with 3 -> 7 <-> 8 <-> 9"
            let expectedOutput = "[1,2,3,7,4,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_8() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "d5a3b229-9818-4503-9a4f-196fdda72bcc"
            let rawInput = "head = [1,2,3,4,5,6] with 2 -> 7 <-> 8 <-> 9"
            let expectedOutput = "[1,2,7,3,4,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_9() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "7c5ffe4d-1d16-4d2d-8045-5bf649f490d7"
            let rawInput = "head = [1,2,3,4,5,6] with 5 -> 7 <-> 8 <-> 9"
            let expectedOutput = "[1,2,3,4,5,7,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_10() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "16cb6fd2-caad-4daa-9f7c-27d79bf6dd24"
            let rawInput = "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9"
            let expectedOutput = "[1,7,8,9,2,3,4,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_11() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "abfb985d-d9e8-475d-b01b-301ec3a631b0"
            let rawInput = "head = [1,2,3,4,5,6] with 6 -> 7 <-> 8 <-> 9"
            let expectedOutput = "[1,2,3,4,5,6,7,8,9]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_12() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "d307514d-439f-45db-be9f-932a43505b54"
            let rawInput = "head = [1,2,3,4,5,6] with 4 -> 7 <-> 8 <-> 9"
            let expectedOutput = "[1,2,3,4,7,8,9,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_13() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "fb4d89fd-2b75-42c2-b5af-0b17bd40e214"
            let rawInput = "head = [1,2,3,4,5,6] with 3 -> 7 <-> 8 <-> 9 and 7 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,2,3,7,10,11,12,8,9,4,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_14() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "377ab540-475a-48f6-a370-08a32764c9b2"
            let rawInput = "head = [1,2,3,4,5,6] with 3 -> 7 <-> 8 <-> 9 and 8 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,2,3,7,8,10,11,12,9,4,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_15() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "1021112d-c6e0-433d-8476-a04e703fa6fa"
            let rawInput = "head = [1,2,3,4,5,6] with 3 -> 7 <-> 8 <-> 9 and 9 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,2,3,7,8,9,10,11,12,4,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_16() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "c91b2a30-1041-4c11-8de5-d78d94868406"
            let rawInput = "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9 and 2 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,7,8,9,2,10,11,12,3,4,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_17() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "e26101d3-8f4f-4c4d-aba2-ef7d86ddc2ee"
            let rawInput = "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9 and 3 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,7,8,9,2,3,10,11,12,4,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_18() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "84c79e9c-d487-4722-b9c7-98f72601a0a7"
            let rawInput = "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9 and 4 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,7,8,9,2,3,4,10,11,12,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_19() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "ec391691-d7c1-40e2-969e-c082ed7ad165"
            let rawInput = "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9 and 5 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,7,8,9,2,3,4,5,10,11,12,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_20() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "84ffbda1-ecde-4454-96af-2d77ff8e2290"
            let rawInput = "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9 and 6 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,7,2,3,4,5,6,10]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_21() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "8a68e425-1f85-411e-9060-668d43b29066"
            let rawInput = "head = [1,2,3,4,5,6] with 2 -> 7 <-> 8 <-> 9 and 3 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,2,7,3,10,4,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_22() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "d16fdfc4-c715-465f-83dc-c05fa04e408a"
            let rawInput = "head = [1,2,3,4,5,6] with 2 -> 7 <-> 8 <-> 9 and 4 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,2,7,3,4,10,5,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_23() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "52737cbd-d4a3-4f1d-b2fa-1447847988d2"
            let rawInput = "head = [1,2,3,4,5,6] with 2 -> 7 <-> 8 <-> 9 and 5 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,2,7,3,4,5,10,6]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_24() async {
            let slug = "flatten-a-multilevel-doubly-linked-list"
            let topic = "linked-list"
            let testId = "9883c47e-ae84-4f33-baa7-c51723f37c56"
            let rawInput = "head = [1,2,3,4,5,6] with 2 -> 7 <-> 8 <-> 9 and 6 -> 10 <-> 11 <-> 12"
            let expectedOutput = "[1,2,7,3,4,5,6,10]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.flatten(p_head)
                let computedOutput = "\(result)"

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
