import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class TopVotedCandidate {
        let personTime: [(Int, Int)]
        let topVote: [Int]

        init(_ person: [Int], _ times: [Int]) {
            var votes: [Int: Int] = [:]
            var maxVote: Int = 0
            var leader: Int = 0
            var topVotes: [Int] = []

            personTime = zip(person, times).sorted { $0.1 < $1.1 }

            for (person, time) in personTime {
                votes[person, default: 0] += 1
                if votes[person]! > maxVote {
                    maxVote = votes[person]!
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

    @Test func test_0() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "d27fc963-34cc-43c1-a161-1dcf4cd04b68"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0],[0,1,1],[0,5,10]],[0],[5]]"
        let expectedOutput = "0"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "c04a1ff5-fb23-48d7-a998-ecfd21363e7e"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,1],[0,5,10]],[0],[10]]"
        let expectedOutput = "1"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "e6cdf946-22a1-4ae9-9f63-be70a09bcb7b"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\"],[[[0],[0,1,1],[0,5,10]],[0],[5],[10]]"
        let expectedOutput = "[0,1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "eef6bd96-a88e-4326-b209-5d275a15c2b6"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\",\"q\"],[[[0,1,1,1,1],[0,5,10,15,20]],[0],[5],[10],[15]]"
        let expectedOutput = "[0,0,1,1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "8632c7fd-1709-4571-9305-c011e614a7a0"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,0,0,0,0],[0,5,10,15,20]],[0]]"
        let expectedOutput = "0"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "c0063aa1-040e-41cc-b9ad-09d1d28b39a9"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[1,1,1,1,1],[0,5,10,15,20]],[20]]"
        let expectedOutput = "1"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "20b419e6-d448-472f-94cc-72fc34e50265"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[5]]"
        let expectedOutput = "0"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "027fe83c-9150-4af5-bf13-9c6983150a3e"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[10]]"
        let expectedOutput = "0"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "a2d65a46-6714-4925-8b91-a71f05c29df2"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[15]]"
        let expectedOutput = "0"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "6ca779b4-2d4a-459d-acf4-4aea98b49a33"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[20]]"
        let expectedOutput = "0"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "76d7e61c-45eb-40dc-a7f2-a5cf27b1ef5a"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[5],[10]]"
        let expectedOutput = "[0,0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "7dd9217d-1c8b-4374-a563-e7f27f4245df"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[10],[15]]"
        let expectedOutput = "[0,0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "aad436d2-21a7-4ab0-9823-f7bc0d959f30"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[15],[20]]"
        let expectedOutput = "[0,0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "e757d549-522a-4c4b-a720-5b9b1626e3ad"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[5],[10],[15]]"
        let expectedOutput = "[0,0,0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "8861fd5e-a785-430d-9f64-82e66709926f"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[5],[10],[20]]"
        let expectedOutput = "[0,0,0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "09d9d972-b2e4-49e1-a25d-98e21f4ac02b"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[10],[15],[20]]"
        let expectedOutput = "[0,0,0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "98002b6d-a659-4b78-b3c1-fb638160a85f"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\",\"q\",\"q\",\"q\"],[[[0,1,0,1,0],[0,5,10,15,20]],[5],[10],[15],[20]]"
        let expectedOutput = "[0,0,0,0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "1b8876b7-ca67-4078-a4e0-7c37e4cb3ad2"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0],[0]],[0]]"
        let expectedOutput = "[0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "d34b30a3-e0da-4aaf-b3da-6c87f3df2586"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[1],[0]],[0]]"
        let expectedOutput = "[1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "6aea55f4-49b8-42cb-9ae4-7df0a7f4259f"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,0],[0,0]],[0]]"
        let expectedOutput = "[0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "8aef81dc-f9be-40a8-a05c-9af3af110b66"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[1,1],[0,0]],[0]]"
        let expectedOutput = "1"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "3baa46aa-49b1-4f36-9a5e-50b8054bf4c9"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1],[0,0]],[0]]"
        let expectedOutput = "0"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "30caac78-42a4-40c4-9185-e5f8f11a2e39"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,0,0,0,0],[0,0,0,0,0]],[0]]"
        let expectedOutput = "0"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "fc12eb72-98c9-4d91-8131-8f039c5a2200"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[1,1,1,1,1],[0,0,0,0,0]],[0]]"
        let expectedOutput = "1"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "online-election"
        let topic = "binary-search"
        let testId = "82ff4ba1-b1c1-463e-bafd-62b214e20e14"
        let rawInput = "[\"TopVotedCandidate\",\"__init__\",\"q\"],[[[0,1,0,1,0],[0,0,0,0,0]],[0]]"
        let expectedOutput = "0"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 2 else { return }
        var obj = Solution.TopVotedCandidate(InputParser.parseIntArray(initArgs[0]), InputParser.parseIntArray(initArgs[1]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "q":
                let r = obj.q(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(InputParser.parseInt(a[0]))
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
