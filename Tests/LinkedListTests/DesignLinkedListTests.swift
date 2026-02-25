import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class MyLinkedList {
        var head: ListNode?
        var tail: ListNode?
        var size: Int

        init() {
            head = nil
            tail = nil
            size = 0
        }

        func addAtHead(_ val: Int) {
            let newNode = ListNode(val: val)
            if head == nil {
                head = newNode
                tail = newNode
            } else {
                newNode.next = head
                head = newNode
            }
            size += 1
        }

        func addAtTail(_ val: Int) {
            let newNode = ListNode(val: val)
            if tail == nil {
                head = newNode
                tail = newNode
            } else {
                tail?.next = newNode
                tail = newNode
            }
            size += 1
        }

        func addAtIndex(_ index: Int, _ val: Int) {
            if index == 0 {
                addAtHead(val)
                return
            }
            if index == size {
                addAtTail(val)
                return
            }
            if index > size {
                return
            }
            let newNode = ListNode(val: val)
            var prev: ListNode? = head
            for _ in 0..<index-1 {
                prev = prev?.next
            }
            newNode.next = prev?.next
            prev?.next = newNode
            size += 1
        }

        func get(_ index: Int) -> Int {
            if index >= size {
                return -1
            }
            var cur: ListNode? = head
            for _ in 0..<index {
                cur = cur?.next
            }
            return cur?.val ?? -1
        }

        func deleteAtIndex(_ index: Int) {
            if index >= size {
                return
            }
            if index == 0 {
                head = head?.next
                if head == nil {
                    tail = nil
                }
            } else {
                var prev: ListNode? = head
                for _ in 0..<index-1 {
                    prev = prev?.next
                }
                if prev?.next === tail {
                    tail = prev
                }
                prev?.next = prev?.next?.next
            }
            size -= 1
        }
    }
}

@Suite struct DesignLinkedListTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "59846031-07f6-4ed9-a120-475c55f4d598"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtTail(5), get(0)"
        let expectedOutput = "4"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "f6762a80-b94c-44b2-a177-ca100aff9151"
        let rawInput = "head = [], addAtHead(1), addAtHead(2), get(0)"
        let expectedOutput = "2"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "925d1db0-7b5c-42ce-b66c-5e2a30396bda"
        let rawInput = "head = [1], addAtHead(2), addAtHead(3), get(0)"
        let expectedOutput = "3"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "d02ede97-53d5-47f6-879c-96d56d8e523f"
        let rawInput = "head = [1,2,3,4,5], addAtHead(6), addAtHead(7), get(0)"
        let expectedOutput = "7"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "519bd78c-3cb5-474f-97fc-a4c570c0c68e"
        let rawInput = "head = [1,2,3], addAtHead(-1), addAtHead(-2), get(0)"
        let expectedOutput = "-2"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "4c1febfe-a3b4-46d9-aac2-44a5b8009790"
        let rawInput = "head = [1,1,1], addAtHead(1), addAtHead(1), get(0)"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "636315ac-27f8-467d-9671-57d8a5359d20"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10], addAtHead(11), get(0)"
        let expectedOutput = "11"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "98e48b14-85c1-484c-be5a-fc069c41f56d"
        let rawInput = "head = [1], addAtHead(1), addAtHead(1), get(0)"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "860511fa-e29c-4383-89e9-9bdc58a83558"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), get(0)"
        let expectedOutput = "6"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "fb7272d9-63cc-4dfa-b656-34b625e21d1e"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), get(0)"
        let expectedOutput = "7"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "e8cd655f-4645-494a-a8e1-2b66cd64ac15"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), get(0)"
        let expectedOutput = "8"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "29f22e56-a480-4ab9-bf25-56bf3a74b084"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), get(0)"
        let expectedOutput = "9"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "82704e99-fead-433c-a060-1bed00ce5127"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), get(0)"
        let expectedOutput = "10"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "420d516a-a12a-45a9-a74e-8fa9dc387080"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), get(0)"
        let expectedOutput = "11"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "524cbacc-75fa-431b-9a0a-51a6726ae53f"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtHead(12), get(0)"
        let expectedOutput = "12"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "c236e89b-3e7c-4b41-937f-e4c3e291cc2b"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtHead(12), addAtHead(13), get(0)"
        let expectedOutput = "13"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "d40e3d58-0bcb-4d0a-a47d-c472cee438f2"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtHead(12), addAtHead(13), addAtHead(14), get(0)"
        let expectedOutput = "14"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "aaa6d5a6-4deb-4e4a-b3d4-7b0aa3a7587c"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtHead(12), addAtHead(13), addAtHead(14), addAtHead(15), get(0)"
        let expectedOutput = "15"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "2eed0f85-7883-4849-9071-28fa0437e1cf"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtHead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), get(0)"
        let expectedOutput = "16"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "53d032fe-b006-47ad-a50d-d1095a0586d8"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtHead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), get(0)"
        let expectedOutput = "17"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "46c10b3f-b21b-4d10-9c67-a0560b728754"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtHead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), addAtHead(18), get(0)"
        let expectedOutput = "18"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "2b821d10-2cbf-4cc1-9a94-11a1c15dc68b"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtHead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), addAtHead(18), addAtHead(19), get(0)"
        let expectedOutput = "19"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "438121b1-bdc7-44fc-bb30-530b314ef70b"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtHead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), addAtHead(18), addAtHead(19), addAtHead(20), get(0)"
        let expectedOutput = "20"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "b0db6cf8-df49-4b4f-9650-4367de3b0656"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtHead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), addAtHead(18), addAtHead(19), addAtHead(20), addAtHead(21), get(0)"
        let expectedOutput = "21"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
        let slug = "design-linked-list"
        let topic = "linked-list"
        let testId = "3a8ee394-35fb-47c2-861f-a5bdd5a54591"
        let rawInput = "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtHead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), addAtHead(18), addAtHead(19), addAtHead(20), addAtHead(21), addAtHead(22), get(0)"
        let expectedOutput = "22"
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
        let obj = MyLinkedList()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addAtHead":
                obj.addAtHead(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtTail":
                obj.addAtTail(InputParser.parseInt(a[0]))
                results.append("null")
            case "addAtIndex":
                obj.addAtIndex(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "deleteAtIndex":
                obj.deleteAtIndex(InputParser.parseInt(a[0]))
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
