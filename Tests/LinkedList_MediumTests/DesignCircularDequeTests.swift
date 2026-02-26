import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDesignCircularDeque {
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

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "542f8496-289e-4bd0-b4ec-853ef26db6d4",
             input: "k = 1, value = 5",
             expected: "true", orderMatters: true),
            TestCaseData(id: "284c85a6-2efd-4e43-921b-932de799427b",
             input: "k = 5, value = 0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6ab8388f-4732-4033-a9d5-d23a06c95ad0",
             input: "k = 10, value = -1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "98117e60-604f-4f2e-9725-38ce41965214",
             input: "k = 3, value = 10",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a5034253-1e68-41d5-b82b-ae20ab82e1b7",
             input: "k = 8, value = 20",
             expected: "true", orderMatters: true),
            TestCaseData(id: "358023b9-8a75-4dcc-8892-5883f76d8747",
             input: "k = 15, value = 30",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2c2dab5b-eb54-42e4-b8cd-f64f977f6b9a",
             input: "k = 2, value = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f7fa924c-9fe4-4179-a0b3-a3058744fb0e",
             input: "k = 4, value = 2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2636c75a-88d4-471a-94e0-b13b5f21d930",
             input: "k = 6, value = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "463dee5b-8bef-48db-89e3-f752cb62932e",
             input: "k = 7, value = 4",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fcc469a1-70a6-49ce-bd40-b051fc4fc75d",
             input: "k = 1, value = -5",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2b7ba3ef-d3bd-4d01-8ca6-fae3f988d1d2",
             input: "k = 5, value = -10",
             expected: "true", orderMatters: true),
            TestCaseData(id: "dbc6d5fb-2206-4f5d-9ab5-f7204152073b",
             input: "k = 10, value = -15",
             expected: "true", orderMatters: true),
            TestCaseData(id: "88d74db8-0968-4e36-8b15-910847f11f5f",
             input: "k = 3, value = -20",
             expected: "true", orderMatters: true),
            TestCaseData(id: "22487bf0-e6a9-4b28-9e23-4243050fff93",
             input: "k = 8, value = -25",
             expected: "true", orderMatters: true),
            TestCaseData(id: "db8dffcd-65c8-4a1e-ae54-f8e98da11ae5",
             input: "k = 15, value = -30",
             expected: "true", orderMatters: true),
            TestCaseData(id: "80b25529-4802-45c0-a88f-fbfa6f29ffd6",
             input: "k = 2, value = 100",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7204c36d-d1dc-4ad5-a15f-d1ca2fba446e",
             input: "k = 4, value = 200",
             expected: "true", orderMatters: true),
            TestCaseData(id: "38b0f875-d6d6-4a1d-9330-33491742a4bb",
             input: "k = 6, value = 300",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4a5f0884-e886-4c47-84d3-b7f9edb6be6a",
             input: "k = 7, value = 400",
             expected: "true", orderMatters: true),
            TestCaseData(id: "43619046-0869-4ac3-b5fa-9fd6fd59504c",
             input: "k = 9, value = 500",
             expected: "true", orderMatters: true),
            TestCaseData(id: "62de91b5-896b-45df-978a-e5c5cbf8c8d0",
             input: "k = 11, value = 600",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f509644e-bd84-4900-95fc-9ce306b38a29",
             input: "k = 12, value = 700",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0d1a2ea0-7e71-43f9-b4b2-d8d467ec043a",
             input: "k = 13, value = 800",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2a4318b4-4536-4d33-8a93-27be0aeae29d",
             input: "k = 14, value = 900",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "design-circular-deque"
            let topic = "linked-list"
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
            guard initArgs.count >= 1 else {
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
            guard let initP_0 = InputParser.parseInt(initArgs[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse init param 0 as Int"
                )
                return
            }
            var obj = Solution.MyCircularDeque(initP_0)

            var results: [String] = []
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                switch methodName {
                case "insertFront":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    let rv = obj.insertFront(mArg_0)
                    results.append(rv ? "true" : "false")
                case "insertLast":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    let rv = obj.insertLast(mArg_0)
                    results.append(rv ? "true" : "false")
                case "deleteFront":
                    let rv = obj.deleteFront()
                    results.append(rv ? "true" : "false")
                case "deleteLast":
                    let rv = obj.deleteLast()
                    results.append(rv ? "true" : "false")
                case "getFront":
                    let rv = obj.getFront()
                    results.append("\(rv)")
                case "getRear":
                    let rv = obj.getRear()
                    results.append("\(rv)")
                case "isEmpty":
                    let rv = obj.isEmpty()
                    results.append(rv ? "true" : "false")
                case "isFull":
                    let rv = obj.isFull()
                    results.append(rv ? "true" : "false")
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
