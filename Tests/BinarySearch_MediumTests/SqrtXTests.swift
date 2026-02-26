import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSqrtX {
    private class Solution {
        func mySqrt(_ x: Int) -> Int {
            if x < 2 { return x }
            var left = 1, right = x / 2, result = 0
            while left <= right {
                let mid = left + (right - left) / 2
                if mid <= x / mid { result = mid; left = mid + 1 }
                else { right = mid - 1 }
            }
            return result
        }
    }

    @Suite struct SqrtXTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "cbef17d6-cb66-43dd-b025-920c5f93ded8",
             input: "x = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e28e7cca-cae0-4d90-b44c-101e6a439a43",
             input: "x = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "49c80659-a234-4e41-8023-c4095c7f2d22",
             input: "x = 4",
             expected: "2", orderMatters: true),
            TestCaseData(id: "bcaeedf8-ec2a-4178-b5a2-dda2f502bdf9",
             input: "x = 9",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c6ca5e66-1491-4ace-b031-9ad81e105afa",
             input: "x = 16",
             expected: "4", orderMatters: true),
            TestCaseData(id: "ee470e19-6983-4abd-a13d-204dc0c530ca",
             input: "x = 25",
             expected: "5", orderMatters: true),
            TestCaseData(id: "331c7fc2-29c4-4ee5-ac9e-7e18740c57be",
             input: "x = 36",
             expected: "6", orderMatters: true),
            TestCaseData(id: "214c921b-1981-460c-9bed-ebf4a0fddd6e",
             input: "x = 49",
             expected: "7", orderMatters: true),
            TestCaseData(id: "f8f62766-9c7f-491e-b459-4196ec0b8497",
             input: "x = 64",
             expected: "8", orderMatters: true),
            TestCaseData(id: "35ce31c9-0ca2-49f2-a623-0194579d333c",
             input: "x = 81",
             expected: "9", orderMatters: true),
            TestCaseData(id: "51546464-56c3-4871-a79d-e8055d7ef628",
             input: "x = 100",
             expected: "10", orderMatters: true),
            TestCaseData(id: "73423906-fa5f-4d35-8914-d9139f08ecd2",
             input: "x = 121",
             expected: "11", orderMatters: true),
            TestCaseData(id: "a731c2c9-86a7-42e0-b21e-b3eb15482e07",
             input: "x = 144",
             expected: "12", orderMatters: true),
            TestCaseData(id: "4c411e8b-6d31-4b1d-b764-a18d2a035ff4",
             input: "x = 169",
             expected: "13", orderMatters: true),
            TestCaseData(id: "5ba3bba7-af6e-4332-b7e9-6db318d54218",
             input: "x = 196",
             expected: "14", orderMatters: true),
            TestCaseData(id: "de767b96-d3fc-4c50-ba89-598b591d42a6",
             input: "x = 225",
             expected: "15", orderMatters: true),
            TestCaseData(id: "6e9fec7d-4781-46f1-a130-9d61cd674e9d",
             input: "x = 256",
             expected: "16", orderMatters: true),
            TestCaseData(id: "218ed5d1-3291-4789-af85-30ad31553a4d",
             input: "x = 289",
             expected: "17", orderMatters: true),
            TestCaseData(id: "eaf0c18a-20e2-45ef-9675-76a5363330f9",
             input: "x = 324",
             expected: "18", orderMatters: true),
            TestCaseData(id: "1bf33bb1-793e-4335-9c1e-ac05aefb8c7e",
             input: "x = 361",
             expected: "19", orderMatters: true),
            TestCaseData(id: "d4178fb3-1ae5-47dc-b309-d06e0cfff95c",
             input: "x = 400",
             expected: "20", orderMatters: true),
            TestCaseData(id: "06d1fa51-808c-46c8-9331-90fe55711d31",
             input: "x = 441",
             expected: "21", orderMatters: true),
            TestCaseData(id: "6b630e1a-4084-40a5-9a14-d9c27902fc58",
             input: "x = 484",
             expected: "22", orderMatters: true),
            TestCaseData(id: "8bda71d3-86ef-427b-87b8-8f1609ac4dc2",
             input: "x = 529",
             expected: "23", orderMatters: true),
            TestCaseData(id: "11e76f67-97d9-4539-9e45-feb6eed4d1cc",
             input: "x = 576",
             expected: "24", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sqrt-x"
            let topic = "binary-search"
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

            guard let p_x = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            let solution = Solution()
            let result = solution.mySqrt(p_x)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
