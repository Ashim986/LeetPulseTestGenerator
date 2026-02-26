import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRevealCardsInIncreasingOrder {
    private class Solution {
        func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
            let sortedDeck = deck.sorted()
            var queue = Array(0..<deck.count)
            var result = [Int](repeating: 0, count: deck.count)
            var index = 0
            for card in sortedDeck {
                let revealedIndex = queue.removeFirst()
                result[revealedIndex] = card
                if !queue.isEmpty {
                    queue.append(queue.removeFirst())
                }
            }
            return result
        }
    }

    @Suite struct RevealCardsInIncreasingOrderTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "aa0d3ed0-3de9-45e4-9e27-553dcf1cc6de",
             input: "deck = []",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "f2a6c812-449e-476a-a701-325073e4230a",
             input: "deck = [1]",
             expected: "[1]", orderMatters: false),
            TestCaseData(id: "cf3673a4-ed35-4c8b-92bf-3a7f996de0fa",
             input: "deck = [1, 2]",
             expected: "[1, 2]", orderMatters: false),
            TestCaseData(id: "9d5639af-d843-4b30-9da9-32bc37b19040",
             input: "deck = [2, 1]",
             expected: "[1, 2]", orderMatters: false),
            TestCaseData(id: "43c48211-5aa9-4a7d-a2e6-70dde9161db7",
             input: "deck = [1, 2, 3, 4, 5]",
             expected: "[1, 3, 5, 2, 4]", orderMatters: false),
            TestCaseData(id: "0e3936cc-f4af-4fc7-9db3-2f83932637f5",
             input: "deck = [5, 4, 3, 2, 1]",
             expected: "[1, 3, 5, 2, 4]", orderMatters: false),
            TestCaseData(id: "4650602e-39f4-4a03-a91c-da4e19be16b1",
             input: "deck = [-1, 0, 1]",
             expected: "[-1, 1, 0]", orderMatters: false),
            TestCaseData(id: "80f1121d-f452-4822-896e-14a29e4b98c2",
             input: "deck = [-10, -5, 0, 5, 10]",
             expected: "[-10, -5, 0, 5, 10]", orderMatters: false),
            TestCaseData(id: "693d9628-c498-46ff-8136-3c64e9ada151",
             input: "deck = [1000, 2000, 3000, 4000, 5000]",
             expected: "[1000, 3000, 5000, 2000, 4000]", orderMatters: false),
            TestCaseData(id: "5ebfb85a-51e7-4394-9154-dd704d85ec76",
             input: "deck = [25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "[1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 25]", orderMatters: false),
            TestCaseData(id: "211d3d99-7947-4c0f-8641-dafc4313f011",
             input: "deck = [17,13,11,2,3,5,7]",
             expected: "[2,13,3,11,5,17,7]", orderMatters: false),
            TestCaseData(id: "b70c4378-6c89-4de5-9287-7cf9dad95cec",
             input: "deck = [1,1000]",
             expected: "[1,1000]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reveal-cards-in-increasing-order"
            let topic = "arrays-hashing"
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

            guard let p_deck = InputParser.parseIntArray(params[0]) else {
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
            guard p_deck.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: deck array too large (\(p_deck.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_deck.count >= 1 && p_deck.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= deck.length <= 1000"
                )
                return
            }
            guard p_deck.allSatisfy({ $0 >= 1 && $0 <= 1000000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= deck[i] <= 10^6"
                )
                return
            }

            let solution = Solution()
            let result = solution.deckRevealedIncreasing(p_deck)
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
