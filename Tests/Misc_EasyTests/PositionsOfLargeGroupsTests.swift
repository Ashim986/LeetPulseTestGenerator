import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPositionsOfLargeGroups {
    private class Solution {
        func largeGroupPositions(s: String) -> [[Int]] {
            var res: [[Int]] = []
            var left = 0
            var count = 1
            let sArray = Array(s)
            for i in 1...sArray.count - 1 {
                if sArray[i] == sArray[i - 1] {
                    count += 1
                }
                else {
                    if count >= 3 {
                        res.append([left, i - 1])
                    }
                    left = i
                    count = 1
                }
            }
            if count >= 3 {
                res.append([left, sArray.count - 1])
            }
            return res
        }
    }

    @Suite struct PositionsOfLargeGroupsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4046acc3-b908-4509-b772-234640299ae5",
             input: "s = \"aaa\"",
             expected: "[[0,2]]", orderMatters: true),
            TestCaseData(id: "19521228-f74b-43ce-8af3-11ef1617d82f",
             input: "s = \"aaab\"",
             expected: "[[0,2]]", orderMatters: true),
            TestCaseData(id: "d1bcf046-6196-4d6c-a7ee-471221b14108",
             input: "s = \"\"",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "33256fb7-39fd-4696-8818-b853ba2ba809",
             input: "s = \"a\"",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "b245a40f-fb0f-4cde-b811-09c77440d45b",
             input: "s = \"ab\"",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "c29d8ce4-f4ab-4dea-9d0b-8d7ff164081e",
             input: "s = \"aabbbcc\"",
             expected: "[[2,4]]", orderMatters: true),
            TestCaseData(id: "72126440-9d98-4d61-a171-eef076317c33",
             input: "s = \"abcabcabc\"",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "764126e5-9a8d-4e8d-b271-2715efa4b66c",
             input: "s = \"aaaaaa\"",
             expected: "[[0,5]]", orderMatters: true),
            TestCaseData(id: "535fa21b-d030-4a71-a2e9-e2d896f7a3e2",
             input: "s = \"abababab\"",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "59d63d4b-c7fd-4db9-a395-fd2573112e8e",
             input: "s = \"aaaaaaaaaa\"",
             expected: "[[0,9]]", orderMatters: true),
            TestCaseData(id: "2a25a3c1-e6a9-4df3-ba47-8534fa252856",
             input: "s = \"bbbbbbbbbb\"",
             expected: "[[0,9]]", orderMatters: true),
            TestCaseData(id: "d6910c39-c36e-4cc7-9685-d5cf22ee4c92",
             input: "s = \"cccccccccc\"",
             expected: "[[0,9]]", orderMatters: true),
            TestCaseData(id: "51179ee4-4237-44a4-946f-b4df217cf42e",
             input: "s = \"dddddddddd\"",
             expected: "[[0,9]]", orderMatters: true),
            TestCaseData(id: "f9fc0c42-b271-481d-b11e-5c74871b3c52",
             input: "s = \"abbbbbbbbb\"",
             expected: "[[1,9]]", orderMatters: true),
            TestCaseData(id: "ffc85277-a143-4bfb-b0bb-549cf31268ea",
             input: "s = \"ababababab\"",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "82b93edc-518c-4f60-82e8-d0ee788afb4c",
             input: "s = \"aaaaaabbbbb\"",
             expected: "[[0,5],[6,10]]", orderMatters: true),
            TestCaseData(id: "a204527e-6529-411a-9735-828cdd999712",
             input: "s = \"bbbbbbbaaaa\"",
             expected: "[[0,6],[7,10]]", orderMatters: true),
            TestCaseData(id: "a31ad0de-c88e-4bb4-bcee-a9cd31fe29cc",
             input: "s = \"ababababababab\"",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "80271fb3-300d-453b-a5f4-672c932fe2cd",
             input: "s = \"aaaaaaaaaaaaaaa\"",
             expected: "[[0,14]]", orderMatters: true),
            TestCaseData(id: "c6a9f3b2-bd94-42a6-822d-87e3ac718512",
             input: "s = \"bbbbbbbbbbbbbbb\"",
             expected: "[[0,14]]", orderMatters: true),
            TestCaseData(id: "f1bdbc3b-1685-45bc-9410-9fe974e62dd3",
             input: "s = \"ccccccccccccccc\"",
             expected: "[[0,14]]", orderMatters: true),
            TestCaseData(id: "05b8e9a7-80f7-4e0d-b7b4-f034cadec08b",
             input: "s = \"ddddddddddddddd\"",
             expected: "[[0,14]]", orderMatters: true),
            TestCaseData(id: "9b139ec5-962a-4eed-a540-3fc19324c713",
             input: "s = \"abababababababab\"",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "9436d63c-1a4f-43df-a70b-567d761efde6",
             input: "s = \"ccccccccccccccccc\"",
             expected: "[[0,16]]", orderMatters: true),
            TestCaseData(id: "2ede6dae-9385-430a-b68e-3abffc56f2de",
             input: "s = \"abba\"",
             expected: "[]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "positions-of-large-groups"
            let topic = "misc"
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

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.largeGroupPositions(s: p_s)
            let computedOutput = OutputSerializer.serialize(result)

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[Int]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
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
