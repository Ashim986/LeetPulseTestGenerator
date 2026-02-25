import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class Codec {
        func serialize(_ root: TreeNode?) -> String {
            var res: [String] = []
            dfs(node: root, res: &res)
            return res.joined(separator: ",")
        }

        func dfs(node: TreeNode?, res: inout [String]) {
            if let node = node {
                res.append(String(node.val))
                dfs(node: node.left, res: &res)
                dfs(node: node.right, res: &res)
            } else {
                res.append("null")
            }
        }

        func deserialize(_ data: String) -> TreeNode? {
            let nodes = data.components(separatedBy: ",").map { $0 == "null" ? nil : Int($0) }
            var index = 0
            return constructTree(nodes: nodes, &index)
        }

        func constructTree(nodes: [Int?], _ index: inout Int) -> TreeNode? {
            if index >= nodes.count || nodes[index] == nil {
                index += 1
                return nil
            }

            let node = TreeNode(val: nodes[index]!)
            index += 1
            node.left = constructTree(nodes: nodes, &index)
            node.right = constructTree(nodes: nodes, &index)
            return node
        }
    }
}

@Suite struct SerializeAndDeserializeBstTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "4cc30f91-d037-4db3-8b52-a948855c1a03"
        let rawInput = "root = [1,2,3,4,5,6,7]"
        let expectedOutput = "[1,2,3,4,5,6,7]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "2786fa2b-c7a4-4b9d-954b-308d83b03a8d"
        let rawInput = "root = [5,3,6,2,4,7,8]"
        let expectedOutput = "[5,3,6,2,4,7,8]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "feb0c7c0-b445-4436-b2a5-7f3eda05d97b"
        let rawInput = "root = [10,5,15,3,7,13,18]"
        let expectedOutput = "[10,5,15,3,7,13,18]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "0dce9556-057c-492d-8225-b7475e81840c"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "8fb2fc4a-daad-4b98-bfab-76a9f83f5953"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "2c0a4d70-4deb-4da3-ab6a-3e9b2ff549ca"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "e5c8c39a-36a1-491e-81bd-fb334c4c797d"
        let rawInput = "root = [1,null,2,null,null,3]"
        let expectedOutput = "[1,2]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "19a06bea-1722-43cd-b862-fa0728724d63"
        let rawInput = "root = [5,3,6,2,4,null,null]"
        let expectedOutput = "[5,3,2,4,6]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "ca6e00b4-1f06-49a8-8271-87e85563c3f0"
        let rawInput = "root = [10,5,15,3,7,null,18]"
        let expectedOutput = "[10,5,3,7,15,18]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "a401786a-72e6-45a0-92bf-1649e73d7f32"
        let rawInput = "root = [10]"
        let expectedOutput = "[10]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "32902aae-7b09-4d64-9e7b-2e9effb4a921"
        let rawInput = "root = [1,null,2,null,null,3,null,null,4]"
        let expectedOutput = "[1,2]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "1ddac19f-8049-4203-ad66-f7297561515f"
        let rawInput = "root = [1,2,3,4,null,null,5]"
        let expectedOutput = "[1,2,4,3,5]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "ee2e8a1f-a975-4095-ba20-1f097e6b30c6"
        let rawInput = "root = [1]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "7305055e-a4fc-4413-a36a-d429416eb1ce"
        let rawInput = "root = [5,3,6,2,4,7,8,1,null,null]"
        let expectedOutput = "[5,3,6,2,4,7,8,1]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "65fdad5d-9365-4027-a9e2-347e5349f32d"
        let rawInput = "root = [10,5,15,3,7,null,18,2,4,6,8]"
        let expectedOutput = "[10,5,15,3,7,18,2,4,6,8]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "a317ae65-76ac-42ff-9ed6-52cb0bc290b0"
        let rawInput = "root = [10,-5,15,3,7,null,18]"
        let expectedOutput = "[10,-5,15,3,7,18]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "bb44bf11-f728-4fbe-9681-e7cb0a8d7add"
        let rawInput = "root = [5,3,6,2,4,7,8,1,null,null,9]"
        let expectedOutput = "[5,3,6,2,4,7,8,1,9]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "e7e14ac7-5fcd-47b8-bae7-412317f8224c"
        let rawInput = "root = [1,null,2,null,null,3,null,null,4,null,null,5]"
        let expectedOutput = "[1,2,3,4,5]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "0406d020-34e4-4c09-b47d-644d69a1b706"
        let rawInput = "root = [10,5,15,3,7,null,18,2,4,6,8,9]"
        let expectedOutput = "[10,5,15,3,7,18,2,4,6,8,9]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "bb9c987f-93c7-4ca1-87a8-76a16aed5020"
        let rawInput = "root = [10,-5,15,3,7,null,18,2,4,6,8,9,1]"
        let expectedOutput = "[10,-5,15,3,7,18,2,4,6,8,9,1]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "35062cdd-8d7f-4cc6-a637-4cf765aaae26"
        let rawInput = "root = [5,3,6,2,4,7,8,1,null,null,9,10]"
        let expectedOutput = "[5,3,6,2,4,7,8,1,9,10]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "1a966754-e5eb-4eb0-bc38-90e568076055"
        let rawInput = "root = [1,null,2,null,null,3,null,null,4,null,null,5,null,null,6,null,null,7,null,null,8]"
        let expectedOutput = "[1,2]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "86fa2746-d690-4dfc-a07f-4b4cb1781290"
        let rawInput = "root = [10,5,15,3,7,null,18,2,4,6,8,9,1,11,12,13,14,15]"
        let expectedOutput = "[10,5,15,3,7,18,2,4,6,8,9,1,11,12,13,14,15]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "1dd227c5-66f9-4542-8c8e-95abf87fe43b"
        let rawInput = "root = [10,-5,15,3,7,null,18,2,4,6,8,9,1,11,12,13,14,15,16]"
        let expectedOutput = "[10,-5,15,3,7,18,2,4,6,8,9,1,11,12,13,14,15,16]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
        let slug = "serialize-and-deserialize-bst"
        let topic = "trees"
        let testId = "23f3fd03-00ec-419d-a7bf-0187595ed718"
        let rawInput = "root = [5,3,6,2,4,7,8,1,null,null,9,10,13,14,15]"
        let expectedOutput = "[5,3,6,2,4,7,8,1,9,10,13,14,15]"
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
                obj.dfs(node: buildTree(InputParser.parseNullableIntArray(a[0])), res: InputParser.parseStringArray(a[1]))
                results.append("null")
            case "deserialize":
                let r = obj.deserialize(InputParser.parseString(a[0]))
                results.append("\(r)")
            case "constructTree":
                let r = obj.constructTree(nodes: InputParser.parseNullableIntArray(a[0]), a[1])
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
