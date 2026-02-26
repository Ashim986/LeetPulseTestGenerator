import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMiddleOfTheLinkedList {
    private class Solution {
        func middleNode(_ head: ListNode?) -> ListNode? {
            var slow = head
            var fast = head

            while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
            }

            return slow
        }
    }

    @Suite struct MiddleOfTheLinkedListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "45f11803-1bda-409d-b2e5-0bfcffd4209f",
             input: "head = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "a472fc5c-ca09-4b86-8146-aca9e3be1d75",
             input: "head = [1,2]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "20ffe8bd-18c2-44f3-bacf-a9d3d8cac7d5",
             input: "head = [1,2,3,4,5,6,7]",
             expected: "[4,5,6,7]", orderMatters: true),
            TestCaseData(id: "a8f28e08-799b-4217-9de1-b997012a927d",
             input: "head = [1,1,1,1,1]",
             expected: "[1,1,1]", orderMatters: true),
            TestCaseData(id: "01701440-f69a-4cda-a353-ad38f6ef92cb",
             input: "head = [-1,-2,-3,-4,-5]",
             expected: "[-3,-4,-5]", orderMatters: true),
            TestCaseData(id: "26e7e6f7-88af-4dc2-b0fb-48785c59f14d",
             input: "head = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "bb8af9b4-31fa-4a76-82fe-3123e6d93fc2",
             input: "head = [0,0,0,0,0,0,0,0,0,0]",
             expected: "[0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "b047b063-ff49-46a8-850b-00b953532406",
             input: "head = [1,2,3,4,5,6,7,8,9]",
             expected: "[5,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "a28e9c54-48dd-489f-a402-3904716d25c6",
             input: "head = [1,1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "f782b03a-aadf-41c4-9ab9-c3bd93fade39",
             input: "head = [10,10,10,10,10,10,10,10,10]",
             expected: "[10,10,10,10,10]", orderMatters: true),
            TestCaseData(id: "4193ba5b-8385-497d-895a-98c8fb07923d",
             input: "head = [1,2,3,4,5,6,7,8]",
             expected: "[5,6,7,8]", orderMatters: true),
            TestCaseData(id: "b18c5a1c-f71c-446d-ab48-9a309c1b4e53",
             input: "head = [1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1]", orderMatters: true),
            TestCaseData(id: "9ecb3284-6170-410d-9adf-97792437d360",
             input: "head = [0,0,0,0,0,0,0,0]",
             expected: "[0,0,0,0]", orderMatters: true),
            TestCaseData(id: "1db8b0bd-a8d4-44bc-a7e2-f1ea0fc97e47",
             input: "head = [-10,-9,-8,-7,-6,-5,-4,-3]",
             expected: "[-6,-5,-4,-3]", orderMatters: true),
            TestCaseData(id: "6ea68ea4-3e1f-477f-92a4-5ebe4b5946ba",
             input: "head = [1,1,1,1,1,1,1]",
             expected: "[1,1,1,1]", orderMatters: true),
            TestCaseData(id: "7d352c0e-0d65-4517-ace8-2ec1072fde59",
             input: "head = [10,10,10,10,10,10,10]",
             expected: "[10,10,10,10]", orderMatters: true),
            TestCaseData(id: "1c633dc1-0234-4b42-80c1-bbda0a5228b5",
             input: "head = [1,1,1,1,1,1]",
             expected: "[1,1,1]", orderMatters: true),
            TestCaseData(id: "7ba4f5b2-d6e6-4530-a7f9-f35fe55891fc",
             input: "head = [0,0,0,0,0,0]",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "b83f5f5f-d5fe-49df-98a3-9a0c01881c24",
             input: "head = [-10,-9,-8,-7,-6,-5]",
             expected: "[-7,-6,-5]", orderMatters: true),
            TestCaseData(id: "ea4ec890-4c49-4d8c-8fd6-180886a096e5",
             input: "head = [1,3,5,7,9]",
             expected: "[5,7,9]", orderMatters: true),
            TestCaseData(id: "8de42320-2f64-4f83-92c1-61a91a4c088f",
             input: "head = [2,4,6,8,10]",
             expected: "[6,8,10]", orderMatters: true),
            TestCaseData(id: "4c88c89b-6118-462a-b0a8-a4d1439e60c6",
             input: "head = [1,2,3,4]",
             expected: "[3,4]", orderMatters: true),
            TestCaseData(id: "8ad1844c-73ff-49c7-9ae2-239bbfe391fc",
             input: "head = [1,1,1,1]",
             expected: "[1,1]", orderMatters: true),
            TestCaseData(id: "9caa86e9-1095-478a-af1d-d609f8d4ae7c",
             input: "head = [0,0,0,0]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "2d6069d7-b2b0-4aae-afb5-1ab648acf3f9",
             input: "head = []",
             expected: "[]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "middle-of-the-linked-list"
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
            let result = solution.middleNode(p_head)
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
