import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        if n < 0 { return 1 / myPow(x, -n) }
        let half = myPow(x, n / 2)
        return n % 2 == 0 ? half * half : half * half * x
    }
}

@Suite struct PowXNTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "7d32cb29-72f6-40af-9922-82a3005b8c46"
        let rawInput = "x = 2.0, n = 0"
        let expectedOutput = "1.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "25da6158-263a-4b1e-bb50-de55d1283f88"
        let rawInput = "x = 2.1, n = 3"
        let expectedOutput = "9.261"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "68c4fb34-d7d1-43c4-9ac1-cf71eb7d8751"
        let rawInput = "x = 2.0, n = 1"
        let expectedOutput = "2.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "3dbabe45-f284-4137-a77a-cd65c1b91bd1"
        let rawInput = "x = 2.0, n = -1"
        let expectedOutput = "0.5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "8e6fff1b-3d21-4421-af10-eff0a0b1d1a9"
        let rawInput = "x = 2.0, n = -10"
        let expectedOutput = "0.0009765625"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "4576f459-a760-4d6d-a9af-772be54c5fbe"
        let rawInput = "x = -2.0, n = 3"
        let expectedOutput = "-8.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "72ec02ce-f267-4ad3-8f73-a427648c3a9a"
        let rawInput = "x = -2.0, n = -3"
        let expectedOutput = "-0.125"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "3acd4b01-45e0-43dc-bc94-fb6586e4392f"
        let rawInput = "x = 0.0, n = 10"
        let expectedOutput = "0.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "3a56a913-0639-414f-acaa-b1150772fd6f"
        let rawInput = "x = 1.0, n = 10"
        let expectedOutput = "1.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "05747341-94a6-4fed-92cd-d8a5f5bcfced"
        let rawInput = "x = 1.0, n = -10"
        let expectedOutput = "1.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "07994921-ccbf-4e15-8b3e-97ab58d7f560"
        let rawInput = "x = -1.0, n = 10"
        let expectedOutput = "1.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "e0260d3d-99da-44e5-b07c-453bf6610445"
        let rawInput = "x = -1.0, n = -10"
        let expectedOutput = "1.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "efde81b0-bead-4ceb-a1d0-9c27c2b3a7e5"
        let rawInput = "x = 2.0, n = 20"
        let expectedOutput = "1048576.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "9551e7a2-d44e-4a54-8168-edce57a8ecff"
        let rawInput = "x = 10.0, n = 2"
        let expectedOutput = "100.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "3698ca26-872c-4674-ab7a-54c5b9be1483"
        let rawInput = "x = 10.0, n = -2"
        let expectedOutput = "0.01"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "a90d42cd-af15-4812-9dfd-c984eb6d67ab"
        let rawInput = "x = 0.5, n = 2"
        let expectedOutput = "0.25"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "a7e16242-6159-4943-96d0-c0ba5bcb4ac7"
        let rawInput = "x = 0.5, n = -2"
        let expectedOutput = "4.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "2a7ebb24-adcf-4637-b805-eabc0e456a59"
        let rawInput = "x = 2.0, n = 30"
        let expectedOutput = "1073741824.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "ec3833ec-ce4a-4ffa-961c-58cc3b4ff848"
        let rawInput = "x = -10.0, n = 2"
        let expectedOutput = "100.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "1cc35cbc-d3bc-46f3-a7e9-0a3a0421b32a"
        let rawInput = "x = -10.0, n = -2"
        let expectedOutput = "0.01"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "8c7e6e3a-f84b-4373-b3d1-3389930bfdb1"
        let rawInput = "x = 0.1, n = 2"
        let expectedOutput = "0.01"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "869eb562-c328-4efd-8685-933cae4d8861"
        let rawInput = "x = 0.1, n = -2"
        let expectedOutput = "100.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "8f2f9da8-8bef-4fcd-b9d7-6975f7601011"
        let rawInput = "x = 2.0, n = 40"
        let expectedOutput = "1099511627776.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "c65914aa-c8fb-41eb-b4b3-efe204772be6"
        let rawInput = "x = 100.0, n = 2"
        let expectedOutput = "10000.0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "pow-x-n"
        let topic = "misc"
        let testId = "ebd464b9-6773-44bd-a579-cfc1021bb46d"
        let rawInput = "x = 100.0, n = -2"
        let expectedOutput = "0.0001"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_x = InputParser.parseDouble(params[0])
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.myPow(p_x, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
