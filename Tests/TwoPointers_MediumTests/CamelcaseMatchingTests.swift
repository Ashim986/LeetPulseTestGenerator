import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCamelcaseMatching {
    private class Solution {
        func camelMatch(query: String, pattern: String) -> Bool {
            let queryArray = Array(query)
            let patternArray = Array(pattern)
            var queryIndex = 0
            var patternIndex = 0
            while queryIndex < queryArray.count {
                if patternIndex < patternArray.count && queryArray[queryIndex] == patternArray[patternIndex] {
                    patternIndex += 1
                }
                else if queryArray[queryIndex].isUppercase {
                    return false
                }
                queryIndex += 1
            }
            return patternIndex == patternArray.count
        }
    }

    @Suite struct CamelcaseMatchingTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2970996b-24ba-4f79-a8fe-bf1c560fac9f",
             input: "query = \"a\", pattern = \"a\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7bef21e1-e7ca-437b-b3a6-79bfce53246b",
             input: "query = \"A\", pattern = \"A\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "25f9f4ac-b1d3-493c-8cad-e0f5890c18f2",
             input: "query = \"abc\", pattern = \"abc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "96d92a21-7f49-40e4-ba8b-20c1ca1562fe",
             input: "query = \"\", pattern = \"abc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c8ebfb7f-db1a-4d45-9eae-f585eff593dc",
             input: "query = \"abc\", pattern = \"def\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8ebfa53b-18d8-4e27-ad6f-e2035a6a74b2",
             input: "query = \"abc\", pattern = \"abcd\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "43f8253b-c73a-4933-8ada-a01828f363a5",
             input: "query = \"aBc\", pattern = \"abc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "63806a7d-2bb0-400d-9fb0-ce1412d024a9",
             input: "query = \"AbC\", pattern = \"ABC\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b680f821-787f-4a75-9b77-62a93b501c21",
             input: "query = \"helloWorld\", pattern = \"HW\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "502f2250-1daa-46bd-a78b-2d853575e488",
             input: "query = \"HelloWorld\", pattern = \"Hw\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "eacb8e3b-b562-40ac-bc52-7c2bd58b56e3",
             input: "query = \"helloWorld\", pattern = \"hW\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ebf0676a-b88d-40fe-80e5-d22c6b5cbfd1",
             input: "query = \"HelloWorld\", pattern = \"hW\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0e1214e0-72b0-463a-951a-bedeed4a6047",
             input: "query = \"HelloWorld\", pattern = \"HWo\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "dcb4970a-1c89-4a33-a73a-033efbca7f55",
             input: "query = \"HelloWorld\", pattern = \"HWW\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a54f114c-5ee6-407b-bc1d-b2439f155880",
             input: "query = \"HelloWorld\", pattern = \"HWWWW\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b52ee820-224f-471e-bde5-e6958d5d741b",
             input: "query = \"HelloWorld\", pattern = \"HWWWWWWWWWW\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "45c296a1-b87b-403a-b46f-ba4d6b128b28",
             input: "query = \"abc\", pattern = \"b\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bbb64a27-0a1c-4416-89e9-8caa7e1e30fa",
             input: "query = \"abc\", pattern = \"c\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "acfee2a9-c436-4aa9-944e-be1e6f91e31d",
             input: "query = \"abc\", pattern = \"bc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b84b54df-cc93-4563-95ff-966d10f3d212",
             input: "query = \"abc\", pattern = \"abcabcabc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b9569b6a-942a-463a-942a-291293e07d54",
             input: "query = \"\", pattern = \"\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9339c615-ec25-4bb4-8581-8af8e3cfc49c",
             input: "query = \"ABC\", pattern = \"ABC\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "35f7fc1f-698c-409e-ac08-5b3054e82278",
             input: "query = \"aBc\", pattern = \"aBc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "cb2c2795-f3ff-446d-8aad-0d1539001d49",
             input: "query = \"AbC\", pattern = \"AbC\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "37d23aeb-e5ac-4cea-ae5a-474fd54cfff0",
             input: "query = \"abc\", pattern = \"\"",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "camelcase-matching"
            let topic = "two-pointers"
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

            let p_query = InputParser.parseString(params[0])
            guard p_query.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: query string too long (\(p_query.count))"
                )
                return
            }
            let p_pattern = InputParser.parseString(params[1])
            guard p_pattern.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: pattern string too long (\(p_pattern.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_pattern.count >= 1 && p_pattern.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= pattern.length, queries.length <= 100"
                )
                return
            }
            guard p_pattern.count >= 1 && p_pattern.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= pattern.length, queries.length <= 100"
                )
                return
            }

            let solution = Solution()
            let result = solution.camelMatch(query: p_query, pattern: p_pattern)
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
