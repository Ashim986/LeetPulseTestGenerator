import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func complexNumberMultiply(_ num1: String, _ num2: String) -> String {
        let real1 = Int(num1.components(separatedBy: "+")[0])!
        let imag1 = Int(String(num1.components(separatedBy: "+")[1].dropLast()))!
        let real2 = Int(num2.components(separatedBy: "+")[0])!
        let imag2 = Int(String(num2.components(separatedBy: "+")[1].dropLast()))!
        let real = real1*real2 - imag1*imag2
        let imag = real1*imag2 + imag1*real2
        return "(real)+(imag)i"
    }
}

@Suite struct ComplexNumberMultiplicationTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "b6616b63-bdfb-4b7f-8383-8656f190e592"
        let rawInput = "num1 = \"0+0i\", num2 = \"0+0i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "c6e77fc8-3d72-4588-b933-e3eb800b9ef3"
        let rawInput = "num1 = \"1+0i\", num2 = \"0+1i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "2be1d9f5-c339-49b8-a43d-3cba4c61c9e1"
        let rawInput = "num1 = \"0+1i\", num2 = \"1+0i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "18d48437-64d7-422c-971b-6093e1c0cf66"
        let rawInput = "num1 = \"-1+0i\", num2 = \"0+1i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "dab366f0-12bc-4c88-8e08-c88e3fdbe492"
        let rawInput = "num1 = \"0+1i\", num2 = \"-1+0i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "3bb28ba8-1da7-40a3-88b5-e6e17566dc4f"
        let rawInput = "num1 = \"-1+0i\", num2 = \"-1+0i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "c762558a-2fc7-40b3-a309-021fd0fa0fda"
        let rawInput = "num1 = \"0+1i\", num2 = \"0+1i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "ef026ab6-b858-4dd5-9605-203ed886e29f"
        let rawInput = "num1 = \"10+10i\", num2 = \"10+10i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "465e4adc-5e0f-4ff7-9d2f-a611e87b9a25"
        let rawInput = "num1 = \"100+100i\", num2 = \"100+100i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "d2682e5e-f480-42e6-9c4c-10397ad3226f"
        let rawInput = "num1 = \"10+10i\", num2 = \"-10-10i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "31d71590-bb9e-451e-91ff-052d595f1afa"
        let rawInput = "num1 = \"1+0i\", num2 = \"1+0i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "669c8686-a2d8-46e4-8fb1-9abb402dacee"
        let rawInput = "num1 = \"-1+0i\", num2 = \"1+0i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "fb34fbd6-4c9b-402f-ab52-19d4fa34bb9d"
        let rawInput = "num1 = \"1+0i\", num2 = \"-1+0i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "74d09da9-a385-4af5-a3b0-6769358e53b3"
        let rawInput = "num1 = \"-1+1i\", num2 = \"1+1i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "2260f8ca-cc97-4070-834c-7761a3b32edc"
        let rawInput = "num1 = \"1+1i\", num2 = \"-1+1i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "d78b186f-7b16-42eb-9013-51b6af3ac2c1"
        let rawInput = "num1 = \"-1+1i\", num2 = \"-1+1i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "97e48f86-4afc-458c-af94-c725d0d5c90f"
        let rawInput = "num1 = \"10+0i\", num2 = \"0+10i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "4b60803c-1f79-4eb7-87f0-f6f9b1929258"
        let rawInput = "num1 = \"0+10i\", num2 = \"10+0i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "10d8f2d8-0b79-4ad7-be03-693dde1e5c33"
        let rawInput = "num1 = \"-10+0i\", num2 = \"0+10i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "90170c85-ceaa-476b-a9c4-0803953202ce"
        let rawInput = "num1 = \"0+10i\", num2 = \"-10+0i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "c94f9478-730f-4bfc-8f8b-d31f4587eb8d"
        let rawInput = "num1 = \"100+0i\", num2 = \"0+100i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "89db3318-6656-4856-b1a5-67c29047f560"
        let rawInput = "num1 = \"0+100i\", num2 = \"100+0i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "f3d5a6b6-8771-4b00-84c9-f514f69818a8"
        let rawInput = "num1 = \"-100+0i\", num2 = \"0+100i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "cbc487fc-466a-4239-8d5d-e390399de4be"
        let rawInput = "num1 = \"0+100i\", num2 = \"-100+0i\""
        let expectedOutput = "(real)+(imag)i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "complex-number-multiplication"
        let topic = "math-geometry"
        let testId = "6528d4d8-8f48-49cb-aec2-964cb75c54f6"
        let rawInput = "num1 = \"1+1i\", num2 = \"1+1i\""
        let expectedOutput = "\"0+2i\""
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_num1 = InputParser.parseString(params[0])
        guard p_num1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))")
            return
        }
        let p_num2 = InputParser.parseString(params[1])
        guard p_num2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))")
            return
        }

        let solution = Solution()
        let result = solution.complexNumberMultiply(p_num1, p_num2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
