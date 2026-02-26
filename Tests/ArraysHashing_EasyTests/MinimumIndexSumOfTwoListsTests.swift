import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumIndexSumOfTwoLists {
    private class Solution {
        func findRestaurant(list1: [String], list2: [String]) -> [Int] {
            var dict: [String: Int] = [:]
            var minSum = Int.max
            var result: [Int] = []
            for i in 0..<list1.count {
                dict[list1[i]] = i
            }
            for j in 0..<list2.count {
                if let i = dict[list2[j]] {
                    let sum = i + j
                    if sum < minSum {
                        minSum = sum
                        result = [i, j]
                    }
                    else if sum == minSum {
                        result.append(i)
                        result.append(j)
                    }
                }
            }
            return result
        }
    }

    @Suite struct MinimumIndexSumOfTwoListsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "28454b67-fa79-4933-8e19-e3d7ae4e5e9c",
             input: "list1 = [\"A\"], list2 = [\"B\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "071c99ba-96e4-464a-85cb-925cc4910f17",
             input: "list1 = [\"A\", \"B\", \"C\"], list2 = [\"D\", \"E\", \"F\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "dd4794e1-698d-4d28-ac1f-ea0ce1767f87",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"K\", \"L\", \"M\", \"N\", \"O\", \"P\", \"Q\""
                + ", \"R\", \"S\", \"T\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "e861d93d-6377-4a35-812e-2801507d8691",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\"], list2 = [\"F\", \"G\", \"H\", \"I\", \"J\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "0e3e29cf-1e54-4596-8a37-6a2d2b0ee048",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\"], list2 = [\"K\", \"L\", \"M\", \"N\", \"O\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "6666bd8a-6f4c-4e8f-8258-4cb0f6910377",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\"], list2 = [\"P\", \"Q\", \"R\", \"S\", \"T\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "3d86b3f8-9373-45e4-940e-b5cc26722789",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\"], list2 = [\"U\", \"V\", \"W\", \"X\", \"Y\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "7a0924e9-6427-4d13-8003-0653824bce1b",
             input: "list1 = [\"A\"], list2 = [\"A\"]",
             expected: "[0,0]", orderMatters: false),
            TestCaseData(id: "eb2fc867-b478-4722-8d52-dffa45ad8d88",
             input: "list1 = [\"A\", \"B\"], list2 = [\"A\", \"B\"]",
             expected: "[0,0]", orderMatters: false),
            TestCaseData(id: "26939536-1ff1-4461-abd2-a8039ec3fab9",
             input: "list1 = [\"A\", \"B\"], list2 = [\"B\", \"A\"]",
             expected: "[0,1,1,0]", orderMatters: false),
            TestCaseData(id: "129634e0-e8c2-4461-b6f9-10ccd70d4f67",
             input: "list1 = [\"A\", \"B\", \"C\"], list2 = [\"A\", \"B\", \"C\"]",
             expected: "[0,0]", orderMatters: false),
            TestCaseData(id: "cda70894-8104-42dd-84a3-cb329f047c9f",
             input: "list1 = [\"A\", \"B\", \"C\"], list2 = [\"C\", \"B\", \"A\"]",
             expected: "[0,2,1,1,2,0]", orderMatters: false),
            TestCaseData(id: "b2dfa280-3916-4cb0-98f1-b739e358d0c8",
             input: "list1 = [\"A\", \"A\", \"A\"], list2 = [\"A\", \"A\", \"A\"]",
             expected: "[0,0]", orderMatters: false),
            TestCaseData(id: "4b33c58f-affe-4392-8ad4-18fbb6c57629",
             input: "list1 = [\"A\", \"B\", \"C\"], list2 = [\"A\", \"A\", \"A\"]",
             expected: "[0,0]", orderMatters: false),
            TestCaseData(id: "8eeb0885-c2f1-4102-a7ce-2bc230dfd723",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\""
                + ", \"H\", \"I\", \"J\"]",
             expected: "[0,0]", orderMatters: false),
            TestCaseData(id: "40325873-325e-4870-b5c9-c13d34411a8e",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"J\", \"I\", \"H\", \"G\", \"F\", \"E\", \"D\""
                + ", \"C\", \"B\", \"A\"]",
             expected: "[0,9,1,8,2,7,3,6,4,5,5,4,6,3,7,2,8,1,9,0]", orderMatters: false),
            TestCaseData(id: "85febc7d-860f-462c-9857-f2b5a0343d82",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"A\", \"K\", \"L\", \"M\", \"N\", \"O\", \"P\""
                + ", \"Q\", \"R\", \"S\"]",
             expected: "[0,0]", orderMatters: false),
            TestCaseData(id: "15b48b1a-c538-45b5-8acf-71a97a0453ec",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"K\", \"A\", \"L\", \"M\", \"N\", \"O\", \"P\""
                + ", \"Q\", \"R\", \"S\"]",
             expected: "[0,1]", orderMatters: false),
            TestCaseData(id: "7125f3c5-0bbb-4262-826e-601bfc9d9f45",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"K\", \"L\", \"A\", \"M\", \"N\", \"O\", \"P\""
                + ", \"Q\", \"R\", \"S\"]",
             expected: "[0,2]", orderMatters: false),
            TestCaseData(id: "361f32bf-ae52-4487-9a4c-d8fea0204eca",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"K\", \"L\", \"M\", \"A\", \"N\", \"O\", \"P\""
                + ", \"Q\", \"R\", \"S\"]",
             expected: "[0,3]", orderMatters: false),
            TestCaseData(id: "fd6e6aac-41f3-4657-84c9-d5d8244096bd",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"K\", \"L\", \"M\", \"N\", \"A\", \"O\", \"P\""
                + ", \"Q\", \"R\", \"S\"]",
             expected: "[0,4]", orderMatters: false),
            TestCaseData(id: "e99f9a32-bfe0-4fe0-b0ee-bd1b8fe9f5f9",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"K\", \"L\", \"M\", \"N\", \"O\", \"A\", \"P\""
                + ", \"Q\", \"R\", \"S\"]",
             expected: "[0,5]", orderMatters: false),
            TestCaseData(id: "e4b6b13f-31f1-4a2a-8446-9d5e22ced799",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"K\", \"L\", \"M\", \"N\", \"O\", \"P\", \"A\""
                + ", \"Q\", \"R\", \"S\"]",
             expected: "[0,6]", orderMatters: false),
            TestCaseData(id: "cccb3fec-c56a-4b26-8987-3a692959c8c3",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"K\", \"L\", \"M\", \"N\", \"O\", \"P\", \"Q\""
                + ", \"A\", \"R\", \"S\"]",
             expected: "[0,7]", orderMatters: false),
            TestCaseData(id: "0f62c0cf-66c5-4bb1-9f2b-b60722c63e84",
             input: "list1 = [\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\"], list2 = [\"K\", \"L\", \"M\", \"N\", \"O\", \"P\", \"Q\""
                + ", \"R\", \"A\", \"S\"]",
             expected: "[0,8]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-index-sum-of-two-lists"
            let topic = "arrays-hashing"
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

            guard let p_list1 = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_list1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: list1 array too large (\(p_list1.count))"
                )
                return
            }
            guard let p_list2 = InputParser.parseStringArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [String]"
                )
                return
            }
            guard p_list2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: list2 array too large (\(p_list2.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_list1.count >= 1 && p_list1.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= list1.length, list2.length <= 1000"
                )
                return
            }
            guard p_list2.count >= 1 && p_list2.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= list1.length, list2.length <= 1000"
                )
                return
            }
            guard p_list1.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= list1[i].length, list2[i].length <= 30"
                )
                return
            }
            guard p_list2.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= list1[i].length, list2[i].length <= 30"
                )
                return
            }

            let solution = Solution()
            let result = solution.findRestaurant(list1: p_list1, list2: p_list2)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
