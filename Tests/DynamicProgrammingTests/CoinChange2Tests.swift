import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: amount + 1)
        dp[0] = 1
        for coin in coins {
            for a in coin...amount {
                dp[a] += dp[a - coin]
            }
        }
        return dp[amount]
    }
}

@Suite struct CoinChange2Tests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "42bd5e1b-1caa-4f18-b2d4-300afe20d1bc"
        let rawInput = "amount = 0, coins = []"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "bc2d3ff8-1d88-46b7-9f60-2912c8a79c34"
        let rawInput = "amount = 1, coins = [1]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "ca53d0c1-be1a-4a84-aab9-0582f7fd064c"
        let rawInput = "amount = 2, coins = [1,2]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "f7dbc248-fdc6-4148-a29f-8e0ccd26be3f"
        let rawInput = "amount = 3, coins = [1,2,3]"
        let expectedOutput = "3"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "b5840b25-c3c1-408d-a53e-5fdcbc134779"
        let rawInput = "amount = 4, coins = [1,2,3,4]"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "f477aebe-a293-4fd5-b5a5-52e57f1deb19"
        let rawInput = "amount = -1, coins = [1,2,3]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "156350ec-f9b8-4d01-84d7-5362aca87664"
        let rawInput = "amount = 0, coins = [1,2,3]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "09257aee-5d1a-4bbb-915e-627b3e5d2fc5"
        let rawInput = "amount = 1, coins = []"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "cf2cc9a0-cd64-4797-9655-e48241fa22c8"
        let rawInput = "amount = 100, coins = []"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "062e7941-f9c2-496f-a8d5-e490c8f02ca5"
        let rawInput = "amount = 100, coins = [1]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "a3f03aef-d29e-47fb-80ac-ecb39fc5782f"
        let rawInput = "amount = 100, coins = [100]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "6beec849-bc4b-4cd7-8e4d-1815786fc7b9"
        let rawInput = "amount = 100, coins = [1,100]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "9acb55a5-e7ba-479b-b3d7-bcaac7071b62"
        let rawInput = "amount = 5, coins = [1,1,1,1,1]"
        let expectedOutput = "126"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "50e2d25f-8af3-44b2-93ec-a571833ed8da"
        let rawInput = "amount = 10, coins = [1,2,5,10]"
        let expectedOutput = "11"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "170a32f6-37c4-417f-be64-9a8c9538421d"
        let rawInput = "amount = 100, coins = [1,5,10,25,50,100]"
        let expectedOutput = "292"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "b0a0d25f-255b-4fee-8a42-b0fc9dcd67a6"
        let rawInput = "amount = 1000, coins = [1,2,5,10,20,50,100,200,500,1000]"
        let expectedOutput = "133984"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "5aad3bef-a399-4a8f-b934-5423a2172d93"
        let rawInput = "amount = 100, coins = [1,2,3,4,5,6,7,8,9,10]"
        let expectedOutput = "1022600"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "8ea2ecd9-27d5-4977-8bdf-88117613d2b5"
        let rawInput = "amount = 100, coins = [10,20,30,40,50,60,70,80,90,100]"
        let expectedOutput = "42"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "27de1fc0-8d48-4f8e-87e5-941f70e45ac0"
        let rawInput = "amount = 100, coins = [100,90,80,70,60,50,40,30,20,10]"
        let expectedOutput = "42"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "coin-change-2"
        let topic = "dynamic-programming"
        let testId = "c55fc014-8de8-4d56-8dc1-92f07bed6315"
        let rawInput = "amount = 100, coins = [1,1,1,1,1,1,1,1,1,1]"
        let expectedOutput = "200160075"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_amount = InputParser.parseInt(params[0])
        let p_coins = InputParser.parseIntArray(params[1])
        guard p_coins.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: coins array too large (\(p_coins.count))")
            return
        }

        let solution = Solution()
        let result = solution.change(p_amount, p_coins)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
