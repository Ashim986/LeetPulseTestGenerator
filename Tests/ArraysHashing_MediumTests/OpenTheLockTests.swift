import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCOpenTheLock {
    private class Solution {
        func openLock(_ deadends: [String], _ target: String) -> Int {
            let dead = Set(deadends)
            if dead.contains("0000") { return -1 }
            if target == "0000" { return 0 }

            func neighbors(_ state: String) -> [String] {
                let chars = Array(state)
                var result: [String] = []
                result.reserveCapacity(8)
                for i in 0..<4 {
                    guard let digit = chars[i].wholeNumberValue else { continue }
                    for delta in [-1, 1] {
                        let nextDigit = (digit + delta + 10) % 10
                        var next = chars
                        next[i] = Character(String(nextDigit))
                        result.append(String(next))
                    }
                }
                return result
            }

            var queue: [String] = ["0000"]
            var visited: Set<String> = ["0000"]
            var steps = 0

            while !queue.isEmpty {
                steps += 1
                var nextQueue: [String] = []
                for state in queue {
                    for next in neighbors(state) {
                        if dead.contains(next) { continue }
                        if visited.contains(next) { continue }
                        if next == target { return steps }
                        visited.insert(next)
                        nextQueue.append(next)
                    }
                }
                queue = nextQueue
            }

            return -1
        }
    }

    @Suite struct OpenTheLockTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a840cff8-a8d6-4be4-9dde-5f722cd66afb",
             input: "deadends = [], target = \"0000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0e41d010-ca43-4031-9b7b-1d967f7b8d87",
             input: "deadends = [\"0000\"], target = \"9999\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "0e472fa7-dc37-4884-8e0a-131ca2a78656",
             input: "deadends = [\"0000\",\"0001\"], target = \"9999\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "195bcd2a-0729-42e7-bc04-5c18b56e49ff",
             input: "deadends = [\"0000\",\"0001\",\"0002\"], target = \"9999\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "2ef5a1b4-e2a8-4cba-bf86-42d443bcdbf2",
             input: "deadends = [\"0000\"], target = \"8888\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "45d18cc3-3673-4453-9e20-5eb72250d948",
             input: "deadends = [\"8888\"], target = \"0000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "806a14d2-8704-4722-bafd-4bb86b59a31d",
             input: "deadends = [\"0000\"], target = \"0000\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "ece14cda-469b-4f38-9c62-f99891a428bd",
             input: "deadends = [\"0000\"], target = \"0001\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "e7cbf7a9-6fda-49cc-9c41-bbcdd4560587",
             input: "deadends = [\"0000\"], target = \"0009\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "934223bf-a789-4487-9d6e-49b57e4d293d",
             input: "deadends = [\"0000\"], target = \"0010\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "ac0b6839-5699-489d-9a5f-dc308bae023f",
             input: "deadends = [\"0000\"], target = \"0099\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "9d163fdf-bdba-450e-a985-2cffeaea6a1e",
             input: "deadends = [\"0000\"], target = \"0100\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "a9b0bb8f-9e22-4bf0-a624-c290eb07f15d",
             input: "deadends = [\"0000\"], target = \"0999\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "7d173e99-abc4-402a-93be-60b0ee77a648",
             input: "deadends = [\"0000\"], target = \"1000\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "6dfa1891-032d-4638-a326-bc1c5edfa891",
             input: "deadends = [\"0000\",\"0001\"], target = \"0002\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "3f921946-2f6a-4396-99c8-bbf5d3b92b4c",
             input: "deadends = [\"0000\",\"0001\"], target = \"0009\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "6cdfef0e-979c-4d2c-bca8-14c280c92e4c",
             input: "deadends = [\"0000\",\"0001\"], target = \"0010\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "289400bf-4c88-49a4-a420-3cd4f3acc6f4",
             input: "deadends = [\"0000\",\"0001\"], target = \"0099\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "4e9d1770-44cd-4909-9372-0cecbe9baba7",
             input: "deadends = [\"0000\",\"0001\"], target = \"0100\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "47639099-0fbb-46c2-9f76-3732d413e95a",
             input: "deadends = [\"0000\",\"0001\"], target = \"0999\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "843a6f7c-c6b4-4e84-a2dc-cda2bab01733",
             input: "deadends = [\"0000\",\"0001\"], target = \"1000\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "2c3010a7-a516-42d3-9572-125555476830",
             input: "deadends = [\"0000\",\"0001\",\"0002\"], target = \"0003\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "0aeda4c2-59db-4545-8046-5d46e72f0911",
             input: "deadends = [\"0000\",\"0001\",\"0002\"], target = \"0009\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "8b8314f0-2bf6-405c-bd8f-78667ab80348",
             input: "deadends = [\"0000\",\"0001\",\"0002\"], target = \"0010\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "fbffb8ac-da30-47b4-b225-2e51978f749d",
             input: "deadends = [\"0000\",\"0001\",\"0002\"], target = \"0099\"",
             expected: "-1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "open-the-lock"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_deadends = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_deadends.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))"
                )
                return
            }
            let p_target = InputParser.parseString(params[1])
            guard p_target.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: target string too long (\(p_target.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= deadends.length <= 500"
                )
                return
            }
            guard p_deadends.count == 4 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: deadends[i].length == 4"
                )
                return
            }
            guard p_target.count == 4 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: target.length == 4"
                )
                return
            }

            let solution = Solution()
            let result = solution.openLock(p_deadends, p_target)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
