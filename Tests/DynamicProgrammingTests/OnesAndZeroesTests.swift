import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int { 
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1) 
        for str in strs { 
            let ones = countOnes(str), zeros = countZeros(str) 
            for i in stride(from: m, through: ones, by: -1) { 
                for j in stride(from: n, through: zeros, by: -1) { 
                    dp[i][j] = max(dp[i][j], dp[i - ones][j - zeros] + 1) 
                } 
            } 
        } 
        return dp[m][n] 
    } 

    func countOnes(_ s: String) -> Int { 
        var count = 0 
        for c in s { 
            if c == "1" { 
                count += 1 
            } 
        } 
        return count 
    } 

    func countZeros(_ s: String) -> Int { 
        var count = 0 
        for c in s { 
            if c == "0" { 
                count += 1 
            } 
        } 
        return count 
    }
}

@Suite struct OnesAndZeroesTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "8d811702-034c-4621-b10b-e1a50940a726"
        let rawInput = "strs = [\"1\"], m = 1, n = 1"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "db6945c4-ed17-4c48-be6d-cd7e51e43c0c"
        let rawInput = "strs = [\"0\"], m = 1, n = 1"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "1aa85782-3051-4b79-83f1-a4b5871594df"
        let rawInput = "strs = [\"10\"], m = 1, n = 1"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "f31edfa3-2487-404b-ad0d-55381e6f1657"
        let rawInput = "strs = [\"10\", \"0\", \"1\"], m = 0, n = 0"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "0a275ecb-c2b1-432e-a0be-5e3b503362c0"
        let rawInput = "strs = [\"10\", \"0\", \"1\"], m = 0, n = 1"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "10509e53-1e81-400b-808d-7bb643e79a42"
        let rawInput = "strs = [\"10\", \"0\", \"1\"], m = 1, n = 0"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "6023e47d-a348-45ae-adc1-b4b7817e0cf2"
        let rawInput = "strs = [\"10\", \"0\", \"1\"], m = -1, n = 1"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "200ad238-b471-417f-9d19-3476214cb99f"
        let rawInput = "strs = [\"10\", \"0\", \"1\"], m = 1, n = -1"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "7af0154f-ee89-409c-a055-da8ed02a1c02"
        let rawInput = "strs = [], m = 1, n = 1"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "7911085a-b9af-4b8f-bf35-b953c843c2ba"
        let rawInput = "strs = [\"10\", \"0\", \"1\", \"10\", \"0\", \"1\"], m = 0, n = 0"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "0be32f7c-ecdd-4e3e-b3cb-b14a015875c7"
        let rawInput = "strs = [\"1111\", \"0000\", \"1111\", \"0000\"], m = 0, n = 0"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "bb833441-919c-431a-9de2-1ab8df1d4625"
        let rawInput = "strs = [\"1111\", \"0000\", \"1111\", \"0000\"], m = 8, n = 8"
        let expectedOutput = "4"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "352d9e0c-afe6-4aa6-bbbe-2b9e49fcfd61"
        let rawInput = "strs = [\"1\", \"1\", \"1\", \"1\", \"1\"], m = 5, n = 5"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "e2b084b3-021a-40ef-a321-80224efa3d2f"
        let rawInput = "strs = [\"0\", \"0\", \"0\", \"0\", \"0\"], m = 5, n = 5"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "4fe7c86b-7539-48bc-b89f-5ca4783dc06a"
        let rawInput = "strs = [\"10\", \"10\", \"10\", \"10\", \"10\"], m = 5, n = 5"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "9a29901b-8d7a-48e6-a320-c9c6b3c04898"
        let rawInput = "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 0, n = 0"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "cbe56565-11f3-4680-91dd-aa3fc70f3d49"
        let rawInput = "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = -5, n = 5"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "165d733e-9709-4729-a998-6a2a61cfb1ad"
        let rawInput = "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 5, n = -5"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "fd7b598f-afab-49c6-bc75-9701e8d05538"
        let rawInput = "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 100, n = 100"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "b5ccef61-ed1c-420b-8f2a-899b20d6b320"
        let rawInput = "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 1000, n = 1000"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "e553c0d7-d3ea-4b46-81f7-4679d6b1c5e4"
        let rawInput = "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 10000, n = 10000"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "8ceab4a7-d528-4c99-9ade-0e2cf9b6703c"
        let rawInput = "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\", \"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 100, n = 100"
        let expectedOutput = "10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "77ee1908-9f8d-40aa-b58d-f3b19a389639"
        let rawInput = "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\", \"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 1000, n = 1000"
        let expectedOutput = "10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "bca5398a-4d01-4bba-8c15-696470e6617c"
        let rawInput = "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\", \"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 10000, n = 10000"
        let expectedOutput = "10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "ones-and-zeroes"
        let topic = "dynamic-programming"
        let testId = "d1e9d270-1e21-4df1-8d14-052cfe2d4521"
        let rawInput = "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\", \"10000\", \"00001\", \"11111\", \"00000\", \"11111\", \"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 100, n = 100"
        let expectedOutput = "15"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_strs = InputParser.parseStringArray(params[0])
        guard p_strs.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: strs array too large (\(p_strs.count))")
            return
        }
        let p_m = InputParser.parseInt(params[1])
        let p_n = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_strs.count >= 1 && p_strs.count <= 600 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= strs.length <= 600")
            return
        }

        let solution = Solution()
        let result = solution.findMaxForm(p_strs, p_m, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
