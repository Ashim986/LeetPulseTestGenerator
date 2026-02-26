import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReconstructItinerary {
    private class Solution {
        func findItinerary(_ tickets: [[String]]) -> [String] {
            var graph = [String: [String]]()
            for t in tickets {
                graph[t[0], default: []].append(t[1])
            }
            for key in graph.keys {
                graph[key]?.sort(by: >)  // Reverse sort for pop efficiency
            }

            var result = [String]()

            func dfs(_ airport: String) {
                while !(graph[airport]?.isEmpty ?? true) {
                    let next = graph[airport].unsafelyUnwrapped.removeLast()
                    dfs(next)
                }
                result.append(airport)
            }

            dfs("JFK")
            return result.reversed()
        }
    }

    @Suite struct ReconstructItineraryTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "55b7884c-cae6-42a0-b84c-93773943256e",
             input: "tickets = [[\"MUC\",\"LHR\"],[\"JFK\",\"MUC\"],[\"SFO\",\"SJC\"],[\"LHR\",\"SFO\"]]",
             expected: "[\"JFK\",\"MUC\",\"LHR\",\"SFO\",\"SJC\"]", orderMatters: true),
            TestCaseData(id: "af0fd211-6ae8-42be-97e3-380bb2ad4bc1",
             input: "tickets = [[\"JFK\",\"SFO\"],[\"JFK\",\"ATL\"],[\"SFO\",\"ATL\"],[\"ATL\",\"JFK\"],[\"ATL\",\"SFO\"]]",
             expected: "[\"JFK\",\"ATL\",\"JFK\",\"SFO\",\"ATL\",\"SFO\"]", orderMatters: true),
            TestCaseData(id: "34f6232b-159a-4bbc-989e-84ac48533fd7",
             input: "tickets = [[\"JFK\",\"KUL\"],[\"JFK\",\"NRT\"],[\"NRT\",\"JFK\"],[\"KUL\",\"JFK\"]]",
             expected: "[\"JFK\",\"NRT\",\"JFK\",\"KUL\",\"JFK\"]", orderMatters: true),
            TestCaseData(id: "86907dcb-9ffd-4827-a7fe-40291b6cd27b",
             input: "tickets = [[\"EZE\",\"AXA\"],[\"EZE\",\"TIA\"],[\"AXA\",\"TIA\"],[\"EZE\",\"TIA\"],[\"EZE\",\"AXA\"],[\"TIA\",\"EZE\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "034832c8-b76e-4bf0-8b5d-1882699cd4f1",
             input: "tickets = []",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "718d5659-ae61-46df-89f7-503e0c14e739",
             input: "tickets = [[\"A\",\"B\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "b04f8d21-104f-4b75-85a2-f8bc6d5b7da3",
             input: "tickets = [[\"A\",\"B\"],[\"B\",\"C\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "415f9b3a-9e06-4f81-8e99-cb3eb86d9712",
             input: "tickets = [[\"A\",\"B\"],[\"A\",\"C\"],[\"B\",\"C\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "076b77c1-a19b-434b-9d4a-e5b88af1233a",
             input: "tickets = [[\"A\",\"B\"],[\"A\",\"C\"],[\"B\",\"C\"],[\"C\",\"B\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "26468165-3e05-44f9-b4b0-8bfa4f0c0dd5",
             input: "tickets = [[\"A\",\"B\"],[\"B\",\"A\"],[\"A\",\"B\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "00b1a48a-42ce-4d38-a916-125f4edb606a",
             input: "tickets = [[\"A\",\"B\"],[\"B\",\"A\"],[\"A\",\"B\"],[\"B\",\"A\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "31ae6565-e3e1-43c8-b452-c32b36bf9319",
             input: "tickets = [[\"A\",\"B\"],[\"B\",\"C\"],[\"C\",\"D\"],[\"D\",\"E\"],[\"E\",\"F\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "8f1ec94b-7b3b-4716-b4ed-0142f345562d",
             input: "tickets = [[\"A\",\"B\"],[\"B\",\"C\"],[\"C\",\"D\"],[\"D\",\"E\"],[\"E\",\"F\"],[\"F\",\"A\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "7c233ebc-e29a-4abe-8bb0-c1c958811718",
             input: "tickets = [[\"A\",\"B\"],[\"B\",\"C\"],[\"C\",\"D\"],[\"D\",\"E\"],[\"E\",\"F\"],[\"F\",\"A\"],[\"A\",\"B\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "14e23a2f-23ab-47fc-85a9-013830474278",
             input: "tickets = [[\"A\",\"B\"],[\"B\",\"C\"],[\"C\",\"D\"],[\"D\",\"E\"],[\"E\",\"F\"],[\"F\",\"A\"],[\"A\",\"B\"],[\"B\",\"C\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "bad41eb3-5cc7-40d7-84fb-1170797aef5e",
             input: "tickets = [[\"A\",\"Z\"],[\"B\",\"Y\"],[\"C\",\"X\"],[\"D\",\"W\"],[\"E\",\"V\"],[\"F\",\"U\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "9b5e2f74-4ef8-43db-8014-96decaa14a5b",
             input: "tickets = [[\"Z\",\"A\"],[\"Y\",\"B\"],[\"X\",\"C\"],[\"W\",\"D\"],[\"V\",\"E\"],[\"U\",\"F\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "4c9f9478-4705-4c06-9b7a-8715c9fda0e9",
             input: "tickets = [[\"A\",\"A\"],[\"A\",\"B\"],[\"B\",\"A\"],[\"B\",\"B\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "1c59e133-7d2e-481d-bb18-da94a79294b5",
             input: "tickets = [[\"A\",\"A\"],[\"A\",\"B\"],[\"B\",\"A\"],[\"B\",\"B\"],[\"A\",\"A\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "b357e45e-3bde-4e1a-bf5a-f3e277876be6",
             input: "tickets = [[\"A\",\"A\"],[\"A\",\"B\"],[\"B\",\"A\"],[\"B\",\"B\"],[\"A\",\"A\"],[\"A\",\"B\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "21ba9202-adff-422f-be1e-a4d57fd3db00",
             input: "tickets = [[\"A\",\"A\"],[\"A\",\"B\"],[\"B\",\"A\"],[\"B\",\"B\"],[\"A\",\"A\"],[\"A\",\"B\"],[\"B\",\"A\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "663d3791-116e-45c2-8584-b8419424be34",
             input: "tickets = [[\"A\",\"A\"],[\"A\",\"B\"],[\"B\",\"A\"],[\"B\",\"B\"],[\"A\",\"A\"],[\"A\",\"B\"],[\"B\",\"A\"],[\"A\",\"B\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "35e5f6d4-63b4-4bab-b7cc-898dd03ee124",
             input: "tickets = [[\"A\",\"B\"],[\"A\",\"C\"],[\"B\",\"D\"],[\"C\",\"D\"],[\"D\",\"E\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "397a8152-a96e-4c00-b1bc-1289ce995585",
             input: "tickets = [[\"A\",\"B\"],[\"A\",\"C\"],[\"B\",\"D\"],[\"C\",\"D\"],[\"D\",\"E\"],[\"E\",\"F\"]]",
             expected: "[\"JFK\"]", orderMatters: true),
            TestCaseData(id: "cbbcf40e-3246-41e1-9769-cc97603cc48d",
             input: "tickets = [[\"A\",\"B\"],[\"A\",\"C\"],[\"B\",\"D\"],[\"C\",\"D\"],[\"D\",\"E\"],[\"E\",\"F\"],[\"F\",\"A\"]]",
             expected: "[\"JFK\"]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reconstruct-itinerary"
            let topic = "misc"
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

            guard let p_tickets = InputParser.parse2DStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[String]]"
                )
                return
            }
            guard p_tickets.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: tickets 2D array too large (\(p_tickets.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_tickets.count >= 1 && p_tickets.count <= 300 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= tickets.length <= 300"
                )
                return
            }
            guard p_tickets.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: tickets[i].length == 2"
                )
                return
            }

            let solution = Solution()
            let result = solution.findItinerary(p_tickets)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [String]"
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
