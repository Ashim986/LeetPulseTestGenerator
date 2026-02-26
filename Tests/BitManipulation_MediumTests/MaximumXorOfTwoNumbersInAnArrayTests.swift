import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumXorOfTwoNumbersInAnArray {
    private class Solution {
        class TrieNode {
            var children = [Int: TrieNode]()
            var endOfNumber = false
        }

        func findMaximumXOR(_ nums: [Int]) -> Int {
            var root = TrieNode()
            for num in nums {
                var node = root
                var tempNum = num
                for _ in 1...31 {
                    let bit = tempNum & 1
                    tempNum >>= 1
                    if node.children[bit] == nil {
                        node.children[bit] = TrieNode()
                    }
                    node = node.children[bit].unsafelyUnwrapped
                }
                node.endOfNumber = true
            }

            func find(num: Int, node: TrieNode) -> Int {
                var result = 0
                var tempNum = num
                var node = node
                for i in 1...31 {
                    let bit = tempNum & 1
                    tempNum >>= 1
                    let oppositeBit = 1 - bit
                    if let nextNode = node.children[oppositeBit] {
                        result += (1 << (31 - i))
                        node = nextNode
                    } else if let nextNode = node.children[bit] {
                        node = nextNode
                    }
                }
                return result
            }

            var max = 0
            for num in nums {
                max = Swift.max(max, find(num: num, node: root))
            }
            return max
        }
    }

    @Suite struct MaximumXorOfTwoNumbersInAnArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "56314ba6-f935-4acc-8d21-cd296b74e78f",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c319dae5-84b1-4cc5-aa73-c396ebc600c2",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "72b5d997-ff0a-4ac6-bfd9-b6c8bb8e174f",
             input: "nums = [0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2c6d45b7-1b38-4b75-a0c8-4a95878f5237",
             input: "nums = [1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "800fcc0b-df3f-4115-9cc6-d856086de523",
             input: "nums = [-1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7c7abb0c-9662-4c34-a7d9-159b0f13965d",
             input: "nums = [2,2,2,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d5f33e7f-6ec8-4aca-9c61-261c681e8392",
             input: "nums = [1,2,3,4,5]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "b241f4ed-9187-43d4-945f-2d761db9a2c8",
             input: "nums = [5,4,3,2,1]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "346361f7-6f4b-4a35-acb1-d5dc70ecf9f4",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "e695245c-8077-484e-97e2-9d9292c04a9e",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "2f4516e6-2d6c-419d-b646-124197c50713",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "91197511-677b-488d-9d61-0255944f7999",
             input: "nums = [0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e270045d-7b9d-4cd4-8401-a3bb98a1ea39",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "63dcc8e6-a778-4f1f-a1a6-0779229c783c",
             input: "nums = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "29b18ced-c794-4c46-bfd2-cf5be30db18a",
             input: "nums = [3,10,5,25,2,8]",
             expected: "28", orderMatters: true),
            TestCaseData(id: "56385d8a-1f53-45dd-94f1-cea4c2c5a2cd",
             input: "nums = [-5,-4,-3,-2,-1]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "65edf393-6614-48ec-92ec-3896064c042a",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "0f5292d9-df02-4882-9999-5b66e35ee982",
             input: "nums = [1000,2000,3000,4000,5000]",
             expected: "7816", orderMatters: true),
            TestCaseData(id: "0b3b6a56-5cee-44bf-8d84-d4245a986038",
             input: "nums = [5000,4000,3000,2000,1000]",
             expected: "7816", orderMatters: true),
            TestCaseData(id: "4a4c2bb0-2199-46f7-80c5-3784aa0d3757",
             input: "nums = [100,200,300,400,500,600,700,800,900,1000]",
             expected: "992", orderMatters: true),
            TestCaseData(id: "cc76c896-9258-46a1-93d4-b3b21e555d0f",
             input: "nums = [1000,900,800,700,600,500,400,300,200,100]",
             expected: "992", orderMatters: true),
            TestCaseData(id: "2b94a2db-62a9-4696-b512-580240233aa7",
             input: "nums = [1,3,5,7,9,11,13,15,17,19]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "e2b5c82e-072c-4d1f-9d79-f9fdcc7a8d7b",
             input: "nums = [19,17,15,13,11,9,7,5,3,1]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "4bcf33ce-7602-47c3-a6e0-a0d4eb926e78",
             input: "nums = [2,4,6,8,10,12,14,16,18,20]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "1be8fb91-7bf3-44c7-90b2-3f459c344035",
             input: "nums = [20,18,16,14,12,10,8,6,4,2]",
             expected: "30", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-xor-of-two-numbers-in-an-array"
            let topic = "bit-manipulation"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 2 * 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.findMaximumXOR(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

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
