import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCOnlineElection {
    private class Solution {
        class TopVotedCandidate {
            let personTime: [(Int, Int)]
            let topVote: [Int]

            init(_ person: [Int], _ times: [Int]) {
                var votes: [Int: Int] = [:]
                var maxVote = 0
                var leader = 0
                var topVotes: [Int] = []

                personTime = zip(person, times).sorted { $0.1 < $1.1 }

                for (person, time) in personTime {
                    votes[person, default: 0] += 1
                    if votes[person].unsafelyUnwrapped > maxVote {
                        maxVote = votes[person].unsafelyUnwrapped
                        leader = person
                    }
                    topVotes.append(leader)
                }

                topVote = topVotes
            }

            func q(_ t: Int) -> Int {
                let idx = binarySearch(t)
                return topVote[idx]
            }

            func binarySearch(_ t: Int) -> Int {
                var left = 0
                var right = topVote.count - 1

                while left < right {
                    let mid = (left + right) / 2
                    if personTime[mid].1 <= t {
                        left = mid + 1
                    } else {
                        right = mid
                    }
                }

                return left - 1
            }
        }
    }

    @Suite struct OnlineElectionTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d27fc963-34cc-43c1-a161-1dcf4cd04b68",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0],[0,1,1],[0,5,10]],[0],[5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c04a1ff5-fb23-48d7-a998-ecfd21363e7e",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,1],[0,5,10]],[0],[10]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e6cdf946-22a1-4ae9-9f63-be70a09bcb7b",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\"],[[[0],[0,1,1],[0,5,10]],[0],[5],[10]]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "eef6bd96-a88e-4326-b209-5d275a15c2b6",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\",\"q\"],[[[0,1,1,1,1],[0,5,10,15,20]],[0],[5],[10],[15]]",
             expected: "[0,0,1,1]", orderMatters: true),
            TestCaseData(id: "8632c7fd-1709-4571-9305-c011e614a7a0",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,0,0,0,0],[0,5,10,15,20]],[0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c0063aa1-040e-41cc-b9ad-09d1d28b39a9",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[1,1,1,1,1],[0,5,10,15,20]],[20]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "20b419e6-d448-472f-94cc-72fc34e50265",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "027fe83c-9150-4af5-bf13-9c6983150a3e",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a2d65a46-6714-4925-8b91-a71f05c29df2",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[15]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6ca779b4-2d4a-459d-acf4-4aea98b49a33",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[20]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "76d7e61c-45eb-40dc-a7f2-a5cf27b1ef5a",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[5],[10]]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "7dd9217d-1c8b-4374-a563-e7f27f4245df",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[10],[15]]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "aad436d2-21a7-4ab0-9823-f7bc0d959f30",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[15],[20]]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "e757d549-522a-4c4b-a720-5b9b1626e3ad",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[5],[10],[15]]",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "8861fd5e-a785-430d-9f64-82e66709926f",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[5],[10],[20]]",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "09d9d972-b2e4-49e1-a25d-98e21f4ac02b",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[10],[15],[20]]",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "98002b6d-a659-4b78-b3c1-fb638160a85f",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[5],[10],[15],[20]]",
             expected: "[0,0,0,0]", orderMatters: true),
            TestCaseData(id: "1b8876b7-ca67-4078-a4e0-7c37e4cb3ad2",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0],[0]],[0]]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "d34b30a3-e0da-4aaf-b3da-6c87f3df2586",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[1],[0]],[0]]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "6aea55f4-49b8-42cb-9ae4-7df0a7f4259f",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,0],[0,0]],[0]]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "8aef81dc-f9be-40a8-a05c-9af3af110b66",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[1,1],[0,0]],[0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3baa46aa-49b1-4f36-9a5e-50b8054bf4c9",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1],[0,0]],[0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "30caac78-42a4-40c4-9185-e5f8f11a2e39",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,0,0,0,0],[0,0,0,0,0]],[0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fc12eb72-98c9-4d91-8131-8f039c5a2200",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[1,1,1,1,1],[0,0,0,0,0]],[0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "82ff4ba1-b1c1-463e-bafd-62b214e20e14",
             input: "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,0,1,0],[0,0,0,0,0]],[0]]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "online-election"
            let topic = "binary-search"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            guard initArgs.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Init args count too small"
                )
                return
            }
            guard let initP_0 = InputParser.parseIntArray(initArgs[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse init param 0 as [Int]"
                )
                return
            }
            guard let initP_1 = InputParser.parseIntArray(initArgs[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse init param 1 as [Int]"
                )
                return
            }
            var obj = Solution.TopVotedCandidate(initP_0, initP_1)

            var results: [String] = []
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                switch methodName {
                case "q":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    let rv = obj.q(mArg_0)
                    results.append("\(rv)")
                case "binarySearch":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    let rv = obj.binarySearch(mArg_0)
                    results.append("\(rv)")
                default:
                    results.append("null")
                }
            }

            let computedOutput = "[" + results.joined(separator: ",") + "]"
            // Class-design comparison: normalize null representations and whitespace
            func normalizeClassOutput(_ s: String) -> String {
                var result = s.replacingOccurrences(of: " ", with: "")
                result = result.replacingOccurrences(of: "nil", with: "null")
                result = result.replacingOccurrences(of: "None", with: "null")
                result = result.replacingOccurrences(of: "NULL", with: "null")
                return result
            }
            let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
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
