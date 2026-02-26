import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func sortArray(_ nums: [Int]) -> [Int] { 
        var nums = nums 
        quickSort(&nums, 0, nums.count - 1) 
        return nums 
    } 

    func quickSort(_ nums: inout [Int], _ low: Int, _ high: Int) { 
        if low < high { 
            let pivot = partition(&nums, low, high) 
            quickSort(&nums, low, pivot - 1) 
            quickSort(&nums, pivot + 1, high) 
        } 
    } 

    func partition(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int { 
        let pivot = nums[high] 
        var i = low - 1 
        for j in low..<high { 
            if nums[j] < pivot { 
                i += 1 
                (nums[i], nums[j]) = (nums[j], nums[i]) 
            } 
        } 
        (nums[i + 1], nums[high]) = (nums[high], nums[i + 1]) 
        return i + 1 
    }
}

@Suite struct SortAnArrayTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "fc3c381f-8917-4a8a-8d1e-120c06e01ae1"
        let rawInput = "nums = []"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "98b740a8-0db4-436c-bce6-62941e80ad55"
        let rawInput = "nums = [1]"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_2() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "b34291da-eb99-42bd-be2e-e2261f69f57a"
        let rawInput = "nums = [5,5]"
        let expectedOutput = "[5,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_3() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "7b5cf595-1516-4422-bee7-c595f00c88eb"
        let rawInput = "nums = [-1,0,1]"
        let expectedOutput = "[-1,0,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_4() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "3ab3d813-14e4-4e40-af79-ac6a36105489"
        let rawInput = "nums = [10,9,8,7,6,5,4,3,2,1]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_5() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "bbd2df46-d64d-44ff-9b31-d7847fc6c61d"
        let rawInput = "nums = [1,1,1,1,1]"
        let expectedOutput = "[1,1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_6() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "9cd63b30-3644-4954-a95c-4e3f5ee875f0"
        let rawInput = "nums = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]"
        let expectedOutput = "[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_7() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "34f78ac3-294e-44e2-b84a-02d46b635a80"
        let rawInput = "nums = [100,200,300,400,500]"
        let expectedOutput = "[100,200,300,400,500]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_8() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "20fc973d-3a63-470a-a327-0ac7156c06e6"
        let rawInput = "nums = [1000,2000,3000,4000,5000]"
        let expectedOutput = "[1000,2000,3000,4000,5000]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_9() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "e584a43e-a81b-4d89-849e-63deb2e1c9dd"
        let rawInput = "nums = [-100,-200,-300,-400,-500]"
        let expectedOutput = "[-500,-400,-300,-200,-100]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_10() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "dd42a352-ac2b-45d0-ba3e-5dc27d040a1c"
        let rawInput = "nums = [0,0,0,0,0]"
        let expectedOutput = "[0,0,0,0,0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_11() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "f16abd33-4626-4f85-9842-a8337ebeffb6"
        let rawInput = "nums = [10,20,30,40,50,60,70,80,90,100]"
        let expectedOutput = "[10,20,30,40,50,60,70,80,90,100]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_12() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "7afa4e0b-4fa3-4c7e-ac6d-f95e212440a8"
        let rawInput = "nums = [1,3,5,7,9]"
        let expectedOutput = "[1,3,5,7,9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_13() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "12431b66-ec42-4623-b80d-f75616e418e1"
        let rawInput = "nums = [2,4,6,8,10]"
        let expectedOutput = "[2,4,6,8,10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_14() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "81993563-7647-44d9-9bb9-35f6a7c5f564"
        let rawInput = "nums = [-1,-3,-5,-7,-9]"
        let expectedOutput = "[-9,-7,-5,-3,-1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_15() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "48d6a2be-c468-4992-bd80-0005c62bca86"
        let rawInput = "nums = [-2,-4,-6,-8,-10]"
        let expectedOutput = "[-10,-8,-6,-4,-2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_16() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "7859e682-1669-4fb7-8010-7ba0758bd33e"
        let rawInput = "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_17() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "800c9a75-0dd2-4c74-b3cb-b04cba56372e"
        let rawInput = "nums = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_18() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "c7572a30-d0e9-4210-9bb9-62a5afbb36b2"
        let rawInput = "nums = [1,3,2,5,4]"
        let expectedOutput = "[1,2,3,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_19() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "7a896254-402e-4433-9e79-883eb6ca80df"
        let rawInput = "nums = [5,4,3,2,1,6,7,8,9,10]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_20() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "00c2a48f-0dbd-4dce-b5fb-25d7a9e042b9"
        let rawInput = "nums = [10,9,8,7,6,5,4,3,2,1,0,-1,-2,-3,-4,-5]"
        let expectedOutput = "[-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_21() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "c5a28221-0d22-4004-be09-68b8d00f14c5"
        let rawInput = "nums = [0,-1,1,-2,2,-3,3,-4,4,-5,5]"
        let expectedOutput = "[-5,-4,-3,-2,-1,0,1,2,3,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_22() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "3f841379-d7b5-4d1b-afe7-15b0eb8b272c"
        let rawInput = "nums = [100,-100,200,-200,300,-300]"
        let expectedOutput = "[-300,-200,-100,100,200,300]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_23() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "b0878627-d1b4-4e6f-bfc8-58474a017167"
        let rawInput = "nums = [1000,-1000,2000,-2000,3000,-3000]"
        let expectedOutput = "[-3000,-2000,-1000,1000,2000,3000]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_24() async {
        let slug = "sort-an-array"
        let topic = "heap-priority-queue"
        let testId = "94f9802d-e286-4102-a406-68d048307630"
        let rawInput = "nums = [1,1,1,1,1,2,2,2,2,2]"
        let expectedOutput = "[1,1,1,1,1,2,2,2,2,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_nums = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        // Constraint precondition checks
        guard p_nums.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.sortArray(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [Int]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
