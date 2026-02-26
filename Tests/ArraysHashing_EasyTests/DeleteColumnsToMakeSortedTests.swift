import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDeleteColumnsToMakeSorted {
    private class Solution {
        func minDeletionSize(_ strs: [String]) -> Int {
            var strs = strs.map { Array($0) }
            var result = 0
            for col in 0..<strs[0].count {
                for row in 1..<strs.count {
                    if strs[row][col] < strs[row-1][col] {
                        result += 1
                        break
                    }
                }
            }
            return result
        }
    }

    @Suite struct DeleteColumnsToMakeSortedTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f26cc1cb-291d-4daa-8978-f2ef9bbacbb5",
             input: "strs = [\"abc\",\"bca\",\"acb\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1814e367-377a-41ba-9fea-58033b716d1c",
             input: "strs = [\"aaa\",\"bbb\",\"ccc\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "27a02a8f-a2c5-4c17-afb5-07ebc116b4a4",
             input: "strs = [\"abc\",\"abc\",\"abc\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7fcb99e7-7108-4c36-ae27-3ea01029559e",
             input: "strs = [\"a\",\"a\",\"a\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0f024199-b635-450b-b558-d1bcd8144642",
             input: "strs = [\"z\",\"z\",\"z\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9540b6e0-a9a7-4c85-afd8-8ab817144fe0",
             input: "strs = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\",\"pqr\",\"stu\",\"vwx\",\"yz\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e0b994a9-bd9d-4e35-b2d1-508454ad7d7f",
             input: "strs = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\",\""
                + "v\",\"w\",\"x\",\"y\",\"z\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dd5442ed-6072-45bb-bfb2-bed94698fba1",
             input: "strs = [\"abc\",\"bca\",\"cab\",\"dab\",\"eab\",\"fab\",\"gab\",\"hab\",\"iab\",\"jab\",\"kab\",\"lab\",\"mab\",\"nab\",\"oab\",\"pab\","
                + "\"qab\",\"rab\",\"sab\",\"tab\",\"uab\",\"vab\",\"wab\",\"xab\",\"yab\",\"zab\",\"abc\",\"bca\",\"cab\",\"dab\",\"eab\",\"fab\",\"gab\","
                + "\"hab\",\"iab\",\"jab\",\"kab\",\"lab\",\"mab\",\"nab\",\"oab\",\"pab\",\"qab\",\"rab\",\"sab\",\"tab\",\"uab\",\"vab\",\"wab\",\"xab\","
                + "\"yab\",\"zab\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c4a7cf30-6b70-42a5-a648-49b289a7766b",
             input: "strs = [\"abc\",\"bca\",\"cab\",\"dab\",\"eab\",\"fab\",\"gab\",\"hab\",\"iab\",\"jab\",\"kab\",\"lab\",\"mab\",\"nab\",\"oab\",\"pab\","
                + "\"qab\",\"rab\",\"sab\",\"tab\",\"uab\",\"vab\",\"wab\",\"xab\",\"yab\",\"zab\",\"abc\",\"bca\",\"cab\",\"dab\",\"eab\",\"fab\",\"gab\","
                + "\"hab\",\"iab\",\"jab\",\"kab\",\"lab\",\"mab\",\"nab\",\"oab\",\"pab\",\"qab\",\"rab\",\"sab\",\"tab\",\"uab\",\"vab\",\"wab\",\"xab\","
                + "\"yab\",\"zab\",\"abc\",\"bca\",\"cab\",\"dab\",\"eab\",\"fab\",\"gab\",\"hab\",\"iab\",\"jab\",\"kab\",\"lab\",\"mab\",\"nab\",\"oab\","
                + "\"pab\",\"qab\",\"rab\",\"sab\",\"tab\",\"uab\",\"vab\",\"wab\",\"xab\",\"yab\",\"zab\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "5a26f34a-ed11-453c-b79b-5d16a6477a0e",
             input: "strs = [\"a\",\"b\",\"c\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "04119a73-dae2-4d25-9abe-0cee850ec9f4",
             input: "strs = [\"abc\",\"bca\",\"cab\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "3b2481a4-aeb6-4424-acb8-80578ff7446b",
             input: "strs = [\"abc\",\"def\",\"ghi\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "156ac7a9-70c1-4777-ab71-757654d3f2d6",
             input: "strs = [\"abc\",\"bca\",\"cab\",\"dab\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "20889069-7df3-4cb9-95e7-61d17f462f24",
             input: "strs = [\"abc\",\"def\",\"ghi\",\"jkl\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2fd34993-b7ad-426b-b1a1-88acafe9e4c1",
             input: "strs = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fa3d47c0-7b5e-48c1-a02e-19ac7fff3327",
             input: "strs = [\"abc\",\"bca\",\"cab\",\"dab\",\"eab\",\"fab\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4720a472-6cf7-4f80-8b0f-26a8c6692b2c",
             input: "strs = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\",\"pqr\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7dab8597-2054-434f-b75f-aaf470ff31a8",
             input: "strs = [\"abc\",\"bca\",\"cab\",\"dab\",\"eab\",\"fab\",\"gab\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7206a150-3db5-47e0-9e5c-49ece96f5d07",
             input: "strs = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\",\"pqr\",\"stu\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "40f597bc-2123-4c7a-851e-6c577607857a",
             input: "strs = [\"abc\",\"bca\",\"cab\",\"dab\",\"eab\",\"fab\",\"gab\",\"hab\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f5508820-559b-4f3b-800d-2be535682d62",
             input: "strs = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\",\"pqr\",\"stu\",\"vwx\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "289ffae5-321e-4ab8-82ca-d688d78b45e0",
             input: "strs = [\"abc\",\"bca\",\"cab\",\"dab\",\"eab\",\"fab\",\"gab\",\"hab\",\"iab\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7610451f-aaca-4e9c-8ba3-4b0935bc4b37",
             input: "strs = [\"abc\",\"bca\",\"cab\",\"dab\",\"eab\",\"fab\",\"gab\",\"hab\",\"iab\",\"jab\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "fe7ce5d3-e71f-4a3c-bde6-211dd1c87e75",
             input: "strs = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "435c18d3-f4d9-4279-b09e-f98e2c23e5cc",
             input: "strs = [\"abc\"]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "delete-columns-to-make-sorted"
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

            guard let p_strs = InputParser.parseStringArray(params[0]) else {
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
            guard p_strs.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: strs array too large (\(p_strs.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_strs.allSatisfy({ $0.count >= 1 && $0.count <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= strs[i].length <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.minDeletionSize(p_strs)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
