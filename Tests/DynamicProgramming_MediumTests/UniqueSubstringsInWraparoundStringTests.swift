import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCUniqueSubstringsInWraparoundString {
    private class Solution {
        func findSubstringInWraproundString(_ p: String) -> Int {
            let n = p.count
            var dp = Array(repeating: 0, count: 26)
            var maxLength = 0
            for (i, char) in p.enumerated() {
                let currCharIndex = char.asciiValue.unsafelyUnwrapped - 97
                if i == 0 || (currCharIndex + 26 - (p[p.index(p.startIndex, offsetBy: i - 1)].asciiValue.unsafelyUnwrapped - 97)) % 26 != 1 {
                    maxLength = 0
                }
                maxLength += 1
                dp[Int(currCharIndex)] = max(dp[Int(currCharIndex)], maxLength)
            }
            return dp.reduce(0) { $0 + $1 }
        }
    }

    @Suite struct UniqueSubstringsInWraparoundStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "abba5194-ec8a-4e1c-ad59-9ef80d7cef6b",
             input: "p = \"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5e29010f-323f-4339-8e73-d22fc7446428",
             input: "p = \"a\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4c69bc80-3be9-4052-b9e4-1d9f0b92591f",
             input: "p = \"ab\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "2698e698-be40-4d68-8642-519973d5eb65",
             input: "p = \"z\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "730ac0bc-d613-4953-a4a2-c11111339939",
             input: "p = \"zab\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "a87eefd7-ed2b-414a-ad4e-a46fbf4afff6",
             input: "p = \"abc\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "e46c21ea-cad0-4ed9-b064-ffb41eb6fb19",
             input: "p = \"abcd\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "71407303-153d-496d-a590-b09166953a60",
             input: "p = \"abcde\"",
             expected: "15", orderMatters: true),
            TestCaseData(id: "ebc70094-c0a3-4470-8fc2-5ec76267649c",
             input: "p = \"abcdef\"",
             expected: "21", orderMatters: true),
            TestCaseData(id: "0d69147b-bc1b-47bf-bd25-9379f45842af",
             input: "p = \"za\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d8179da9-1af8-4250-bc3b-c390d2bb69fa",
             input: "p = \"zabc\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "134f2b0b-c71d-4992-9599-c855c21583e5",
             input: "p = \"zyxwv\"",
             expected: "15", orderMatters: true),
            TestCaseData(id: "40fecfe8-6a3e-4531-af30-1e6de086ec60",
             input: "p = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "351", orderMatters: true),
            TestCaseData(id: "fe2bfcb6-01b3-440f-b7fb-26f18f059a1b",
             input: "p = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "1027", orderMatters: true),
            TestCaseData(id: "30ac22f7-8546-4f7a-988e-e6e771f11cec",
             input: "p = \"aaaaaaaaaaaaaaaa\"",
             expected: "16", orderMatters: true),
            TestCaseData(id: "38cc163b-0338-4b3b-b7b5-ccb1ac701acc",
             input: "p = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "1703", orderMatters: true),
            TestCaseData(id: "c0767e8e-56fd-4196-a6b8-dc17ec5e57c2",
             input: "p = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "2379", orderMatters: true),
            TestCaseData(id: "8202f357-167d-4f1d-a4c1-05e46fa0b340",
             input: "p = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "3055", orderMatters: true),
            TestCaseData(id: "2c2833a3-3cb1-4e1a-9775-6fc436998018",
             input: "p = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
                + "abcdefghijklmnopqrstuvwxyz\"",
             expected: "3731", orderMatters: true),
            TestCaseData(id: "5003e363-2218-416a-b67f-06d1a09f53ae",
             input: "p = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
                + "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "4407", orderMatters: true),
            TestCaseData(id: "8174aa05-ec43-4413-894d-ca0f8f5685b9",
             input: "p = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
                + "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "2080", orderMatters: true),
            TestCaseData(id: "2122526e-ad8c-4671-80d9-d94bb0509078",
             input: "p = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
                + "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "2340", orderMatters: true),
            TestCaseData(id: "8a337f4c-5ad8-4f18-94e0-cc513c4df334",
             input: "p = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
                + "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "2600", orderMatters: true),
            TestCaseData(id: "9a1a9020-02d6-4f62-8a83-c92181176e65",
             input: "p = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
                + "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdef"
                + "ghijklmnopqrstuvwxyz\"",
             expected: "2860", orderMatters: true),
            TestCaseData(id: "7224a8bf-7fb3-4c42-902a-2fcf9b2ef7a8",
             input: "p = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
                + "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdef"
                + "ghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "3120", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "unique-substrings-in-wraparound-string"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            let p_p = InputParser.parseString(params[0])
            guard p_p.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: p string too long (\(p_p.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_p.count >= 1 && p_p.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findSubstringInWraproundString(p_p)
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

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
