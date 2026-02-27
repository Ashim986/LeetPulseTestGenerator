import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCHeaters {
    private class Solution {
        func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
            let houses = houses.sorted()
            let heaters = heaters.sorted()
            var radius = 0
            var heaterIndex = 0
            for house in houses {
                while heaterIndex + 1 < heaters.count && abs(house - heaters[heaterIndex + 1]) <= abs(house - heaters[heaterIndex]) {
                    heaterIndex += 1
                }
                radius = max(radius, abs(house - heaters[heaterIndex]))
            }
            return radius
        }
    }

    @Suite struct HeatersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0dc8825d-c0d7-40f1-97df-165041627b06",
             input: "houses = [1], heaters = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a4f9a0da-baf5-4bdc-baa4-adc877eda4e6",
             input: "houses = [1,2,3,4,5], heaters = [3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "73cd0713-21bd-4388-a87a-0aa0d86a4b73",
             input: "houses = [1,2,3,4,5], heaters = [1,2,3,4,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "316bc31d-6eff-42c3-9f24-e43ce1ea3e24",
             input: "houses = [], heaters = [1,2,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "89289ea4-b189-434a-a1fe-80c3fb71db32",
             input: "houses = [1,1,1], heaters = [1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e7485f63-9de9-4e8f-bc8a-9716530e7dd6",
             input: "houses = [1,2,3,4,5], heaters = [5,4,3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a47f9878-918f-40ec-9375-e807165e5ce7",
             input: "houses = [-1,-2,-3], heaters = [-2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "24d3ff77-57c9-416b-9c2a-d31e3317fdd4",
             input: "houses = [1,2,3,4,5], heaters = [0,1,2,3,4]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "05392957-3b94-49bc-86b3-a993b5742c4e",
             input: "houses = [1000,2000,3000], heaters = [1500,2500]",
             expected: "500", orderMatters: true),
            TestCaseData(id: "219353f9-06a0-4484-ae32-011b7f913bfb",
             input: "houses = [1,2,3,4,5], heaters = [1000,2000,3000]",
             expected: "999", orderMatters: true),
            TestCaseData(id: "28d0f43f-ca1d-4dc3-be5b-08a2dc989699",
             input: "houses = [1,2,3,4,5], heaters = [1,2,3,4,5,6,7,8,9,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c4d6051c-7e2d-463d-b192-10c3d4172779",
             input: "houses = [1,2,3,4,5], heaters = [10,9,8,7,6,5,4,3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "73fa1039-ae7f-4c0d-bd7c-ed0274a8d036",
             input: "houses = [1,2,3,4,5], heaters = [11,10,9,8,7,6,5,4,3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f3925ca8-ecda-4f7a-8388-87847807b6ed",
             input: "houses = [1,2,3,4,5], heaters = [2,4,6,8,10,12]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "40c7ce7a-0f08-44a5-b9ab-da767a9d719d",
             input: "houses = [1,2,3,4,5], heaters = [0,2,4,6,8,10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d3a17443-55cc-4510-b2c6-d242c0e7884c",
             input: "houses = [1,2,3,4,5], heaters = [1,5]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f9414667-d5ab-43dd-a77e-c6c154126e02",
             input: "houses = [1,2,3], heaters = []",
             expected: "9223372036854775807", orderMatters: true),
            TestCaseData(id: "7bf95327-a462-4878-936f-8447eb19a016",
             input: "houses = [1,2,3,4,5], heaters = [1,1,1,1,1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "a545750b-b82c-46b2-b40f-b3b107ffca0a",
             input: "houses = [1,2,3], heaters = [-1,0,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d76727e5-84af-49b9-a7b5-31a7e4705e2b",
             input: "houses = [1,2,3,4,5], heaters = [-1000,-2000,-3000]",
             expected: "1005", orderMatters: true),
            TestCaseData(id: "78f3ead1-9c3d-4f19-8299-3565457eba03",
             input: "houses = [1,1,1,1,1], heaters = [1,2,3,4,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d1c7cf9c-becd-407a-abbb-e6b54a2cde4b",
             input: "houses = [1,2,3,4,5], heaters = [1,1,1,1,1,1,1,1,1,1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "50af3e32-7d6b-43c6-98b4-52c2c9bd9b72",
             input: "houses = [1,2,3,4,5], heaters = [1,3,5,7,9]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b2471ea3-d26c-49f4-b5c7-4f42ae8ccc4a",
             input: "houses = [1,2,3,4,5], heaters = [1,3,5,7,9,11]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "86fa9193-a376-42e8-9e42-945e64405dbf",
             input: "houses = [1,2,3,4,5], heaters = [1,3,5,7,9,11,13]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "heaters"
            let topic = "two-pointers"
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

            guard let p_houses = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_houses.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: houses array too large (\(p_houses.count))"
                )
                return
            }
            guard let p_heaters = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_heaters.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: heaters array too large (\(p_heaters.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_houses.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= houses.length, heaters.length <= 3 * 104"
                )
                return
            }
            guard p_heaters.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= houses.length, heaters.length <= 3 * 104"
                )
                return
            }
            guard p_houses.allSatisfy({ $0 >= 1 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= houses[i], heaters[i] <= 109"
                )
                return
            }
            guard p_heaters.allSatisfy({ $0 >= 1 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= houses[i], heaters[i] <= 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findRadius(p_houses, p_heaters)
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
