import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        func findFirst() -> Int {
            var l = 0, r = nums.count - 1, result = -1
            while l <= r {
                let m = l + (r - l) / 2
                if nums[m] == target { result = m; r = m - 1 }
                else if nums[m] < target { l = m + 1 }
                else { r = m - 1 }
            }
            return result
        }
        func findLast() -> Int {
            var l = 0, r = nums.count - 1, result = -1
            while l <= r {
                let m = l + (r - l) / 2
                if nums[m] == target { result = m; l = m + 1 }
                else if nums[m] < target { l = m + 1 }
                else { r = m - 1 }
            }
            return result
        }
        return [findFirst(), findLast()]
    }
}

@Suite struct FindFirstAndLastPositionOfElementInSortedArrayTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "766157DB-6F25-4B4B-ACF5-47CFF0BFDE93"
        let rawInput = "[], 0"
        let expectedOutput = "[-1,-1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "4EB7CA38-C50D-45AC-A734-D476A4116210"
        let rawInput = "[1], 1"
        let expectedOutput = "[0, 0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "458DF344-D22A-4DA0-B53E-5938B746F32A"
        let rawInput = "[1], 0"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "A92AD3CE-6684-46C8-AF96-A1EC7D9F3965"
        let rawInput = "[1,2,3,4,5], 3"
        let expectedOutput = "[2, 2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "F71EA3B9-C23F-4648-9604-C98B8477D7FB"
        let rawInput = "[5,7,7,8,8,10], 8"
        let expectedOutput = "[3,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "583F71B3-1C6C-442E-A46B-9810DFB1C8BC"
        let rawInput = "[1,1,2,3,4], 1"
        let expectedOutput = "[0, 1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "E7927913-9FC9-461E-AA58-7A27DBC19A24"
        let rawInput = "[7,7,7,7,7], 7"
        let expectedOutput = "[0, 4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "631B2DE9-5708-4F29-95F8-6E71380E1A93"
        let rawInput = "[1,2,3,3,3,3,4,5,6,7,8,9], 3"
        let expectedOutput = "[2, 5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "4B531BFB-D0EC-4202-9A6B-D0C7FDCD096B"
        let rawInput = "{\"nums\": [], \"target\": 0}"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "D649F85B-FB0B-4707-A45B-DC2B750070A0"
        let rawInput = "{\"nums\": [1], \"target\": 1}"
        let expectedOutput = "[0, 0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "A89CD354-DCE2-48A6-8673-BD6D54EF9CA8"
        let rawInput = "{\"nums\": [1], \"target\": 0}"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "5B619573-F615-490C-9E99-982D08C1ECC2"
        let rawInput = "{\"nums\": [5, 7, 7, 8, 8, 10], \"target\": 2}"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "7315B1B8-6043-4E09-B94C-A494DBF45E53"
        let rawInput = "{\"nums\": [5, 7, 7, 8, 8, 10], \"target\": 12}"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "AA1F7173-B7AA-46ED-8694-F3DA819EA772"
        let rawInput = "{\"nums\": [5, 7, 7, 8, 8, 10], \"target\": 10}"
        let expectedOutput = "[5, 5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "13D1FB74-A630-46BC-9195-B23B70D07CC9"
        let rawInput = "{\"nums\": [1, 1, 2, 3, 4, 5], \"target\": 1}"
        let expectedOutput = "[0, 1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "0F9B5D71-1738-40D1-9B3B-4B92A07572ED"
        let rawInput = "{\"nums\": [1, 2, 3, 4, 5, 5], \"target\": 5}"
        let expectedOutput = "[4, 5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "FC2DE93F-3AA0-43A5-84B1-929AA65BACC9"
        let rawInput = "{\"nums\": [6, 6, 6, 6, 6, 6], \"target\": 6}"
        let expectedOutput = "[0, 5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "9FF125B7-CA0F-40B1-8553-2C5E4D556BBF"
        let rawInput = "{\"nums\": [1, 3, 5, 7, 9], \"target\": 4}"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "00035210-CA1A-4FD6-8C3B-E1A0C3C7988A"
        let rawInput = "{\"nums\": [5, 7, 7, 8, 8, 10], \"target\": 8}"
        let expectedOutput = "[3, 4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "2025777D-5344-4845-ABCE-1B6E5BFBF26B"
        let rawInput = "{\"nums\": [6, 6, 6, 6, 6], \"target\": 6}"
        let expectedOutput = "[0, 4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "3CF7DB3C-A96B-4187-B140-8F229148C240"
        let rawInput = "{\"nums\": [1, 2, 3, 4, 5], \"target\": 3}"
        let expectedOutput = "[2, 2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "6A413ACD-C501-41A3-B722-9E560BB34633"
        let rawInput = "{\"nums\": [10, 20, 30], \"target\": 35}"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "51866E75-D034-4BFF-8317-F19226B55985"
        let rawInput = "nums = [], target = 0"
        let expectedOutput = "[-1,-1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "5F2D538B-01DF-4B4C-9837-48920BB03095"
        let rawInput = "nums = [5], target = 5"
        let expectedOutput = "[0, 0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "find-first-and-last-position-of-element-in-sorted-array"
        let topic = "binary-search"
        let testId = "8E14E93F-FDD3-4EA5-AE52-76E9B0C9017B"
        let rawInput = "nums = [1, 3, 5, 7], target = 4"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 0 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.searchRange(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
