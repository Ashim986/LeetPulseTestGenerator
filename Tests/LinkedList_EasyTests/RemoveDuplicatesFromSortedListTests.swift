import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRemoveDuplicatesFromSortedList {
    // Definition for singly-linked list.

    private class Solution {
        func deleteDuplicates(_ head: ListNode?) -> ListNode? {
            var current: ListNode? = head
            while current != nil && current?.next != nil {
                if current?.val == current?.next?.val {
                    current?.next = current?.next?.next
                } else {
                    current = current?.next
                }
            }
            return head
        }
    }

    @Suite struct RemoveDuplicatesFromSortedListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7914eb53-4cb0-4ffa-82bc-a7b19496fb14",
             input: "head = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "e75efa36-5fb5-4bd6-a912-636e1e77c81e",
             input: "head = [1, 1, 1, 1, 1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "83e7a99b-8037-400f-baf5-7f00425c3df1",
             input: "head = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "853fc42b-10d5-4965-96f2-d2ecb511ee07",
             input: "head = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "3e76b213-f00c-40ac-8146-edcf66f92a0e",
             input: "head = [-1, -1, -2, -2, -3, -3]",
             expected: "[-1,-2,-3]", orderMatters: true),
            TestCaseData(id: "cb3c1ca8-f34c-49fa-98c4-f678f521cacf",
             input: "head = [5, 5, 5, 5, 5]",
             expected: "[5]", orderMatters: true),
            TestCaseData(id: "73924384-db33-4ab8-8372-8095f75f831e",
             input: "head = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]",
             expected: "[1,2,3,4]", orderMatters: true),
            TestCaseData(id: "8cddba9d-59a0-48f8-814c-ce64c5d073a6",
             input: "head = [1, 1, 1, 2, 2, 2, 3, 3, 3]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "6179edf0-d8f7-4957-8ce3-0ab1bc799d56",
             input: "head = [10, 10, 10, 10, 10]",
             expected: "[10]", orderMatters: true),
            TestCaseData(id: "a7d0da51-04bf-41c0-bf75-a958201051bb",
             input: "head = [1, 2, 3, 3, 3, 3, 3, 3]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "e7a7d9d9-aea7-4fcb-91f9-2c46db0b4e2f",
             input: "head = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "ee8a328e-a8b6-4909-91cd-37fa7ae96bc6",
             input: "head = [5, 6, 7, 8, 9, 10]",
             expected: "[5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "d00ba2c4-e636-4737-86ec-a36f635eee36",
             input: "head = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "[10,9,8,7,6,5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "43e75a12-4e44-44d7-b351-4c85881ac634",
             input: "head = [1, 1, 2, 3, 4, 5, 6]",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "7b7582bf-b5ea-4d79-8489-2bcf844d563e",
             input: "head = [1, 2, 2, 3, 4, 5, 5]",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "9935732f-e158-420d-9d90-5b307ee09a56",
             input: "head = [1, 1, 2, 3, 3, 4, 5, 6]",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "40d1d95f-ebd7-4ff4-b1d2-2a3d120c2701",
             input: "head = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "1831b670-c127-4a51-a653-ffdab249da0a",
             input: "head = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "[10]", orderMatters: true),
            TestCaseData(id: "f93ca548-48bd-4b34-bc9b-f4282f751d34",
             input: "head = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "5507a926-17f9-4d83-a2ce-d6d7be7edb23",
             input: "head = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5]",
             expected: "[5]", orderMatters: true),
            TestCaseData(id: "439361ac-a1a5-4fe7-89bd-228c71b3ba43",
             input: "head = [1, 2, 3, 4, 5, 6, 7, 8, 9]",
             expected: "[1,2,3,4,5,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "7881b7ca-857b-4c84-bb82-809fce3de6c9",
             input: "head = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]",
             expected: "[10,20,30,40,50,60,70,80,90,100]", orderMatters: true),
            TestCaseData(id: "1c78df0b-a4df-4cdc-8678-4d1e765104fb",
             input: "head = [1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "968a6926-ec2f-4574-b12d-150aed37c304",
             input: "head = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "[10]", orderMatters: true),
            TestCaseData(id: "8f09b3e6-3cf3-4b09-ab8f-b241063e371b",
             input: "head = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "remove-duplicates-from-sorted-list"
            let topic = "linked-list"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as ListNode?"
                )
                return
            }

            let solution = Solution()
            let result = solution.deleteDuplicates(p_head)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
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
