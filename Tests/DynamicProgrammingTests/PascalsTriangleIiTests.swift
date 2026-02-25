import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var row: [Int] = [1]
        for _ in 1...rowIndex {
            var newRow: [Int] = [1]
            for i in 1..<row.count {
                newRow.append(row[i-1] + row[i])
            }
            newRow.append(1)
            row = newRow
        }
        return row
    }
}

@Suite struct PascalsTriangleIiTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "8882afa5-f352-47ad-bab6-b8bd26d7006a"
        let rawInput = "rowIndex = 2"
        let expectedOutput = "[1,2,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "4ab15b51-0f86-4f84-bbcb-1a1c01ad7680"
        let rawInput = "rowIndex = 6"
        let expectedOutput = "[1,6,15,20,15,6,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "b6affa98-c107-4612-b322-c2f73e74aa5f"
        let rawInput = "rowIndex = 7"
        let expectedOutput = "[1,7,21,35,35,21,7,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "7508e2fe-870c-4f9f-9a1f-229e77a50da7"
        let rawInput = "rowIndex = 8"
        let expectedOutput = "[1,8,28,56,70,56,28,8,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "9c337231-aeef-4361-9067-b017ca98ce8d"
        let rawInput = "rowIndex = 9"
        let expectedOutput = "[1,9,36,84,126,126,84,36,9,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "3827d481-564b-4a2c-af74-106506a317da"
        let rawInput = "rowIndex = 11"
        let expectedOutput = "[1,11,55,165,330,462,462,330,165,55,11,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "c7c89488-b565-40b9-a6e8-ce9485807b4c"
        let rawInput = "rowIndex = 12"
        let expectedOutput = "[1,12,66,220,495,792,924,792,495,220,66,12,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "08a4d9ea-db5e-4dfa-957a-37d1da2e48ce"
        let rawInput = "rowIndex = 13"
        let expectedOutput = "[1,13,78,286,715,1287,1716,1716,1287,715,286,78,13,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "aaca6b16-15d2-4204-8045-6fd2dd63b14f"
        let rawInput = "rowIndex = 14"
        let expectedOutput = "[1,14,91,364,1001,2002,3003,3432,3003,2002,1001,364,91,14,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "56201527-483c-4f94-8eb6-af4a432455a3"
        let rawInput = "rowIndex = 15"
        let expectedOutput = "[1,15,105,455,1365,3003,5005,6435,6435,5005,3003,1365,455,105,15,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "433d5102-d6bd-4d36-bc92-19f08a3eb0c3"
        let rawInput = "rowIndex = 3"
        let expectedOutput = "[1,3,3,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "8cec68b8-a41e-471f-9be1-8f0eea579e56"
        let rawInput = "rowIndex = 0"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "pascals-triangle-ii"
        let topic = "dynamic-programming"
        let testId = "e55cd208-af26-4efb-a5a2-e9a2447dd301"
        let rawInput = "rowIndex = 1"
        let expectedOutput = "[1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_rowIndex = InputParser.parseInt(params[0])

        // Constraint precondition checks
        guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= rowIndex <= 33")
            return
        }

        let solution = Solution()
        let result = solution.getRow(p_rowIndex)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
