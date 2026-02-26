import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSimplifyPath {
    private class Solution {
        func simplifyPath(path: String) -> String {
            let components = path.components(separatedBy: "/")
            var stack: [String] = []
            for component in components {
                switch component {
                case "":
                    continue
                case ".":
                    continue
                case "..":
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                default:
                    stack.append(component)
                }
            }
            return "/" + stack.joined(separator: "/")
        }
    }

    @Suite struct SimplifyPathTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "8072400F-AE58-4F2D-B5A5-3EF8F33873B1",
             input: "/home/",
             expected: "/home", orderMatters: true),
            TestCaseData(id: "BD85A053-C4AF-46DF-9B2F-A7139BEE2B00",
             input: "/home//foo/",
             expected: "/home/foo", orderMatters: true),
            TestCaseData(id: "3F9E89C2-75D2-4B97-B6C2-3C5BDAAA0851",
             input: "/a/./b/../../c/",
             expected: "/c", orderMatters: true),
            TestCaseData(id: "5F2F9A4C-1127-4701-B043-14D88A1F6719",
             input: "/../",
             expected: "/", orderMatters: true),
            TestCaseData(id: "92BD0B26-B2D0-47CA-AB77-83B182E1C3C0",
             input: "/home//foo//",
             expected: "/home/foo", orderMatters: true),
            TestCaseData(id: "A3EFFB6B-9671-4E5B-8533-59F33D1FDCCC",
             input: "/a/../../b/../c//.//",
             expected: "/c", orderMatters: true),
            TestCaseData(id: "656BAF67-8750-40E4-854A-CD8C05C57F3F",
             input: "/",
             expected: "/", orderMatters: true),
            TestCaseData(id: "70D282C3-5FAC-46E9-8FCC-440CABE6D2FF",
             input: "/home",
             expected: "/home", orderMatters: true),
            TestCaseData(id: "17432C88-5932-476F-9BB9-64615976FB30",
             input: "/..",
             expected: "/", orderMatters: true),
            TestCaseData(id: "361B7A4C-650E-47C8-BAE0-26309A7B74A7",
             input: "/././././",
             expected: "/", orderMatters: true),
            TestCaseData(id: "86C45B17-98DD-4525-976A-D743D8D23DF9",
             input: "/a/b/c/../..",
             expected: "/a", orderMatters: true),
            TestCaseData(id: "0E81373E-3342-473C-AEC9-F74A8BEC244F",
             input: "/a//b////c/d//././/..",
             expected: "/a/b/c", orderMatters: true),
            TestCaseData(id: "EE3EA0A9-E374-4E88-804A-DE1568E5E829",
             input: "/...",
             expected: "/...", orderMatters: true),
            TestCaseData(id: "F98E42A9-88CE-4045-932E-ADA8845C623C",
             input: "//",
             expected: "/", orderMatters: true),
            TestCaseData(id: "B3BD4D7C-52FE-4FFB-BEEC-1EE352118E43",
             input: "/.",
             expected: "/", orderMatters: true),
            TestCaseData(id: "74D2DC73-B06B-43BE-9EC0-D824824CF2A7",
             input: "/a/./b/",
             expected: "/a/b", orderMatters: true),
            TestCaseData(id: "2156D913-ED40-416F-94E3-5D3E6E2326AA",
             input: "/home//foo//./bar/",
             expected: "/home/foo/bar", orderMatters: true),
            TestCaseData(id: "610343BA-F0E0-4D63-91B8-BDA2EDF698E6",
             input: "/a/./b/../../c//.//",
             expected: "/c", orderMatters: true),
            TestCaseData(id: "13f3e0b0-5498-4df3-8632-8ef1f59a978e",
             input: "path = \"/a/./b/../../c/\"",
             expected: "/c", orderMatters: true),
            TestCaseData(id: "af586cfa-f03b-422c-97e7-76afda4bb054",
             input: "path = \"/home//foo/./bar/\"",
             expected: "/home/foo/bar", orderMatters: true),
            TestCaseData(id: "7a46884b-9f56-4ae0-b561-26bde8d650ab",
             input: "path = \"/../\"",
             expected: "/", orderMatters: true),
            TestCaseData(id: "ac4d3ee1-335c-411b-8b18-28cc340347a4",
             input: "path = \"/home//foo/../bar/\"",
             expected: "/home/bar", orderMatters: true),
            TestCaseData(id: "0dd16985-24bd-45c2-9a0c-5e1bbc8f3aca",
             input: "path = \"/a/../../b/../c//.//\"",
             expected: "/c", orderMatters: true),
            TestCaseData(id: "cf6e68bb-ac71-4fab-a19d-85d648a90eef",
             input: "path = \"/\"",
             expected: "/", orderMatters: true),
            TestCaseData(id: "638c1ee8-a36a-4cf3-87fd-e3d9a4f21dba",
             input: "path = \"/home\"",
             expected: "/home", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "simplify-path"
            let topic = "stack"
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

            let p_path = InputParser.parseString(params[0])
            guard p_path.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: path string too long (\(p_path.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_path.count >= 1 && p_path.count <= 3000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= path.length <= 3000"
                )
                return
            }

            let solution = Solution()
            let result = solution.simplifyPath(path: p_path)
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
