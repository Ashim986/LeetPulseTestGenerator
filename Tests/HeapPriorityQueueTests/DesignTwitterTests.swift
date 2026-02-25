import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class Twitter {
        private var tweets: [Int: [(Int, Int)]] = [:]
        private var follows: [Int: Set<Int>] = [:]
        private var timestamp = 0

        init() {}

        func postTweet(_ userId: Int, _ tweetId: Int) {
            tweets[userId, default: []].append((timestamp, tweetId))
            timestamp += 1
        }

        func getNewsFeed(_ userId: Int) -> [Int] {
            // Collect users to check (self + followees)
            var users = follows[userId, default: []]
            users.insert(userId)

            // Build heap: (negTime, tweetId, userId, index)
            // Using negative time for max-heap behavior with min-heap
            var heap: [(Int, Int, Int, Int)] = []

            for uid in users {
                if let userTweets = tweets[uid], !userTweets.isEmpty {
                    let idx = userTweets.count - 1
                    let (time, tid) = userTweets[idx]
                    heap.append((-time, tid, uid, idx))
                }
            }

            // Heapify
            heap.sort { $0.0 < $1.0 }

            var result: [Int] = []
            while !heap.isEmpty && result.count < 10 {
                let (_, tweetId, uid, idx) = heap.removeFirst()
                result.append(tweetId)

                if idx > 0, let userTweets = tweets[uid] {
                    let newIdx = idx - 1
                    let (time, tid) = userTweets[newIdx]
                    heap.append((-time, tid, uid, newIdx))
                    heap.sort { $0.0 < $1.0 }
                }
            }

            return result
        }

        func follow(_ followerId: Int, _ followeeId: Int) {
            if followerId != followeeId {
                follows[followerId, default: []].insert(followeeId)
            }
        }

        func unfollow(_ followerId: Int, _ followeeId: Int) {
            follows[followerId, default: []].remove(followeeId)
        }
    }
}

@Suite struct DesignTwitterTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "218316cc-7444-45f0-9875-a7e047442e58"
        let rawInput = "['Twitter', 'postTweet', 'getNewsFeed', 'follow', 'postTweet', 'getNewsFeed', 'unfollow', 'getNewsFeed']"
        let expectedOutput = "[null,[5],null,null,[6,5],null,[5]]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "0a810dec-c6a9-4ba3-8b25-0eb6a5330ee0"
        let rawInput = "['Twitter', 'postTweet', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[null,null,null,[2,1]]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "ea3ecf4e-5338-4372-bc26-5b1d55f7325d"
        let rawInput = "['Twitter', 'follow', 'follow', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[null,null,null,null,[10]]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "02199f92-c5f4-461f-b768-01558db6b44c"
        let rawInput = "['Twitter', 'postTweet', 'unfollow', 'getNewsFeed']"
        let expectedOutput = "[null,null,null,[5]]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "05b190b3-0390-43b3-b032-4c920dfe4834"
        let rawInput = "['Twitter', 'follow', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[null,null,null,[5]]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "3c8a1252-1920-42e9-a291-0f22ebc3128c"
        let rawInput = "['Twitter', 'postTweet', 'postTweet', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[null,null,null,null,[3,2,1]]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "1f18629b-b589-41f0-be58-7efe74d95055"
        let rawInput = "['Twitter', 'follow', 'follow', 'follow', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[null,null,null,null,null,[10]]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "fa18682e-e077-4c5d-813c-c3172dae7f25"
        let rawInput = "['Twitter', 'postTweet', 'postTweet', 'unfollow', 'getNewsFeed']"
        let expectedOutput = "[null,null,null,null,[1]]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "ed4a591c-5c00-4a18-88a0-8b33a56e2d33"
        let rawInput = "['Twitter', 'follow', 'postTweet', 'follow', 'getNewsFeed']"
        let expectedOutput = "[null,null,null,null,[10]]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "b022036e-979e-4699-afad-7bf0348b189c"
        let rawInput = "['Twitter', 'postTweet', 'postTweet', 'postTweet', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[null,null,null,null,null,[4,3,2,1]]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "54f71c67-10c3-4e60-b72c-7d31608b4ad4"
        let rawInput = "['Twitter', 'follow', 'follow', 'follow', 'follow', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[101]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "f8fe95c4-496a-489d-a60f-9fb6b55c3c44"
        let rawInput = "['Twitter', 'postTweet', 'unfollow', 'unfollow', 'getNewsFeed']"
        let expectedOutput = "[5]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "39307c84-f5d6-4663-8e0f-cbb50a18d325"
        let rawInput = "['Twitter', 'follow', 'postTweet', 'unfollow', 'getNewsFeed']"
        let expectedOutput = "[]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "0f46d13d-97fb-4f0a-98be-92a2f3de570b"
        let rawInput = "['Twitter', 'postTweet', 'postTweet', 'postTweet', 'postTweet', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[5,4,3,2,1]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "ebd67385-31c7-4058-84db-1922ac3c36f2"
        let rawInput = "['Twitter', 'follow', 'follow', 'follow', 'follow', 'follow', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[101]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "08b45b43-248f-428f-90c3-8d673ecdc97d"
        let rawInput = "['Twitter', 'postTweet', 'unfollow', 'unfollow', 'unfollow', 'getNewsFeed']"
        let expectedOutput = "[5]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "ad18b940-e806-4a16-8d05-6dd7cb926998"
        let rawInput = "['Twitter', 'follow', 'postTweet', 'unfollow', 'unfollow', 'getNewsFeed']"
        let expectedOutput = "[]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "bcbc199f-2cf3-42ba-b62b-584cb2d5c5ee"
        let rawInput = "['Twitter', 'postTweet', 'postTweet', 'postTweet', 'postTweet', 'postTweet', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[6,5,4,3,2,1]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "695d6bc3-b961-4e74-8aad-08182c5c9a41"
        let rawInput = "['Twitter', 'follow', 'follow', 'follow', 'follow', 'follow', 'follow', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[101]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "13331bfb-7a0a-42a2-9a47-85e6262a43d3"
        let rawInput = "['Twitter', 'postTweet', 'unfollow', 'unfollow', 'unfollow', 'unfollow', 'getNewsFeed']"
        let expectedOutput = "[5]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "c0e4abb3-629a-4cdc-827d-90c249702743"
        let rawInput = "['Twitter', 'follow', 'postTweet', 'unfollow', 'unfollow', 'unfollow', 'getNewsFeed']"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "457f24b1-331d-47c8-9ae1-4bfbbe55940c"
        let rawInput = "['Twitter', 'postTweet', 'postTweet', 'postTweet', 'postTweet', 'postTweet', 'postTweet', 'postTweet', 'getNewsFeed']"
        let expectedOutput = "[7,6,5,4,3,2,1]"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "b16fb0fd-9a25-48b5-ad89-40ff3f3ab496"
        let rawInput = "['Twitter', 'follow', 'follow', 'follow', 'follow', 'follow', 'follow', 'follow', 'postTweet', 'getNewsFeed']"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "d06d0dbc-1fab-4a55-95c3-f4cdbd5d8f7f"
        let rawInput = "['Twitter', 'postTweet', 'unfollow', 'unfollow', 'unfollow', 'unfollow', 'unfollow', 'getNewsFeed']"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
        let slug = "design-twitter"
        let topic = "heap-priority-queue"
        let testId = "ffee9fb4-f563-4287-97c4-2cfbe55cad72"
        let rawInput = "['Twitter', 'follow', 'postTweet', 'unfollow', 'unfollow', 'unfollow', 'unfollow', 'getNewsFeed']"
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
        let obj = Twitter()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "postTweet":
                obj.postTweet(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "getNewsFeed":
                let r = obj.getNewsFeed(InputParser.parseInt(a[0]))
                results.append(OutputSerializer.serializeIntArray(r))
            case "follow":
                obj.follow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "unfollow":
                obj.unfollow(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
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
