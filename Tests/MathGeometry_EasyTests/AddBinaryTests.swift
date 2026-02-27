import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAddBinary {
    private class Solution {
        func addBinary(_ a: String, _ b: String) -> String {
           let sum = Int(a, radix: 2).unsafelyUnwrapped + Int(b, radix: 2).unsafelyUnwrapped
           return String(sum, radix: 2)
        }
    }

    @Suite struct AddBinaryTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "827301D4-42E0-4C2A-B4A3-BFE3CEB6F0E8",
             input: "a = \"1010\", b = \"1011\"",
             expected: "\"10101\"", orderMatters: true),
            TestCaseData(id: "51A6134D-29C6-4A56-9C70-D6EF5DDAD08B",
             input: "a = \"1\", b = \"1\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "F3E5F2B1-DD62-4752-BCFE-6390387EA983",
             input: "a = \"0\", b = \"0\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "FE8B90EF-4525-46C2-8408-D5C8C3831ECB",
             input: "a = \"1\", b = \"0\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "82AC707C-144C-4E33-84E1-BB16560A9EAC",
             input: "a = \"111\", b = \"1\"",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "8E3B970F-52A0-4FE6-BDAC-4E7D0F3256FE",
             input: "a = \"100000000000000000000000000000000000000000000000000000000000000\", b = \"1\"",
             expected: "100000000000000000000000000000000000000000000000000000000000001", orderMatters: true),
            TestCaseData(id: "C5BA32DA-7887-4BAD-8D07-9F50C3DEC833",
             input: "a = \"1111\", b = \"1111\"",
             expected: "11110", orderMatters: true),
            TestCaseData(id: "A090AB8E-CDFE-4ABC-8EEB-F4ADAD531020",
             input: "{\"a\": \"11\", \"b\": \"1\"}",
             expected: "100", orderMatters: true),
            TestCaseData(id: "1A0F54C0-FCEF-444F-837C-D4E27FCB7E2A",
             input: "{\"a\": \"1010\", \"b\": \"1011\"}",
             expected: "10101", orderMatters: true),
            TestCaseData(id: "FE99A0F6-AAEB-4E9F-8164-F029CF000FDD",
             input: "{\"a\": \"1\", \"b\": \"0\"}",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0C56E909-0CC0-4092-A948-8B824634E4C0",
             input: "{\"a\": \"0\", \"b\": \"0\"}",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0708F20F-EA5D-405F-9640-DD4B86F05560",
             input: "{\"a\": \"1111\", \"b\": \"1111\"}",
             expected: "11110", orderMatters: true),
            TestCaseData(id: "64804516-BBCA-448E-BD8F-0C53E0A74C50",
             input: "{\"a\": \"1\", \"b\": \"111111\"}",
             expected: "1000000", orderMatters: true),
            TestCaseData(id: "614D3472-09A2-4C68-81F5-D2DFEDBEF772",
             input: "{\"a\": \"111\", \"b\": \"1\"}",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "68938396-162F-4A6B-AF30-FA7D39D3BBCA",
             input: "{\"a\": \"1\", \"b\": \"111\"}",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "467bdb16-26e0-4d75-a227-f4f003138020",
             input: "a = \"100\", b = \"1\"",
             expected: "101", orderMatters: true),
            TestCaseData(id: "828d5e4d-bbb8-4c56-b02a-4c68407dbd9a",
             input: "a = \"11111111\", b = \"11111111\"",
             expected: "111111110", orderMatters: true),
            TestCaseData(id: "de6a78bd-5d8f-4f05-addd-be30ecdae7f2",
             input: "a = \"1000000\", b = \"1\"",
             expected: "1000001", orderMatters: true),
            TestCaseData(id: "1b0a6c9c-f312-4f84-a14e-e5f0618447fd",
             input: "a = \"1\", b = \"1000000\"",
             expected: "1000001", orderMatters: true),
            TestCaseData(id: "53839e22-7a89-400c-898a-46ce1e108747",
             input: "a = \"\", b = \"1\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3eb43212-929f-451b-b948-464f5f1394ca",
             input: "a = \"1\", b = \"\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1ff97a66-9be8-43fa-9b8f-31f5f9a9d59e",
             input: "a = \"1000\", b = \"1000\"",
             expected: "10000", orderMatters: true),
            TestCaseData(id: "d8510ff8-8c61-4af2-a78c-76822c0fecf6",
             input: "a = \"1111111111111111\", b = \"1\"",
             expected: "10000000000000000", orderMatters: true),
            TestCaseData(id: "515e50dc-be76-445b-a6a5-2865b061708e",
             input: "a = \"1001\", b = \"1101\"",
             expected: "\"10110\"", orderMatters: true),
            TestCaseData(id: "5F425A9C-7130-417E-B360-13DAC99ECFC6",
             input: "a = \"100\", b = \"110010\"",
             expected: "110110", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "add-binary"
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

            let p_a = InputParser.parseString(params[0])
            guard p_a.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: a string too long (\(p_a.count))"
                )
                return
            }
            let p_b = InputParser.parseString(params[1])
            guard p_b.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: b string too long (\(p_b.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_a.count >= 1 && p_a.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= a.length, b.length <= 104"
                )
                return
            }
            guard p_b.count >= 1 && p_b.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= a.length, b.length <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.addBinary(p_a, p_b)
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

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
