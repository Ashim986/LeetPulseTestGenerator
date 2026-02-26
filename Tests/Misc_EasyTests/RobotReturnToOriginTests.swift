import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRobotReturnToOrigin {
    private class Solution {
        func judgeCircle(moves: String) -> Bool {
            var movementDict: [Character: Int] = ["U": 0, "D": 0, "L": 0, "R": 0]

            for move in moves {
                movementDict[move, default: 0] += 1
            }

            return movementDict["U"].unsafelyUnwrapped - movementDict["D"].unsafelyUnwrapped == 0 && movementDict["L"].unsafelyUnwrapped - movementDict["R"].unsafelyUnwrapped == 0
        }
    }

    @Suite struct RobotReturnToOriginTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "58ce6332-258a-42cb-b394-d66cf5ef3fb4",
             input: "moves = \"\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "42dbd0c6-d65f-4f35-8a95-b77c136322c1",
             input: "moves = \"U\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b8b5019a-ac44-4bcb-b7c7-dfef04541040",
             input: "moves = \"D\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bbfd0bab-c1eb-4e59-abf6-9e3e75437d2d",
             input: "moves = \"L\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "dce06df2-2557-4ff0-972d-a538267c1c72",
             input: "moves = \"R\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7fd0640a-b624-4a6c-ad46-6be65f039a31",
             input: "moves = \"UU\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c558e94a-9e68-42bc-b28e-03904d9e67f7",
             input: "moves = \"DD\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9ffbb1aa-07bc-4439-9780-41b7b2247e2d",
             input: "moves = \"RR\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "933c712a-c80c-4e5f-b7f9-1119723092e3",
             input: "moves = \"UDL\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8a37b290-c4ba-42dc-9fd1-adcf5baf1851",
             input: "moves = \"UDR\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e7b938c1-d918-48af-a732-fb1e268a2173",
             input: "moves = \"UL\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "78f78818-e0a5-4671-9d7c-f205fc7e114d",
             input: "moves = \"UR\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5042531e-e69f-48c7-81f8-5376b7a6fa39",
             input: "moves = \"DL\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "db754ade-b8d2-485e-acd2-3b53a3982f56",
             input: "moves = \"DR\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "dc23f603-32ad-46a6-9f1e-d7c624b48aea",
             input: "moves = \"LR\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "704e4a02-b91b-4045-aba4-b196d2afa0b0",
             input: "moves = \"RL\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f5dc1cee-6d1a-4917-9868-f21847ec3ac8",
             input: "moves = \"UUDD\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7d67abdc-43e5-457b-927c-5ada0ffc2070",
             input: "moves = \"LLRR\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ff52a4ef-0a0b-4287-9af9-e835fcfe7466",
             input: "moves = \"UDUD\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a0d27657-99d5-4519-92b7-10a12bbc69a3",
             input: "moves = \"LRLR\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6b875718-1ac9-40a9-a882-811af8b2c96c",
             input: "moves = \"UDLDRD\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "dec944b7-f1af-4506-9c9d-0dbf4d2f5fef",
             input: "moves = \"UDLDRLL\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0b659a76-3256-460b-b750-9daa021667a7",
             input: "moves = \"UDLDRRR\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ff1c0dcd-26ae-49e7-a7b6-863b227816d0",
             input: "moves = \"UDLDRUL\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9b26a492-8bf8-42b0-be8b-8df1c459bafd",
             input: "moves = \"UDLDRUR\"",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "robot-return-to-origin"
            let topic = "misc"
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

            let p_moves = InputParser.parseString(params[0])
            guard p_moves.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: moves string too long (\(p_moves.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_moves.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= moves.length <= 2 * 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.judgeCircle(moves: p_moves)
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
