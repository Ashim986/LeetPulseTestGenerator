import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCWordSubsets {
    private class Solution {
        func wordSubsets(_ A: [String], _ B: [String]) -> [String] {
            var bmax = [Character: Int]()
            for b in B {
                var bcount = Array(b).reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
                for (char, count) in bcount {
                    bmax[char] = max(bmax[char] ?? 0, count)
                }
            }
            var ans: [String] = []
            for a in A {
                var acount = Array(a).reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
                var isSuperset = true
                for (char, count) in bmax {
                    if acount[char] ?? 0 < count {
                        isSuperset = false
                        break
                    }
                }
                if isSuperset {
                    ans.append(a)
                }
            }
            return ans
        }
    }

    @Suite struct WordSubsetsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "85f778cb-be16-4b9a-b347-fdc6ca220d63",
             input: "A = [\"a\"], B = [\"a\"]",
             expected: "[\"a\"]", orderMatters: false),
            TestCaseData(id: "dfd72f25-d733-4834-9732-6fc45ea8a698",
             input: "A = [\"a\"], B = [\"b\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "c0fc6449-09d5-4e27-9fb0-8c00cec3188e",
             input: "A = [\"a\", \"b\"], B = [\"a\"]",
             expected: "[\"a\"]", orderMatters: false),
            TestCaseData(id: "77bddced-9fae-4d9b-b015-cb7ad677aba9",
             input: "A = [\"a\", \"b\"], B = [\"b\"]",
             expected: "[\"b\"]", orderMatters: false),
            TestCaseData(id: "6eb3bb00-beac-4bb0-8352-ba9d7afa18f1",
             input: "A = [\"a\", \"b\"], B = [\"c\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "8215ccf9-dc6d-41eb-9c1e-149973fb399a",
             input: "A = [\"abc\", \"def\"], B = [\"g\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "96db3b51-e13a-4a37-a895-5bbc3d3bcde2",
             input: "A = [\"abc\", \"def\", \"ghi\"], B = [\"j\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "ea982e96-abf7-4f26-b83c-d0c0fca473b1",
             input: "A = [\"apple\", \"banana\", \"cherry\"], B = [\"z\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "e6ef55e0-f0f4-42ea-a2e0-51e90770c68e",
             input: "A = [\"hello\", \"world\"], B = [\"x\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "0090ca9c-0497-4556-abec-0e36ea816162",
             input: "A = [\"aaa\", \"bbb\", \"ccc\"], B = [\"d\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "5938203c-3a1b-4335-b2ba-e090a02747fa",
             input: "A = [\"aaaa\", \"bbbb\", \"cccc\"], B = [\"d\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "3dbe7d6e-47c4-4091-ba1d-afc459188cb4",
             input: "A = [\"abcde\", \"fghij\", \"klmno\"], B = [\"p\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "608fbadf-f936-4947-8f02-8721353240c0",
             input: "A = [], B = [\"a\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "381bad07-38a4-4550-b5a1-352e6d849d7b",
             input: "A = [\"a\"], B = []",
             expected: "[\"a\"]", orderMatters: false),
            TestCaseData(id: "a4f8e912-5143-49ea-a2d3-390ccdd6aa8b",
             input: "A = [\"abc\", \"def\"], B = [\"a\", \"d\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "f7512041-5c04-4258-93fc-fd46c18e97e2",
             input: "A = [\"abc\", \"def\"], B = [\"b\", \"e\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "8b95fb2e-59a9-44df-bfdd-9404147055c5",
             input: "A = [\"abc\", \"def\"], B = [\"c\", \"f\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "495bff53-58c0-4d93-b6f0-e6829b0e5515",
             input: "A = [\"abc\", \"def\", \"ghi\"], B = [\"a\", \"d\", \"g\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "86653ca8-3da9-43c7-bb00-7ed20e86fa85",
             input: "A = [\"abc\", \"def\", \"ghi\"], B = [\"b\", \"e\", \"h\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "0a6c6835-b74d-48c5-8101-0f4747cf6524",
             input: "A = [\"abc\", \"def\", \"ghi\"], B = [\"c\", \"f\", \"i\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "ed23f7ed-1721-4fa4-99cd-13b5fd46a3c9",
             input: "A = [\"apple\", \"banana\", \"cherry\"], B = [\"a\", \"b\", \"c\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "4519eed1-a79d-4258-82df-fd11d4ece1f8",
             input: "A = [\"apple\", \"banana\", \"cherry\"], B = [\"p\", \"n\", \"r\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "e6a2e2a0-c5d7-4d45-bfc1-41656d5b9343",
             input: "A = [\"apple\", \"banana\", \"cherry\"], B = [\"l\", \"a\", \"y\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "9e5baca5-d08c-4284-bfb5-60dac01da4da",
             input: "A = [\"hello\", \"world\"], B = [\"h\", \"w\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "77844573-2d37-4d7f-8f09-2d3714835bde",
             input: "A = [\"hello\", \"world\"], B = [\"e\", \"r\"]",
             expected: "[]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "word-subsets"
            let topic = "arrays-hashing"
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

            guard let p_A = InputParser.parseStringArray(params[0]) else {
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
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }
            guard let p_B = InputParser.parseStringArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [String]"
                )
                return
            }
            guard p_B.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: B array too large (\(p_B.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_A.count >= 1 && p_A.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words1.length, words2.length <= 10^4"
                )
                return
            }
            guard p_B.count >= 1 && p_B.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words1.length, words2.length <= 10^4"
                )
                return
            }
            guard p_A.allSatisfy({ $0.count >= 1 && $0.count <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words1[i].length, words2[i].length <= 10"
                )
                return
            }
            guard p_B.allSatisfy({ $0.count >= 1 && $0.count <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words1[i].length, words2[i].length <= 10"
                )
                return
            }

            let solution = Solution()
            let result = solution.wordSubsets(p_A, p_B)
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
