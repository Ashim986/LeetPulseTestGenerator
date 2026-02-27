import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLinkedListCycleIi {
    private class Solution {
        func detectCycle(_ head: ListNode?) -> ListNode? {
            var slow = head
            var fast = head

            // Find meeting point
            while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next

                if slow === fast {
                    // Found cycle, now find start
                    var ptr = head
                    while ptr !== slow {
                        ptr = ptr?.next
                        slow = slow?.next
                    }
                    return ptr
                }
            }

            return nil
        }
    }

    @Suite struct LinkedListCycleIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4914989e-b5d2-43c3-b05e-dbc18de86d6f",
             input: "head = [1,2,3,4,5]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "12078aeb-c23b-4724-adf6-f0a01a1918ab",
             input: "head = [1,2]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "d7ea9da3-5d4e-4be8-858f-043f1a2b0b57",
             input: "head = [1]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "747c4eac-21f1-4b59-a8ef-9c9c1fc31e78",
             input: "head = []",
             expected: "null", orderMatters: true),
            TestCaseData(id: "a9e6b181-3196-4adb-837d-51f8483b0124",
             input: "head = [1,2,3,4,5,6,7,8,9,10]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "dcb4a427-340b-4f57-96ce-668b93b4f4bf",
             input: "head = [1,-2,3,-4,5]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "d49ad079-431d-4fb2-a12d-d4cb4bf3f865",
             input: "head = [1,1,1,1,1]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "e301d9aa-c793-4ec2-b350-569e3c4c5245",
             input: "head = [1,2,3,4,5,6,7,8,9,10,1]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "b13501fb-3369-405c-8c18-0bc3187b5cc9",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "413eb5e0-964e-4c0e-8274-a4b191856723",
             input: "head = [1,2,3,4,5,6,7,8,9,10,0]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "19a1a215-cd51-4e04-b559-47fc0f517537",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "b3c94bb1-d755-44c3-adc5-34a5a7f84720",
             input: "head = [1,-1,2,-2,3,-3,4,-4,5,-5]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "9f07aaed-99c3-4ab9-b635-a3f16ead7501",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "a05acfb3-f5fc-4185-8a51-4d8574c4fd24",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "6603bfac-90d9-40fe-b4aa-17e5769ce4bd",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "793c23f6-c93b-410a-a9fa-5c723a768c1f",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "530f8b74-cca4-45ab-a65e-bdd5552c1a0a",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "e05476bf-9332-4e09-89f6-3997785550e1",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "120964da-1759-44f0-b047-b2cef4a9272c",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,"
                + "92,93,94,95,96,97,98,99,100]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "377b48af-9db3-4119-a48c-696147192826",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,"
                + "92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "ff8d68f9-73ee-4692-a327-e0c7b5ff39f2",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,"
                + "92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "04db6348-a310-4a23-81b6-785e52de9716",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,"
                + "92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,"
                + "128,129,130]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "9c07953e-d1a1-4a82-8eef-0a29b0188411",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,"
                + "92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,"
                + "128,129,130,131,132,133,134,135,136,137,138,139,140]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "65c55f49-c2e0-46b1-84fc-892fe338ac38",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,"
                + "92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,"
                + "128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "e9e135fd-74b2-4fa2-8905-7653f07e5f68",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,"
                + "92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,"
                + "128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160]",
             expected: "null", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "linked-list-cycle-ii"
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
                resultHolder = solution.detectCycle(p_head)
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
