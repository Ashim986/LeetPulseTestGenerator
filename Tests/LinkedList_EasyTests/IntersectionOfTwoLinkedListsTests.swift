import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCIntersectionOfTwoLinkedLists {
    // Definition for singly-linked list.

    private class Solution {
        func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            var pA = headA
            var pB = headB
            while pA !== pB {
                pA = pA != nil ? pA?.next : headB
                pB = pB != nil ? pB?.next : headA
            }
            return pA
        }
    }

    @Suite struct IntersectionOfTwoLinkedListsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a277cc89-bb48-427c-b787-48fbb90c329c",
             input: "headA = [], headB = [1,2,3]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "7334824a-99c6-4b60-83c0-dc304dcdd8f4",
             input: "headA = [1,2,3], headB = [4,5,6]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "e850f175-2c95-46e7-beb3-1bcda76be13f",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "fe39095c-ea9d-466f-a69e-5265d4b19e6d",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "f4d47049-c669-4bcb-922d-0dffe6b915b6",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "89969345-1eab-4f2c-b617-5cd470d79d5a",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "40b19561-08c0-4fe0-b2da-a3e2cad3a303",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "e66658b8-5f50-44bb-b2e8-1e86175c11c4",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "1d31bb08-29af-472e-9783-6a67693ba057",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "1858465d-a174-4fdf-8447-57ab2783a32b",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "9beb6859-5000-4548-8430-8505704f3704",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "0f41234d-e465-45f9-87a6-49c53ab24a41",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "0e2cb30c-7919-42cb-825a-362b02a7994b",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "1d698424-b3eb-4534-b148-fbd7c08bce1b",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "397cc32e-0007-488f-a53c-2941c2a4015e",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "e15a75ec-efb7-41b1-ac72-fdee9b2eff32",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "07a56198-9b83-4e4c-9668-a9c084d5a798",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "e1ee11e2-b268-4bca-a8a6-74e31ccc97d0",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "711c5a30-133f-4644-9fa3-58b9cc00d704",
             input: "headA = [1,2,3,4,5], headB = [-1,-2,-3,-4,-5]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "009884cf-abf1-438f-b09e-61fab222a206",
             input: "headA = [1,2,3,4,5], headB = [10,9,8,7,6]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "78b3e8f7-4e5e-4cb6-a39f-ba6f25f726a3",
             input: "headA = [10,9,8,7,6], headB = [1,2,3,4,5]",
             expected: "nil", orderMatters: true),
            TestCaseData(id: "39d83187-cc82-4aa3-85bf-d1e50f4f7928",
             input: "headA = [1,2,3,4,5], headB = [6,7,8,4,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "44aff8b3-ca3f-47bc-929e-e52c69525d0a",
             input: "headA = [1], headB = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e5259d65-e105-42d7-aaf5-b8198f5ca74c",
             input: "headA = [1,2,3], headB = [4,5,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "48bea05b-ace1-450f-aac2-848ca64b0e80",
             input: "headA = [1,2,3,4,5], headB = [1,2,3,4,5]",
             expected: "null", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "intersection-of-two-linked-lists"
            let topic = "linked-list"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_headA = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as ListNode?"
                )
                return
            }
            guard let p_headB = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as ListNode?"
                )
                return
            }

            let solution = Solution()
            var resultHolder: ListNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.getIntersectionNode(p_headA, p_headB)
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
