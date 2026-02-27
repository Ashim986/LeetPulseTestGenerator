import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumGeneticMutation {
    private class Solution {
        func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
            var bankSet = Set(bank)
            if !bankSet.contains(end) { return -1 }
            var queue = [(start, 0)]
            var visited = Set([start])
            let genes: [Character] = ["A", "C", "G", "T"]

            while !queue.isEmpty {
                let (gene, steps) = queue.removeFirst()
                if gene == end { return steps }
                var chars = Array(gene)
                for i in 0..<chars.count {
                    let original = chars[i]
                    for g in genes {
                        chars[i] = g
                        let mutation = String(chars)
                        if bankSet.contains(mutation) && !visited.contains(mutation) {
                            visited.insert(mutation)
                            queue.append((mutation, steps + 1))
                        }
                    }
                    chars[i] = original
                }
            }
            return -1
        }
    }

    @Suite struct MinimumGeneticMutationTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1437b17c-732c-48bc-bc13-97f9a390ddc1",
             input: "start = \"\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\"]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "e8a0b37f-7bd3-4fd6-940f-7fa130a60cae",
             input: "start = \"AACCGGTT\", end = \"\", bank = [\"AACCGGTA\",\"AACCGCTA\"]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "28b85d5b-6ca7-4ef2-8876-85057d9cf00a",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = []",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "ceb6ddfd-5770-4943-94f6-eb63dcff87fd",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGCTA\",\"AACCGCTA\"]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "5b7d9414-69b9-4f7c-9346-81f0c971b013",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e9464f60-810a-4501-a607-05a8ead84a41",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e72a2914-336b-445a-8b0a-8b04e06aa027",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGCTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "922f35f5-6794-4d38-b705-efa588a54a8d",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\",\"AACCGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "fe0c27f9-fc16-43a8-95f6-b21d55223306",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGCTA\",\"AAACGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "02d7b878-0a93-4fbc-a47a-445ca2b58b56",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "10fa66bc-e4fc-47d1-9fab-48d50f578b19",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9cb80466-de86-4916-8ca2-9747fcdf3e04",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGCTA\",\"AACCGCTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "128f1315-971c-48fe-995a-d538accaefec",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5faaec01-f0e5-4f30-831e-1b014845f0c6",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGCTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\"]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "a9ccf60d-609e-406b-b563-21a1b99f374d",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGCTA\",\"AACCGCTA\",\"AACCGCTA\",\"AACCGCTA\"]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "9290788a-adf2-456f-9e04-30f94285cc80",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c38ceec3-8ffc-4229-8bdd-468685becf53",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGG"
                + "TA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "593fea21-3cb1-4a87-b8ae-aff44ce74b21",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGC"
                + "TA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1e7a878f-2a8c-4d9b-af63-9935c4880c86",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGG"
                + "TA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a46db1a3-df44-4c4d-9475-e54a8d8ee37f",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGG"
                + "TA\",\"AAACGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d9a424e7-505f-4961-816d-b22351869d7a",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGG"
                + "TA\",\"AAACGGTA\",\"AAACGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "50e07521-a3b6-42b2-a5e7-a1058be7ca0c",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGG"
                + "TA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9bdaab4b-ea1e-48b7-8768-aeb8e52d749d",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGG"
                + "TA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e5780b87-db1b-4275-a7d5-a2cf52e81afa",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGG"
                + "TA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e0fe7429-81f2-4a1a-a76d-0f07dff9e620",
             input: "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGG"
                + "TA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-genetic-mutation"
            let topic = "graphs"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            let p_start = InputParser.parseString(params[0])
            guard p_start.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: start string too long (\(p_start.count))"
                )
                return
            }
            let p_end = InputParser.parseString(params[1])
            guard p_end.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: end string too long (\(p_end.count))"
                )
                return
            }
            guard let p_bank = InputParser.parseStringArray(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as [String]"
                )
                return
            }
            guard p_bank.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: bank array too large (\(p_bank.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_bank.count >= 0 && p_bank.count <= 10 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= bank.length <= 10"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.minMutation(p_start, p_end, p_bank)
            }
            guard !didCrash, let result = resultHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
