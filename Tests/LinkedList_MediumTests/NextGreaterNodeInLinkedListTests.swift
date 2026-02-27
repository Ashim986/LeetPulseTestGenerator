import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNextGreaterNodeInLinkedList {
    private class Solution {
        func nextLargerNodes(_ head: ListNode?) -> [Int] {
            var list = [Int]()
            var current = head
            while current != nil {
                list.append(current.unsafelyUnwrapped.val)
                current = current.unsafelyUnwrapped.next
            }

            var stack: [(index: Int, value: Int)] = []
            var result = Array(repeating: 0, count: list.count)

            for i in 0..<list.count {
                while !stack.isEmpty && list[i] > stack[stack.count - 1].value {
                    let lastIndex = stack.removeLast().index
                    result[lastIndex] = list[i]
                }
                stack.append((index: i, value: list[i]))
            }

            return result
        }
    }

    @Suite struct NextGreaterNodeInLinkedListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f9d12d6c-f5a8-4d6a-9da4-a288fd2e40ee",
             input: "head = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "78db1c29-be21-4506-8501-3e5e67fbfd54",
             input: "head = [1]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "a26d2efa-ea1b-4feb-89f7-8932d3d90560",
             input: "head = [5,4,3,2,1]",
             expected: "[0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "dab2fbd7-4250-447f-97e1-26dca3222a5b",
             input: "head = [1,2,3,4,5]",
             expected: "[2, 3, 4, 5, 0]", orderMatters: true),
            TestCaseData(id: "1d169f79-57f7-4c9b-965c-1d51b5f3d52e",
             input: "head = [10,20,30,40,50]",
             expected: "[20, 30, 40, 50, 0]", orderMatters: true),
            TestCaseData(id: "21d780a8-cf7e-4929-8cd9-4e490a5f1d16",
             input: "head = [50,40,30,20,10]",
             expected: "[0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "a27a7e23-67fc-415d-ae67-e37294462027",
             input: "head = [1,1,1,1,1]",
             expected: "[0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "e30cb4d0-8171-43b6-86b6-627e6cb51825",
             input: "head = [-1,-2,-3,-4,-5]",
             expected: "[0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "e86836a2-2e60-4074-8445-c7d1148737e9",
             input: "head = [5,5,5,5,5]",
             expected: "[0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "c1bece48-811e-4ccf-b47e-87a46639af4e",
             input: "head = [10,5,20,15,30]",
             expected: "[20, 20, 30, 30, 0]", orderMatters: true),
            TestCaseData(id: "627a0c02-7a96-4631-98b1-cadeec21ce5c",
             input: "head = [1,100,1,100,1]",
             expected: "[100, 0, 100, 0, 0]", orderMatters: true),
            TestCaseData(id: "43efb42d-6338-4e91-bb84-e90fb8e56ae2",
             input: "head = [100,1,100,1,100]",
             expected: "[0, 100, 0, 100, 0]", orderMatters: true),
            TestCaseData(id: "ece13ef5-660f-4c8e-8f7e-c8a3c30bd878",
             input: "head = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[2, 3, 4, 5, 6, 7, 8, 9, 10, 0]", orderMatters: true),
            TestCaseData(id: "d974d7b7-2103-4e63-a84c-ba6f97c37774",
             input: "head = [10,9,8,7,6,5,4,3,2,1]",
             expected: "[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "3039007a-0753-44d9-834e-bfaebc149598",
             input: "head = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "72ce31d3-f8eb-42fc-9fe1-4c2f18a12d3a",
             input: "head = [5,10,15,20,25,30,35,40,45,50]",
             expected: "[10, 15, 20, 25, 30, 35, 40, 45, 50, 0]", orderMatters: true),
            TestCaseData(id: "2877b703-faca-45c2-b47b-38e7ae35fe19",
             input: "head = [50,45,40,35,30,25,20,15,10,5]",
             expected: "[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "cb99429c-ca2b-4d45-abca-98e800419824",
             input: "head = [1,3,5,7,9,11,13,15,17,19]",
             expected: "[3, 5, 7, 9, 11, 13, 15, 17, 19, 0]", orderMatters: true),
            TestCaseData(id: "1db06691-8486-4e47-8df6-3fd42f9dbc81",
             input: "head = [19,17,15,13,11,9,7,5,3,1]",
             expected: "[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "15a19703-bfc1-4edb-8de2-ec211e39067c",
             input: "head = [10,20,30,10,20,30,10,20,30,10]",
             expected: "[20, 30, 0, 20, 30, 0, 20, 30, 0, 0]", orderMatters: true),
            TestCaseData(id: "9188310c-621b-4c3d-8a84-f008e04c5840",
             input: "head = [10,10,10,10,10,10,10,10,10,10]",
             expected: "[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "02cc6d44-c0a0-4145-bb51-89618ce73029",
             input: "head = [5,15,25,35,45,55,65,75,85,95]",
             expected: "[15, 25, 35, 45, 55, 65, 75, 85, 95, 0]", orderMatters: true),
            TestCaseData(id: "bc03669f-d54a-427e-878b-9416e661e0ef",
             input: "head = [95,85,75,65,55,45,35,25,15,5]",
             expected: "[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "e1dc54a3-439b-4158-b5e9-47e058010fc8",
             input: "head = [1,100,1,100,1,100,1,100,1,100]",
             expected: "[100, 0, 100, 0, 100, 0, 100, 0, 100, 0]", orderMatters: true),
            TestCaseData(id: "7accc8b9-85b3-46f5-9c0e-8a2363729046",
             input: "head = [10,20,10,20,10,20,10,20,10,20]",
             expected: "[20, 0, 20, 0, 20, 0, 20, 0, 20, 0]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "next-greater-node-in-linked-list"
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
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.nextLargerNodes(p_head)
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

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
