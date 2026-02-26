import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCourseScheduleIi {
    private class Solution {
        func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
            var graph = [[Int]](repeating: [], count: numCourses)
            var inDegree = [Int](repeating: 0, count: numCourses)

            for pre in prerequisites {
                graph[pre[1]].append(pre[0])
                inDegree[pre[0]] += 1
            }

            var queue = (0..<numCourses).filter { inDegree[$0] == 0 }
            var result: [Int] = []

            while !queue.isEmpty {
                let course = queue.removeFirst()
                result.append(course)
                for next in graph[course] {
                    inDegree[next] -= 1
                    if inDegree[next] == 0 {
                        queue.append(next)
                    }
                }
            }

            return result.count == numCourses ? result : []
        }
    }

    @Suite struct CourseScheduleIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3cb7c80c-d769-408c-a2be-aa363fc55802",
             input: "numCourses = 1, prerequisites = []",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "c2d4deb7-3a3e-44b4-bebc-2b4b86c949c5",
             input: "numCourses = 2, prerequisites = [[1,0]]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "5b453922-4fca-4f55-9a95-9c85e3691a49",
             input: "numCourses = 3, prerequisites = [[1,0],[2,0]]",
             expected: "[0,1,2]", orderMatters: true),
            TestCaseData(id: "7c130de8-374d-4d4b-a4e3-d1997a2ba362",
             input: "numCourses = 5, prerequisites = [[1,0],[2,0],[3,1],[3,2],[4,3]]",
             expected: "[0,1,2,3,4]", orderMatters: true),
            TestCaseData(id: "67b98c9b-38cc-40cb-a0f0-3632424cda6b",
             input: "numCourses = 6, prerequisites = [[1,0],[2,0],[3,1],[3,2],[4,3],[5,4]]",
             expected: "[0,1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "ac403c94-3cd0-4af3-b2cb-f36ec992eac9",
             input: "numCourses = 2, prerequisites = [[1,0],[0,1]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "6f6b67c3-5556-47d0-ad01-751c7830987c",
             input: "numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2],[0,3]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "74c44b2d-652d-433a-93d3-dd762acec41e",
             input: "numCourses = 5, prerequisites = [[1,0],[2,0],[3,1],[3,2],[4,3],[0,4]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "e88dff21-4514-402b-9de8-2d7104751b89",
             input: "numCourses = 1, prerequisites = [[0,0]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "c728c2a3-50f4-4ef0-80e7-b7342ebcb7b2",
             input: "numCourses = 3, prerequisites = [[1,0],[2,0],[0,2]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "0a747da3-86fb-4b6c-a57d-4b30b7d881fe",
             input: "numCourses = 2, prerequisites = [[1,1]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "cd511158-8d97-4183-aef9-4fdf723d8ce7",
             input: "numCourses = 3, prerequisites = [[1,1],[2,2]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "25eaa7c5-f7dc-4875-a5bf-6f51ecfa45ab",
             input: "numCourses = 4, prerequisites = [[1,1],[2,2],[3,3]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "03cc37af-a6d8-40d7-9499-40fb65824409",
             input: "numCourses = 5, prerequisites = [[1,1],[2,2],[3,3],[4,4]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "91a5a254-06b9-4747-8c56-e9ae50d3445f",
             input: "numCourses = 6, prerequisites = [[1,1],[2,2],[3,3],[4,4],[5,5]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "1ae1cada-11a1-4955-8d06-7d045aafc935",
             input: "numCourses = 2, prerequisites = [[0,0],[1,1]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "a5ab2772-5b38-4088-9c5a-e7bfaf8b6612",
             input: "numCourses = 3, prerequisites = [[0,0],[1,1],[2,2]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "ff8bf86c-3422-4347-8d87-fcabf9319b1d",
             input: "numCourses = 4, prerequisites = [[0,0],[1,1],[2,2],[3,3]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "98d8c172-d6fc-457d-8686-c404e137a68b",
             input: "numCourses = 5, prerequisites = [[0,0],[1,1],[2,2],[3,3],[4,4]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "dd83a89c-222e-45ab-8299-b71b6ceb4f4f",
             input: "numCourses = 6, prerequisites = [[0,0],[1,1],[2,2],[3,3],[4,4],[5,5]]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "10b5c37c-bdb1-41c2-96b9-d7b7aff91b77",
             input: "numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]",
             expected: "[0,2,1,3]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "course-schedule-ii"
            let topic = "graphs"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_numCourses = InputParser.parseInt(params[0]) else {
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
            guard let p_prerequisites = InputParser.parse2DIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [[Int]]"
                )
                return
            }
            guard p_prerequisites.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: prerequisites 2D array too large (\(p_prerequisites.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_numCourses >= 1 && p_numCourses <= 2000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= numCourses <= 2000"
                )
                return
            }
            guard p_prerequisites.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: prerequisites[i].length == 2"
                )
                return
            }

            let solution = Solution()
            let result = solution.findOrder(p_numCourses, p_prerequisites)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
