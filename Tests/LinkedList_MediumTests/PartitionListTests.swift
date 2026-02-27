import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPartitionList {
    private class Solution {
        func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
            var dummy1 = ListNode(0)
            var dummy2 = ListNode(0)
            var l1 = dummy1
            var l2 = dummy2
            var curr = head
            while curr != nil {
                if curr.unsafelyUnwrapped.val < x {
                    l1.next = curr
                    l1 = l1.next.unsafelyUnwrapped
                } else {
                    l2.next = curr
                    l2 = l2.next.unsafelyUnwrapped
                }
                curr = curr.unsafelyUnwrapped.next
            }
            l2.next = nil
            l1.next = dummy2.next
            return dummy1.next
        }
    }

    @Suite struct PartitionListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c460173f-4c75-4ac0-85a0-c61d9330bcdf",
             input: "head = [5,1,8,4,5]",
             expected: "[1,5,8,4,5]", orderMatters: true),
            TestCaseData(id: "502b9138-57ac-40bc-8b4f-a15a5e25db94",
             input: "head = [2,1]",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "10140484-b51d-49d1-b865-ac63a2740a39",
             input: "head = [1,1,1,1,1]",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "bd414839-f78a-47ae-aa23-9925b2a7cc8b",
             input: "head = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "9f87e180-ea66-45b8-bf0c-36021a717f5a",
             input: "head = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "dfd373ef-2be7-4d7c-90a7-847639a8ae3d",
             input: "head = [10,9,8,7,6,5,4,3,2,1]",
             expected: "[2,1,10,9,8,7,6,5,4,3]", orderMatters: true),
            TestCaseData(id: "3cf2bc9b-d404-4c43-b799-1de6bca19fac",
             input: "head = [1,-2,3,-4,5,-6]",
             expected: "[1,-2,-4,-6,3,5]", orderMatters: true),
            TestCaseData(id: "303a6a98-074f-4b46-bc18-33fa2f112e7e",
             input: "head = [-1,-2,-3,-4,-5,-6]",
             expected: "[-1,-2,-3,-4,-5,-6]", orderMatters: true),
            TestCaseData(id: "5d4fc070-2b99-48df-9600-af8491e12f51",
             input: "head = [0,0,0,0,0]",
             expected: "[0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "b514f876-d27c-47c7-9813-3a43c5feef69",
             input: "head = [1,0,1,0,1]",
             expected: "[1,0,1,0,1]", orderMatters: true),
            TestCaseData(id: "2f4a0830-024e-4749-b82a-160f3866008c",
             input: "head = [5,4,3,2,1]",
             expected: "[2,1,5,4,3]", orderMatters: true),
            TestCaseData(id: "602fb284-d6d2-4d80-8bdd-11489af28eac",
             input: "head = [10,20,30,40,50]",
             expected: "[10,20,30,40,50]", orderMatters: true),
            TestCaseData(id: "841db1df-6faf-4546-be9d-6fe5b54bcef2",
             input: "head = [-10,-20,-30,-40,-50]",
             expected: "[-10,-20,-30,-40,-50]", orderMatters: true),
            TestCaseData(id: "d1c2df7a-fb24-41e3-9184-2b10dda22c34",
             input: "head = [1,3,5,7,9]",
             expected: "[1,3,5,7,9]", orderMatters: true),
            TestCaseData(id: "10da362a-5586-4fe9-857b-394b01b6c510",
             input: "head = [2,4,6,8,10]",
             expected: "[2,4,6,8,10]", orderMatters: true),
            TestCaseData(id: "402afe6f-e9ef-435e-92ff-24236cad36ef",
             input: "head = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "dd612536-2bbc-492b-8981-be209f5434d3",
             input: "head = [0,1,0,1,0,1,0,1,0,1]",
             expected: "[0,1,0,1,0,1,0,1,0,1]", orderMatters: true),
            TestCaseData(id: "74df3cff-7619-46c9-bb15-25df33acbd9e",
             input: "head = [5,5,5,5,5,5,5,5,5,5]",
             expected: "[5,5,5,5,5,5,5,5,5,5]", orderMatters: true),
            TestCaseData(id: "6ed1c30a-148d-4860-9d46-7397be681307",
             input: "head = [10,5,8,4,2]",
             expected: "[2,10,5,8,4]", orderMatters: true),
            TestCaseData(id: "0041fe24-eb29-4b26-9a1a-b63ac64c6e58",
             input: "head = [1,9,2,8,3,7,4,6,5]",
             expected: "[1,2,9,8,3,7,4,6,5]", orderMatters: true),
            TestCaseData(id: "35e22112-972c-4e91-aad1-f32f471473e5",
             input: "head = [9,8,7,6,5,4,3,2,1]",
             expected: "[4,3,2,1,9,8,7,6,5]", orderMatters: true),
            TestCaseData(id: "18140611-87da-47e3-b819-51d8908d1b4f",
             input: "head = [5,1,8,4,5,1,8,4,5]",
             expected: "[1,4,1,4,5,8,5,8,5]", orderMatters: true),
            TestCaseData(id: "0380a95e-10a8-4721-8d5e-37d60f3cacba",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12]", orderMatters: true),
            TestCaseData(id: "3acc43c2-2471-470d-8427-4c37bf1890b0",
             input: "head = [12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "[4,3,2,1,12,11,10,9,8,7,6,5]", orderMatters: true),
            TestCaseData(id: "06dd3f57-a75d-424d-81fd-4615208cba45",
             input: "head = [1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1,1,1,1,1,1,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "partition-list"
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

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as ListNode?"
                )
                return
            }
            guard let p_x = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_x >= -100 && p_x <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -100 <= Node.val <= 100"
                )
                return
            }
            guard p_x >= -200 && p_x <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -200 <= x <= 200"
                )
                return
            }

            let solution = Solution()
            var resultHolder: ListNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.partition(p_head, p_x)
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
