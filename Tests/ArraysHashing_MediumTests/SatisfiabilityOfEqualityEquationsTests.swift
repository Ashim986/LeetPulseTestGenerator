import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSatisfiabilityOfEqualityEquations {
    private class Solution {
        func equationsPossible(_ equations: [String]) -> Bool {
            var parent = Array(0..<26)

            func find(_ x: Int) -> Int {
                if parent[x] != x {
                    parent[x] = find(parent[x])
                }
                return parent[x]
            }

            func union(_ a: Int, _ b: Int) {
                let ra = find(a)
                let rb = find(b)
                if ra != rb { parent[ra] = rb }
            }

            for eq in equations {
                let chars = Array(eq)
                if chars.count != 4 { continue }
                if chars[1] == "=" && chars[2] == "=" {
                    let a = Int(chars[0].asciiValue ?? 97) - 97
                    let b = Int(chars[3].asciiValue ?? 97) - 97
                    union(a, b)
                }
            }

            for eq in equations {
                let chars = Array(eq)
                if chars.count != 4 { continue }
                if chars[1] == "!" && chars[2] == "=" {
                    let a = Int(chars[0].asciiValue ?? 97) - 97
                    let b = Int(chars[3].asciiValue ?? 97) - 97
                    if find(a) == find(b) { return false }
                }
            }

            return true
        }
    }

    @Suite struct SatisfiabilityOfEqualityEquationsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d277c7fb-9085-4966-bf69-5b90e5fc480c",
             input: "equations = [\"a==b\",\"b==c\",\"c==a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4a238aa4-8342-4c9e-ac58-dbfc6e4e681b",
             input: "equations = [\"a!=b\",\"b!=c\",\"c!=a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c7fac410-9713-4522-ab29-d2b5939d0b36",
             input: "equations = [\"a==b\",\"b!=c\",\"c==a\"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e5ef6f24-63f0-4413-bada-2d36b7cb15b2",
             input: "equations = [\"a==a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "190b8bcc-2193-4c38-92a1-cebbfa5feecf",
             input: "equations = [\"a!=a\"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6b256b6d-2867-4049-a303-962b54bcdf32",
             input: "equations = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "449d08f8-405a-4a3e-aa22-9018dcab5f4b",
             input: "equations = [\"a==b\",\"a==b\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "212465ad-c229-4d98-9f0a-ec9f5542d63c",
             input: "equations = [\"a!=b\",\"a!=b\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f5e7585d-d986-4248-aed8-748e627dc57d",
             input: "equations = [\"a==b\",\"c==d\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9974763c-bea4-46dd-bdd9-a37718794db6",
             input: "equations = [\"a!=b\",\"c!=d\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7ad274c4-2173-4a8d-8c0b-fdd65a623cf8",
             input: "equations = [\"a==b\",\"a==c\",\"b==c\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "01a337f8-93ba-4ce6-b786-caef23c5107a",
             input: "equations = [\"a!=b\",\"a!=c\",\"b!=c\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f0d5e683-69d5-4616-b493-251a43ab3143",
             input: "equations = [\"a==b\",\"a==c\",\"b!=c\"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0cd4829d-57d9-42ec-92cb-9fb52c7fd95a",
             input: "equations = [\"a!=b\",\"a==c\",\"b==c\"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7c8334ab-d2ed-489a-b358-2ff48ae79cf3",
             input: "equations = [\"a==b\",\"a==c\",\"a==d\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "15273c43-5e38-4971-9117-a129f5620962",
             input: "equations = [\"a!=b\",\"a!=c\",\"a!=d\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0f299ee6-126d-496c-94a7-7593b6309f0c",
             input: "equations = [\"a==b\",\"b==c\",\"c==d\",\"d==e\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ee2d6f14-39e7-4bc1-baa5-0aedabab4b62",
             input: "equations = [\"a!=b\",\"b!=c\",\"c!=d\",\"d!=e\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "69f7f0c4-8279-4773-ad0b-d9419de6a52d",
             input: "equations = [\"a==b\",\"b==c\",\"c==d\",\"d==e\",\"e==f\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "281772b7-9e8a-4667-85fe-e8531a002330",
             input: "equations = [\"a!=b\",\"b!=c\",\"c!=d\",\"d!=e\",\"e!=f\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "79c21b68-281b-4d86-a831-fe30c36af1fa",
             input: "equations = [\"a==b\",\"a==c\",\"a==d\",\"a==e\",\"a==f\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5530d8c0-4891-47ab-9588-77f70fd98d3a",
             input: "equations = [\"a!=b\",\"a!=c\",\"a!=d\",\"a!=e\",\"a!=f\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "14dd7f90-18b6-4ae4-a772-43b48eaa8198",
             input: "equations = [\"x==y\",\"x==z\",\"y==z\",\"w==v\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a9c5c302-dd53-4344-acd9-ae493a8e3dd8",
             input: "equations = [\"x!=y\",\"x!=z\",\"y!=z\",\"w!=v\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c1344636-03d0-4e32-a5db-b51eb6af00d0",
             input: "equations = [\"x==y\",\"x==z\",\"y==z\",\"w!=v\"]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "satisfiability-of-equality-equations"
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

            guard let p_equations = InputParser.parseStringArray(params[0]) else {
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
            guard p_equations.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: equations array too large (\(p_equations.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_equations.count >= 1 && p_equations.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= equations.length <= 500"
                )
                return
            }
            guard p_equations.count == 4 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: equations[i].length == 4"
                )
                return
            }

            let solution = Solution()
            let result = solution.equationsPossible(p_equations)
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
