import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSubdomainVisitCount {
    private class Solution {
        func subdomainVisits(_ cpdomains: [String]) -> [String] {
            var counts: [String: Int] = [:]
            for entry in cpdomains {
                let parts = entry.split(separator: " ")
                guard parts.count == 2, let count = Int(parts[0]) else { continue }
                let domain = String(parts[1])
                let frags = domain.split(separator: ".")
                for i in 0..<frags.count {
                    let sub = frags[i...].joined(separator: ".")
                    counts[String(sub), default: 0] += count
                }
            }
            return counts.map { "\($0.value) \($0.key)" }
        }
    }

    @Suite struct SubdomainVisitCountTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ca669f1f-8e3a-4a80-bb98-56e61b4fc46c",
             input: "cpdomains = []",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "4429a9f7-132f-4b75-88fe-ff8197e8f5e9",
             input: "cpdomains = [\"1 a.com\"]",
             expected: "[\"1 a.com\",\"1 com\"]", orderMatters: false),
            TestCaseData(id: "9213edf0-0de8-4a88-a238-868e955d6684",
             input: "cpdomains = [\"1 a.com\", \"1 a.com\"]",
             expected: "[\"2 a.com\",\"2 com\"]", orderMatters: false),
            TestCaseData(id: "fe056b26-79d2-450b-8fc1-64933b90c670",
             input: "cpdomains = [\"1 a.com\", \"1 b.com\"]",
             expected: "[\"1 a.com\",\"1 b.com\",\"2 com\"]", orderMatters: false),
            TestCaseData(id: "470a95a4-41f6-49f5-832c-7b54d79406f8",
             input: "cpdomains = [\"1 a.com\", \"1 a.com\", \"1 a.com\"]",
             expected: "[\"3 a.com\",\"3 com\"]", orderMatters: false),
            TestCaseData(id: "ee936a0b-ce7e-4b90-861b-8405bf686d0f",
             input: "cpdomains = [\"1 a.com\", \"2 a.com\"]",
             expected: "[\"3 a.com\",\"3 com\"]", orderMatters: false),
            TestCaseData(id: "53b7cd19-f971-444c-9fca-80878bce2bd6",
             input: "cpdomains = [\"1 a.com\", \"1 b.com\", \"1 c.com\"]",
             expected: "[\"1 a.com\",\"1 b.com\",\"1 c.com\",\"3 com\"]", orderMatters: false),
            TestCaseData(id: "a293a93e-23f4-4f2c-a142-8c66441521d9",
             input: "cpdomains = [\"1 a.com\", \"1 b.com\", \"1 c.com\", \"1 d.com\"]",
             expected: "[\"1 a.com\",\"1 b.com\",\"1 c.com\",\"1 d.com\",\"4 com\"]", orderMatters: false),
            TestCaseData(id: "8516631f-20d7-4a4d-9471-844eb409ec96",
             input: "cpdomains = [\"1 a.b.com\"]",
             expected: "[\"1 a.b.com\",\"1 b.com\",\"1 com\"]", orderMatters: false),
            TestCaseData(id: "f5780865-2873-4429-97ec-7287dd8902bc",
             input: "cpdomains = [\"1 a.b.c.com\"]",
             expected: "[\"1 a.b.c.com\",\"1 b.c.com\",\"1 c.com\",\"1 com\"]", orderMatters: false),
            TestCaseData(id: "43dd165b-b8a0-4c9f-a420-cd4e80d3b7f5",
             input: "cpdomains = [\"1 a.b.c.d.com\"]",
             expected: "[\"1 a.b.c.d.com\",\"1 b.c.d.com\",\"1 c.d.com\",\"1 d.com\",\"1 com\"]", orderMatters: false),
            TestCaseData(id: "ab93bd35-5eec-4530-b307-d9db6b4141c0",
             input: "cpdomains = [\"10 a.com\", \"20 b.com\"]",
             expected: "[\"10 a.com\",\"20 b.com\",\"30 com\"]", orderMatters: false),
            TestCaseData(id: "410bc38a-1ad4-48e6-902f-6a23f532d791",
             input: "cpdomains = [\"100 a.com\", \"200 b.com\"]",
             expected: "[\"100 a.com\",\"200 b.com\",\"300 com\"]", orderMatters: false),
            TestCaseData(id: "4d51fe36-48da-45d6-86b0-a511ab84416e",
             input: "cpdomains = [\"1000 a.com\", \"2000 b.com\"]",
             expected: "[\"1000 a.com\",\"2000 b.com\",\"3000 com\"]", orderMatters: false),
            TestCaseData(id: "d1f3390a-830d-40ff-9531-7a205ae65c96",
             input: "cpdomains = [\"10000 a.com\", \"20000 b.com\"]",
             expected: "[\"10000 a.com\",\"20000 b.com\",\"30000 com\"]", orderMatters: false),
            TestCaseData(id: "3c333a62-86d1-4814-b341-5b29ec938099",
             input: "cpdomains = [\"100000 a.com\", \"200000 b.com\"]",
             expected: "[\"100000 a.com\",\"200000 b.com\",\"300000 com\"]", orderMatters: false),
            TestCaseData(id: "75047cb7-b6f4-4b98-9fce-7b8782a47056",
             input: "cpdomains = [\"-1 a.com\"]",
             expected: "[\"-1 a.com\",\"-1 com\"]", orderMatters: false),
            TestCaseData(id: "94f0a9a9-a2a3-4648-b955-4eb2cca8e5b3",
             input: "cpdomains = [\"0 a.com\"]",
             expected: "[\"0 a.com\",\"0 com\"]", orderMatters: false),
            TestCaseData(id: "4ac2f07c-cadd-4019-80ea-3c4c16df779a",
             input: "cpdomains = [\"1 a.com\", \"-1 a.com\"]",
             expected: "[\"0 a.com\",\"0 com\"]", orderMatters: false),
            TestCaseData(id: "1989393e-721b-4d2e-a9ca-7e57db704b08",
             input: "cpdomains = [\"1 a.com\", \"0 a.com\"]",
             expected: "[\"1 a.com\",\"1 com\"]", orderMatters: false),
            TestCaseData(id: "fc98ef43-56ef-454b-a89b-ebfc6410d4c2",
             input: "cpdomains = [\"1 a.com\", \"1 a.com\", \"-1 a.com\"]",
             expected: "[\"1 a.com\",\"1 com\"]", orderMatters: false),
            TestCaseData(id: "5066beb3-91f0-4f53-b0ee-3b1ef166362f",
             input: "cpdomains = [\"1 a.com\", \"1 a.com\", \"0 a.com\"]",
             expected: "[\"2 a.com\",\"2 com\"]", orderMatters: false),
            TestCaseData(id: "4d9cbee1-7b20-4115-95e5-0fec57228b7a",
             input: "cpdomains = [\"1 a.com\", \"1 b.com\", \"-1 a.com\"]",
             expected: "[\"0 a.com\",\"1 b.com\",\"1 com\"]", orderMatters: false),
            TestCaseData(id: "d88aac61-d888-4304-a5a7-bfd24f8eb080",
             input: "cpdomains = [\"1 a.com\", \"1 b.com\", \"0 a.com\"]",
             expected: "[\"1 a.com\",\"1 b.com\",\"2 com\"]", orderMatters: false),
            TestCaseData(id: "1cb7c720-3a1a-4786-ba80-5629f1bd0423",
             input: "cpdomains = [\"1 a.b.com\", \"1 b.com\"]",
             expected: "[\"1 a.b.com\",\"2 b.com\",\"2 com\"]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "subdomain-visit-count"
            let topic = "arrays-hashing"
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

            guard let p_cpdomains = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_cpdomains.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: cpdomains array too large (\(p_cpdomains.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_cpdomains.count >= 1 && p_cpdomains.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= cpdomain.length <= 100"
                )
                return
            }
            guard p_cpdomains.allSatisfy({ $0.count >= 1 && $0.count <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= cpdomain[i].length <= 100"
                )
                return
            }

            let solution = Solution()
            let result = solution.subdomainVisits(p_cpdomains)
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
