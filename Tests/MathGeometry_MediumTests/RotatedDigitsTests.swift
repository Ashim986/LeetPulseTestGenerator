import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRotatedDigits {
    private class Solution {
        func rotatedDigits(_ X: Int, _ Y: Int) -> Int {
            let rotatedDigits: [Character: Character] = [
                "0": "0",
                "1": "1",
                "8": "8",
                "2": "5",
                "5": "2",
                "6": "9",
                "9": "6"
            ]
            var count = 0
            for num in X...Y {
                let strNum = String(num)
                var canBeRotated = false
                var cannotBeRotated = false
                for char in strNum {
                    if let rotatedChar = rotatedDigits[char] {
                        if rotatedChar != char {
                            canBeRotated = true
                        }
                    } else {
                        cannotBeRotated = true
                        break
                    }
                }
                if canBeRotated && !cannotBeRotated {
                    count += 1
                }
            }
            return count
        }
    }

    @Suite struct RotatedDigitsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "94a07af4-7d83-400c-8b0b-80c0558541d6",
             input: "X = 1, Y = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "30a835de-5b33-4b26-afb7-35f0c50aa282",
             input: "X = 0, Y = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d9b8a4b6-6b35-4ae3-9617-8712a9d696e5",
             input: "X = 1, Y = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a8220190-611a-4319-95f0-587cb0c3705e",
             input: "X = 100, Y = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a6214e0f-75a9-4c9c-83ab-7ca04d7c4580",
             input: "X = 100, Y = 50",
             expected: "0", orderMatters: true),
            TestCaseData(id: "48b0aefa-60eb-49eb-a7c7-6a4750b86035",
             input: "X = 10, Y = 1000",
             expected: "232", orderMatters: true),
            TestCaseData(id: "d605eadb-c8f9-480c-955a-6799e473392b",
             input: "X = 1000, Y = 10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "32799639-1caf-4840-9bb2-0d17a6393b6b",
             input: "X = 200, Y = 100",
             expected: "0", orderMatters: true),
            TestCaseData(id: "12f25a49-d227-465d-a485-0b9760084b7c",
             input: "X = 1000, Y = 500",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c82b8c7a-7b7c-462d-a8ec-ebd400714506",
             input: "X = 500, Y = 100",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b2705685-c248-4c5d-8d65-cfd8b3cf2120",
             input: "X = 50, Y = 10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8677a625-df18-44e8-a70d-def77351e8f9",
             input: "X = 1000, Y = 100",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1a2929da-bd4c-4c21-92b0-fe32e42602b0",
             input: "X = 500, Y = 50",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dca8a233-3818-4dc9-bc29-656d0a1f3ec2",
             input: "X = 5000, Y = 100",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8b0e42c2-d792-45ca-b5b9-570e2b51cb77",
             input: "X = -1, Y = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "51397ae3-d4cc-472c-8be0-5f757bb27c2b",
             input: "X = 5, Y = 10",
             expected: "3", orderMatters: true),
            TestCaseData(id: "dec9a120-b0bb-46be-975c-2ef5ca44edb8",
             input: "X = 10, Y = 10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c44aeb56-b4c9-42f5-a90c-e75f42dab279",
             input: "X = 100, Y = 100",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8c2c6953-f367-49e0-b5a0-8bb022ce2570",
             input: "X = 1000, Y = 1000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "01448b00-6351-4a9f-84de-a01fcc0c51f5",
             input: "X = 10000, Y = 10000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "775e548c-9d30-4d67-aed7-2d38c9af4bd7",
             input: "X = 1, Y = 100",
             expected: "40", orderMatters: true),
            TestCaseData(id: "a92601bb-49ea-461e-a01c-c25e7484d0e7",
             input: "X = 50, Y = 100",
             expected: "26", orderMatters: true),
            TestCaseData(id: "026784d7-fc06-4048-b1c9-8cb2f2fba6cc",
             input: "X = 500, Y = 1000",
             expected: "110", orderMatters: true),
            TestCaseData(id: "cb7bc22c-be89-4d8f-be9e-0182a452465c",
             input: "X = 10000, Y = 5000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "326236e4-8cee-4c28-9e1b-55239057e3d5",
             input: "X = 5000, Y = 10000",
             expected: "1100", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "rotated-digits"
            let topic = "math-geometry"
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

            guard let p_X = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_Y = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_X >= 1 && p_X <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.rotatedDigits(p_X, p_Y)
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
