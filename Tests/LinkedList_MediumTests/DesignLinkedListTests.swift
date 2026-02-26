import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDesignLinkedList {
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

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "59846031-07f6-4ed9-a120-475c55f4d598",
             input: "head = [1,2,3], addAtHead(4), addAtTail(5), get(0)",
             expected: "4", orderMatters: true),
            TestCaseData(id: "f6762a80-b94c-44b2-a177-ca100aff9151",
             input: "head = [], addAtHead(1), addAtHead(2), get(0)",
             expected: "2", orderMatters: true),
            TestCaseData(id: "925d1db0-7b5c-42ce-b66c-5e2a30396bda",
             input: "head = [1], addAtHead(2), addAtHead(3), get(0)",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d02ede97-53d5-47f6-879c-96d56d8e523f",
             input: "head = [1,2,3,4,5], addAtHead(6), addAtHead(7), get(0)",
             expected: "7", orderMatters: true),
            TestCaseData(id: "519bd78c-3cb5-474f-97fc-a4c570c0c68e",
             input: "head = [1,2,3], addAtHead(-1), addAtHead(-2), get(0)",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "4c1febfe-a3b4-46d9-aac2-44a5b8009790",
             input: "head = [1,1,1], addAtHead(1), addAtHead(1), get(0)",
             expected: "1", orderMatters: true),
            TestCaseData(id: "636315ac-27f8-467d-9671-57d8a5359d20",
             input: "head = [1,2,3,4,5,6,7,8,9,10], addAtHead(11), get(0)",
             expected: "11", orderMatters: true),
            TestCaseData(id: "98e48b14-85c1-484c-be5a-fc069c41f56d",
             input: "head = [1], addAtHead(1), addAtHead(1), get(0)",
             expected: "1", orderMatters: true),
            TestCaseData(id: "860511fa-e29c-4383-89e9-9bdc58a83558",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), get(0)",
             expected: "6", orderMatters: true),
            TestCaseData(id: "fb7272d9-63cc-4dfa-b656-34b625e21d1e",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), get(0)",
             expected: "7", orderMatters: true),
            TestCaseData(id: "e8cd655f-4645-494a-a8e1-2b66cd64ac15",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), get(0)",
             expected: "8", orderMatters: true),
            TestCaseData(id: "29f22e56-a480-4ab9-bf25-56bf3a74b084",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), get(0)",
             expected: "9", orderMatters: true),
            TestCaseData(id: "82704e99-fead-433c-a060-1bed00ce5127",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), get(0)",
             expected: "10", orderMatters: true),
            TestCaseData(id: "420d516a-a12a-45a9-a74e-8fa9dc387080",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), get(0)",
             expected: "11", orderMatters: true),
            TestCaseData(id: "524cbacc-75fa-431b-9a0a-51a6726ae53f",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtH"
                + "ead(12), get(0)",
             expected: "12", orderMatters: true),
            TestCaseData(id: "c236e89b-3e7c-4b41-937f-e4c3e291cc2b",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtH"
                + "ead(12), addAtHead(13), get(0)",
             expected: "13", orderMatters: true),
            TestCaseData(id: "d40e3d58-0bcb-4d0a-a47d-c472cee438f2",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtH"
                + "ead(12), addAtHead(13), addAtHead(14), get(0)",
             expected: "14", orderMatters: true),
            TestCaseData(id: "aaa6d5a6-4deb-4e4a-b3d4-7b0aa3a7587c",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtH"
                + "ead(12), addAtHead(13), addAtHead(14), addAtHead(15), get(0)",
             expected: "15", orderMatters: true),
            TestCaseData(id: "2eed0f85-7883-4849-9071-28fa0437e1cf",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtH"
                + "ead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), get(0)",
             expected: "16", orderMatters: true),
            TestCaseData(id: "53d032fe-b006-47ad-a50d-d1095a0586d8",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtH"
                + "ead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), get(0)",
             expected: "17", orderMatters: true),
            TestCaseData(id: "46c10b3f-b21b-4d10-9c67-a0560b728754",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtH"
                + "ead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), addAtHead(18), get(0)",
             expected: "18", orderMatters: true),
            TestCaseData(id: "2b821d10-2cbf-4cc1-9a94-11a1c15dc68b",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtH"
                + "ead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), addAtHead(18), addAtHead(19), get(0)",
             expected: "19", orderMatters: true),
            TestCaseData(id: "438121b1-bdc7-44fc-bb30-530b314ef70b",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtH"
                + "ead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), addAtHead(18), addAtHead(19), addAtHead(20), get(0)",
             expected: "20", orderMatters: true),
            TestCaseData(id: "b0db6cf8-df49-4b4f-9650-4367de3b0656",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtH"
                + "ead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), addAtHead(18), addAtHead(19), addAtHead(20), addAtHe"
                + "ad(21), get(0)",
             expected: "21", orderMatters: true),
            TestCaseData(id: "3a8ee394-35fb-47c2-861f-a5bdd5a54591",
             input: "head = [1,2,3], addAtHead(4), addAtHead(5), addAtHead(6), addAtHead(7), addAtHead(8), addAtHead(9), addAtHead(10), addAtHead(11), addAtH"
                + "ead(12), addAtHead(13), addAtHead(14), addAtHead(15), addAtHead(16), addAtHead(17), addAtHead(18), addAtHead(19), addAtHead(20), addAtHe"
                + "ad(21), addAtHead(22), get(0)",
             expected: "22", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "design-linked-list"
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
            var obj = Solution.MyLinkedList()

            var results: [String] = []
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                switch methodName {
                case "addAtHead":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    obj.addAtHead(mArg_0)
                    results.append("null")
                case "addAtTail":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    obj.addAtTail(mArg_0)
                    results.append("null")
                case "addAtIndex":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    guard let mArg_1 = InputParser.parseInt(args[1]) else { results.append("null"); continue }
                    obj.addAtIndex(mArg_0, mArg_1)
                    results.append("null")
                case "get":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    let rv = obj.get(mArg_0)
                    results.append("\(rv)")
                case "deleteAtIndex":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    obj.deleteAtIndex(mArg_0)
                    results.append("null")
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
