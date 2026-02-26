import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDeleteColumnsToMakeSortedIi {
    private class Solution {
        func minDeletionSize(_ strs: [String]) -> Int {
            let strsArray = strs.map { Array($0) }
            var columnsToDelete = 0
            let n = strsArray.count
            let m = strsArray[0].count

            for j in 0..<m {
                for i in 1..<n {
                    if strsArray[i-1][j] > strsArray[i][j] {
                        columnsToDelete += 1
                        break
                    }
                }
            }

            return columnsToDelete
        }
    }

    @Suite struct DeleteColumnsToMakeSortedIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d0577d17-977f-4296-9482-4573b5bb607b",
             input: "strs = [\"a\",\"b\",\"c\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2fd8f688-a5fb-4028-883a-bbe2d8097b32",
             input: "strs = [\"cba\",\"bac\",\"bca\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "0a24baf7-4d08-4745-89df-72d32b1b8769",
             input: "strs = [\"abc\",\"abc\",\"abc\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e2719521-1e9e-4531-a2f3-55cf94ddc1be",
             input: "strs = [\"abc\",\"def\",\"ghi\",\"jkl\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e7f0db2b-11ea-4709-a0d2-501915428783",
             input: "strs = [\"abc\",\"abc\",\"abc\",\"abc\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c0c37ad6-70ec-492a-b595-fe6e080bf7bf",
             input: "strs = [\"\",\"\",\"\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7fddc2a1-01e7-47b1-b9ba-6f4f86b7d473",
             input: "strs = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\",\""
                + "v\",\"w\",\"x\",\"y\",\"z\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "97874606-3d5d-4a21-9098-169961dc1582",
             input: "strs = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\",\"pqr\",\"stu\",\"vwx\",\"yz\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0767d5f1-a4ef-4f2b-9b3d-fae55694607b",
             input: "strs = [\"abc\",\"abc\",\"abc\",\"abc\",\"abc\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fa2ddf1c-d723-47d2-a8e5-a05f6a0a443f",
             input: "strs = [\"abc\",\"abc\",\"abc\",\"abc\",\"abc\",\"abc\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3e39ff17-a27b-4481-b8fc-f082eba97f20",
             input: "strs = [\"a\",\"a\",\"a\",\"a\",\"a\",\"a\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6d19869d-8a28-4b7d-bd39-8d0d42ad8924",
             input: "strs = [\"z\",\"z\",\"z\",\"z\",\"z\",\"z\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "651d083f-cede-49f5-9ce6-ecf3e7337a90",
             input: "strs = [\"abc\",\"bca\",\"acb\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ae0b9d1f-c424-4e3b-b033-db15ed5f1562",
             input: "strs = [\"z\",\"y\",\"x\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6925add4-3a8a-45c6-8733-51e20881a2f1",
             input: "strs = [\"cba\",\"def\",\"ghi\",\"jkl\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7f84d009-e590-4950-8780-90d54e4fa226",
             input: "strs = [\"abc\",\"def\",\"ghi\",\"cba\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c16c280f-594b-4f08-a352-56af21b78a2d",
             input: "strs = [\"a\",\"aa\",\"aaa\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "15f3f1e0-952b-415b-b7df-d30c76321f49",
             input: "strs = [\"z\",\"y\",\"x\",\"w\",\"v\",\"u\",\"t\",\"s\",\"r\",\"q\",\"p\",\"o\",\"n\",\"m\",\"l\",\"k\",\"j\",\"i\",\"h\",\"g\",\"f\",\""
                + "e\",\"d\",\"c\",\"b\",\"a\"]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "db1bc6fb-945f-4a2f-ba97-ff14ca83cd44",
             input: "strs = [\"cba\",\"fed\",\"ihg\",\"jlk\",\"mno\",\"pqr\",\"stu\",\"vwx\",\"yz\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9a27185c-aec1-45de-b90e-08ecc76314d8",
             input: "strs = [\"abc\",\"def\",\"ghi\",\"jkl\",\"cba\"]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "3a8d0b58-1c5e-4833-ab45-c840128ad822",
             input: "strs = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\",\"pqr\",\"stu\",\"vwx\",\"yz\",\"abc\"]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "3d17e2ca-744d-4e7e-8d4b-405df8fae552",
             input: "strs = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\",\""
                + "v\",\"w\",\"x\",\"y\",\"z\",\"a\"]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "ef7bb3f9-9657-45d8-b157-0f1c187e93c4",
             input: "strs = [\"z\",\"y\",\"x\",\"w\",\"v\",\"u\",\"t\",\"s\",\"r\",\"q\",\"p\",\"o\",\"n\",\"m\",\"l\",\"k\",\"j\",\"i\",\"h\",\"g\",\"f\",\""
                + "e\",\"d\",\"c\",\"b\",\"a\",\"z\"]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "06306859-0cbd-4687-9075-2987b97f62b3",
             input: "strs = [\"ca\",\"bb\",\"ac\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "61c3a1eb-8f58-40a5-834e-1cedbd781296",
             input: "strs = [\"xc\",\"yb\",\"za\"]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "delete-columns-to-make-sorted-ii"
            let topic = "greedy"
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
            guard p_strs.allSatisfy({ $0.count >= 1 && $0.count <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= strs[i].length <= 100"
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
