import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMergeTwoSortedLists {
    private class Solution {
        func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
            guard let l1 = list1 else { return list2 }
            guard let l2 = list2 else { return list1 }

            if l1.val <= l2.val {
                l1.next = mergeTwoLists(l1.next, l2)
                return l1
            } else {
                l2.next = mergeTwoLists(l1, l2.next)
                return l2
            }
        }
    }

    @Suite struct MergeTwoSortedListsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3E3B24E1-B907-4ACA-8790-AAD83E869717",
             input: "list1 = [1,2,4], list2 = [1,3,4]",
             expected: "[1,1,2,3,4,4]", orderMatters: true),
            TestCaseData(id: "A104743C-AF19-4711-8B67-E1953004BB8B",
             input: "list1 = [], list2 = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "2A580502-6438-4760-9F6A-3B725089E216",
             input: "list1 = [], list2 = [0]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "850135D8-4EAA-4241-98C1-589ED681D9D4",
             input: "list1 = [1], list2 = [2]",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "F8754224-EC59-4C5F-88A5-64B0BB4320B2",
             input: "list1 = [0], list2 = []",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "F40C33C3-9F14-4463-AB77-E90364439BC7",
             input: "list1 = [1,3,5,7,9], list2 = [2,4,6,8,10]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "FFFDF540-F3C9-4A4B-B36B-A3F0FE5BDEB4",
             input: "list1 = [1,2,3], list2 = [4,5,6]",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "3B934704-D896-4CE5-9C85-CF76947B893E",
             input: "list1 = [4,5,6], list2 = [1,2,3]",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "649A62AA-0702-4529-B9A5-B05EA1ED16A1",
             input: "{\"list1\": [1, 2, 4], \"list2\": [1, 3, 4]}",
             expected: "[1,1,2,3,4,4]", orderMatters: true),
            TestCaseData(id: "AB9B9EB7-CC32-4ECF-89D1-1816B158AA9D",
             input: "{\"list1\": [], \"list2\": []}",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "C9BB5FBE-4BF0-4E87-8DFA-2EBDBD10AA3B",
             input: "{\"list1\": [], \"list2\": [0]}",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "D7D295C8-ED11-4F28-8983-7E62DF08A88C",
             input: "{\"list1\": [1, 3, 5, 7, 9], \"list2\": [2, 4, 6, 8, 10]}",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "55F3055F-A207-451C-BB4A-43EBC0213A31",
             input: "{\"list1\": [1, 2, 3], \"list2\": []}",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "339BF6FE-BE27-4758-88AA-18A5382A9E61",
             input: "{\"list1\": [5], \"list2\": [1, 2, 3, 4, 6]}",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "5D4E3189-E3C5-46B4-AFF5-8C554A3DF084",
             input: "{\"list1\": [2, 2, 2], \"list2\": [1, 1, 3]}",
             expected: "[1,1,2,2,2,3]", orderMatters: true),
            TestCaseData(id: "8A8EFCBB-7CF3-4261-BD2F-6DAA793124E9",
             input: "{\"list1\": [0], \"list2\": []}",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "8DB847E1-CCDC-4202-9DC3-4BE0989C9AE4",
             input: "list1 = [-1,5,7,9], list2 = [2,4,6]",
             expected: "[-1,2,4,5,6,7,9]", orderMatters: true),
            TestCaseData(id: "5389FC38-2AE8-46C7-83BF-CCFF90C446E4",
             input: "list1 = [1], list2 = []",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "0EA4C213-102E-46EE-BB74-013758F39085",
             input: "list1 = [], list2 = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "bbfc7045-7350-4145-a093-66480c9614f3",
             input: "list1 = [1,3,5], list2 = [2,4,6]",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "64ed61e2-a2bc-4776-904b-baa84040b0e5",
             input: "list1 = [], list2 = [1,2,3]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "c42c975f-cfcf-4f2b-8e31-ba67d0f8a3d5",
             input: "list1 = [1,2,3,4,5,6,7,8,9,10], list2 = [11,12,13,14,15,16,17,18,19,20]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]", orderMatters: true),
            TestCaseData(id: "11095367-9bff-40e4-ae6e-0f75f4a2f7b1",
             input: "list1 = [-1,-2,-3], list2 = [-4,-5,-6]",
             expected: "[-6,-5,-4,-3,-2,-1]", orderMatters: true),
            TestCaseData(id: "8165bdd6-cc37-426b-8c4e-5dc3d99c2fad",
             input: "list1 = [1,1,1], list2 = [1,1,1]",
             expected: "[1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "6757fd43-0930-4a22-99a9-72a121826b05",
             input: "list1 = [1,3,5,7,9], list2 = []",
             expected: "[1,3,5,7,9]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "merge-two-sorted-lists"
            let topic = "linked-list"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_list1 = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
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
            guard let p_list2 = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as ListNode?"
                )
                return
            }

            let solution = Solution()
            let result = solution.mergeTwoLists(p_list1, p_list2)
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
