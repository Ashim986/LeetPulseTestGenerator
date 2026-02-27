import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCardFlippingGame {
    private class Solution {
        func flipgame(_ fronts: [Int], _ backs: [Int]) -> Int {
            var same = Set<Int>()
            for (a, b) in zip(fronts, backs) {
                if a == b {
                    same.insert(a)
                }
            }
            var ans = Int.max
            for x in fronts + backs {
                if !same.contains(x) {
                    ans = min(ans, x)
                }
            }
            return ans == Int.max ? 0 : ans
        }
    }

    @Suite struct CardFlippingGameTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2f0a1694-150f-48d0-887f-4eab614d7361",
             input: "fronts = [1], backs = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1a2b6a42-87b1-4562-bf00-39c0101cca03",
             input: "fronts = [1,1], backs = [1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7a78f37e-ba97-4059-811f-af3f423ce05e",
             input: "fronts = [1,2,3], backs = [1,2,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "37be9289-32d7-46bd-b06d-57f8ba57b105",
             input: "fronts = [1,2,3], backs = [3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e82f623e-b3e2-4e8c-a600-7b33fd7f95da",
             input: "fronts = [1,2,3,4,5], backs = [1,2,3,4,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7ad82a9e-d0be-4a26-b8ab-26a281493072",
             input: "fronts = [1,2,3,4,5], backs = [5,4,3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "bcdc57e2-ca25-4dd1-ab2a-2b98da3f8cf8",
             input: "fronts = [1,1,1,1,1], backs = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cf18dcc3-5ab2-46e8-97a0-3a0ff572575e",
             input: "fronts = [-1,-2,-3], backs = [-1,-2,-3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "32aec53a-9ceb-41fc-8693-36fa860ad755",
             input: "fronts = [-1,-2,-3], backs = [-3,-2,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "810c0719-a3ee-461a-a11e-56d58f1e963c",
             input: "fronts = [1000,2000,3000], backs = [1000,2000,3000]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7e2ac731-1dc1-4224-ae21-8e357828f83a",
             input: "fronts = [1000,2000,3000], backs = [3000,2000,1000]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ab49e85c-8bcd-4a30-9ca2-8500619221de",
             input: "fronts = [1,2,3,4,5,6,7,8,9,10], backs = [1,2,3,4,5,6,7,8,9,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ac4f6e3a-a7f7-41e3-b019-003adf99dfcb",
             input: "fronts = [1,2,3,4,5,6,7,8,9,10], backs = [10,9,8,7,6,5,4,3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9178cf9a-68c3-4fce-8c4e-d31d4a2faefc",
             input: "fronts = [1,1,1,1,1,1,1,1,1,1], backs = [1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "27250dc2-3efc-4bb0-8cfd-76ba510e2ad8",
             input: "fronts = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], backs = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "11efc629-1cc6-4e6f-80c9-370652cb97c9",
             input: "fronts = [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000], backs = [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1e19ec43-dd0c-4ebd-a44e-9f83fcf30ebc",
             input: "fronts = [], backs = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1cb73b22-f91f-4191-9882-cd8759d14847",
             input: "fronts = [0], backs = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cc199a5f-bb05-4e58-8eb6-b90039980a18",
             input: "fronts = [1,2], backs = [3,4]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "194caa64-698c-4da3-a80e-cbc0f9f4047a",
             input: "fronts = [1,2,3], backs = [4,5,6]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c7a93d94-813d-49cd-84aa-bdd82a05a644",
             input: "fronts = [1,2,3,4,5], backs = [6,7,8,9,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b6a06af9-6dae-4a0b-92d9-79abb4b7bd0c",
             input: "fronts = [1,1,1,1,1], backs = [2,2,2,2,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f530056c-f0b9-4033-bd03-282b9883db32",
             input: "fronts = [1,2,3,4,5], backs = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9d68c03a-ac2e-4135-920c-0491093fe096",
             input: "fronts = [1,2,3,4,5], backs = [5,5,5,5,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "96b12bdd-2059-4162-9b45-c3ed85fbbb01",
             input: "fronts = [0,0,0,0,0], backs = [1,1,1,1,1]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "card-flipping-game"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_fronts = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_fronts.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: fronts array too large (\(p_fronts.count))"
                )
                return
            }
            guard let p_backs = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_backs.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: backs array too large (\(p_backs.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_fronts.count >= 1 && p_fronts.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 1000"
                )
                return
            }
            guard p_fronts.allSatisfy({ $0 >= 1 && $0 <= 2000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= fronts[i], backs[i] <= 2000"
                )
                return
            }
            guard p_backs.allSatisfy({ $0 >= 1 && $0 <= 2000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= fronts[i], backs[i] <= 2000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.flipgame(p_fronts, p_backs)
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
