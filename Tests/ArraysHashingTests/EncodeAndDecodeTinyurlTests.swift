import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class Codec {
        var map: [String: String] = [:]
        let tinyUrl: String = "http://tinyurl.com/"
        let base62: [String] = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        var count: Int = 0

        func encode(_ longUrl: String) -> String {
            let shortUrl: String = tinyUrl + String(count, radix: 62)
            map[shortUrl] = longUrl
            count += 1
            return shortUrl
        }

        func decode(_ shortUrl: String) -> String {
            return map[shortUrl] ?? ""
        }
    }
}

@Suite struct EncodeAndDecodeTinyurlTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "2add2ced-15d3-4515-8ea9-c9a2557f4a51"
        let rawInput = "['TinyURL', 'encode', 'decode']"
        let expectedOutput = "[\"http://tinyurl.com/aaaaaa\",\"longUrl_1\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "2dee331b-a62d-46e7-a284-14478c6315d6"
        let rawInput = "['TinyURL', 'encode', 'encode']"
        let expectedOutput = "[\"http://tinyurl.com/aaaaaa\",\"http://tinyurl.com/bbbbbb\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "65bdafce-620e-43ba-a793-9e244a8dd56e"
        let rawInput = "['TinyURL', 'decode', 'decode']"
        let expectedOutput = "[\"\",\"\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "f874aff0-7006-433d-ac73-da16a1534217"
        let rawInput = "['TinyURL', 'encode', 'encode', 'decode']"
        let expectedOutput = "[\"http://tinyurl.com/aaaaaa\",\"http://tinyurl.com/bbbbbb\",\"longUrl_2\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "da46f183-17a1-47af-ba90-c3ea1934828d"
        let rawInput = "['TinyURL', 'decode', 'encode', 'decode']"
        let expectedOutput = "[\"\",\"http://tinyurl.com/aaaaaa\",\"longUrl_1\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "e68e7479-22b0-4038-8c2e-acd1a337ec64"
        let rawInput = "['TinyURL', 'encode', 'decode', 'encode']"
        let expectedOutput = "[\"http://tinyurl.com/aaaaaa\",\"longUrl_1\",\"http://tinyurl.com/bbbbbb\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "8bb39eec-096c-4e01-ae96-26e4050f33da"
        let rawInput = "['TinyURL', 'encode', 'encode', 'encode']"
        let expectedOutput = "[\"http://tinyurl.com/aaaaaa\",\"http://tinyurl.com/bbbbbb\",\"http://tinyurl.com/cccccc\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "05358880-d9a2-4992-9b57-3bb2a91c720f"
        let rawInput = "['TinyURL', 'decode', 'decode', 'decode']"
        let expectedOutput = "[\"\",\"\",\"\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "34b2bb94-2331-452a-bca4-e10ad297bf7e"
        let rawInput = "['TinyURL', 'encode', 'decode', 'encode', 'decode']"
        let expectedOutput = "[\"http://tinyurl.com/aaaaaa\",\"longUrl_1\",\"http://tinyurl.com/bbbbbb\",\"longUrl_2\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "1f5a2183-c7a1-4974-9ebe-ce8b3aaaafc1"
        let rawInput = "['TinyURL', 'decode', 'encode', 'decode', 'encode']"
        let expectedOutput = "[\"\",\"http://tinyurl.com/aaaaaa\",\"longUrl_1\",\"http://tinyurl.com/bbbbbb\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "4b7fb4b0-fefc-4447-8872-1ada466d9e7f"
        let rawInput = "['TinyURL', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode']"
        let expectedOutput = "[\"http://tinyurl.com/AAAAAA\",\"https://leetcode.com/problems/design-tinyurl\",\"http://tinyurl.com/BBBBBB\",\"https://www.google.com\",\"http://tinyurl.com/CCCCCC\",\"https://www.apple.com\",\"http://tinyurl.com/DDDDDD\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "cb55a824-94e4-43a9-bbb7-b2de96c1ec2a"
        let rawInput = "['TinyURL', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode']"
        let expectedOutput = "[\"\",\"http://tinyurl.com/AAAAAA\",\"https://www.example.com/path1\",\"http://tinyurl.com/BBBBBB\",\"https://www.example.com/path2\",\"http://tinyurl.com/CCCCCC\",\"https://www.example.com/path3\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "71756644-2624-499a-83df-ff78e42e55e7"
        let rawInput = "['TinyURL', 'encode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode']"
        let expectedOutput = "[\"http://tinyurl.com/AAAAAA\",\"http://tinyurl.com/BBBBBB\",\"url1\",\"http://tinyurl.com/CCCCCC\",\"url2\",\"http://tinyurl.com/DDDDDD\",\"url3\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "f3a2c697-7c47-412b-9335-079da29b2501"
        let rawInput = "['TinyURL', 'decode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode']"
        let expectedOutput = "[\"\",\"\",\"http://tinyurl.com/AAAAAA\",\"urlA\",\"http://tinyurl.com/BBBBBB\",\"urlB\",\"http://tinyurl.com/CCCCCC\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "7d97d3a0-30ff-47d5-9f33-d941069ce3a6"
        let rawInput = "['TinyURL', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode']"
        let expectedOutput = "[\"http://tinyurl.com/AAAAAA\",\"longurl1\",\"http://tinyurl.com/BBBBBB\",\"longurl2\",\"http://tinyurl.com/CCCCCC\",\"longurl3\",\"http://tinyurl.com/DDDDDD\",\"longurl4\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "27bbc7cf-d09f-4082-b9c4-93bd616968b7"
        let rawInput = "['TinyURL', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode']"
        let expectedOutput = "[\"\",\"http://tinyurl.com/AAAAAA\",\"url_a\",\"http://tinyurl.com/BBBBBB\",\"url_b\",\"http://tinyurl.com/CCCCCC\",\"url_c\",\"http://tinyurl.com/DDDDDD\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "7a32290e-6fd1-49cc-80e4-4fa7914d4285"
        let rawInput = "['TinyURL', 'encode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode']"
        let expectedOutput = "[\"http://tinyurl.com/AAAAAA\",\"http://tinyurl.com/BBBBBB\",\"first\",\"http://tinyurl.com/CCCCCC\",\"second\",\"http://tinyurl.com/DDDDDD\",\"third\",\"http://tinyurl.com/EEEEEE\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "844531ef-89b2-48a6-af64-231f1e5332c7"
        let rawInput = "['TinyURL', 'decode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode']"
        let expectedOutput = "[\"\",\"\",\"http://tinyurl.com/AAAAAA\",\"url_one\",\"http://tinyurl.com/BBBBBB\",\"url_two\",\"http://tinyurl.com/CCCCCC\",\"url_three\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "b52cc522-de8c-4039-b527-54b922c8d715"
        let rawInput = "['TinyURL', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode']"
        let expectedOutput = "[\"http://tinyurl.com/AAAAAA\",\"L1\",\"http://tinyurl.com/BBBBBB\",\"L2\",\"http://tinyurl.com/CCCCCC\",\"L3\",\"http://tinyurl.com/DDDDDD\",\"L4\",\"http://tinyurl.com/EEEEEE\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "2fdd39fa-4538-474d-bc65-5c5fef9aa584"
        let rawInput = "['TinyURL', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode']"
        let expectedOutput = "[\"\",\"http://tinyurl.com/AAAAAA\",\"U1\",\"http://tinyurl.com/BBBBBB\",\"U2\",\"http://tinyurl.com/CCCCCC\",\"U3\",\"http://tinyurl.com/DDDDDD\",\"U4\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "3763d4c3-e085-421b-8afb-7b8213a91b02"
        let rawInput = "['TinyURL', 'encode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode']"
        let expectedOutput = "[\"http://tinyurl.com/AAAAAA\",\"http://tinyurl.com/BBBBBB\",\"longUrl1\",\"http://tinyurl.com/CCCCCC\",\"longUrl2\",\"http://tinyurl.com/DDDDDD\",\"longUrl3\",\"http://tinyurl.com/EEEEEE\",\"longUrl4\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "e17716a1-41db-440f-9b1a-5c88fdae3917"
        let rawInput = "['TinyURL', 'decode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode', 'decode', 'encode']"
        let expectedOutput = "[\"\",\"\",\"http://tinyurl.com/111111\",\"longUrlA\",\"http://tinyurl.com/222222\",\"\",\"http://tinyurl.com/333333\",\"longUrlB\",\"http://tinyurl.com/444444\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "da5a8685-66fc-4ead-8f7e-c9e3e31e1f9b"
        let rawInput = "['TinyURL', 'encode', 'encode', 'decode', 'decode']"
        let expectedOutput = "[\"http://tinyurl.com/abcdef\",\"http://tinyurl.com/ghijkl\",\"longUrlX\",\"longUrlY\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "5f0759d2-8e6e-495d-9e62-3f9eb140b0ad"
        let rawInput = "['TinyURL', 'encode', 'encode', 'encode', 'decode', 'decode', 'decode']"
        let expectedOutput = "[\"http://tinyurl.com/uvwxyz\",\"http://tinyurl.com/012345\",\"http://tinyurl.com/6789ab\",\"longUrlP\",\"longUrlQ\",\"longUrlR\"]"
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
        let slug = "encode-and-decode-tinyurl"
        let topic = "arrays-hashing"
        let testId = "248b428c-65db-4f3b-9967-56c38294fe5c"
        let rawInput = "url = \"https://leetcode.com/problems/design-tinyurl\""
        let expectedOutput = "\"https://leetcode.com/problems/design-tinyurl\""
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
        let obj = Codec()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "encode":
                let r = obj.encode(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "decode":
                let r = obj.decode(InputParser.parseString(a[0]))
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
