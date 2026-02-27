import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReverseLinkedList {
    private class Solution {
        func reverseList(_ head: ListNode?) -> ListNode? {
            // Base case: empty or single node
            guard let head = head, let next = head.next else {
                return head
            }

            // Recursively reverse the rest
            let newHead = reverseList(next)

            // Fix pointers
            next.next = head  // Make next point back to us
            head.next = nil   // Clear our forward pointer

            return newHead
        }
    }

    @Suite struct ReverseLinkedListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7EACCAE5-726D-4C61-914B-2C7A6D1DA62C",
             input: "[1,2,3,4,5]",
             expected: "[5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "1CA65FFD-6789-457C-9493-72497AAD7F12",
             input: "[1,2]",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "8A71BFB8-F540-4CF8-A11A-3B5D42B716EE",
             input: "[1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "3F652636-01C7-4AFA-AC01-8B3BD3928EDC",
             input: "[1,1,1,1]",
             expected: "[1,1,1,1]", orderMatters: true),
            TestCaseData(id: "B797E0DD-0BDE-4F58-9EFB-F5AFF0A41A48",
             input: "[-1,-2,-3,-4,-5]",
             expected: "[-5,-4,-3,-2,-1]", orderMatters: true),
            TestCaseData(id: "59E51C37-4D63-4482-9BAF-38900D408539",
             input: "[1,-2,3,-4,5]",
             expected: "[5,-4,3,-2,1]", orderMatters: true),
            TestCaseData(id: "516AF642-E098-4C97-B018-3F8DD126FB99",
             input: "[10,20,30,40,50]",
             expected: "[50,40,30,20,10]", orderMatters: true),
            TestCaseData(id: "A8C7FB9D-B5C5-412E-BB49-8516CCBEE685",
             input: "[100,200,300,400,500]",
             expected: "[500,400,300,200,100]", orderMatters: true),
            TestCaseData(id: "6D4E6EB5-D1B2-4017-B741-B5BBDFBC672D",
             input: "[1,3,5,7,9]",
             expected: "[9,7,5,3,1]", orderMatters: true),
            TestCaseData(id: "0B4FB5F7-0172-45E1-9597-B70159191EBA",
             input: "[2,4,6,8,10]",
             expected: "[10,8,6,4,2]", orderMatters: true),
            TestCaseData(id: "9BC3F489-9835-4ECD-A879-0BE6413743A8",
             input: "[1,2,3,4,5,6,7,8,9,10]",
             expected: "[10,9,8,7,6,5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "F439AD98-F68C-4EA3-9837-4EA5FC3012AD",
             input: "[5,4,3,2,1]",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "DF8733CE-E0AB-4DDF-BDFD-599DA1F9BA86",
             input: "[10,9,8,7,6,5,4,3,2,1]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "9DD67334-059C-4865-B749-E48E3EC0B679",
             input: "[1,3,5,7,9,11,13,15]",
             expected: "[15,13,11,9,7,5,3,1]", orderMatters: true),
            TestCaseData(id: "4FF00EFF-FB77-4672-981F-A2B3BEA0E891",
             input: "[2,4,6,8,10,12,14,16]",
             expected: "[16,14,12,10,8,6,4,2]", orderMatters: true),
            TestCaseData(id: "BAC47D6B-FE88-45B8-899D-8ADD2456048A",
             input: "[1,-1,1,-1,1]",
             expected: "[1,-1,1,-1,1]", orderMatters: true),
            TestCaseData(id: "96430F36-9874-43FA-9E9E-8E3FCA92EE2D",
             input: "[-1,1,-1,1,-1]",
             expected: "[-1,1,-1,1,-1]", orderMatters: true),
            TestCaseData(id: "F3909F57-8EAD-4D4E-ADC1-82EDA08432C5",
             input: "[1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "[12,11,10,9,8,7,6,5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "2D6928C3-8A2D-4BF6-8596-BA73A7202685",
             input: "[1,1,1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "B36786F6-BAFE-4991-BF68-1BCE9607BB64",
             input: "[5,10,15,20,25,30,35,40,45,50]",
             expected: "[50,45,40,35,30,25,20,15,10,5]", orderMatters: true),
            TestCaseData(id: "25DCCF89-1E2D-4872-ABBD-FD560DEB900D",
             input: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "B29B49B7-A444-4B0D-BB26-3D78B91C49CA",
             input: "[0,1,0,1,0,1,0,1]",
             expected: "[1,0,1,0,1,0,1,0]", orderMatters: true),
            TestCaseData(id: "650417DF-2889-4823-8068-62025D601D80",
             input: "[1,0,1,0,1,0,1,0]",
             expected: "[0,1,0,1,0,1,0,1]", orderMatters: true),
            TestCaseData(id: "3E4FEE88-2C82-48B5-9F24-EBA8191BF9AD",
             input: "[0,0,0,0,0,0,0,0]",
             expected: "[0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "0E3D6D1D-50CF-45FA-BBF7-7A6502D6FD31",
             input: "[1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1,1,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reverse-linked-list"
            let topic = "linked-list"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as ListNode?"
                )
                return
            }

            let solution = Solution()
            var resultHolder: ListNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.reverseList(p_head)
            }
            guard !didCrash, let result = resultHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
