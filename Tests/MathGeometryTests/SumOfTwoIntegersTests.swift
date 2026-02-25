import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int { return a + b }
}

@Suite struct SumOfTwoIntegersTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "46f67a9f-f56f-493c-8f0e-bf1f05a6330e"
        let rawInput = "a = 0, b = 0"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "6bfc1ae0-d2e6-4007-84ef-a08f330ac57d"
        let rawInput = "a = 1, b = 1"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "56371ec9-45fa-4469-ac51-0034bb88aea2"
        let rawInput = "a = -1, b = 1"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "553b33c1-5cda-40e1-aaba-72aa809e8589"
        let rawInput = "a = -1, b = -1"
        let expectedOutput = "-2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "0791a679-5e24-4265-86b0-d2666804c704"
        let rawInput = "a = 100, b = 0"
        let expectedOutput = "100"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "b55343b9-f077-4393-b76c-f679bc836497"
        let rawInput = "a = 0, b = 100"
        let expectedOutput = "100"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "915ae20a-c127-4b64-b1b9-a7d79d8db9f5"
        let rawInput = "a = 100, b = 100"
        let expectedOutput = "200"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "71dbff56-49ab-4672-844c-5296584ca456"
        let rawInput = "a = -100, b = 0"
        let expectedOutput = "-100"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "fd61566f-0696-42bc-86af-17074002ec20"
        let rawInput = "a = 0, b = -100"
        let expectedOutput = "-100"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "45ed96c8-74c1-4cb6-8a5a-c1571fd8db35"
        let rawInput = "a = -100, b = -100"
        let expectedOutput = "-200"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "383d0fa5-7cad-46a3-a016-885a50d8209c"
        let rawInput = "a = 1000, b = 0"
        let expectedOutput = "1000"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "57eb737b-cc3e-4581-a6db-7e318961b4fe"
        let rawInput = "a = 0, b = 1000"
        let expectedOutput = "1000"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "6e7ae374-ee66-4f01-a625-d2b65d033635"
        let rawInput = "a = 1000, b = 1000"
        let expectedOutput = "2000"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "55cdcffe-0015-4866-bc68-e320d7dacdf8"
        let rawInput = "a = -1000, b = 0"
        let expectedOutput = "-1000"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "17a5b680-a4a1-46ee-963e-524844e64847"
        let rawInput = "a = 0, b = -1000"
        let expectedOutput = "-1000"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "b6bea90d-0a04-47b4-be98-d797500e0655"
        let rawInput = "a = -1000, b = -1000"
        let expectedOutput = "-2000"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "a576d5d2-9610-4053-a37d-cd950ca31503"
        let rawInput = "a = 10, b = 20"
        let expectedOutput = "30"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "71979cb7-eb90-48e8-a4bd-c116c0dcfc80"
        let rawInput = "a = 20, b = 10"
        let expectedOutput = "30"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "f1800bda-5161-42d0-a919-b6eedbf35d18"
        let rawInput = "a = -10, b = 20"
        let expectedOutput = "10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "793602ab-9cc7-4e78-8d93-e280a409069d"
        let rawInput = "a = 20, b = -10"
        let expectedOutput = "10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "c5a50687-efd3-4ed3-ac13-5a0bb8910d72"
        let rawInput = "a = -10, b = -20"
        let expectedOutput = "-30"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "59363ce3-2e28-4375-a400-b40bd27b020a"
        let rawInput = "a = -20, b = -10"
        let expectedOutput = "-30"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "9b770cd2-1d27-4d54-8964-fc568f7924dc"
        let rawInput = "a = 10, b = -20"
        let expectedOutput = "-10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "2bca8a01-7f21-43e9-9c79-98ac2607e63e"
        let rawInput = "a = -20, b = 10"
        let expectedOutput = "-10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "sum-of-two-integers"
        let topic = "math-geometry"
        let testId = "4b0b168d-54f1-48e3-a93a-2dee0b946cf3"
        let rawInput = "a = 5, b = 5"
        let expectedOutput = "10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_a = InputParser.parseInt(params[0])
        let p_b = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.getSum(p_a, p_b)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
