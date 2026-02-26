import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDota2Senate {
    private class Solution {
        func predictPartyVictory(_ senate: String) -> String {
            var rQueue: [Character] = [], dQueue: [Character] = []
            for (index, char) in senate.enumerated() {
                if char == "R" {
                    rQueue.append(char)
                } else {
                    dQueue.append(char)
                }
            }
            while !rQueue.isEmpty && !dQueue.isEmpty {
                if rQueue.count > dQueue.count {
                    return "Radiant"
                } else if rQueue.count < dQueue.count {
                    return "Dire"
                } else {
                    if rQueue[rQueue.startIndex] > dQueue[dQueue.startIndex] {
                        rQueue.append(rQueue.removeFirst())
                        dQueue.removeFirst()
                    } else {
                        dQueue.append(dQueue.removeFirst())
                        rQueue.removeFirst()
                    }
                }
            }
            return rQueue.isEmpty ? "Dire" : "Radiant"
        }
    }

    @Suite struct Dota2SenateTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e89be969-d0eb-421b-a5a5-088f780246e8",
             input: "senate = \"DR\"",
             expected: "Dire", orderMatters: true),
            TestCaseData(id: "b25f25a5-538a-4849-9fe5-d8b836fcb6cf",
             input: "senate = \"RDR\"",
             expected: "Radiant", orderMatters: true),
            TestCaseData(id: "e36460dd-22bc-4fc5-8a49-1f4a47222cda",
             input: "senate = \"DRD\"",
             expected: "Dire", orderMatters: true),
            TestCaseData(id: "dcba2d85-7be5-4ba4-a68a-4954f3e73234",
             input: "senate = \"RRD\"",
             expected: "Radiant", orderMatters: true),
            TestCaseData(id: "3e1b331d-9363-4887-83bd-2df39a8d3337",
             input: "senate = \"DDR\"",
             expected: "Dire", orderMatters: true),
            TestCaseData(id: "409ee6d2-e991-4a56-99bc-101ac72481ee",
             input: "senate = \"RDRDRD\"",
             expected: "Radiant", orderMatters: true),
            TestCaseData(id: "05c00818-1d4b-4d6d-869e-d40b9db1774d",
             input: "senate = \"DRDRDR\"",
             expected: "Dire", orderMatters: true),
            TestCaseData(id: "3e71c2fe-c16f-47d4-ba0d-76dc00bd4a04",
             input: "senate = \"RDRDRDRDR\"",
             expected: "Radiant", orderMatters: true),
            TestCaseData(id: "7883daa0-73f5-4240-988e-64f62f458ad7",
             input: "senate = \"DRDRDRDRD\"",
             expected: "Dire", orderMatters: true),
            TestCaseData(id: "cf69300e-66f9-4b12-92b5-44625a9151dd",
             input: "senate = \"RDRDRDRDRDR\"",
             expected: "Radiant", orderMatters: true),
            TestCaseData(id: "18eb5cf6-929c-40ae-9373-82d2a584150f",
             input: "senate = \"DRDRDRDRDRD\"",
             expected: "Dire", orderMatters: true),
            TestCaseData(id: "47a389cf-b552-4d62-ba83-43b0d0a9dadb",
             input: "senate = \"RDRDRDRDRDRDR\"",
             expected: "Radiant", orderMatters: true),
            TestCaseData(id: "3807f782-e855-40ca-8200-f7791a8748d9",
             input: "senate = \"DRDRDRDRDRDRD\"",
             expected: "Dire", orderMatters: true),
            TestCaseData(id: "8c65061d-67d3-4713-8dc8-73ad376fd31e",
             input: "senate = \"DRDR\"",
             expected: "Dire", orderMatters: true),
            TestCaseData(id: "953a22b6-c80c-48c7-b559-82ac5a148e8f",
             input: "senate = \"RDRDRDR\"",
             expected: "Radiant", orderMatters: true),
            TestCaseData(id: "0c4414fb-5598-451f-9ace-883757bbc40f",
             input: "senate = \"DRDRDRD\"",
             expected: "Dire", orderMatters: true),
            TestCaseData(id: "9d34fa64-ec91-4824-b8c5-a3112328b265",
             input: "senate = \"RDRDR\"",
             expected: "Radiant", orderMatters: true),
            TestCaseData(id: "945eab86-d705-425b-95c7-fe5640df5b1d",
             input: "senate = \"RRRR\"",
             expected: "Infinite Loop", orderMatters: true),
            TestCaseData(id: "87d969f7-c194-497c-937b-6413a75ddcef",
             input: "senate = \"DDDD\"",
             expected: "Infinite Loop", orderMatters: true),
            TestCaseData(id: "68eefbb7-d2dd-4d38-93cf-eed12b312d02",
             input: "senate = \"R\"",
             expected: "Infinite Loop", orderMatters: true),
            TestCaseData(id: "c8616cb3-7db1-4c89-b1a4-bf59b4944050",
             input: "senate = \"D\"",
             expected: "Infinite Loop", orderMatters: true),
            TestCaseData(id: "df80c4e2-555c-47ed-b874-ca37180c0336",
             input: "senate = \"RR\"",
             expected: "Infinite Loop", orderMatters: true),
            TestCaseData(id: "63c75169-afbd-4a07-b140-3892c8896440",
             input: "senate = \"DD\"",
             expected: "Infinite Loop", orderMatters: true),
            TestCaseData(id: "c9461ad4-0985-48db-986f-254415a91309",
             input: "senate = \"RRRRRR\"",
             expected: "Infinite Loop", orderMatters: true),
            TestCaseData(id: "71dd7ca9-2fed-458b-bd95-533850121dbc",
             input: "senate = \"DDDDDD\"",
             expected: "Infinite Loop", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "dota2-senate"
            let topic = "greedy"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            let p_senate = InputParser.parseString(params[0])
            guard p_senate.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: senate string too long (\(p_senate.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.predictPartyVictory(p_senate)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
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
