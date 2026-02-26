import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReverseBits {
    private class Solution {
        func reverseBits(_ n: Int) -> Int {
            var num = n
            // Swap adjacent bits
            num = ((num & 0x55555555) << 1) | ((num >> 1) & 0x55555555)
            // Swap adjacent 2-bit pairs
            num = ((num & 0x33333333) << 2) | ((num >> 2) & 0x33333333)
            // Swap adjacent 4-bit nibbles
            num = ((num & 0x0F0F0F0F) << 4) | ((num >> 4) & 0x0F0F0F0F)
            // Swap adjacent bytes
            num = ((num & 0x00FF00FF) << 8) | ((num >> 8) & 0x00FF00FF)
            // Swap adjacent 16-bit halves
            num = ((num & 0x0000FFFF) << 16) | ((num >> 16) & 0x0000FFFF)
            return num
        }
    }

    @Suite struct ReverseBitsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c3c8c75a-876c-4a12-9faa-244be318a3e9",
             input: "n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2ce28522-bc15-41bf-a392-0ab28decbb0d",
             input: "n = 1",
             expected: "2147483648", orderMatters: true),
            TestCaseData(id: "cf34ad7c-4e34-4009-97a2-0db4484cc06b",
             input: "n = 2",
             expected: "1073741824", orderMatters: true),
            TestCaseData(id: "b6f8383d-d9e5-4203-bd0f-4cf3dc3ea969",
             input: "n = 2147483647",
             expected: "4294967294", orderMatters: true),
            TestCaseData(id: "6eec20b2-0529-4229-8882-a3087fbe3718",
             input: "n = 4294967295",
             expected: "4294967295", orderMatters: true),
            TestCaseData(id: "60dd26c9-67c6-4435-afc8-d047b02c57b8",
             input: "n = 4294967294",
             expected: "2147483647", orderMatters: true),
            TestCaseData(id: "80a4db01-1578-4242-8a81-7bec9932ff64",
             input: "n = 4294967292",
             expected: "1073741823", orderMatters: true),
            TestCaseData(id: "b40e3b30-4792-4656-999e-f43db2876cb2",
             input: "n = 4294967291",
             expected: "3758096383", orderMatters: true),
            TestCaseData(id: "307b616a-ee65-45fc-bf10-db3fac63e454",
             input: "n = 4294967290",
             expected: "1610612735", orderMatters: true),
            TestCaseData(id: "eeb8a32b-460f-4dae-a921-ae82021350e6",
             input: "n = 4294967289",
             expected: "2684354559", orderMatters: true),
            TestCaseData(id: "5b495b26-8c71-4be5-af05-c74cedb1603b",
             input: "n = 4294967288",
             expected: "536870911", orderMatters: true),
            TestCaseData(id: "d5e32c0f-cfa3-4463-92a4-510bdc9fc20e",
             input: "n = 4294967287",
             expected: "4026531839", orderMatters: true),
            TestCaseData(id: "80b5d4af-f5dc-4915-80d3-9eb459529f2e",
             input: "n = 4294967286",
             expected: "3489660927", orderMatters: true),
            TestCaseData(id: "180636b8-e216-44d7-b4eb-7b5928247f95",
             input: "n = 4294967285",
             expected: "2952780015", orderMatters: true),
            TestCaseData(id: "a1636abb-0d45-4b63-9d31-2d0d715880ff",
             input: "n = 4294967284",
             expected: "805306367", orderMatters: true),
            TestCaseData(id: "339cc6ed-d570-4c1e-9826-e90f2ca2894e",
             input: "n = 4294967283",
             expected: "2415919103", orderMatters: true),
            TestCaseData(id: "fd8b1521-8553-4c0f-bdc9-ba9d851ae249",
             input: "n = 4294967282",
             expected: "1342177279", orderMatters: true),
            TestCaseData(id: "81e68bd4-d1c8-4697-a720-db152085a7c8",
             input: "n = 4294967281",
             expected: "536870911", orderMatters: true),
            TestCaseData(id: "4e57c6fd-0847-4a2f-847b-81849ccfeac1",
             input: "n = 4294967280",
             expected: "268435455", orderMatters: true),
            TestCaseData(id: "340ba3d2-5690-4df5-8f95-36a16d3c04ae",
             input: "n = 4294967279",
             expected: "4160749567", orderMatters: true),
            TestCaseData(id: "841f4d8a-074e-4785-8173-2e33a9b5fcb7",
             input: "n = 4294967278",
             expected: "2013265919", orderMatters: true),
            TestCaseData(id: "96394a03-75e2-4c35-b823-d6fcad854833",
             input: "n = 4294967277",
             expected: "3087006743", orderMatters: true),
            TestCaseData(id: "48848324-013b-489b-8d4f-e489aea92deb",
             input: "n = 4294967276",
             expected: "939524095", orderMatters: true),
            TestCaseData(id: "7e387576-a863-4367-8799-947d0481705f",
             input: "n = 4294967275",
             expected: "3623878727", orderMatters: true),
            TestCaseData(id: "a0bad9e8-3dbf-4457-a490-22466e014290",
             input: "n = 4294967274",
             expected: "1476395007", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reverse-bits"
            let topic = "bit-manipulation"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= n <= 231 - 2"
                )
                return
            }

            let solution = Solution()
            let result = solution.reverseBits(p_n)
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
