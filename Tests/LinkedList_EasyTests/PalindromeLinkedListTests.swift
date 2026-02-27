import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPalindromeLinkedList {
    private class Solution {
        func isPalindrome(_ head: ListNode?) -> Bool {
            var slow = head, fast = head
            while fast?.next != nil { slow = slow?.next; fast = fast?.next?.next }
            var prev: ListNode? = nil
            while slow != nil { let next = slow?.next; slow?.next = prev; prev = slow; slow = next }
            var p1 = head, p2 = prev
            while p2 != nil { if p1?.val != p2?.val { return false }; p1 = p1?.next; p2 = p2?.next }
            return true
        }
    }

    @Suite struct PalindromeLinkedListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b6879ec9-7dbb-4b90-a002-08ac0cb3e34a",
             input: "head = []",
             expected: "True", orderMatters: true),
            TestCaseData(id: "c1b78685-ad1b-4c9b-9db6-132e52136fcc",
             input: "head = [1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "492099fb-ff92-4ca1-9267-d19fa9fab8bc",
             input: "head = [1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "e49271fe-b0fb-4d32-b807-5c5b868a60dc",
             input: "head = [1,2,3,2,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "21db4f5c-19bc-4980-996d-5a31aad86964",
             input: "head = [1,2,3,4,5]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "a0026586-de50-4450-9e88-a3468684608b",
             input: "head = [-1,-2,-3,-2,-1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "4ddfe2d2-a73b-474b-8ebb-e2c6d0f7da97",
             input: "head = [1,2,2,1,1]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "debe5d69-f408-405a-a0ff-d4954d0c3d6e",
             input: "head = [1,1,1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "fe77c8e5-653f-44c6-815a-5974c425f613",
             input: "head = [1,2,3,4,5,6,7,8,9,10]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "8480e50d-ceef-4084-802d-e6de595f3395",
             input: "head = [1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,3,2,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "eef5bd89-d8d8-4d7d-9f25-d820bee27c55",
             input: "head = [1,1,1,1,1,1,1,1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "dcc9e1ab-ee7d-497e-9a21-203d51840523",
             input: "head = [1,2,3,4,5,6,7,8,9]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "18dde37a-90ba-45da-8a2b-527af45be593",
             input: "head = [1,2,3,4,5,6,7,8]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "a092e090-04e3-46d2-86cc-6eca3c12413d",
             input: "head = [1,1,1,1,1,1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "2769cb86-f30f-4113-9d95-33b95c9a2e14",
             input: "head = [1,2,3,4,5,6,7]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "d1e54392-9d14-4e59-acb5-0a7054fcd6a7",
             input: "head = [1,2,3,4,5,6]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "c0b56b08-10e2-4d72-98bd-c073241e1053",
             input: "head = [1,1,1,1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "c99dac74-31e6-4f13-9734-ac436044a1cf",
             input: "head = [1,2,3,4,5,6,5,4,3,2,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "1f5e3c1b-14f1-485e-a5f0-541b0b3606f9",
             input: "head = [1,2,3,4,5,6,7,6,5,4,3,2,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "8653b550-1eff-4a8f-a524-9d78a01d51a3",
             input: "head = [1,2,3,4,5,6,7,8,7,6,5,4,3,2,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "f6580791-5fec-4100-a988-2881a2671524",
             input: "head = [1,2,3,4,5,6,7,8,9,8,7,6,5,4,3,2,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "4d8a9d5c-93eb-411e-bbcd-be8ecd5ad60f",
             input: "head = [1,2,3,4,5,6,7,8,9,10,9,8,7,6,5,4,3,2,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "a86679d3-e6e5-4ca9-ab9c-a21b10c49d1f",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "e086c75d-9b83-497e-b3ef-3f2fadb525a5",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "27f84e8d-7466-483e-a491-270278abd779",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "True", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "palindrome-linked-list"
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
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.isPalindrome(p_head)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
