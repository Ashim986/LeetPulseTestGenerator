import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class Codec {
        func serialize(_ root: TreeNode?) -> String {
            var result: [String] = []
            func dfs(_ node: TreeNode?) {
                guard let node = node else {
                    result.append("#")
                    return
                }
                result.append(String(node.val))
                dfs(node.left)
                dfs(node.right)
            }
            dfs(root)
            return result.joined(separator: ",")
        }

        func deserialize(_ data: String) -> TreeNode? {
            let tokens = data.split(separator: ",").map(String.init)
            var index = 0

            func dfs() -> TreeNode? {
                if index >= tokens.count { return nil }
                let token = tokens[index]
                index += 1
                if token == "#" { return nil }
                let node = TreeNode(Int(token) ?? 0)
                node.left = dfs()
                node.right = dfs()
                return node
            }

            return dfs()
        }
    }
}

@Suite struct SerializeAndDeserializeBinaryTreeTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "11c4f703-6be3-4b1c-a126-9c0ebb8ad90a"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "null"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "7d3f1a01-f716-4acf-a340-e7297d9a5787"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "#"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "c28cc5af-c4a0-45e9-b788-b3e92d5581a9"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "#"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "b43cc370-4af2-40c7-a3e4-2a5281ae7566"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "#"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "de817642-a60f-420a-aa42-9244f44846f6"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "null"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "c54c626a-9294-4fbb-8f63-b7471ef48c63"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "null"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "51d524f4-5563-4bbe-a7e6-87e130c825c3"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "#"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "48534a2d-6503-4cdf-ad52-e5885e182adc"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "#"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "111b253e-5710-4e90-965f-3706c8c88032"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "null"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "84b6322c-1112-46d4-b476-f1322d0ab790"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "null"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "a6e71b21-47cf-4d71-9f62-108610f7a36f"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "[\"#\",\"#\",\"#\",\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "0b9c9e2e-8750-4cc6-af59-1038152b48bd"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "[\"#\",\"#\",\"#\",\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "50015fc8-afa3-47b2-ac81-1954ec4ecd8f"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "[\"#\",\"#\",\"#\",\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "d547d2b4-c414-4892-956a-a5901ab063d3"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "[\"#\",\"#\",\"#\",\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "62bbc7ad-8190-427c-861b-4bbbe253d4bd"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "[\"#\",\"#\",\"#\",\"#\",\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "97b4034a-aeb1-4fa1-a981-24ca022ff9a3"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "[\"#\",\"#\",\"#\",\"#\",\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "6d44589b-15a5-4cd7-a38d-91c75b98a890"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "[\"#\",\"#\",\"#\",\"#\",\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "bd31790c-1dc0-4fbd-96af-4ead5f307d31"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "[\"#\",\"#\",\"#\",\"#\",\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "1aa4ff2b-5b8d-4d06-9452-6c0384d04334"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "[\"#\",\"#\",\"#\",\"#\",\"#\",\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "1a5aca6d-9eba-41e9-a1e1-08d56f876bec"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "[\"#\",\"#\",\"#\",\"#\",\"#\",\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "0620104b-d532-4ab0-b5f0-4fb6a3f18efa"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "[\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\",null]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "d6fcfadb-320e-4d8f-be43-300565c66c67"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "[null,\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "5eaca22b-378e-43d5-95f9-8e4da55cfdc7"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "[\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "2f9f7e07-ee8e-47ea-a7d4-9e67bde95d36"
        let rawInput = "[\"Codec\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\"]"
        let expectedOutput = "[null,\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\"]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
        let slug = "serialize-and-deserialize-binary-tree"
        let topic = "misc"
        let testId = "25918f61-8f80-4696-bacf-daefadbeaae3"
        let rawInput = "[\"Codec\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\",\"serialize\",\"deserialize\"]"
        let expectedOutput = "[\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\",null,\"#\",null]"
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
            case "serialize":
                let r = obj.serialize(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("\(r)")
            case "dfs":
                obj.dfs(buildTree(InputParser.parseNullableIntArray(a[0])))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "dfs":
                let r = obj.dfs()
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
