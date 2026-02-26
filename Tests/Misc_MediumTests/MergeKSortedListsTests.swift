import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMergeKSortedLists {
    private class Solution {
        func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
            var lists = lists.compactMap { $0 }  // Remove nils
            if lists.isEmpty { return nil }

            while lists.count > 1 {
                var merged: [ListNode] = []
                for i in stride(from: 0, to: lists.count, by: 2) {
                    let l1 = lists[i]
                    let l2 = i + 1 < lists.count ? lists[i + 1] : nil
                    if let m = mergeTwoLists(l1, l2) {
                        merged.append(m)
                    }
                }
                lists = merged
            }

            return lists.first
        }

        private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            let dummy = ListNode(0)
            var tail = dummy
            var l1 = l1, l2 = l2

            while let n1 = l1, let n2 = l2 {
                if n1.val <= n2.val {
                    tail.next = n1
                    l1 = n1.next
                } else {
                    tail.next = n2
                    l2 = n2.next
                }
                tail = tail.next.unsafelyUnwrapped
            }
            tail.next = l1 ?? l2
            return dummy.next
        }
    }

    @Suite struct MergeKSortedListsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f86db658-37e2-47f9-8be1-91bb3ba8ab17",
             input: "lists = [[1,2,3],[4,5,6]]",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "eedb8ad7-8f23-4659-91f8-eea1e8d37721",
             input: "lists = [[-1,-2,-3],[-4,-5,-6]]",
             expected: "[-6,-5,-4,-3,-2,-1]", orderMatters: true),
            TestCaseData(id: "e078a55d-1294-4512-a2a8-b5e918e2e727",
             input: "lists = [[1,1,1],[2,2,2],[3,3,3]]",
             expected: "[1,1,1,2,2,2,3,3,3]", orderMatters: true),
            TestCaseData(id: "bfdef46a-a24b-4d04-a840-4a35d7278184",
             input: "lists = [[1],[2],[3]]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "07836f0b-5ba4-4b7f-8396-9cf8ba2456be",
             input: "lists = [[1,2,3,4,5,6,7,8,9,10]]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "53fd496c-bfa4-4cae-8142-bcca0944b520",
             input: "lists = [[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]]",
             expected: "[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]", orderMatters: true),
            TestCaseData(id: "59074348-f03d-4ed8-a1cd-8214083bdbe5",
             input: "lists = [[1,3,5],[2,4,6]]",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "7d98c4a7-4cbd-4d11-9603-fea5af1f4c15",
             input: "lists = [[1,2,3],[4,5,6],[7,8,9]]",
             expected: "[1,2,3,4,5,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "55cc2392-cba6-4c82-9779-8084aa94b28b",
             input: "lists = [[10,20,30],[5,15,25]]",
             expected: "[5,10,15,20,25,30]", orderMatters: true),
            TestCaseData(id: "296a2c06-dd5a-48a8-93b6-27a78e3cf1a8",
             input: "lists = [[1],[1],[1],[1],[1]]",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "17ee4d0d-e74e-4d61-aa01-09945464ca04",
             input: "lists = [[-5,-4,-3],[-2,-1,0]]",
             expected: "[-5,-4,-3,-2,-1,0]", orderMatters: true),
            TestCaseData(id: "ca55c344-3670-4886-bd83-6f1780765223",
             input: "lists = [[1,2,3,4,5,6,7,8,9,10],[11,12,13,14,15,16,17,18,19,20]]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]", orderMatters: true),
            TestCaseData(id: "a9a08180-ed3a-4148-86f9-4d34f2e165d0",
             input: "lists = [[1,2,3],[4,5,6],[7,8,9],[10,11,12]]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12]", orderMatters: true),
            TestCaseData(id: "f66e1cee-a22e-4d45-9918-1bfd20875362",
             input: "lists = [[1,3,5,7,9],[2,4,6,8,10]]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "edd8c476-ee5c-4db6-b837-949892c251fe",
             input: "lists = [[1,2,3,4,5],[6,7,8,9,10]]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "6f75d22c-f870-47dd-b007-ccf156e97f44",
             input: "lists = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15]]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]", orderMatters: true),
            TestCaseData(id: "7fd9d232-732d-4d2b-abd6-14a233b92d1c",
             input: "lists = [[1,1,1,1,1],[2,2,2,2,2]]",
             expected: "[1,1,1,1,1,2,2,2,2,2]", orderMatters: true),
            TestCaseData(id: "476c17d2-0fdd-44ad-87e6-a2001d3c1702",
             input: "lists = [[-10,-9,-8],[-7,-6,-5],[-4,-3,-2],[-1,0,1]]",
             expected: "[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1]", orderMatters: true),
            TestCaseData(id: "28ddb291-a354-4d17-bf84-74348bbd8186",
             input: "lists = [[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]", orderMatters: true),
            TestCaseData(id: "924462ce-e16c-40d8-94f6-942a082943e6",
             input: "lists = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18]]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]", orderMatters: true),
            TestCaseData(id: "0e0259bf-ab1f-43ea-bf38-baac5adb3ae5",
             input: "lists = [[1,3,5,7,9,11,13,15,17,19],[2,4,6,8,10,12,14,16,18,20]]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]", orderMatters: true),
            TestCaseData(id: "70d4b584-7dbb-419b-a3f7-02def6dc23ff",
             input: "lists = [[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],[21,22,23,24,25,26,27,28,29,30]]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]", orderMatters: true),
            TestCaseData(id: "3c00a2fc-3d4a-4af6-92a2-b8ce659bcf3d",
             input: "lists = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "06dd8273-1f5c-470c-8d8c-aaeae7aa2eea",
             input: "lists = [[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],[21,22,23,24,25,26,27,28,29,30],[31,32,33,34,35,36,37,38,39,40]]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40]", orderMatters: true),
            TestCaseData(id: "80461553-d61e-4407-ac8e-decce650a153",
             input: "lists = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18],[19,20,21]]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "merge-k-sorted-lists"
            let topic = "misc"
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

            guard let p_lists = InputParser.parse2DIntArray(params[0]).map({ $0.map({ buildList($0) }) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [ListNode?]"
                )
                return
            }

            let solution = Solution()
            let result = solution.mergeKLists(p_lists)
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
