import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindEventualSafeStates {
    private class Solution {
        func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
            let n = graph.count
            var state = [Int](repeating: 0, count: n)  // 0=unvisited, 1=visiting, 2=safe

            func dfs(_ node: Int) -> Bool {
                if state[node] != 0 { return state[node] == 2 }
                state[node] = 1
                for next in graph[node] {
                    if !dfs(next) { return false }
                }
                state[node] = 2
                return true
            }

            var result: [Int] = []
            for i in 0..<n {
                if dfs(i) { result.append(i) }
            }
            return result
        }
    }

    @Suite struct FindEventualSafeStatesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "945fefdd-790a-4652-85ef-aa90c8259322",
             input: "graph = [[],[0,2,3,4],[3],[4],[]]",
             expected: "[0,1,2,3,4]", orderMatters: true),
            TestCaseData(id: "1b066e37-0557-4b28-b09a-7f3efa4fbd74",
             input: "graph = [[1,2,3,4],[1,2],[3,4],[0,4],[]]",
             expected: "[4]", orderMatters: true),
            TestCaseData(id: "d24ef8ea-c204-48eb-a071-03e76e2e514e",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]", orderMatters: true),
            TestCaseData(id: "e50753ee-ea6f-4fe0-8f76-25c2465dbe5a",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]", orderMatters: true),
            TestCaseData(id: "855a980a-8bf1-4064-9ea5-9927dc8534f3",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]", orderMatters: true),
            TestCaseData(id: "4039890c-67f3-458d-83aa-52c1ce7376d5",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]", orderMatters: true),
            TestCaseData(id: "d3360be9-235f-4373-b91c-48182c05d494",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]", orderMatters: true),
            TestCaseData(id: "5a3adc2b-bf30-495b-a94b-17c3e14083b4",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]", orderMatters: true),
            TestCaseData(id: "2eb603b9-7316-440c-b960-6acaac067c0a",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]", orderMatters: true),
            TestCaseData(id: "9aa92a8f-d356-42d2-95e7-e57a7082265f",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]", orderMatters: true),
            TestCaseData(id: "a1a3c6b9-6f3e-4897-bfc8-6cc539458ebc",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]", orderMatters: true),
            TestCaseData(id: "b7ce4401-b295-4093-ac60-a51aebcaa7c1",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]", orderMatters: true),
            TestCaseData(id: "1a45bf2e-755c-433f-95ca-71d017563277",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]", orderMatters: true),
            TestCaseData(id: "8ee61d56-97d5-4f13-9b15-f44970709d9b",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]", orderMatters: true),
            TestCaseData(id: "4775f9fd-56f6-412e-bc11-24cfae8425fa",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28],[28,29]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]", orderMatters: true),
            TestCaseData(id: "526523ae-7944-465d-9eaa-d4f9cb343a5c",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28],[28,29],[29,30]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]", orderMatters: true),
            TestCaseData(id: "eb4491b3-829a-494d-92e0-83232cb3fbb5",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28],[28,29],[29,30],[30,31]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]", orderMatters: true),
            TestCaseData(id: "7d14d4d2-b5e5-4b3a-a616-d960f343d50c",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28],[28,29],[29,30],[30,31],[31,32]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32]", orderMatters: true),
            TestCaseData(id: "9d9adb9f-1cd7-41f8-aef0-d2c12ac763a0",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28],[28,29],[29,30],[30,31],[31,32],[32,33]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33]", orderMatters: true),
            TestCaseData(id: "52c607d8-c42e-4d62-b342-0da65b65ae40",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28],[28,29],[29,30],[30,31],[31,32],[32,33],[33,34]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34]", orderMatters: true),
            TestCaseData(id: "f8d08f1d-4c71-4d13-aa8f-7fd204af0c66",
             input: "graph = [[0,1],[0,2],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,"
                + "18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28],[28,29],[29,30],[30,31],[31,32],[32,33],[33,34],[34,"
                + "35]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35]", orderMatters: true),
            TestCaseData(id: "10c1a5c3-8cfd-4ec6-a6a6-67e7210c7333",
             input: "graph = [[1],[2],[3],[]]",
             expected: "[0,1,2,3]", orderMatters: true),
            TestCaseData(id: "1ce2c8fa-74bc-41c3-aaf0-dac45f4b0ae5",
             input: "graph = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "0a748442-4411-4706-99e4-b1d784a42596",
             input: "graph = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11]", orderMatters: true),
            TestCaseData(id: "04a4ea90-8334-4b56-a315-b531e59fed49",
             input: "graph = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12]]",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-eventual-safe-states"
            let topic = "graphs"
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

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_graph.count >= 1 && p_graph.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.eventualSafeNodes(p_graph)
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

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
