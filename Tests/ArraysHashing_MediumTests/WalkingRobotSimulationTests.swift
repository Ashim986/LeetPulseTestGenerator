import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCWalkingRobotSimulation {
    private class Solution {
        func robotSim(commands: [Int]) -> [Int] {
            var x = 0
            var y = 0
            var dx = 0
            var dy = 1
            var hashTable: [Int: (Int, Int)] = [:]
            for (i, command) in commands.enumerated() {
                if command == -1 {
                    x += dx
                    y += dy
                } else if command == -2 {
                    x -= dx
                    y -= dy
                } else {
                    if command % 2 == 1 {
                        dy += command
                    } else {
                        dx += command
                    }
                }
                hashTable[i] = (x, y)
            }
            return [x, y]
        }
    }

    @Suite struct WalkingRobotSimulationTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "cd6d132b-5a0a-45b1-8dcf-0b155528e647",
             input: "commands = []",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "a0fb5bbb-ca31-4e98-b92e-8ce3b1e6b523",
             input: "commands = [0]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "cf9858d9-78a8-47ae-9708-fe0873a1df9c",
             input: "commands = [1]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "5cc1c10f-22a7-4e18-b701-9e0d52098f85",
             input: "commands = [-1]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "7fd144c3-13c4-4b5c-9c9e-b694d9398f71",
             input: "commands = [1, -1]",
             expected: "[0,2]", orderMatters: true),
            TestCaseData(id: "ec319df5-ca1e-4be0-be73-57df06c40be4",
             input: "commands = [10, -10]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "9b400606-c863-4c92-b6f8-a271d1acd041",
             input: "commands = [100, -100]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "eca617c2-e4b6-4982-ac41-d4ae51cf11aa",
             input: "commands = [1000, -1000]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "2aff6069-8ccf-4ff6-8138-0886d061a5c0",
             input: "commands = [1, 2, 3, 4, 5]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "2231d002-dc9d-4ed3-8b2b-e34a3030133d",
             input: "commands = [-1, -2, -3, -4, -5]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "508f3f80-4ddd-4164-972f-06351e46f6c1",
             input: "commands = [1, -1, 1, -1, 1, -1]",
             expected: "[0,9]", orderMatters: true),
            TestCaseData(id: "5fed8a68-3bfb-48fd-bf10-6038e11a35ca",
             input: "commands = [10, 10, 10, 10, 10]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "d14c68a6-d885-4e56-b636-df30feb54bd0",
             input: "commands = [-10, -10, -10, -10, -10]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "46c896c2-480b-42e8-84eb-b76ec9edb09e",
             input: "commands = [100, 100, 100, 100, 100]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "40f2b291-2932-4ba1-9ff3-519de5d9f6a8",
             input: "commands = [-100, -100, -100, -100, -100]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "5c914f87-9f44-4309-b9a8-13503bbbedae",
             input: "commands = [1, 2, 3, 4, 5, -1, -2, -3, -4, -5]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "bf6fd0b0-4b61-4123-86e3-c521d891bff3",
             input: "commands = [5, 4, 3, 2, 1, -1, -2, -3, -4, -5]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "282c68df-7c0b-4f77-b2e7-664f24c4a7a7",
             input: "commands = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "8c0f7bc4-5057-4644-9bfb-6724635409da",
             input: "commands = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "c89686d1-4f0c-4a01-afa2-91527af7f9a7",
             input: "commands = [1, 1, 1, 1, 1, -1, -1, -1, -1, -1]",
             expected: "[0,30]", orderMatters: true),
            TestCaseData(id: "3df39d5f-2d48-4b6c-aa96-0660aeb4039a",
             input: "commands = [-1, -1, -1, -1, -1, 1, 1, 1, 1, 1]",
             expected: "[0,5]", orderMatters: true),
            TestCaseData(id: "00d20378-082c-46a9-9911-9549f43a863c",
             input: "commands = [1000, 1000, 1000, 1000, 1000, -1000, -1000, -1000, -1000, -1000]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "f44e58fc-7e96-476b-bd97-5b47787db7df",
             input: "commands = [-1000, -1000, -1000, -1000, -1000, 1000, 1000, 1000, 1000, 1000]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "65c54869-f347-47d8-9328-d9d7340e0a99",
             input: "commands = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]",
             expected: "[0,110]", orderMatters: true),
            TestCaseData(id: "830cfb96-2ca1-424c-837a-e05cb8ad7c35",
             input: "commands = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "[0,10]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "walking-robot-simulation"
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

            guard let p_commands = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_commands.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: commands array too large (\(p_commands.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_commands.count >= 1 && p_commands.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= commands.length <= 10^4"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.robotSim(commands: p_commands)
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
