import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBusRoutes {
    private class Solution {
        func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
            if source == target { return 0 }
            var stopToRoutes: [Int: [Int]] = [:]
            for (i, route) in routes.enumerated() {
                for stop in route {
                    stopToRoutes[stop, default: []].append(i)
                }
            }
            var visitedRoutes = Set<Int>()
            var visitedStops = Set<Int>([source])
            var queue = [source]
            var buses = 0

            while !queue.isEmpty {
                buses += 1
                var newStops: [Int] = []
                for stop in queue {
                    for route in stopToRoutes[stop] ?? [] {
                        if visitedRoutes.contains(route) { continue }
                        visitedRoutes.insert(route)
                        for nextStop in routes[route] {
                            if nextStop == target { return buses }
                            if !visitedStops.contains(nextStop) {
                                visitedStops.insert(nextStop)
                                newStops.append(nextStop)
                            }
                        }
                    }
                }
                queue = newStops
            }
            return -1
        }
    }

    @Suite struct BusRoutesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "58e8a354-2034-45a3-b698-939705fbe487",
             input: "routes = [[1,2,3],[4,5,6]], source = 7, target = 8",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "6d75ee30-95dc-447d-95cd-067c70383fd2",
             input: "routes = [[1,2,3],[4,5,6]], source = 1, target = 7",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "60bf9c3f-8adb-4c42-95b2-6875a0d03983",
             input: "routes = [[1,2,3],[4,5,6]], source = 1, target = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "28a140d1-5e7a-4811-a005-d10b611cb20e",
             input: "routes = [[1,2,3],[4,5,6]], source = 2, target = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d836ae3c-cff2-4e69-a17b-b9155744ced4",
             input: "routes = [[1,2,3],[4,5,6]], source = 3, target = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "689b63df-24c0-4240-bd9a-37a2e642ed49",
             input: "routes = [[1,2,3],[4,5,6]], source = 3, target = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "13a955f7-99f8-4e2b-b35b-30f22d752754",
             input: "routes = [[1,2,3],[4,5,6]], source = 4, target = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d14f23fd-4957-48e2-b981-6d51a848e58a",
             input: "routes = [[1,2,3],[4,5,6]], source = 4, target = 6",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f5bb4ac2-d7ed-4d0f-bb0f-24364eea5bcc",
             input: "routes = [[1,2,3],[4,5,6]], source = 5, target = 4",
             expected: "1", orderMatters: true),
            TestCaseData(id: "be5aa06c-1be8-49cf-b138-1215844c9575",
             input: "routes = [[1,2,3],[4,5,6]], source = 5, target = 6",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1b6f6f06-35b3-4d71-8a6d-4d124134e8b8",
             input: "routes = [[1,2,3],[4,5,6]], source = 6, target = 4",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8d6edb42-d2d4-4932-95f9-24779806230f",
             input: "routes = [[1,2,3],[1,2,3]], source = 1, target = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "593fb946-359c-4202-8550-665635d2b092",
             input: "routes = [[1,2,3],[4,5,6],[7,8,9]], source = 1, target = 6",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "48ae60c0-f44f-4757-b44a-0bb0d3b82c3b",
             input: "routes = [[1,2,3],[4,5,6],[7,8,9]], source = 1, target = 7",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "8a1aecb1-e1d6-4818-8a9d-b38122be1a72",
             input: "routes = [[1,2,3],[4,5,6],[7,8,9]], source = 9, target = 1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "434752ca-2498-42dd-acfc-0af7fb9c163a",
             input: "routes = [[1,2,3],[4,5,6]], source = 1, target = 6",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "743a6719-0bb3-4f5f-b1d1-e36c2dbddaf7",
             input: "routes = [[1,2,3],[4,5,6]], source = 4, target = 3",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "11b14a59-bd05-4852-b5a9-dffc7e4aa1a2",
             input: "routes = [[1,2,3],[4,5,6]], source = 1, target = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7723115d-1b5b-41bd-9206-7849cc980be3",
             input: "routes = [[1,2,3],[4,5,6]], source = 1, target = 4",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "d2ea4004-ee67-40f5-ad63-8484b2d75318",
             input: "routes = [[1,2,3],[4,5,6]], source = 6, target = 1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "e0905501-7d3f-492f-8f09-44425f82e405",
             input: "routes = [[1,2,3],[4,5,6]], source = 6, target = 6",
             expected: "0", orderMatters: true),
            TestCaseData(id: "67e35904-b8f6-406a-9c80-2d53e4ab50d4",
             input: "routes = [[1,2,3],[4,5,6]], source = 3, target = 3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5b53dfe2-170c-41b2-9668-5ebfe2e549cb",
             input: "routes = [[1,2,3],[4,5,6]], source = 4, target = 4",
             expected: "0", orderMatters: true),
            TestCaseData(id: "44f516a6-5976-45e2-986c-845f908d49c4",
             input: "routes = [[1,2,3],[4,5,6]], source = 5, target = 5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d235e245-74c7-4702-b129-0affdea4ef99",
             input: "routes = [[1,2,3]], source = 3, target = 3",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "bus-routes"
            let topic = "misc"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            guard let p_routes = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_routes.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: routes 2D array too large (\(p_routes.count))"
                )
                return
            }
            guard let p_source = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_target = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            let solution = Solution()
            let result = solution.numBusesToDestination(p_routes, p_source, p_target)
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
