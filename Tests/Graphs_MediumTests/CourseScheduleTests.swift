import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCourseSchedule {
    private class Solution {
        func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
            var graph = [[Int]](repeating: [], count: numCourses)
            for pre in prerequisites {
                graph[pre[1]].append(pre[0])
            }

            var state = [Int](repeating: 0, count: numCourses)  // 0=unvisited, 1=visiting, 2=visited

            func hasCycle(_ node: Int) -> Bool {
                if state[node] == 1 { return true }  // Cycle
                if state[node] == 2 { return false }  // Already done

                state[node] = 1
                for neighbor in graph[node] {
                    if hasCycle(neighbor) { return true }
                }
                state[node] = 2
                return false
            }

            for i in 0..<numCourses {
                if hasCycle(i) { return false }
            }
            return true
        }
    }

    @Suite struct CourseScheduleTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "25366753-8e6e-4de7-a95d-8d11722cc913",
             input: "numCourses = 1, prerequisites = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "465be266-a9bc-43bc-af7b-800a66d86044",
             input: "numCourses = 2, prerequisites = [[1,0],[0,1]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "70b965c6-142e-4837-8e4b-541c7804571a",
             input: "numCourses = 3, prerequisites = [[1,0],[2,1]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ce871821-2142-49a1-8e0a-8d4071a3d3c0",
             input: "numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0fa057f9-698d-414b-a1a0-cd83ce35718b",
             input: "numCourses = 5, prerequisites = [[1,4],[2,4],[3,1],[3,2]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d54aafdb-6f64-4f6e-b3b3-73a4f4c9eede",
             input: "numCourses = 6, prerequisites = [[1,0],[2,0],[3,1],[3,2],[4,3],[5,4]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ea39ea7b-052e-48cf-875d-1178aa3133a5",
             input: "numCourses = 7, prerequisites = [[1,0],[2,0],[3,1],[3,2],[4,3],[5,4],[6,5]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "00bf7d36-8220-4b13-9dcb-21e77ab910b8",
             input: "numCourses = 8, prerequisites = [[1,0],[2,0],[3,1],[3,2],[4,3],[5,4],[6,5],[7,6]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "44556789-c9a5-494d-a285-97f6581a05e3",
             input: "numCourses = 9, prerequisites = [[1,0],[2,0],[3,1],[3,2],[4,3],[5,4],[6,5],[7,6],[8,7]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9f49f4f1-50e3-4996-acb6-5218749c9855",
             input: "numCourses = 10, prerequisites = [[1,0],[2,0],[3,1],[3,2],[4,3],[5,4],[6,5],[7,6],[8,7],[9,8]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1e25aebc-f7a5-40d5-8bd4-119fbdbd51c1",
             input: "numCourses = 2, prerequisites = [[1,0],[1,0]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2e1fe247-653f-4d11-84aa-9c0134114223",
             input: "numCourses = 3, prerequisites = [[1,0],[1,0],[2,1]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "00a06b79-754d-4911-b7b3-abd4717c3edc",
             input: "numCourses = 4, prerequisites = [[1,0],[1,0],[2,0],[3,1]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "53809188-9419-4dca-8c23-18f2774f4302",
             input: "numCourses = 5, prerequisites = [[1,0],[1,0],[2,0],[3,1],[4,2]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "11a03751-1f96-4fb0-b77c-274e51204abc",
             input: "numCourses = 6, prerequisites = [[1,0],[1,0],[2,0],[3,1],[4,2],[5,3]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "62bd6be0-051c-449b-8d0e-84e563182092",
             input: "numCourses = 7, prerequisites = [[1,0],[1,0],[2,0],[3,1],[4,2],[5,3],[6,4]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "282efbbe-5d98-461d-a6ec-e51c8d055d16",
             input: "numCourses = 8, prerequisites = [[1,0],[1,0],[2,0],[3,1],[4,2],[5,3],[6,4],[7,5]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ee05384f-9d4c-4380-80e4-b13355ed3791",
             input: "numCourses = 9, prerequisites = [[1,0],[1,0],[2,0],[3,1],[4,2],[5,3],[6,4],[7,5],[8,6]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0a2b1b19-c94d-44c5-8843-d8798e48e0db",
             input: "numCourses = 10, prerequisites = [[1,0],[1,0],[2,0],[3,1],[4,2],[5,3],[6,4],[7,5],[8,6],[9,7]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f0f6c895-6625-4ea6-b0e8-7c7d4f552837",
             input: "numCourses = 2, prerequisites = [[0,1],[1,0]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b1149957-806e-4790-afb7-c0953d95bb14",
             input: "numCourses = 3, prerequisites = [[0,1],[1,2],[2,0]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f4f2d109-71a0-47f2-9a5d-6f56088bad43",
             input: "numCourses = 4, prerequisites = [[0,1],[1,2],[2,3],[3,0]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "93494771-2ee6-497f-931f-8978aeb69c77",
             input: "numCourses = 5, prerequisites = [[0,1],[1,2],[2,3],[3,4],[4,0]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c4f641ed-33a8-4ffa-a776-e47e720de7dc",
             input: "numCourses = 6, prerequisites = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,0]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "19da4243-69b5-40d3-9f46-0de82d7b0dee",
             input: "numCourses = 7, prerequisites = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,0]]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "course-schedule"
            let topic = "graphs"
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

            guard let p_numCourses = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_prerequisites = InputParser.parse2DIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [[Int]]"
                )
                return
            }
            guard p_prerequisites.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: prerequisites 2D array too large (\(p_prerequisites.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_numCourses >= 1 && p_numCourses <= 2000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= numCourses <= 2000"
                )
                return
            }
            guard p_prerequisites.count >= 0 && p_prerequisites.count <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= prerequisites.length <= 5000"
                )
                return
            }
            guard p_prerequisites.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: prerequisites[i].length == 2"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.canFinish(p_numCourses, p_prerequisites)
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
