import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCConstructTheRectangle {
    private class Solution {
        func constructRectangle(area: Int) -> [Int] {
            var length = Int(sqrt(Double(area)))
            while length > 0 {
                if area % length == 0 {
                    return [length, area / length]
                }
                length -= 1
            }
            return []
        }
    }

    @Suite struct ConstructTheRectangleTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4e4544dd-133c-48c7-940c-08cdde1c1d57",
             input: "area = 1",
             expected: "[1,1]", orderMatters: true),
            TestCaseData(id: "7cb488f2-919a-4bed-9968-1867f139654e",
             input: "area = 2",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "9a7c18f5-361e-4425-85b2-385adc172bd5",
             input: "area = 3",
             expected: "[3,1]", orderMatters: true),
            TestCaseData(id: "4e7a91c9-a779-4249-9a71-78b85bf4908b",
             input: "area = 6",
             expected: "[3,2]", orderMatters: true),
            TestCaseData(id: "36780da1-f45f-41da-9581-27cac2c886c2",
             input: "area = 9",
             expected: "[3,3]", orderMatters: true),
            TestCaseData(id: "d60a75df-4b24-4619-8fd0-f2ff4c7c6836",
             input: "area = 10",
             expected: "[5,2]", orderMatters: true),
            TestCaseData(id: "70986969-967f-4813-bc25-a7e9f1134132",
             input: "area = 12",
             expected: "[4,3]", orderMatters: true),
            TestCaseData(id: "2064e17d-0d84-4c81-9070-02e39ba5b249",
             input: "area = 15",
             expected: "[5,3]", orderMatters: true),
            TestCaseData(id: "67aac0f3-44aa-4a42-acfb-5fca7d870068",
             input: "area = 16",
             expected: "[4,4]", orderMatters: true),
            TestCaseData(id: "ed9f6a48-d331-473d-a0a6-cdd32c6e9e09",
             input: "area = 20",
             expected: "[5,4]", orderMatters: true),
            TestCaseData(id: "5117ee7b-39fe-4cf8-937f-c21c7dd86535",
             input: "area = 25",
             expected: "[5,5]", orderMatters: true),
            TestCaseData(id: "80f2a5e5-d12f-4417-baff-cb788323b75d",
             input: "area = 30",
             expected: "[6,5]", orderMatters: true),
            TestCaseData(id: "d12e2c96-de61-44fe-a491-bd564ddf5fdf",
             input: "area = 36",
             expected: "[6,6]", orderMatters: true),
            TestCaseData(id: "3fb9b8df-b2e0-4375-8799-bc0e4ee21383",
             input: "area = 40",
             expected: "[8,5]", orderMatters: true),
            TestCaseData(id: "7d998aa3-d231-4eef-859a-03ea7c0f8fe1",
             input: "area = 45",
             expected: "[9,5]", orderMatters: true),
            TestCaseData(id: "fa38f0f5-6b1f-409f-b274-a0e3f44e8d9f",
             input: "area = 50",
             expected: "[10,5]", orderMatters: true),
            TestCaseData(id: "115c0cec-c292-445a-81e6-1417f30c6640",
             input: "area = 100",
             expected: "[10,10]", orderMatters: true),
            TestCaseData(id: "42e07189-bf3f-4bc6-baa2-e1e6e22811e0",
             input: "area = 120",
             expected: "[12,10]", orderMatters: true),
            TestCaseData(id: "c1d868ec-af14-480c-90b9-393341e719d3",
             input: "area = 150",
             expected: "[15,10]", orderMatters: true),
            TestCaseData(id: "632b733b-57b1-4261-8cfc-0c3a600670e3",
             input: "area = 200",
             expected: "[20,10]", orderMatters: true),
            TestCaseData(id: "c0436b66-7a2e-43dc-a24f-78a71e895b77",
             input: "area = 250",
             expected: "[25,10]", orderMatters: true),
            TestCaseData(id: "d6a7bb90-4e5d-41ca-a3d9-fe65b6ed8487",
             input: "area = 400",
             expected: "[20,20]", orderMatters: true),
            TestCaseData(id: "f14e17f8-8d93-4999-84c1-dfe178b2a4c9",
             input: "area = 500",
             expected: "[25,20]", orderMatters: true),
            TestCaseData(id: "57a59635-8516-472c-b628-ac796a6d62a9",
             input: "area = 1000",
             expected: "[25,40]", orderMatters: true),
            TestCaseData(id: "51d8aa7f-0ea6-431d-957f-622b57262862",
             input: "area = 2000",
             expected: "[50,40]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "construct-the-rectangle"
            let topic = "math-geometry"
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

            guard let p_area = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_area >= 1 && p_area <= 107 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= area <= 107"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.constructRectangle(area: p_area)
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
