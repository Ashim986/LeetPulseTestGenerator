import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAddTwoNumbers {
    private class Solution {
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            let dummy = ListNode(0)
            var tail = dummy
            var p1 = l1
            var p2 = l2
            var carry = 0

            while p1 != nil || p2 != nil || carry > 0 {
                let val1 = p1?.val ?? 0
                let val2 = p2?.val ?? 0
                let sum = val1 + val2 + carry

                carry = sum / 10
                tail.next = ListNode(sum % 10)
                tail = tail.next.unsafelyUnwrapped

                p1 = p1?.next
                p2 = p2?.next
            }

            return dummy.next
        }
    }

    @Suite struct AddTwoNumbersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "C8B6A31A-6DED-46A8-9121-F55DA40C87C6",
             input: "[2,4,3]\n[5,6,4]",
             expected: "[7,0,8]", orderMatters: true),
            TestCaseData(id: "ACB900FE-0529-4A56-9149-1FDB0320F2A5",
             input: "[0]\n[0]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "942947AC-2D6F-47AB-887F-797D79BDA082",
             input: "[9,9,9,9,9,9,9]\n[9,9,9,9]",
             expected: "[8,9,9,9,0,0,0,1]", orderMatters: true),
            TestCaseData(id: "7909F5A5-6E5F-4720-99DA-D1DC75B0E61D",
             input: "[1]\n[9,9]",
             expected: "[0,0,1]", orderMatters: true),
            TestCaseData(id: "C0CF6749-242E-47EC-A695-A3F198EDA92E",
             input: "[9,9]\n[1]",
             expected: "[0,0,1]", orderMatters: true),
            TestCaseData(id: "58FE43AA-8EA5-4A2E-81CF-6170B05150C7",
             input: "[5]\n[5]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "335166D7-81D4-4B1F-8DB7-A364C1AD3BC0",
             input: "[1,8]\n[0]",
             expected: "[1,8]", orderMatters: true),
            TestCaseData(id: "5CEFADF2-E687-47B3-BE12-AD3A043C23C3",
             input: "[0]\n[1,8]",
             expected: "[1,8]", orderMatters: true),
            TestCaseData(id: "87C9A7E0-7ED2-4719-91D2-BB4065C01438",
             input: "[1,2,3,4,5]\n[5,4,3,2,1]",
             expected: "[6,6,6,6,6]", orderMatters: true),
            TestCaseData(id: "FC88E33F-EB07-44D2-8058-A93631772C31",
             input: "[9,9]\n[9,9]",
             expected: "[8,9,1]", orderMatters: true),
            TestCaseData(id: "5846C5D7-C3F8-4C53-A206-3970811DFA9F",
             input: "[1,1,1]\n[1,1,1]",
             expected: "[2,2,2]", orderMatters: true),
            TestCaseData(id: "E2CAE0D4-7ED1-42A3-A8C7-DB2405BB62A9",
             input: "[1]\n[0]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "60DC5F9D-5FC2-4ED3-9F7C-D9E1769AE5F5",
             input: "[0]\n[1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "5AEA2244-D36B-495B-B174-296DAE794135",
             input: "[1,0,0,0,0,0,0,0,0,0,1]\n[1,0,0,0,0,0,0,0,0,0,1]",
             expected: "[2,0,0,0,0,0,0,0,0,0,2]", orderMatters: true),
            TestCaseData(id: "CE77413D-7817-4A57-8991-69EE5876BABC",
             input: "[1,2,3]\n[4,5,6]",
             expected: "[5,7,9]", orderMatters: true),
            TestCaseData(id: "084F9DC6-E8CA-4691-9C28-F945E9854460",
             input: "[4,5,6]\n[1,2,3]",
             expected: "[5,7,9]", orderMatters: true),
            TestCaseData(id: "D5B16E7C-2328-4723-A9E9-9B3267FF6780",
             input: "[1,8,3]\n[0,1,2]",
             expected: "[1,9,5]", orderMatters: true),
            TestCaseData(id: "B6CF3F30-9BC4-4D11-97D9-5E6131799BD0",
             input: "[3,8,1]\n[2,1,0]",
             expected: "[5,9,1]", orderMatters: true),
            TestCaseData(id: "742D3AAF-4C55-4825-A600-4B3F2209C963",
             input: "[9,9,9]\n[1]",
             expected: "[0,0,0,1]", orderMatters: true),
            TestCaseData(id: "4C2750D5-D4BF-4A98-84E6-30326F85993D",
             input: "[2,0,1]\n[2,0,1]",
             expected: "[4,0,2]", orderMatters: true),
            TestCaseData(id: "7DF846D6-4D58-4C04-9FF1-D2460B0907EB",
             input: "[1,1,1,1,1]\n[9,9,9,9,9]",
             expected: "[0,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "25F9828F-C1F3-4BFA-AC33-179C644A50EB",
             input: "[9,9,9,9,9]\n[1,1,1,1,1]",
             expected: "[0,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "4880CC0F-A8CE-4D9A-B0E5-8B52E0CDB191",
             input: "[7]\n[3]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "C2FBA889-9FC3-40FC-A8C8-518B0BEA0F15",
             input: "[3]\n[7]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "29293B7A-BB81-4B30-A544-E34FDACC1D1B",
             input: "[1,2,3]\n[1,2,3]",
             expected: "[2,4,6]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "add-two-numbers"
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

            guard let p_l1 = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as ListNode?"
                )
                return
            }
            guard let p_l2 = InputParser.parseIntArray(params[1]).map({ buildList($0) }) else {
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
                resultHolder = solution.addTwoNumbers(p_l1, p_l2)
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
