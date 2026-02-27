import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTaskScheduler {
    private class Solution {
        func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
            var freq = [Int](repeating: 0, count: 26)
            for task in tasks {
                freq[Int(task.asciiValue.unsafelyUnwrapped) - 65] += 1
            }

            let maxFreq = freq.max().unsafelyUnwrapped
            let numMaxTasks = freq.filter { $0 == maxFreq }.count

            let minTime = (maxFreq - 1) * (n + 1) + numMaxTasks
            return max(minTime, tasks.count)
        }
    }

    @Suite struct TaskSchedulerTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "372a36f9-b1bd-445f-a509-00b8e5572ba4",
             input: "tasks = [\"A\"], n = 2",
             expected: "1", orderMatters: false),
            TestCaseData(id: "4f3e5d21-cbb8-4703-b547-e9ceb87d7bac",
             input: "tasks = [\"A\",\"B\"], n = 0",
             expected: "2", orderMatters: false),
            TestCaseData(id: "d4587f10-d7fa-4cd8-a161-7857e1be11c5",
             input: "tasks = [\"A\",\"A\",\"B\",\"B\"], n = 0",
             expected: "4", orderMatters: false),
            TestCaseData(id: "c309f719-183e-44cb-b0af-9641bdf63647",
             input: "tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"B\"], n = 1",
             expected: "6", orderMatters: false),
            TestCaseData(id: "196202ad-bc1d-4352-ab7b-58d214a9b2aa",
             input: "tasks = [\"A\",\"A\",\"B\",\"B\",\"C\",\"C\"], n = 2",
             expected: "6", orderMatters: false),
            TestCaseData(id: "51fead21-367a-4473-b921-809d72ac183d",
             input: "tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"C\"], n = 1",
             expected: "6", orderMatters: false),
            TestCaseData(id: "bdf91e7a-16b7-4139-8ece-2f9453a9c95d",
             input: "tasks = [\"A\",\"A\",\"B\",\"B\",\"C\",\"C\",\"D\",\"D\"], n = 2",
             expected: "8", orderMatters: false),
            TestCaseData(id: "ef18ea12-2610-4e5b-9f44-23a738bcd90d",
             input: "tasks = [\"A\",\"A\",\"B\",\"B\",\"C\",\"C\",\"D\",\"D\",\"E\",\"E\"], n = 3",
             expected: "10", orderMatters: false),
            TestCaseData(id: "bf6c33de-b38c-4b4b-98c9-8ca993b19016",
             input: "tasks = [\"A\",\"A\",\"B\",\"B\",\"C\",\"C\",\"D\",\"D\",\"E\",\"E\",\"F\",\"F\"], n = 4",
             expected: "12", orderMatters: false),
            TestCaseData(id: "db945175-d18d-457f-8a98-8d94e145c077",
             input: "tasks = [\"A\"], n = -1",
             expected: "1", orderMatters: false),
            TestCaseData(id: "adf0fcf6-a98a-40b8-9f4c-90ee7b110c9e",
             input: "tasks = [\"A\",\"B\",\"C\"], n = 2",
             expected: "3", orderMatters: false),
            TestCaseData(id: "19359ff2-bf41-456a-95eb-01ef5c867c42",
             input: "tasks = [\"A\",\"A\",\"A\",\"A\"], n = 2",
             expected: "10", orderMatters: false),
            TestCaseData(id: "5c6afda6-a6ad-4477-8450-f7ad2a4f9731",
             input: "tasks = [\"A\",\"B\",\"C\",\"D\"], n = 3",
             expected: "4", orderMatters: false),
            TestCaseData(id: "43a82ef8-9410-4fd6-896d-d3ec99ac6e88",
             input: "tasks = [\"A\",\"B\",\"C\",\"D\",\"E\"], n = 4",
             expected: "5", orderMatters: false),
            TestCaseData(id: "5939bffe-5234-4f83-abe4-3263be20547c",
             input: "tasks = [\"A\",\"A\",\"A\",\"A\",\"A\"], n = 3",
             expected: "17", orderMatters: false),
            TestCaseData(id: "a428374d-28fb-46c4-b48a-4adeb1731e28",
             input: "tasks = [\"A\",\"B\",\"C\",\"D\",\"E\",\"F\"], n = 5",
             expected: "6", orderMatters: false),
            TestCaseData(id: "b2e7c908-e621-4758-8a17-b7fb821c3928",
             input: "tasks = [\"A\",\"A\",\"A\",\"B\",\"B\",\"C\",\"C\",\"D\"], n = 1",
             expected: "8", orderMatters: false),
            TestCaseData(id: "3ccac20f-a096-4b4d-ba3c-dd42aba8b8fb",
             input: "tasks = [\"A\",\"B\",\"C\",\"D\",\"E\",\"F\",\"G\"], n = 6",
             expected: "7", orderMatters: false),
            TestCaseData(id: "a977bc4c-3cf3-4b3e-81ff-cf9440efe48b",
             input: "tasks = [\"A\",\"A\",\"A\",\"A\",\"A\",\"B\",\"B\",\"B\",\"B\",\"B\"], n = 4",
             expected: "22", orderMatters: false),
            TestCaseData(id: "7f32fc3d-0c9c-487f-b533-0c1a5be00fc1",
             input: "tasks = [\"A\",\"B\",\"C\",\"D\",\"E\",\"F\",\"G\",\"H\"], n = 7",
             expected: "8", orderMatters: false),
            TestCaseData(id: "6af2ae7f-5960-40cf-8cc2-d91af6706270",
             input: "tasks = [\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"], n = 5",
             expected: "31", orderMatters: false),
            TestCaseData(id: "7ba42fe9-bf13-46ca-bb56-b7e4775a864f",
             input: "tasks = [\"A\",\"B\",\"C\",\"D\",\"E\",\"F\",\"G\",\"H\",\"I\"], n = 8",
             expected: "9", orderMatters: false),
            TestCaseData(id: "3d1fc0a3-7884-4cc6-9bfb-aaf28947f7b4",
             input: "tasks = [\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"], n = 6",
             expected: "43", orderMatters: false),
            TestCaseData(id: "1144f07d-e48b-414e-a739-201e0433b79c",
             input: "tasks = [\"A\",\"B\",\"C\",\"D\",\"E\",\"F\",\"G\",\"H\",\"I\",\"J\"], n = 9",
             expected: "10", orderMatters: false),
            TestCaseData(id: "9c97e90b-ead6-4194-b08e-e57cf6946da0",
             input: "tasks = [\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"], n = 7",
             expected: "57", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "task-scheduler"
            let topic = "heap-priority-queue"
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

            guard let p_tasks = InputParser.parseCharacterArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Character]"
                )
                return
            }
            guard p_tasks.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: tasks array too large (\(p_tasks.count))"
                )
                return
            }
            guard let p_n = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_tasks.count >= 1 && p_tasks.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= tasks.length <= 104"
                )
                return
            }
            guard p_n >= 0 && p_n <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= n <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.leastInterval(p_tasks, p_n)
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
