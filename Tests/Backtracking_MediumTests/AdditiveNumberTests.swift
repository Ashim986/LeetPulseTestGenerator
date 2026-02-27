import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAdditiveNumber {
    private class Solution {
        func isAdditiveNumber(_ num: String) -> Bool {
            func isValid(_ num: String) -> Bool {
                return num.count == 1 || num.first != "0"
            }
            func backtrack(_ idx: Int, _ path: [Int]) -> Bool {
                if idx == num.count {
                    return path.count >= 3
                }
                for i in idx...num.count-1 {
                    let cur = String(num[num.index(num.startIndex, offsetBy: idx)...num.index(num.startIndex, offsetBy: i+1)])
                    if !isValid(cur) {
                        continue
                    }
                    if let n = Int(cur) {
                        if path.count < 2 || n == path[path.count-1] + path[path.count-2] {
                            if backtrack(i+1, path + [n]) {
                                return true
                            }
                        }
                    }
                }
                return false
            }
            return backtrack(0, [])
        }
    }

    @Suite struct AdditiveNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a43deff6-b9a6-4b2a-bf5e-f71e167b9f0c",
             input: "num = \"10203\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "46724ec8-de04-4f91-92ac-d1b8a921af60",
             input: "num = \"11235813\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "90c6fba2-89b0-4078-bf96-577681f1dcf2",
             input: "num = \"1991001999\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d49567b6-36ec-40d5-b0c5-3f8bd5288af9",
             input: "num = \"1123\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ecbe54d7-d812-4395-8218-f3e760b085d3",
             input: "num = \"2117381\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ec1b348f-e50a-47d6-aa81-a665743f7f38",
             input: "num = \"1\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f04d7380-93ee-40ca-8548-0fe538d5cc72",
             input: "num = \"12\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3f62e565-d141-4eeb-a272-d6796346feb0",
             input: "num = \"123\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "14774bc8-50b9-4a52-a275-ff5aa5245f10",
             input: "num = \"1234\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "749c8134-11a5-4589-9ff1-d0581807a89b",
             input: "num = \"12345\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c9abce21-5294-4799-a3b8-2b8501fd680b",
             input: "num = \"11111\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e5ea3186-9ff7-4571-9335-56423993c8cf",
             input: "num = \"22222\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c3fdc444-8029-40ea-9c75-603bb7c72ba8",
             input: "num = \"33333\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b195a3ff-da75-4a8b-a216-adcc763de03f",
             input: "num = \"44444\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b06c3ca8-28fa-48d3-87aa-9dd411fdc5ce",
             input: "num = \"55555\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8d24e480-7c1c-46a5-b64b-42fb675c474e",
             input: "num = \"66666\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "69534357-0a12-4458-a778-9da5107e8f22",
             input: "num = \"77777\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b309e0f0-5d30-4620-8528-f359fc6e9e4d",
             input: "num = \"88888\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2bc7adcd-e717-4cdc-abbf-24ca07004434",
             input: "num = \"99999\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "786aa6d4-1f5b-4437-a765-74bb545e6957",
             input: "num = \"123456789\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7311df53-91bf-42cb-8e00-5b4ef686e8d7",
             input: "num = \"11111111111111111111\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f01e0add-d489-4f5d-b212-0b0815660523",
             input: "num = \"22222222222222222222\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "97ce00bf-2552-4eaa-a211-010f2253f483",
             input: "num = \"33333333333333333333\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c0bb6de8-193d-493e-b1ff-a8fe854d565f",
             input: "num = \"123456789012345678901234567890\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c0d5c9ea-a353-428b-a5da-3d8302417252",
             input: "num = \"1234567890123456789012345678901234567890\"",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "additive-number"
            let topic = "backtracking"
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

            let p_num = InputParser.parseString(params[0])
            guard p_num.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: num string too long (\(p_num.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_num.count >= 1 && p_num.count <= 35 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= num.length <= 35"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.isAdditiveNumber(p_num)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
