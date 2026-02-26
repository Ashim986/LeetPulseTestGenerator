import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class MyCircularDeque {
        var head: Node?
        var tail: Node?
        var size: Int
        var capacity: Int
        init(_ k: Int) {
            capacity = k
            size = 0
        }
        func insertFront(_ value: Int) -> Bool {
            if size == capacity {
                return false
            }
            let node = Node(value)
            if isEmpty() {
                head = node
                tail = node
                node.next = node
                node.prev = node
            }
            else {
                node.next = head
                node.prev = tail
                head?.prev = node
                tail?.next = node
                head = node
            }
            size += 1
            return true
        }
        func insertLast(_ value: Int) -> Bool {
            if size == capacity {
                return false
            }
            let node = Node(value)
            if isEmpty() {
                head = node
                tail = node
                node.next = node
                node.prev = node
            }
            else {
                node.next = head
                node.prev = tail
                head?.prev = node
                tail?.next = node
                tail = node
            }
            size += 1
            return true
        }
        func deleteFront() -> Bool {
            if isEmpty() {
                return false
            }
            if size == 1 {
                head = nil
                tail = nil
            }
            else {
                head = head?.next
                head?.prev = tail
                tail?.next = head
            }
            size -= 1
            return true
        }
        func deleteLast() -> Bool {
            if isEmpty() {
                return false
            }
            if size == 1 {
                head = nil
                tail = nil
            }
            else {
                tail = tail?.prev
                tail?.next = head
                head?.prev = tail
            }
            size -= 1
            return true
        }
        func getFront() -> Int {
            return head?.val ?? -1
        }
        func getRear() -> Int {
            return tail?.val ?? -1
        }
        func isEmpty() -> Bool {
            return size == 0
        }
        func isFull() -> Bool {
            return size == capacity
        }
    }
}

@Suite struct DesignCircularDequeTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "542f8496-289e-4bd0-b4ec-853ef26db6d4"
        let rawInput = "k = 1, value = 5"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_1() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "284c85a6-2efd-4e43-921b-932de799427b"
        let rawInput = "k = 5, value = 0"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_2() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "6ab8388f-4732-4033-a9d5-d23a06c95ad0"
        let rawInput = "k = 10, value = -1"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_3() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "98117e60-604f-4f2e-9725-38ce41965214"
        let rawInput = "k = 3, value = 10"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_4() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "a5034253-1e68-41d5-b82b-ae20ab82e1b7"
        let rawInput = "k = 8, value = 20"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_5() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "358023b9-8a75-4dcc-8892-5883f76d8747"
        let rawInput = "k = 15, value = 30"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_6() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "2c2dab5b-eb54-42e4-b8cd-f64f977f6b9a"
        let rawInput = "k = 2, value = 1"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_7() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "f7fa924c-9fe4-4179-a0b3-a3058744fb0e"
        let rawInput = "k = 4, value = 2"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_8() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "2636c75a-88d4-471a-94e0-b13b5f21d930"
        let rawInput = "k = 6, value = 3"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_9() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "463dee5b-8bef-48db-89e3-f752cb62932e"
        let rawInput = "k = 7, value = 4"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_10() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "fcc469a1-70a6-49ce-bd40-b051fc4fc75d"
        let rawInput = "k = 1, value = -5"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_11() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "2b7ba3ef-d3bd-4d01-8ca6-fae3f988d1d2"
        let rawInput = "k = 5, value = -10"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_12() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "dbc6d5fb-2206-4f5d-9ab5-f7204152073b"
        let rawInput = "k = 10, value = -15"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_13() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "88d74db8-0968-4e36-8b15-910847f11f5f"
        let rawInput = "k = 3, value = -20"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_14() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "22487bf0-e6a9-4b28-9e23-4243050fff93"
        let rawInput = "k = 8, value = -25"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_15() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "db8dffcd-65c8-4a1e-ae54-f8e98da11ae5"
        let rawInput = "k = 15, value = -30"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_16() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "80b25529-4802-45c0-a88f-fbfa6f29ffd6"
        let rawInput = "k = 2, value = 100"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_17() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "7204c36d-d1dc-4ad5-a15f-d1ca2fba446e"
        let rawInput = "k = 4, value = 200"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_18() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "38b0f875-d6d6-4a1d-9330-33491742a4bb"
        let rawInput = "k = 6, value = 300"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_19() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "4a5f0884-e886-4c47-84d3-b7f9edb6be6a"
        let rawInput = "k = 7, value = 400"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_20() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "43619046-0869-4ac3-b5fa-9fd6fd59504c"
        let rawInput = "k = 9, value = 500"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_21() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "62de91b5-896b-45df-978a-e5c5cbf8c8d0"
        let rawInput = "k = 11, value = 600"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_22() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "f509644e-bd84-4900-95fc-9ce306b38a29"
        let rawInput = "k = 12, value = 700"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_23() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "0d1a2ea0-7e71-43f9-b4b2-d8d467ec043a"
        let rawInput = "k = 13, value = 800"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_24() async {
        let slug = "design-circular-deque"
        let topic = "linked-list"
        let testId = "2a4318b4-4536-4d33-8a93-27be0aeae29d"
        let rawInput = "k = 14, value = 900"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            guard initArgs.count >= 1 else { return }
            var obj = Solution.MyCircularDeque(InputParser.parseInt(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insertFront":
                let r = obj.insertFront(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "insertLast":
                let r = obj.insertLast(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "deleteFront":
                let r = obj.deleteFront()
                results.append(r ? "true" : "false")
            case "deleteLast":
                let r = obj.deleteLast()
                results.append(r ? "true" : "false")
            case "getFront":
                let r = obj.getFront()
                results.append("\(r)")
            case "getRear":
                let r = obj.getRear()
                results.append("\(r)")
            case "isEmpty":
                let r = obj.isEmpty()
                results.append(r ? "true" : "false")
            case "isFull":
                let r = obj.isFull()
                results.append(r ? "true" : "false")
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
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

}
