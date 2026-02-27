import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAvailableCapturesForRook {
    private class Solution {
        func numRookCaptures(_ board: [[Character]]) -> Int {
            var res = 0
            for i in 0...7 {
                for j in 0...7 {
                    if board[i][j] == "R" {
                        var x = i
                        var y = j
                        // check up
                        while x > 0 {
                            x -= 1
                            if board[x][y] == "p" {
                                res += 1
                                break
                            } else if board[x][y] == "B" {
                                break
                            }
                        }
                        // check down
                        x = i
                        while x < 7 {
                            x += 1
                            if board[x][y] == "p" {
                                res += 1
                                break
                            } else if board[x][y] == "B" {
                                break
                            }
                        }
                        // check left
                        x = i
                        while y > 0 {
                            y -= 1
                            if board[x][y] == "p" {
                                res += 1
                                break
                            } else if board[x][y] == "B" {
                                break
                            }
                        }
                        // check right
                        y = j
                        while y < 7 {
                            y += 1
                            if board[x][y] == "p" {
                                res += 1
                                break
                            } else if board[x][y] == "B" {
                                break
                            }
                        }
                    }
                }
            }
            return res
        }
    }

    @Suite struct AvailableCapturesForRookTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "caa728d6-02b7-4fd7-a334-e29e2be3245f",
             input: "board = [[\".\",\".\",\".\",\".\",\".\",\".\",\".\",\".\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e7d942e7-3521-4d25-8978-6ea6e0a41747",
             input: "board = [[\"R\",\".\",\".\",\".\",\".\",\".\",\".\",\".\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c8acd6b5-708d-4c83-aab5-bbadc195867c",
             input: "board = [[\".\",\".\",\".\",\".\",\".\",\".\",\".\",\"R\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a5190bd3-d61d-4e56-8b54-b4db3711991f",
             input: "board = [[\"p\",\".\",\".\",\".\",\".\",\".\",\".\",\".\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2a1adc52-dee6-4ee4-88c8-2dcb6fafa327",
             input: "board = [[\"R\",\".\",\".\",\".\",\".\",\".\",\".\",\"p\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ebf12d6c-1971-4ce7-9f73-6284778c1139",
             input: "board = [[\"p\",\".\",\".\",\".\",\".\",\".\",\".\",\"R\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c044de52-e9d7-40fc-bc23-229565cf3327",
             input: "board = [[\".\",\".\",\".\",\"R\",\".\",\".\",\".\",\".\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "05402b00-4d42-4d6e-9961-c8d1404ba9b2",
             input: "board = [[\".\",\".\",\".\",\"R\",\".\",\".\",\".\",\"p\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1ef48b15-34db-47e1-a80e-edc191ece854",
             input: "board = [[\".\",\".\",\".\",\"p\",\".\",\".\",\".\",\"R\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "35d7a7e4-09b6-45fc-9d63-2057c4b73fc0",
             input: "board = [[\".\",\".\",\".\",\"R\",\".\",\".\",\"p\",\".\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "eaf9e9f3-014a-428a-b04b-1bdfd69e7594",
             input: "board = [[\".\",\".\",\".\",\"p\",\".\",\".\",\"R\",\".\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "634cf618-7b7f-49a4-97bd-d3b25d144780",
             input: "board = [[\".\",\".\",\"R\",\".\",\".\",\".\",\".\",\".\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b81d1bf7-5f9d-41da-9e95-cde637204793",
             input: "board = [[\".\",\".\",\"R\",\".\",\".\",\".\",\".\",\"p\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "36085a86-4850-4798-83ec-9847858d379f",
             input: "board = [[\".\",\".\",\"p\",\".\",\".\",\".\",\".\",\"R\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "54d7c1de-d63c-4af4-b267-c69467381f2e",
             input: "board = [[\".\",\"R\",\".\",\".\",\".\",\".\",\".\",\".\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e1b6665e-976a-4480-9e07-1fda2fe51475",
             input: "board = [[\".\",\"R\",\".\",\".\",\".\",\".\",\".\",\"p\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8eb82b56-e2ad-493b-9aab-20fe32f92b3e",
             input: "board = [[\".\",\"p\",\".\",\".\",\".\",\".\",\".\",\"R\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "13a2e584-2c73-4e37-9a59-0b7cfcc4d1b4",
             input: "board = [[\"R\",\".\",\".\",\".\",\".\",\".\",\"p\",\".\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "21c72ae3-ae67-4234-8161-094b52aefcf2",
             input: "board = [[\"p\",\".\",\".\",\".\",\".\",\".\",\"R\",\".\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "43eb11c0-b372-41d1-98d2-b12d76aa6f6d",
             input: "board = [[\"R\",\".\",\".\",\".\",\".\",\"p\",\".\",\".\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2c8c118a-57e0-4dde-aa11-fab55e05c075",
             input: "board = [[\"p\",\".\",\".\",\".\",\".\",\"R\",\".\",\".\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f842b57b-025f-417e-a7e0-d76ec8d796be",
             input: "board = [[\"R\",\".\",\".\",\".\",\"p\",\".\",\".\",\".\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "06979606-fb48-47d8-8dfd-808177178d11",
             input: "board = [[\"p\",\".\",\".\",\".\",\"R\",\".\",\".\",\".\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8f695808-122b-4156-a71d-88b769131aa8",
             input: "board = [[\".\",\".\",\".\",\".\",\".\",\".\",\".\",\"p\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fac68824-fbd5-4add-be1e-fd3e47e2577f",
             input: "board = [[\".\",\".\",\".\",\"p\",\".\",\".\",\".\",\".\"]]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "available-captures-for-rook"
            let topic = "arrays-hashing"
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

            guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Character]]"
                )
                return
            }
            guard p_board.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_board.count == 8 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: board.length == 8"
                )
                return
            }
            guard p_board.count == 8 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: board[i].length == 8"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.numRookCaptures(p_board)
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
