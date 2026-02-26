import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryWatch {
    private class Solution {
        func readBinaryWatch(_ turnedOn: Int) -> [String] {
            var res = [String]()
            let hours = [1, 2, 4, 8]
            let minutes = [1, 2, 4, 8, 16, 32]
            var hourPowers = [Int]()
            var minutePowers = [Int]()
            for i in 0...3 {
                hourPowers.append(hours[i])
                minutePowers.append(minutes[i])
            }
            for h in hourPowers {
                for m in minutePowers {
                    if ((h.nonzeroBitCount) + (m.nonzeroBitCount)) == turnedOn {
                        let time = String(format: "%02d:%02d", h, m)
                        res.append(time)
                    }
                }
            }
            return res
        }
    }

    @Suite struct BinaryWatchTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "35dd73db-a1ba-495e-bf75-add17b2b67b5",
             input: "turnedOn = 18",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "5ba1a8fe-78d1-453e-bfda-21ac200621cb",
             input: "turnedOn = -5",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "98c0ea6d-57a5-4279-949a-5ced96829c76",
             input: "turnedOn = 19",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "d82bdea5-44a3-4f1a-ae5e-501f61f23916",
             input: "turnedOn = 20",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "144f3170-fbe9-4352-a816-f7b7cdf8664c",
             input: "turnedOn = -6",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "0de4817d-b614-4644-b16a-f3bb9ae53b3d",
             input: "turnedOn = 21",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "0ca657dd-3780-4dfc-88be-cf192519dae2",
             input: "turnedOn = 22",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "b3f2b7e6-b944-4cbb-84f5-234eeef1c0f4",
             input: "turnedOn = -7",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "216533c2-af1e-44f5-bfac-bf589f382fcb",
             input: "turnedOn = 23",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "ac658eef-c3ac-4c46-80c8-c2aee72e52fe",
             input: "turnedOn = 24",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "a63f262c-94e9-428c-94df-6dd8cbf7cc3b",
             input: "turnedOn = -8",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "1ad8a0e3-3739-440c-9e80-d2ec3e3a5d75",
             input: "turnedOn = 25",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "ef8a62ae-5e30-49bc-914d-57835cfc4250",
             input: "turnedOn = 26",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "4d437b3d-9206-4619-96e6-20a2a92e378f",
             input: "turnedOn = -9",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "3e0f29f5-8cf5-42f5-8c38-34e8d981a493",
             input: "turnedOn = 27",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "b312aa69-7ec8-4add-9ab4-ff2ba86bc880",
             input: "turnedOn = 1",
             expected: "[\"0:01\",\"0:02\",\"0:04\",\"0:08\",\"0:16\",\"0:32\",\"1:00\",\"2:00\",\"4:00\",\"8:00\"]", orderMatters: false),
            TestCaseData(id: "a33079a0-9944-42dd-892d-e6f5f8488a16",
             input: "turnedOn = 9",
             expected: "[]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-watch"
            let topic = "backtracking"
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

            guard let p_turnedOn = InputParser.parseInt(params[0]) else {
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

            // Constraint precondition checks
            guard p_turnedOn >= 0 && p_turnedOn <= 10 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= turnedOn <= 10"
                )
                return
            }

            let solution = Solution()
            let result = solution.readBinaryWatch(p_turnedOn)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [String]"
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
