import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_path_sum {
    private class Solution {
        func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
            guard let root = root else { return false }

            var stack: [(TreeNode, Int)] = [(root, targetSum)]

            while !stack.isEmpty {
                let (node, remaining) = stack.removeLast()

                // Check if leaf with matching sum
                if node.left == nil && node.right == nil && remaining == node.val {
                    return true
                }

                // Push children
                if let left = node.left {
                    stack.append((left, remaining - node.val))
                }
                if let right = node.right {
                    stack.append((right, remaining - node.val))
                }
            }

            return false
        }
    }

    @Suite struct PathSumTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "path-sum"
            let topic = "trees"
            let testId = "f738ab4a-138c-463c-80c5-8edebc7883bc"
            let rawInput = "root = [1,null,2]"
            let expectedOutput = "False"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "8edde347-c7e2-4a2a-ae47-0190ba603d61"
            let rawInput = "root = [1,2]"
            let expectedOutput = "False"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "40cd55c4-c8ce-4975-b793-8270c8e3158d"
            let rawInput = "root = [0]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "1471a064-6c4d-4459-8814-c5f7c89e0f98"
            let rawInput = "root = [0,null,0]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "27b52f40-cb92-4900-94c1-1b599b619f03"
            let rawInput = "root = [1,null,2,null,3,null,4,null,5,null,6,null,7]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "d9fbe3af-52f0-4ac0-bd75-afc98d944fd3"
            let rawInput = "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "a32abda1-9193-48f6-9aa4-55d0d04f9c49"
            let rawInput = "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "1e02cc30-32f5-4b88-b856-c81fc20e8982"
            let rawInput = "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "974bb505-fb97-4943-a504-362a3789a6b8"
            let rawInput = "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "942726c8-874c-4117-a646-7a2d271ee10f"
            let rawInput = "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "e8d8e417-bf3c-4b18-b710-ee01028aa856"
            let rawInput = "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "b29d3491-bc80-459f-b90e-36a885932c49"
            let rawInput = "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "794f3cdf-6d71-4247-81f4-11b68fcadf0f"
            let rawInput = "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "0ecea3eb-a8d2-41db-ac83-1ab3bc734c72"
            let rawInput = "root = [1]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "0fb2fb7e-3457-4474-93c6-c216399616fd"
            let rawInput = "root = [2,-2,-3]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "1bb2fd9b-29c8-43ac-8f8e-6b96bd13bac8"
            let rawInput = "root = [1,-1]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "5633e6a0-02a7-4efb-9757-8eb262844551"
            let rawInput = "root = [1,2,2,3,3,3,3]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "0ba9ac2e-4ea5-4bc9-9cc0-0d2d2c3a12f1"
            let rawInput = "root = [-2,null,-3]"
            let expectedOutput = "True"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "0953c479-d1af-4c54-9251-db6555a34b87"
            let rawInput = "root = [1,2,3,null,null,4,5]"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "1f730fb7-2b9b-4984-a617-5842b51a1397"
            let rawInput = "root = [1,null,2,null,3]"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "fb331be7-8463-45f8-97bc-8fd4b72bffa6"
            let rawInput = "root = [1,2,null,3]"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "25288559-f5b3-4cc8-85dc-d7aba5494614"
            let rawInput = "root = [1,null,2,null,3,null,4]"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "e6f058df-656e-4dee-9d64-e09928fb262c"
            let rawInput = "root = [1,null,2,null,3,null,4,null,5]"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "e9b0601b-102e-46ab-a235-c1c26541ad42"
            let rawInput = "root = [1,null,2,null,3,null,4,null,5,null,6]"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
            let slug = "path-sum"
            let topic = "trees"
            let testId = "cc2e6333-8668-491c-aecb-f578c61a833f"
            let rawInput = "root = [0,1,1]"
            let expectedOutput = "false"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
                return
            }
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= Node.val <= 1000")
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -1000 <= targetSum <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.hasPathSum(p_root, p_targetSum)
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
