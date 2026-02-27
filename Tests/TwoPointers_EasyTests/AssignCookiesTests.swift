import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAssignCookies {
    private class Solution {
        func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
            let sortedG = g.sorted()
            let sortedS = s.sorted()
            var childIndex = 0
            var cookieIndex = 0
            while childIndex < sortedG.count && cookieIndex < sortedS.count {
                if sortedS[cookieIndex] >= sortedG[childIndex] {
                    childIndex += 1
                }
                cookieIndex += 1
            }
            return childIndex
        }
    }

    @Suite struct AssignCookiesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "08094930-1d47-46dc-8c4f-43efd3b546cc",
             input: "g = [1], s = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8a6ce4a0-0688-4190-93eb-987c4cca7d3c",
             input: "g = [1], s = [2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5389cadf-fb84-49a2-a9b2-6ec4835cf481",
             input: "g = [2], s = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "075c3964-3306-4473-a7d2-675ae67ab758",
             input: "g = [1,1], s = [1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "db486935-dde2-4cc1-8592-808affaa87d1",
             input: "g = [1,1], s = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f2c72b4d-c8ee-4e59-8a96-4cbcbeac320f",
             input: "g = [1,2,3], s = [3,4,5]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f74931d5-d39d-48d0-9c42-e8fbbd5219ec",
             input: "g = [1,2,3], s = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "669687ea-4f04-492c-bdd1-aee3ad99c172",
             input: "g = [], s = [1,2,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "96e0d744-ea62-4ba7-90ce-26975ec68470",
             input: "g = [1,2,3], s = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dfc5e0db-3265-4944-b03d-e002c69cc1d0",
             input: "g = [-1,-2,-3], s = [-1,-2,-3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d5c15961-d873-4514-b4a5-dd5cdebfa087",
             input: "g = [1,2,3], s = [1,2,3,4,5]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1b962234-35b8-4dd5-aaee-297c930bdf2d",
             input: "g = [10,20,30], s = [10,20,30]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "3750af8e-b21f-4dbd-b3aa-4a6f30582dab",
             input: "g = [1000,2000,3000], s = [1000,2000,3000]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "21362268-66cb-44da-a535-1b242aa1254f",
             input: "g = [1,1,1,1,1], s = [1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "fc990e04-1779-4866-956e-fabc33af7d6a",
             input: "g = [1,2,3,4,5], s = [5,4,3,2,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "2b6fb399-bd2b-4d19-8e71-9052ebf3f061",
             input: "g = [5,4,3,2,1], s = [1,2,3,4,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "7855bb5f-1a45-4c3c-b183-c5f11ede7fe3",
             input: "g = [1,3,5,7,9], s = [2,4,6,8,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "7aca6704-072b-435f-a560-d9699cb5d0cf",
             input: "g = [10,20,30,40,50], s = [10,20,30,40,50]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "fb94277d-c7d4-4f20-836a-b4bc68e0472e",
             input: "g = [100,200,300,400,500], s = [100,200,300,400,500]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "2edd80cc-2e2a-4191-b3b4-03cad7dc78ef",
             input: "g = [1,2,3,4,5], s = [1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0207d57b-4603-438f-93f4-c02968b42698",
             input: "g = [2,2,2,2,2], s = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "331adb83-6664-41c2-a2d3-344d5ad6fc29",
             input: "g = [10,10,10,10,10], s = [10,10,10,10,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "77d20a56-91b6-414c-9081-d2fc85c7e1fd",
             input: "g = [100,100,100,100,100], s = [100,100,100,100,100]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "bfa6f2e5-c70a-4c77-b699-c1e27c7ad1b1",
             input: "g = [1,2,3,4,5], s = [10,20,30,40,50]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9f2778e5-f578-4ee0-bfe9-f952ab1c4d44",
             input: "g = [10,20,30,40,50], s = [1,2,3,4,5]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "assign-cookies"
            let topic = "two-pointers"
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

            guard let p_g = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_g.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: g array too large (\(p_g.count))"
                )
                return
            }
            guard let p_s = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s array too large (\(p_s.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_g.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= g.length <= 3 * 104"
                )
                return
            }
            guard p_s.count >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= s.length <= 3 * 104"
                )
                return
            }
            guard p_g.allSatisfy({ $0 >= 1 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= g[i], s[j] <= 231 - 1"
                )
                return
            }
            guard p_s.allSatisfy({ $0 >= 1 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= g[i], s[j] <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findContentChildren(p_g, p_s)
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
