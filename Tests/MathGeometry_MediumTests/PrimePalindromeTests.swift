import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPrimePalindrome {
    private class Solution {
        func primePalindrome(_ n: Int) -> Int {
            func isPrime(_ num: Int) -> Bool {
                guard num > 1 else { return false }
                let sqrtNum = Int(sqrt(Double(num)))
                for i in 2...sqrtNum {
                    if num % i == 0 { return false }
                }
                return true
            }

            let strN = String(n)
            let lenN = strN.count

            if lenN == 1 {
                if n == 8 || n == 9 { return 11 }
                else { return n + 1 }
            }

            let halfLenN = lenN / 2

            var half = 1
            while half <= n / (10 ^ halfLenN) {
                var candidate = half * (10 ^ halfLenN) + half
                if candidate > n && isPrime(candidate) {
                    return candidate
                }
                half += 1
            }

            half = 10
            while half <= n / (10 ^ halfLenN) {
                var candidate = half * (10 ^ (halfLenN - 1)) + half / 10
                if candidate > n && isPrime(candidate) {
                    return candidate
                }
                half += 1
            }

            return -1
        }
    }

    @Suite struct PrimePalindromeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4416bcc7-32b4-4354-aad9-1c9cec5c51c3",
             input: "n = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1cc3d605-17f3-48d4-a2ff-3a82f4fade27",
             input: "n = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e8a067de-971e-44f5-9981-03d2b81aa45f",
             input: "n = 7",
             expected: "11", orderMatters: true),
            TestCaseData(id: "793d978f-2854-407f-a371-f91dcfb8202b",
             input: "n = 9",
             expected: "11", orderMatters: true),
            TestCaseData(id: "b218da82-56a9-4c0e-9484-559960829938",
             input: "n = 12",
             expected: "101", orderMatters: true),
            TestCaseData(id: "98a174b4-4215-403e-a0f9-bb0283184943",
             input: "n = 13",
             expected: "101", orderMatters: true),
            TestCaseData(id: "c2efd367-4b42-4e18-8349-2c0d99fbf165",
             input: "n = 14",
             expected: "101", orderMatters: true),
            TestCaseData(id: "65abff1a-2a9b-4757-a6ed-a3ee5026faa6",
             input: "n = 15",
             expected: "101", orderMatters: true),
            TestCaseData(id: "25ff9d20-f6c7-4667-a730-315c59928f4d",
             input: "n = 16",
             expected: "101", orderMatters: true),
            TestCaseData(id: "edbed631-a1bd-4ab0-9f0f-fb07fc983db0",
             input: "n = 17",
             expected: "101", orderMatters: true),
            TestCaseData(id: "d734e180-7660-4359-8fb4-e3e67712f037",
             input: "n = 18",
             expected: "101", orderMatters: true),
            TestCaseData(id: "3becf0e4-cb3a-403b-b09c-88dd71a522e1",
             input: "n = 19",
             expected: "101", orderMatters: true),
            TestCaseData(id: "17216824-6af2-43aa-854d-42e2272a8e77",
             input: "n = 20",
             expected: "101", orderMatters: true),
            TestCaseData(id: "bd4ca92a-d69e-48cc-a310-91de3139c29d",
             input: "n = 21",
             expected: "101", orderMatters: true),
            TestCaseData(id: "b286593a-2ef2-4027-9095-2b33b73c16e9",
             input: "n = 22",
             expected: "101", orderMatters: true),
            TestCaseData(id: "e3d52cb7-9504-4f3f-9cc5-c7ba0d6bd00b",
             input: "n = 23",
             expected: "101", orderMatters: true),
            TestCaseData(id: "1f2055a6-1144-4e13-b2e0-7c4ddb0b014e",
             input: "n = 24",
             expected: "101", orderMatters: true),
            TestCaseData(id: "e56948ae-0ad0-46fe-abc1-1e012b2331ed",
             input: "n = 25",
             expected: "101", orderMatters: true),
            TestCaseData(id: "04716ef9-239e-4148-987b-329c9f1c67bc",
             input: "n = 26",
             expected: "101", orderMatters: true),
            TestCaseData(id: "6db857ac-dcea-4b61-96c3-e133069e5a0b",
             input: "n = 27",
             expected: "101", orderMatters: true),
            TestCaseData(id: "92b90b5b-9fd0-45d2-9457-6f8866ee54bb",
             input: "n = 28",
             expected: "101", orderMatters: true),
            TestCaseData(id: "2bd81fae-92bf-4b90-b73e-977e42ed8d81",
             input: "n = 29",
             expected: "101", orderMatters: true),
            TestCaseData(id: "15cf626f-5c44-442c-99f5-2efcc553b07a",
             input: "n = 30",
             expected: "101", orderMatters: true),
            TestCaseData(id: "b4286f3c-b650-4aec-accf-554e13a26b53",
             input: "n = -1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c1d0600f-7a4d-40ed-9e16-6880d66c2229",
             input: "n = 2",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "prime-palindrome"
            let topic = "math-geometry"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 108 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 108"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.primePalindrome(p_n)
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
