import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMoveZeroes {
    private class Solution {
        func moveZeroes(_ nums: inout [Int]) {
            var slow = 0

            for fast in 0..<nums.count {
                if nums[fast] != 0 {
                    // Swap only if positions differ (avoid self-swap)
                    if slow != fast {
                        nums.swapAt(slow, fast)
                    }
                    slow += 1
                }
            }
        }
    }

    @Suite struct MoveZeroesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d4bc66bf-9c99-4f27-b3d4-98d0550edf0b",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "26e4dc55-5150-4d5b-8661-f03f314cdb30",
             input: "nums = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "b97506b0-3348-4523-9fbf-3e22ea193985",
             input: "nums = [0,0,0]",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "54d5ce31-c3f7-49ae-9aad-1b34391c616d",
             input: "nums = [1,2,3,4,5]",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "cca52ad8-548a-4f5b-b2b2-66800211806f",
             input: "nums = [5,4,3,2,1]",
             expected: "[5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "5fd1ad4a-1595-400b-bea5-0f62b496afbc",
             input: "nums = [1,0,1,0,1]",
             expected: "[1,1,1,0,0]", orderMatters: true),
            TestCaseData(id: "063757cf-5938-47a9-98da-8e6df298c523",
             input: "nums = [0,1,0,1,0]",
             expected: "[1,1,0,0,0]", orderMatters: true),
            TestCaseData(id: "0f7969c8-1467-467b-9fac-3a8f4d49ce93",
             input: "nums = [-1,0,-2,0,-3]",
             expected: "[-1,-2,-3,0,0]", orderMatters: true),
            TestCaseData(id: "b5fa8469-0e29-4114-a6c8-3c1b93cbd3cc",
             input: "nums = [1,1,1,1,1]",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "971eacd9-2822-4052-9f99-9a530ed054aa",
             input: "nums = [0,0,0,0,0]",
             expected: "[0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "89eb5552-cda4-4f04-a6b9-620039b278e4",
             input: "nums = [10,20,30,40,50]",
             expected: "[10,20,30,40,50]", orderMatters: true),
            TestCaseData(id: "76cb00c4-b06d-4330-a6b7-97af394ce3fb",
             input: "nums = [1000,2000,3000,4000,5000]",
             expected: "[1000,2000,3000,4000,5000]", orderMatters: true),
            TestCaseData(id: "c693101c-f217-434a-8e75-59448e7bad93",
             input: "nums = [-1000,-2000,-3000,-4000,-5000]",
             expected: "[-1000,-2000,-3000,-4000,-5000]", orderMatters: true),
            TestCaseData(id: "4f52385d-e687-46f6-9601-aa45e286bc9f",
             input: "nums = [0,10,0,20,0]",
             expected: "[10,20,0,0,0]", orderMatters: true),
            TestCaseData(id: "c4767665-13cf-451f-ada8-84febfa024be",
             input: "nums = [0,-10,0,-20,0]",
             expected: "[-10,-20,0,0,0]", orderMatters: true),
            TestCaseData(id: "74670e7d-b911-486f-9391-353c75668178",
             input: "nums = [0,0,10,0,20]",
             expected: "[10,20,0,0,0]", orderMatters: true),
            TestCaseData(id: "b526c591-3312-4495-b66d-e4ff3a886ac3",
             input: "nums = [0,0,-10,0,-20]",
             expected: "[-10,-20,0,0,0]", orderMatters: true),
            TestCaseData(id: "e5a6ca00-c34d-4f8b-bd3d-29cc30ce23cb",
             input: "nums = [10,0,20,0,30]",
             expected: "[10,20,30,0,0]", orderMatters: true),
            TestCaseData(id: "eeaa7d62-9994-4f4c-a665-6261c1d909e7",
             input: "nums = [-10,0,-20,0,-30]",
             expected: "[-10,-20,-30,0,0]", orderMatters: true),
            TestCaseData(id: "be385c5b-ec5e-4aa2-b51c-3452d465be6c",
             input: "nums = [1,0,0,0,0]",
             expected: "[1,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "6dafae36-d638-4e81-864f-83860d86be36",
             input: "nums = [0,0,0,0,1]",
             expected: "[1,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "8371a3ef-801a-415a-89a2-2390caa579de",
             input: "nums = [0,1,0,0,0]",
             expected: "[1,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "8b1cfe5b-c873-4698-b1a2-ceb38eb17953",
             input: "nums = [0,0,1,0,0]",
             expected: "[1,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "f773f1c0-95e8-4aca-a751-5a9fdf454d72",
             input: "nums = [0,0,0,1,0]",
             expected: "[1,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "2e29cb1c-b8c3-4a7d-8bc5-c72c3d1590bc",
             input: "nums = [1,1,0,0,0]",
             expected: "[1,1,0,0,0]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "move-zeroes"
            let topic = "two-pointers"
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

            guard var p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as inout [Int]"
                )
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -231 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= nums[i] <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let didCrash = withCrashGuard {
                solution.moveZeroes(&p_nums)
            }
            guard !didCrash else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = OutputSerializer.serialize(p_nums)

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
