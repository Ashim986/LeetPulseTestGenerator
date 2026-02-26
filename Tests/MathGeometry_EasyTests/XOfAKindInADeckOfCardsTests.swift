import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCXOfAKindInADeckOfCards {
    private class Solution {
        func isNStraightHand(_ deck: [Int], _ handSize: Int) -> Bool {
            if deck.count % handSize != 0 {
                return false
            }
            var count: [Int: Int] = [:]
            for num in deck {
                if let value = count[num] {
                    count[num] = value + 1
                } else {
                    count[num] = 1
                }
            }
            let sortedKeys = Array(count.keys).sorted()
            var prev = sortedKeys[0]
            var groupSize = count[prev].unsafelyUnwrapped
            for key in sortedKeys[1...] {
                if key - prev != 1 {
                    return false
                }
                if count[key].unsafelyUnwrapped < groupSize {
                    return false
                }
                prev = key
                groupSize = count[key].unsafelyUnwrapped
            }
            return true
        }
    }

    @Suite struct XOfAKindInADeckOfCardsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "aeb14bb5-dc8f-4647-96dd-4d2e334215b3",
             input: "deck = [1,2,3,4,5], handSize = 5",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e8581af1-0a56-452e-8ecd-a12c75014d76",
             input: "deck = [1,2,3,4,5,6,7,8,9], handSize = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0f208f7e-8237-440a-acdb-ab687b211096",
             input: "deck = [1,2,3,4,5,6,7,8,9,10], handSize = 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6a7d984f-826c-4074-bde4-9d7cea808078",
             input: "deck = [1,2,3,4,5,6,7,8,9,10,11,12], handSize = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6974a263-aeac-4222-82fa-1bba31345739",
             input: "deck = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], handSize = 5",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1a9ff605-1797-4043-ae31-fd96519472e0",
             input: "deck = [1], handSize = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c96d2548-02e9-4ade-b103-2436405e3a33",
             input: "deck = [1,2,3], handSize = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a77079fa-8d10-469e-9bef-443f088f47f4",
             input: "deck = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], handSize = 5",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ac901b7b-c39d-4378-9aa5-abd073bf9a7b",
             input: "deck = [1,2,3,4,5,6], handSize = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "38643eb9-de04-4e47-84a7-7d5f3cc07490",
             input: "deck = [1,1,1,2,2,2,3,3,3], handSize = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "72077b55-5e1b-4412-8f13-720c2a55ce63",
             input: "deck = [1,1,1,1,1,2,2,2,2,2], handSize = 5",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f1fdf656-fa1a-47b4-9e6a-33facb1e4276",
             input: "deck = [1,1,1,2,2,2,3,3,3,4,4,4,5,5,5], handSize = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "851a28a7-5b08-431d-8133-63aa5b38df0f",
             input: "deck = [1,1,1,1,2,2,2,2,3,3,3,3], handSize = 4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "70875011-3792-4d72-bf90-a6a113c9c6da",
             input: "deck = [1,1,1,1,1,1,1,1,1,1], handSize = 10",
             expected: "false", orderMatters: true),
            TestCaseData(id: "68c797ff-843f-400e-acdc-2597b104d490",
             input: "deck = [1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,6], handSize = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "af56856d-77e8-4026-81de-945ab0e49a41",
             input: "deck = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], handSize = 15",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bf7f8830-06eb-4052-8fa1-f8546cfad28c",
             input: "deck = [], handSize = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "49b8486b-a330-4a43-b211-3bb2ce974617",
             input: "deck = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], handSize = 20",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c5c18320-2b71-452b-b082-2da9639565c2",
             input: "deck = [1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,6,7,7,7], handSize = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4c0c6548-ed6c-4522-b896-17f9e80cbb7a",
             input: "deck = [1,2,3,4,4,3,2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5e48ed47-2ee8-4397-b518-cf56a80368b1",
             input: "deck = [1,1,1,2,2,2,3,3]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "x-of-a-kind-in-a-deck-of-cards"
            let topic = "math-geometry"
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
            guard let p_handSize = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_deck.count >= 1 && p_deck.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= deck.length <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.isNStraightHand(p_deck, p_handSize)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
