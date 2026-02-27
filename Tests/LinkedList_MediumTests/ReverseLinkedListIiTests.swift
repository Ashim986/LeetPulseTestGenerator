import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReverseLinkedListIi {
    private class Solution {
        func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
            if head == nil || left == right { return head }
            let dummy = ListNode(0)
            dummy.next = head
            var pre: ListNode? = dummy

            var pos = 1
            while pos < left {
                pre = pre?.next
                pos += 1
            }

            let start = pre?.next
            var then = start?.next
            var i = 0
            while i < right - left {
                start?.next = then?.next
                then?.next = pre?.next
                pre?.next = then
                then = start?.next
                i += 1
            }

            return dummy.next
        }
    }

    @Suite struct ReverseLinkedListIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6552374C-8FE8-45FA-B301-AF1AFFAB5E46",
             input: "[1,2,3,4,5]\n1\n3",
             expected: "[3,2,1,4,5]", orderMatters: true),
            TestCaseData(id: "0795F064-FEA8-4633-B86A-BDFD4B5DFC4D",
             input: "[5]",
             expected: "[5]", orderMatters: true),
            TestCaseData(id: "3A9B961C-1FC1-42A0-BA5C-A848AD584992",
             input: "[1,2]\n1\n1",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "1B5F8741-F3C5-4DB7-A682-DDD2C1D62805",
             input: "[1,2,3,4,5]\n1\n5",
             expected: "[5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "05C23E4A-A190-45C5-A378-3A9F883CC9B2",
             input: "[1,2]\n2\n2",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "2359C0ED-8C1F-479D-8370-F11F47CCE55F",
             input: "[5]\n1\n1",
             expected: "[5]", orderMatters: true),
            TestCaseData(id: "2BFD9E3C-79FC-408E-9727-68DD015B487E",
             input: "[1,2,3,4,5]\n2\n4",
             expected: "[1,4,3,2,5]", orderMatters: true),
            TestCaseData(id: "B4AD86AE-A788-415D-91CF-0B7AA85C9B05",
             input: "[1,2,3,4,5]\n1\n2",
             expected: "[2,1,3,4,5]", orderMatters: true),
            TestCaseData(id: "BA247A60-5578-46ED-8C17-8B5B15AC35D9",
             input: "[1,2,3,4,5]\n4\n5",
             expected: "[1,2,3,5,4]", orderMatters: true),
            TestCaseData(id: "5DDC8208-83DF-4AD2-807D-62846EA26086",
             input: "[1,1,1,1]\n1\n4",
             expected: "[1,1,1,1]", orderMatters: true),
            TestCaseData(id: "DE1102D8-DB4E-4B5D-8F15-CC5F47BA940F",
             input: "[1,1,1,1]\n2\n3",
             expected: "[1,1,1,1]", orderMatters: true),
            TestCaseData(id: "4B7227CF-3435-4AE0-AD1D-F9C50715D78D",
             input: "[-1,-2,-3,-4,-5]\n1\n5",
             expected: "[-5,-4,-3,-2,-1]", orderMatters: true),
            TestCaseData(id: "86F08AA0-2CB7-4207-8C57-4E1899F4A6AB",
             input: "[1,-2,3,-4,5]\n1\n2",
             expected: "[-2,1,3,-4,5]", orderMatters: true),
            TestCaseData(id: "D54F5825-7086-4504-9170-633FB5A294A6",
             input: "[1,2,3,4,5]\n5\n5",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "604D6A9A-7EF0-4E14-9416-3D83B5EA1EC2",
             input: "[1,2,3,4,5]\n3\n3",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "17F67BAD-9D7A-4933-A965-E15A99BADDD6",
             input: "[1,1,1,1,1]\n1\n5",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "46491355-AD14-415E-BE4C-4BA6DB1DF555",
             input: "[1,2,3,4,5]\n1\n1",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "FCE602BC-89AC-4E34-B94B-35980B127129",
             input: "[1,2,3,4,5]\n4\n4",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "656FDA94-C4A5-40F9-BFAC-2F99057EB911",
             input: "[1,-1,2,-2,3,-3]\n1\n6",
             expected: "[-3,3,-2,2,-1,1]", orderMatters: true),
            TestCaseData(id: "92C42241-41DD-448D-9FA1-15072B8D0F3D",
             input: "[1,2,3,4,5,6,7,8,9,10]\n5\n6",
             expected: "[1,2,3,4,6,5,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "8FE00FA7-F73B-4DEF-94D6-D4E05CA85038",
             input: "[10,9,8,7,6,5,4,3,2,1]\n1\n10",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "84B21292-4C7D-4982-BA8D-E45F88373240",
             input: "[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]\n1\n10",
             expected: "[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]", orderMatters: true),
            TestCaseData(id: "3733B35B-E3AC-40A6-994A-209EAE31BAD0",
             input: "[1,2,3,4,5,6,7,8,9,10]\n1\n10",
             expected: "[10,9,8,7,6,5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "8560C668-E648-4F27-912D-473ACA3DA1ED",
             input: "[1,-1,1,-1,1,-1,1,-1,1,-1]\n1\n10",
             expected: "[1,-1,1,-1,1,-1,1,-1,1,-1]", orderMatters: true),
            TestCaseData(id: "75031C8D-9EBF-45A6-97E4-78F9237001B3",
             input: "[1,2,3,4,5]\n6\n6",
             expected: "[1,2,3,4,5]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reverse-linked-list-ii"
            let topic = "linked-list"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
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
            guard let p_left = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_right = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_left >= -500 && p_left <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -500 <= Node.val <= 500"
                )
                return
            }
            guard p_left >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= left <= right <= n"
                )
                return
            }
            guard p_right >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= left <= right <= n"
                )
                return
            }

            let solution = Solution()
            var resultHolder: ListNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.reverseBetween(p_head, p_left, p_right)
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
