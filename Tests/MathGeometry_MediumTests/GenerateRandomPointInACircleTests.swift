import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCGenerateRandomPointInACircle {
    private class Solution {
        let radius: Double
        let x_center: Double
        let y_center: Double

        init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
            self.radius = radius
            self.x_center = x_center
            self.y_center = y_center
        }

        func randPoint() -> [Double] {
            let theta = Double.random(in: 0...2*Double.pi)
            let r = Double.random(in: 0...radius)
            let x = x_center + r * cos(theta)
            let y = y_center + r * sin(theta)
            return [x, y]
        }
    }

    @Suite struct GenerateRandomPointInACircleTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "8695b23d-e430-479c-b636-211cc50476b3",
             input: "radius = 0.0, x_center = 0.0, y_center = 0.0",
             expected: "[0.0, 0.0]", orderMatters: true),
            TestCaseData(id: "93a89a7a-926d-4d00-8ccb-91edbfe217ae",
             input: "radius = 1.0, x_center = 0.0, y_center = 0.0",
             expected: "[0.0,0.0]", orderMatters: true),
            TestCaseData(id: "77dbda3e-fba6-446a-a87f-2590c0aec971",
             input: "radius = 5.0, x_center = 10.0, y_center = 20.0",
             expected: "[10.0,20.0]", orderMatters: true),
            TestCaseData(id: "e8f21a49-d48d-4448-9656-4b6a99b9aaee",
             input: "radius = 10.0, x_center = 0.0, y_center = 0.0",
             expected: "[0.0,0.0]", orderMatters: true),
            TestCaseData(id: "59bba4f4-4092-48bf-be61-63d3d4e00cdf",
             input: "radius = 1.0, x_center = -10.0, y_center = 0.0",
             expected: "[-10.0,0.0]", orderMatters: true),
            TestCaseData(id: "3adeee29-089d-429c-ad9c-0d36eefac7d3",
             input: "radius = 1.0, x_center = 0.0, y_center = -10.0",
             expected: "[0.0,-10.0]", orderMatters: true),
            TestCaseData(id: "f2e45f4c-9424-448f-949a-f0835d938c9b",
             input: "radius = 1.0, x_center = 10.0, y_center = 10.0",
             expected: "[10.0,10.0]", orderMatters: true),
            TestCaseData(id: "8d4e227e-a75f-4e6f-9b63-49ff84183355",
             input: "radius = 1.0, x_center = -1.0, y_center = -1.0",
             expected: "[-1.0,-1.0]", orderMatters: true),
            TestCaseData(id: "30e850b6-fd4e-4115-b9d8-4a66c6213f6e",
             input: "radius = 100.0, x_center = 0.0, y_center = 0.0",
             expected: "[0.0,0.0]", orderMatters: true),
            TestCaseData(id: "363816c9-c674-4cde-a64f-8bf5ede14710",
             input: "radius = 1.0, x_center = 1.0, y_center = 1.0",
             expected: "[1.0,1.0]", orderMatters: true),
            TestCaseData(id: "eb8a9016-bf3d-40a6-88bb-f73edd804505",
             input: "radius = 1.0, x_center = -1.0, y_center = 1.0",
             expected: "[-1.0,1.0]", orderMatters: true),
            TestCaseData(id: "ee4b1a7b-c64f-44d3-83b1-00d9cdf46eb1",
             input: "radius = 1.0, x_center = 1.0, y_center = -1.0",
             expected: "[1.0,-1.0]", orderMatters: true),
            TestCaseData(id: "2692aedc-185f-4c73-acd1-6030e866601e",
             input: "radius = 1.0, x_center = 0.0, y_center = 1.0",
             expected: "[0.0,1.0]", orderMatters: true),
            TestCaseData(id: "5439ee9f-3493-4000-8517-ad6dc97d1b19",
             input: "radius = 1.0, x_center = 0.0, y_center = -1.0",
             expected: "[0.0,-1.0]", orderMatters: true),
            TestCaseData(id: "6cbd1828-657c-4065-bee8-5cdfe9e2343e",
             input: "radius = 1.0, x_center = 1.0, y_center = 0.0",
             expected: "[1.0,0.0]", orderMatters: true),
            TestCaseData(id: "acc82462-6f58-4136-a554-6eeceeb36a89",
             input: "radius = 1.0, x_center = -1.0, y_center = 0.0",
             expected: "[-1.0,0.0]", orderMatters: true),
            TestCaseData(id: "6bfb09da-fb04-49b7-8de3-8ed9cb417eb7",
             input: "radius = 0.5, x_center = 0.0, y_center = 0.0",
             expected: "[0.0,0.0]", orderMatters: true),
            TestCaseData(id: "1114ee75-8ad1-42f8-941d-f672a86def75",
             input: "radius = 0.5, x_center = 1.0, y_center = 1.0",
             expected: "[1.0,1.0]", orderMatters: true),
            TestCaseData(id: "2726b589-fcc4-42a5-995b-d2828adbd673",
             input: "radius = 0.1, x_center = 0.0, y_center = 0.0",
             expected: "[0.0,0.0]", orderMatters: true),
            TestCaseData(id: "3ba234dc-b56c-4aad-ba27-29ec52cf7484",
             input: "radius = 0.1, x_center = 1.0, y_center = 1.0",
             expected: "[1.0,1.0]", orderMatters: true),
            TestCaseData(id: "593509b2-6381-4535-9c1c-96e1f8cfd6dc",
             input: "radius = 1000.0, x_center = 0.0, y_center = 0.0",
             expected: "[0.0,0.0]", orderMatters: true),
            TestCaseData(id: "6507f0f9-19e1-4880-b594-29e7bc6ea0f2",
             input: "radius = 1000.0, x_center = 1000.0, y_center = 1000.0",
             expected: "[1000.0,1000.0]", orderMatters: true),
            TestCaseData(id: "3f093d03-5eee-45b0-b848-a6b8e4cd0956",
             input: "radius = 1.0, x_center = -1000.0, y_center = 0.0",
             expected: "[-1000.0,0.0]", orderMatters: true),
            TestCaseData(id: "e87d8340-4735-4411-9a43-a8d119615d8a",
             input: "radius = 1.0, x_center = 0.0, y_center = -1000.0",
             expected: "[0.0,-1000.0]", orderMatters: true),
            TestCaseData(id: "7dc94adf-2f4c-4cab-990e-11698ee1d738",
             input: "radius = 1.0, x_center = 1000.0, y_center = 1000.0",
             expected: "[1000.0,1000.0]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "generate-random-point-in-a-circle"
            let topic = "math-geometry"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            guard initArgs.count >= 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Init args count too small"
                )
                return
            }
            guard let initP_0 = InputParser.parseDouble(initArgs[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse init param 0 as Double"
                )
                return
            }
            guard let initP_1 = InputParser.parseDouble(initArgs[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse init param 1 as Double"
                )
                return
            }
            guard let initP_2 = InputParser.parseDouble(initArgs[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse init param 2 as Double"
                )
                return
            }
            var objHolder: Solution?
            let initDidCrash = withCrashGuard {
                objHolder = Solution(initP_0, initP_1, initP_2)
            }
            guard !initDidCrash, var obj = objHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution init crashed at runtime"
                )
                return
            }

            var results: [String] = []
            let loopDidCrash = withCrashGuard {
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                results.append("null")
            }
            }
            guard !loopDidCrash else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution method crashed at runtime"
                )
                return
            }

            let computedOutput = "[" + results.joined(separator: ",") + "]"
            // Class-design comparison: normalize null representations and whitespace
            func normalizeClassOutput(_ s: String) -> String {
                var result = s.replacingOccurrences(of: " ", with: "")
                result = result.replacingOccurrences(of: "nil", with: "null")
                result = result.replacingOccurrences(of: "None", with: "null")
                result = result.replacingOccurrences(of: "NULL", with: "null")
                return result
            }
            let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
