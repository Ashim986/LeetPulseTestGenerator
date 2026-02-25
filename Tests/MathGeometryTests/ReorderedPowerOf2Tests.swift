import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func reorderedPowerOf2(_ N: Int) -> Bool {
        let numStr = String(N)
        let count = numStr.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        for i in 0...30 {
            let powerOfTwo = 2 << i
            let powerOfTwoStr = String(powerOfTwo)
            let powerOfTwoCount = powerOfTwoStr.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
            if count == powerOfTwoCount {
                return true
            }
        }
        return false
    }
}

@Suite struct ReorderedPowerOf2Tests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "6dee0cc6-1a4e-4420-8597-90af1542b74f"
        let rawInput = "N = 0"
        let expectedOutput = "false"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "22739323-c413-4b70-be29-39967f6e19dd"
        let rawInput = "N = -1"
        let expectedOutput = "false"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "fe89041a-1dd2-49bd-8798-cff8e1ad1558"
        let rawInput = "N = 2"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "9b60749f-1b1b-4dd3-8bce-a6f11deebed8"
        let rawInput = "N = 4"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "8632d368-aa55-41e1-a552-dca51118351e"
        let rawInput = "N = 8"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "b904fc14-28b2-42c9-9508-f37b3cf56206"
        let rawInput = "N = 16"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "00fd7abb-33e6-4905-9b91-70beebad6b7b"
        let rawInput = "N = 32"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "b7108032-b9e1-455a-95a4-a0d8c6e71fcc"
        let rawInput = "N = 64"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "c46a96db-099a-4fbf-9fb4-cee20ff3c94d"
        let rawInput = "N = 128"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "763c8195-ceed-4a94-8a92-6cbb4eeb1eca"
        let rawInput = "N = 256"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "99d62f83-8141-4c67-a71a-238a81411719"
        let rawInput = "N = 512"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "c1aa8eb1-e25c-4259-9ad5-116bc693bc45"
        let rawInput = "N = 1024"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "14b73820-5baf-483c-af6e-c43ab3f969f1"
        let rawInput = "N = 2048"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "c719e778-9314-494b-96b2-3c9bd9cc4fd8"
        let rawInput = "N = 4096"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "10295377-a700-4471-b5b3-3d0deb61414b"
        let rawInput = "N = 8192"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "e574b3bb-8668-40f9-97f7-53a1e91ecc0d"
        let rawInput = "N = 16384"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "876bcf45-c5cd-426d-b29d-9bea7aa1819e"
        let rawInput = "N = 32768"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "075c7d07-65b1-4228-ba87-366f1e90e9f6"
        let rawInput = "N = 65536"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "bfb5dc16-65c7-4a1b-a88a-84d45de937ad"
        let rawInput = "N = 131072"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "57438b40-1d4b-402e-ad11-5c01d39d0da1"
        let rawInput = "N = 262144"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "80e7df2a-7b1d-4986-9d81-a21410af5e11"
        let rawInput = "N = 524288"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "b23258ab-6ae4-486e-9eff-5e30850ff7bd"
        let rawInput = "N = 1048576"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "206adc51-1407-4b42-8bda-e7d80fbf6d8a"
        let rawInput = "N = 2097152"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "84c18a8a-fbdb-4957-80c6-339b54ac9764"
        let rawInput = "N = 4194304"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "reordered-power-of-2"
        let topic = "math-geometry"
        let testId = "a951a24f-a515-4601-a40a-53f0a49bfffa"
        let rawInput = "N = 8388608"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_N = InputParser.parseInt(params[0])

        let solution = Solution()
        let result = solution.reorderedPowerOf2(p_N)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
