import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSortList {
    private class Solution {
        func sortList(_ head: ListNode?) -> ListNode? {
            guard head?.next != nil else { return head }
            var slow = head, fast = head?.next
            while fast?.next != nil { slow = slow?.next; fast = fast?.next?.next }
            let mid = slow?.next; slow?.next = nil
            let left = sortList(head), right = sortList(mid)
            return merge(left, right)
        }
        func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            let dummy = ListNode(0)
            var curr: ListNode? = dummy
            var p1 = l1, p2 = l2
            while p1 != nil && p2 != nil {
                if p1.unsafelyUnwrapped.val < p2.unsafelyUnwrapped.val { curr?.next = p1; p1 = p1?.next }
                else { curr?.next = p2; p2 = p2?.next }
                curr = curr?.next
            }
            curr?.next = p1 ?? p2
            return dummy.next
        }
    }

    @Suite struct SortListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0a06365c-6bf2-449a-830c-15ec0b1f2efc",
             input: "head = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "80c98b18-2ce6-48ab-84d3-030b5ce12592",
             input: "head = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "34975c27-ff41-459d-9840-0b3fcfcbc7b3",
             input: "head = [5,4,3,2,1]",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "c8178f66-deaa-4f3f-986e-762a4bc51503",
             input: "head = [1,1,1,1,1]",
             expected: "[1, 1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "8f348879-6382-44e0-ae65-4070fcfae373",
             input: "head = [-1,0,1]",
             expected: "[-1, 0, 1]", orderMatters: true),
            TestCaseData(id: "39b9cd95-fc35-4ecc-9a5d-92ff14a3181c",
             input: "head = [10,9,8,7,6,5,4,3,2,1]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]", orderMatters: true),
            TestCaseData(id: "d34f3f42-4e8d-42ac-aefa-639c711263fa",
             input: "head = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]", orderMatters: true),
            TestCaseData(id: "bb5413bf-9716-4053-8add-4d2d01fcb42d",
             input: "head = [5,1,3,2,4]",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "53c0e3d0-e807-46e5-9609-a1b2396dd311",
             input: "head = [1,3,5,7,9]",
             expected: "[1, 3, 5, 7, 9]", orderMatters: true),
            TestCaseData(id: "96e85d07-0ada-4d63-ad38-2a4a8bf48732",
             input: "head = [2,4,6,8,10]",
             expected: "[2, 4, 6, 8, 10]", orderMatters: true),
            TestCaseData(id: "f1c0980d-3430-44d2-812c-165f4a05d9c1",
             input: "head = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "[-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]", orderMatters: true),
            TestCaseData(id: "e4db49ad-78a3-4506-b677-e1dcb3d54a75",
             input: "head = [10,-9,8,-7,6,-5,4,-3,2,-1]",
             expected: "[-9, -7, -5, -3, -1, 2, 4, 6, 8, 10]", orderMatters: true),
            TestCaseData(id: "43afddfe-a649-46ab-8914-560cf39e567b",
             input: "head = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[1, 1, 1, 1, 1, 1, 1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "750d3b93-fa5c-47f7-bf91-e6df6ece54e7",
             input: "head = [5,5,5,5,5,5,5,5,5,5]",
             expected: "[5, 5, 5, 5, 5, 5, 5, 5, 5, 5]", orderMatters: true),
            TestCaseData(id: "52e3c464-c8d3-4fe3-befd-aad060ee1895",
             input: "head = [1,3,5,7,9,11,13,15,17,19]",
             expected: "[1, 3, 5, 7, 9, 11, 13, 15, 17, 19]", orderMatters: true),
            TestCaseData(id: "36a5bd48-6204-49cd-a974-7d2d6722bce6",
             input: "head = [2,4,6,8,10,12,14,16,18,20]",
             expected: "[2, 4, 6, 8, 10, 12, 14, 16, 18, 20]", orderMatters: true),
            TestCaseData(id: "d1a2070e-26c3-47ba-acaf-952bdb6e6131",
             input: "head = [-1,1,-3,3,-5,5,-7,7,-9,9]",
             expected: "[-9, -7, -5, -3, -1, 1, 3, 5, 7, 9]", orderMatters: true),
            TestCaseData(id: "38e784e2-0cf4-4b8e-beb4-bddf1ab1768e",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]", orderMatters: true),
            TestCaseData(id: "0e224d9a-78e4-4e44-89bf-24b621470226",
             input: "head = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]", orderMatters: true),
            TestCaseData(id: "d8988242-1165-4b2a-8b85-4e1a0a792c91",
             input: "head = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29]",
             expected: "[1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29]", orderMatters: true),
            TestCaseData(id: "237dc028-8625-4592-ab15-add2b5aabed2",
             input: "head = [29,27,25,23,21,19,17,15,13,11,9,7,5,3,1]",
             expected: "[1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29]", orderMatters: true),
            TestCaseData(id: "3d9c1b51-327f-40d7-95e7-2c611ab79083",
             input: "head = [-10,-8,-6,-4,-2,0,2,4,6,8,10]",
             expected: "[-10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10]", orderMatters: true),
            TestCaseData(id: "1cfc4282-3f4b-447e-83ae-8dd4207b1cec",
             input: "head = [10,8,6,4,2,0,-2,-4,-6,-8,-10]",
             expected: "[-10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10]", orderMatters: true),
            TestCaseData(id: "2a58ad83-8a24-4de2-ab60-5a593fd08b47",
             input: "head = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "b1cbf7eb-f51b-47ca-ba6b-806ea923eef8",
             input: "head = [5,10,15,20,25,30,35,40,45,50]",
             expected: "[5, 10, 15, 20, 25, 30, 35, 40, 45, 50]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sort-list"
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
                resultHolder = solution.sortList(p_head)
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
