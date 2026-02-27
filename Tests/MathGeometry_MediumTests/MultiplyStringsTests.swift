import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMultiplyStrings {
    private class Solution {
        func multiply(_ num1: String, _ num2: String) -> String {
            let n1 = Array(num1), n2 = Array(num2)
            var result = [Int](repeating: 0, count: n1.count + n2.count)
            for i in (0..<n1.count).reversed() {
                for j in (0..<n2.count).reversed() {
                    let mul = Int(String(n1[i])).unsafelyUnwrapped * Int(String(n2[j])).unsafelyUnwrapped
                    let p1 = i + j, p2 = i + j + 1
                    let sum = mul + result[p2]
                    result[p2] = sum % 10
                    result[p1] += sum / 10
                }
            }
            var str = result.map { String($0) }.joined()
            while str.count > 1 && str.first == "0" { str.removeFirst() }
            return str
        }
    }

    @Suite struct MultiplyStringsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "B7347035-E7DD-4638-B493-80F0B8C49EF8",
             input: "[\"0\", \"0\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "A60FE934-4719-45B7-95ED-5EA4B4D9C483",
             input: "[\"123\", \"0\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0CA7E684-C2F1-4323-85BC-234F3B82E88F",
             input: "[\"0\", \"456\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "DD59C475-541A-4E13-9AC0-0C9E2DD9E040",
             input: "[\"2\", \"3\"]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "9331614D-A76B-48EE-ABE8-14A6F7E7F364",
             input: "[\"99\", \"99\"]",
             expected: "9801", orderMatters: true),
            TestCaseData(id: "AC8AAC60-E495-4638-847D-FA94F8B68E9D",
             input: "[\"999\", \"999\"]",
             expected: "998001", orderMatters: true),
            TestCaseData(id: "23F288D0-14F0-4330-A4E9-5BCEC4B1BD08",
             input: "[\"123456789\", \"1\"]",
             expected: "123456789", orderMatters: true),
            TestCaseData(id: "B3171942-F81A-4F90-80FF-6E68652A17B7",
             input: "[\"1\", \"0\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "E38E6ABF-2326-446B-A392-C58A6C67F7FA",
             input: "[\"0\", \"1\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "67C553F2-215F-4181-B4E6-8E651120CDE4",
             input: "[\"7\", \"8\"]",
             expected: "56", orderMatters: true),
            TestCaseData(id: "CAF2FC18-4520-4B4C-B76A-3B18301913DB",
             input: "[\"101\", \"10\"]",
             expected: "1010", orderMatters: true),
            TestCaseData(id: "0C96F321-5BB9-4F57-AF93-2E22BC26E5FF",
             input: "[\"123456789\", \"9\"]",
             expected: "1111111101", orderMatters: true),
            TestCaseData(id: "A0F8C422-376F-4837-93AA-75E31CE3B028",
             input: "[\"0\", \"123\"]",
             expected: "\"0\"", orderMatters: true),
            TestCaseData(id: "6E25CF82-AB76-4CC4-87FF-117D93C3D7A8",
             input: "[\"1\", \"456\"]",
             expected: "\"456\"", orderMatters: true),
            TestCaseData(id: "556AC156-7186-40A8-8C2B-12F493A7700A",
             input: "[\"12\", \"10\"]",
             expected: "\"120\"", orderMatters: true),
            TestCaseData(id: "2F5C6E2B-0907-43F0-9D66-352AF22B35F0",
             input: "[\"123\", \"405\"]",
             expected: "\"49815\"", orderMatters: true),
            TestCaseData(id: "0CEBFA89-824F-42AE-BFFC-CA9C7D1F7EDB",
             input: "[\"105\", \"20\"]",
             expected: "\"2100\"", orderMatters: true),
            TestCaseData(id: "6684D9C5-D230-4E00-9E38-5E8800B3FC03",
             input: "[ \"2\", \"3\" ]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "3F31C253-7385-4BFB-8D39-D812E60FDC03",
             input: "[ \"0\", \"0\" ]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "C475154E-DB09-4E0A-A977-2361303F7419",
             input: "[ \"0\", \"123\" ]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "DF47BB6E-D2A9-40A3-9601-9060979BF08B",
             input: "[ \"1\", \"1\" ]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ACECD215-5384-4947-A0A5-F711B53B31B4",
             input: "[ \"123\", \"1\" ]",
             expected: "123", orderMatters: true),
            TestCaseData(id: "7F3E1054-D31B-4512-9E1F-A99774A6FAFF",
             input: "[ \"12\", \"10\" ]",
             expected: "120", orderMatters: true),
            TestCaseData(id: "EB4F9390-94F4-46FC-B3A6-E6EAFE5F7AD4",
             input: "[ \"99\", \"99\" ]",
             expected: "9801", orderMatters: true),
            TestCaseData(id: "34062875-33DB-4FD0-AA47-AA39A570E004",
             input: "[ \"101\", \"202\" ]",
             expected: "20402", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "multiply-strings"
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

            let p_num1 = InputParser.parseString(params[0])
            guard p_num1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))"
                )
                return
            }
            let p_num2 = InputParser.parseString(params[1])
            guard p_num2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_num1.count >= 1 && p_num1.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= num1.length, num2.length <= 200"
                )
                return
            }
            guard p_num2.count >= 1 && p_num2.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= num1.length, num2.length <= 200"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.multiply(p_num1, p_num2)
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
