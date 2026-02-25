import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        var res = [String]()
        let hours = [1, 2, 4, 8]
        let minutes = [1, 2, 4, 8, 16, 32]
        var hourPowers = [Int]()
        var minutePowers = [Int]()
        for i in 0...3 {
            hourPowers.append(hours[i])
            minutePowers.append(minutes[i])
        }
        for h in hourPowers {
            for m in minutePowers {
                if ((h.nonzeroBitCount) + (m.nonzeroBitCount)) == turnedOn {
                    let time = String(format: "%02d:%02d", h, m)
                    res.append(time)
                }
            }
        }
        return res
    }
}

@Suite struct BinaryWatchTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "35dd73db-a1ba-495e-bf75-add17b2b67b5"
        let rawInput = "turnedOn = 18"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "5ba1a8fe-78d1-453e-bfda-21ac200621cb"
        let rawInput = "turnedOn = -5"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "98c0ea6d-57a5-4279-949a-5ced96829c76"
        let rawInput = "turnedOn = 19"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "d82bdea5-44a3-4f1a-ae5e-501f61f23916"
        let rawInput = "turnedOn = 20"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "144f3170-fbe9-4352-a816-f7b7cdf8664c"
        let rawInput = "turnedOn = -6"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "0de4817d-b614-4644-b16a-f3bb9ae53b3d"
        let rawInput = "turnedOn = 21"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "0ca657dd-3780-4dfc-88be-cf192519dae2"
        let rawInput = "turnedOn = 22"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "b3f2b7e6-b944-4cbb-84f5-234eeef1c0f4"
        let rawInput = "turnedOn = -7"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "216533c2-af1e-44f5-bfac-bf589f382fcb"
        let rawInput = "turnedOn = 23"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "ac658eef-c3ac-4c46-80c8-c2aee72e52fe"
        let rawInput = "turnedOn = 24"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "a63f262c-94e9-428c-94df-6dd8cbf7cc3b"
        let rawInput = "turnedOn = -8"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "1ad8a0e3-3739-440c-9e80-d2ec3e3a5d75"
        let rawInput = "turnedOn = 25"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "ef8a62ae-5e30-49bc-914d-57835cfc4250"
        let rawInput = "turnedOn = 26"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "4d437b3d-9206-4619-96e6-20a2a92e378f"
        let rawInput = "turnedOn = -9"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "3e0f29f5-8cf5-42f5-8c38-34e8d981a493"
        let rawInput = "turnedOn = 27"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "b312aa69-7ec8-4add-9ab4-ff2ba86bc880"
        let rawInput = "turnedOn = 1"
        let expectedOutput = "[\"0:01\",\"0:02\",\"0:04\",\"0:08\",\"0:16\",\"0:32\",\"1:00\",\"2:00\",\"4:00\",\"8:00\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "binary-watch"
        let topic = "backtracking"
        let testId = "a33079a0-9944-42dd-892d-e6f5f8488a16"
        let rawInput = "turnedOn = 9"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_turnedOn = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= turnedOn <= 10")
            return
        }

        let solution = Solution()
        let result = solution.readBinaryWatch(p_turnedOn)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
