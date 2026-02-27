import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRemoveDuplicatesFromSortedListIi {
    private class Solution {
        func deleteDuplicates(_ head: ListNode?) -> ListNode? {
            let dummy = ListNode(0)
            dummy.next = head
            var slow: ListNode? = dummy
            var fast: ListNode? = head

            while fast != nil && fast?.next != nil {
                if fast?.val == fast?.next?.val {
                    let val = fast?.val
                    while fast != nil && fast?.val == val {
                        fast = fast?.next
                    }
                    slow?.next = fast
                } else {
                    slow = slow?.next
                    fast = fast?.next
                }
            }
            return dummy.next
        }
    }

    @Suite struct RemoveDuplicatesFromSortedListIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "114b296c-bee4-4d5d-97f6-ac67c1d2977d",
             input: "head = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "7c16f26d-5abb-4f79-9727-b32259b6b1fd",
             input: "head = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "fda81d73-7101-47ff-8b2d-66026fb83396",
             input: "head = [1,1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "552975d7-00bd-4adb-91ee-06d65f7fbbfd",
             input: "head = [1,2,3,4,5,6]",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "f173247b-0c72-41c7-9b3e-1efab299b54e",
             input: "head = [1,1,1,1,1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "30da08c8-61fc-4d09-954e-c6068a303d35",
             input: "head = [1,2,2,3,3,4,4,5,5]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "88dad7a9-05d8-45d8-b5ee-347164314282",
             input: "head = [-1,-1,-2,-2,-3,-3]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "76ee9b67-2c18-4b1c-ad05-0e0c34eb1c8c",
             input: "head = [1,1,2,2,3,3,4,4,5,5]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "8db4e4ff-d243-4b59-981f-71c9c94c8d57",
             input: "head = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "a929a3cd-8ed1-49dc-b481-a8a27e1c9c3e",
             input: "head = [10,10,10,10,10]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "f18651a7-c77d-4bb5-a26f-5e9a9b303823",
             input: "head = [1,1,2,3,3,4,5,5]",
             expected: "[2,4]", orderMatters: true),
            TestCaseData(id: "fec1c144-1134-4d65-bfcc-72e2d83e085a",
             input: "head = [1,2,2,3,4,4,5,6,6]",
             expected: "[1,3,5]", orderMatters: true),
            TestCaseData(id: "f8513ecb-0849-4f62-92b6-9203dd6947bf",
             input: "head = [1,1,2,2,3,3,4,4,5,5,6,6]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "2068e17c-18a6-4c9c-b69e-e555749ce404",
             input: "head = [1,2,3,4,5,6,7,8,9,10,10]",
             expected: "[1,2,3,4,5,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "6f8040bb-6417-4043-8c68-419423bc4314",
             input: "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "1118069e-91b3-4fb1-aa8c-6666dd6b0d42",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,11]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "93c6e05a-0387-4684-86f1-60d9845faae9",
             input: "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "002b4731-3483-4847-9d0a-cc7a091c2c59",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,12]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11]", orderMatters: true),
            TestCaseData(id: "0cefe0a0-be67-4115-bb4d-9f7dbe6a4d6d",
             input: "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "c99a194e-f017-42b7-bf71-7e5fc38aa09f",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,13]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12]", orderMatters: true),
            TestCaseData(id: "230dfa85-b51d-4345-8b48-d4c860c8572b",
             input: "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "7fa83f30-4152-463b-905c-ba0fcfa5465e",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,14]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13]", orderMatters: true),
            TestCaseData(id: "bea6d99b-11b7-4dad-bbef-618859579255",
             input: "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "3203c2e7-79bd-4118-bc88-220b7014ef96",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,15]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14]", orderMatters: true),
            TestCaseData(id: "15da80a1-8bf8-467d-80fe-6da8a091199d",
             input: "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12]",
             expected: "[]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "remove-duplicates-from-sorted-list-ii"
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
                resultHolder = solution.deleteDuplicates(p_head)
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
