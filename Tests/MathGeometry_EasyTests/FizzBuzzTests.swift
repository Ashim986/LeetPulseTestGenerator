import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFizzBuzz {
    private class Solution {
        func fizzBuzz(_ n: Int) -> [String] {
          return (1...n).map {
            switch ($0) {
            case let x where x % 15 == 0: return "FizzBuzz"
            case let x where x % 3 == 0: return "Fizz"
            case let x where x % 5 == 0: return "Buzz"
            default: return String($0)
            }
          }
        }
    }

    @Suite struct FizzBuzzTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6a4d9b2b-c2b9-465a-a8e4-0fd1928cad33",
             input: "n = 0",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "a6e45fa0-835e-40e4-90ff-c283bf1fc4e3",
             input: "n = -1",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "089fc811-ea12-478b-a90d-85194ed53436",
             input: "n = -5",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "93ecd276-2244-4cb1-b451-ff5e0faa8d86",
             input: "n = 1",
             expected: "[\"1\"]", orderMatters: true),
            TestCaseData(id: "5c64a115-89a6-44fe-87b6-83702c654310",
             input: "n = 20",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\",\"Buzz\"]", orderMatters: true),
            TestCaseData(id: "7bb9f55c-9656-4f7c-ad02-c02b29c9d985",
             input: "n = 100",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\",\"Buzz\",\"Fizz\",\"22\",\"23\",\"Fizz\",\"Buzz\",\"26\",\"Fizz\",\"28\",\"29\",\"FizzBuzz\",\"31\",\"32\",\"Fizz\",\"34\","
                + "\"Buzz\",\"Fizz\",\"37\",\"38\",\"Fizz\",\"Buzz\",\"41\",\"Fizz\",\"43\",\"44\",\"FizzBuzz\",\"46\",\"47\",\"Fizz\",\"49\",\"Buzz\",\"51"
                + "\",\"52\",\"Fizz\",\"54\",\"Buzz\",\"Fizz\",\"57\",\"58\",\"Fizz\",\"Buzz\",\"61\",\"62\",\"Fizz\",\"64\",\"Buzz\",\"Fizz\",\"67\",\"68"
                + "\",\"Fizz\",\"Buzz\",\"71\",\"72\",\"Fizz\",\"74\",\"FizzBuzz\",\"76\",\"77\",\"Fizz\",\"79\",\"Buzz\",\"Fizz\",\"82\",\"83\",\"Fizz\","
                + "\"Buzz\",\"86\",\"Fizz\",\"88\",\"89\",\"FizzBuzz\",\"91\",\"92\",\"Fizz\",\"94\",\"Buzz\",\"Fizz\",\"97\",\"98\",\"Fizz\",\"Buzz\"]", orderMatters: true),
            TestCaseData(id: "95f88b15-e044-4452-a4a4-555acb8541d4",
             input: "n = 50",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\",\"Buzz\",\"Fizz\",\"22\",\"23\",\"Fizz\",\"Buzz\",\"26\",\"Fizz\",\"28\",\"29\",\"FizzBuzz\",\"31\",\"32\",\"Fizz\",\"34\","
                + "\"Buzz\",\"Fizz\",\"37\",\"38\",\"Fizz\",\"Buzz\",\"41\",\"Fizz\",\"43\",\"44\",\"FizzBuzz\",\"46\",\"47\",\"Fizz\",\"49\",\"Buzz\"]", orderMatters: true),
            TestCaseData(id: "578fee93-6312-4286-bea1-8dcbac786216",
             input: "n = 10",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\"]", orderMatters: true),
            TestCaseData(id: "cdd991fb-96bb-4501-b01b-ce02fd3d5075",
             input: "n = 25",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\",\"Buzz\",\"Fizz\",\"22\",\"23\",\"Fizz\",\"Buzz\"]", orderMatters: true),
            TestCaseData(id: "d82a1fbf-7d61-447d-ae0b-02a98a9ee907",
             input: "n = 30",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\",\"Buzz\",\"Fizz\",\"22\",\"23\",\"Fizz\",\"Buzz\",\"26\",\"Fizz\",\"28\",\"29\",\"FizzBuzz\"]", orderMatters: true),
            TestCaseData(id: "17b2ef9e-b888-46a9-ae0a-7558f6497fbe",
             input: "n = 9",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\"]", orderMatters: true),
            TestCaseData(id: "86c02998-9f0b-41bc-a543-7569b8875ab4",
             input: "n = 7",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\"]", orderMatters: true),
            TestCaseData(id: "0131ea62-4d1f-4973-b6aa-29e0014956b3",
             input: "n = 11",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\"]", orderMatters: true),
            TestCaseData(id: "422c42c5-78b5-46de-9d3d-cc952e893524",
             input: "n = 12",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\"]", orderMatters: true),
            TestCaseData(id: "8bceadf1-8235-45df-ae06-1fd6d1363167",
             input: "n = 14",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\"]", orderMatters: true),
            TestCaseData(id: "f7b9da2d-aaeb-490a-9bc9-06c35d97aa8c",
             input: "n = 13",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\"]", orderMatters: true),
            TestCaseData(id: "f20a9b05-e9f9-46d3-a995-a410e5fc9b87",
             input: "n = 16",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\"]", orderMatters: true),
            TestCaseData(id: "bb3ff8fd-9b47-43d9-9b7a-0287b505a1c1",
             input: "n = 18",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\"]", orderMatters: true),
            TestCaseData(id: "56c95d98-890e-44a7-be0e-5626fde6d8c0",
             input: "n = 19",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\"]", orderMatters: true),
            TestCaseData(id: "c6dba0d3-1286-4a72-a6ae-c3942a0c5658",
             input: "n = 21",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\",\"Buzz\",\"Fizz\"]", orderMatters: true),
            TestCaseData(id: "762c68b7-d40b-4986-ae0f-8b4edec3e050",
             input: "n = 22",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\",\"Buzz\",\"Fizz\",\"22\"]", orderMatters: true),
            TestCaseData(id: "9ac1797b-b25a-4b8d-b13d-e20e94aa3848",
             input: "n = 23",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\",\"Buzz\",\"Fizz\",\"22\",\"23\"]", orderMatters: true),
            TestCaseData(id: "30918450-6c37-4d46-8a63-4b2f45bfa9c4",
             input: "n = 24",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\",\"Buzz\",\"Fizz\",\"22\",\"23\",\"Fizz\"]", orderMatters: true),
            TestCaseData(id: "9b212f04-f055-478c-84e4-b0cbc8e4aa48",
             input: "n = 26",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\",\"Buzz\",\"Fizz\",\"22\",\"23\",\"Fizz\",\"Buzz\",\"26\"]", orderMatters: true),
            TestCaseData(id: "0855a93b-5167-436b-b285-02320dc2b317",
             input: "n = 27",
             expected: "[\"1\",\"2\",\"Fizz\",\"4\",\"Buzz\",\"Fizz\",\"7\",\"8\",\"Fizz\",\"Buzz\",\"11\",\"Fizz\",\"13\",\"14\",\"FizzBuzz\",\"16\",\"17\",\"F"
                + "izz\",\"19\",\"Buzz\",\"Fizz\",\"22\",\"23\",\"Fizz\",\"Buzz\",\"26\",\"Fizz\"]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "fizz-buzz"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [String]?
            let didCrash = withCrashGuard {
                resultHolder = solution.fizzBuzz(p_n)
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

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
