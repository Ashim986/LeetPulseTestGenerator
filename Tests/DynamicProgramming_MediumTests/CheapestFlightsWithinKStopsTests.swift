import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCheapestFlightsWithinKStops {
    private class Solution {
        func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
            var dist = [Int](repeating: Int.max, count: n)
            dist[src] = 0

            for _ in 0...k {
                let prev = dist
                for f in flights {
                    let from = f[0], to = f[1], price = f[2]
                    if prev[from] != Int.max {
                        dist[to] = min(dist[to], prev[from] + price)
                    }
                }
            }

            return dist[dst] == Int.max ? -1 : dist[dst]
        }
    }

    @Suite struct CheapestFlightsWithinKStopsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b15d14d2-736b-497b-9990-c481b94c075a",
             input: "n = 3, flights = [[0,1,100],[1,2,100],[2,0,100]], src = 0, dst = 2, k = 1",
             expected: "200", orderMatters: true),
            TestCaseData(id: "5b0a368a-708f-4bdc-957d-8f841ec91335",
             input: "n = 5, flights = [[0,1,100],[1,2,100],[2,3,100],[3,4,100]], src = 0, dst = 4, k = 4",
             expected: "400", orderMatters: true),
            TestCaseData(id: "8097acb2-afc6-4b7a-9e66-3ac10e13023a",
             input: "n = 2, flights = [[0,1,100]], src = 0, dst = 1, k = 1",
             expected: "100", orderMatters: true),
            TestCaseData(id: "c38ec10a-9995-4c83-add4-1ab0adf7eb10",
             input: "n = 1, flights = [], src = 0, dst = 0, k = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9cf8b4ad-3d62-4801-aa6c-e8ac97a6d120",
             input: "n = 10, flights = [[0,1,100],[1,2,100],[2,3,100],[3,4,100],[4,5,100],[5,6,100],[6,7,100],[7,8,100],[8,9,100]], src = 0, dst = 9, k = 9",
             expected: "900", orderMatters: true),
            TestCaseData(id: "1df4b83c-9acc-4af9-9544-91b57593d9ce",
             input: "n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 0",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "517b819d-6cd5-4b3c-814d-5156610cec00",
             input: "n = 5, flights = [[0,1,100],[1,2,100],[2,3,100],[3,4,100]], src = 0, dst = 4, k = 0",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "87a3831f-6174-442f-826b-2fe2ac0b607f",
             input: "n = 3, flights = [[0,1,100],[1,2,100],[2,0,100]], src = 0, dst = 2, k = 2",
             expected: "200", orderMatters: true),
            TestCaseData(id: "d4584444-a616-4f0d-a119-fe9baf841bd6",
             input: "n = 2, flights = [[0,1,100],[1,0,100]], src = 0, dst = 1, k = 1",
             expected: "100", orderMatters: true),
            TestCaseData(id: "b37d991d-0055-4fd7-8c92-741b897b4a97",
             input: "n = 10, flights = [[0,1,100],[1,2,100],[2,3,100],[3,4,100],[4,5,100],[5,6,100],[6,7,100],[7,8,100],[8,9,100]], src = 0, dst = 9, k = 10",
             expected: "900", orderMatters: true),
            TestCaseData(id: "2fc9929a-0c88-47f2-a92b-4a1e78d45a48",
             input: "n = 5, flights = [[0,1,100],[1,2,100],[2,3,100],[3,4,100]], src = 0, dst = 4, k = 3",
             expected: "400", orderMatters: true),
            TestCaseData(id: "0d2d6dde-922a-4dee-a771-1783dc09123d",
             input: "n = 3, flights = [[0,1,100],[1,2,100],[2,0,100]], src = 0, dst = 2, k = 0",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "2a681956-5a1a-4b81-ab51-7e7856dc60f8",
             input: "n = 3, flights = [[0,1,100],[1,2,100],[2,0,100]], src = 0, dst = 2, k = 3",
             expected: "200", orderMatters: true),
            TestCaseData(id: "2c015f03-3877-4597-8dae-d783f492622a",
             input: "n = 2, flights = [[0,1,100]], src = 0, dst = 1, k = 2",
             expected: "100", orderMatters: true),
            TestCaseData(id: "cf8344ee-f8b8-4d65-bdb7-835df6fb6e95",
             input: "n = 3, flights = [[0,1,100],[1,2,100],[2,0,100]], src = 0, dst = 2, k = 4",
             expected: "200", orderMatters: true),
            TestCaseData(id: "de3d4961-11e1-4eed-b396-bd3f939a7729",
             input: "n = 2, flights = [[0,1,100]], src = 0, dst = 1, k = 3",
             expected: "100", orderMatters: true),
            TestCaseData(id: "6628160c-ac82-42e4-99d8-b7d495ba6184",
             input: "n = 3, flights = [[0,1,100],[1,2,100],[2,0,100]], src = 0, dst = 2, k = 5",
             expected: "200", orderMatters: true),
            TestCaseData(id: "07589036-5566-4471-9a01-006b1644ee9f",
             input: "n = 2, flights = [[0,1,100]], src = 0, dst = 1, k = 4",
             expected: "100", orderMatters: true),
            TestCaseData(id: "b09888b3-49d3-420d-8921-fd4b315fa483",
             input: "n = 5, flights = [[0,1,100],[1,2,100],[2,3,100],[3,4,100]], src = 0, dst = 4, k = 5",
             expected: "400", orderMatters: true),
            TestCaseData(id: "ce0f9ba6-ba84-49a5-8984-d92df4d97ebe",
             input: "n = 3, flights = [[0,1,100],[1,2,100],[2,0,100]], src = 0, dst = 2, k = 6",
             expected: "200", orderMatters: true),
            TestCaseData(id: "85268137-b90c-45d4-b2ef-8c34c93e33e2",
             input: "n = 2, flights = [[0,1,100]], src = 0, dst = 1, k = 5",
             expected: "100", orderMatters: true),
            TestCaseData(id: "69c7a7d6-0810-4ad2-9c42-c05839225216",
             input: "n = 5, flights = [[0,1,100],[1,2,100],[2,3,100],[3,4,100]], src = 0, dst = 4, k = 6",
             expected: "400", orderMatters: true),
            TestCaseData(id: "63a735a1-7d44-4a73-892f-9983cfc20517",
             input: "n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 2",
             expected: "400", orderMatters: true),
            TestCaseData(id: "a8f8b729-ef01-44f1-9e11-a69f5c659bf0",
             input: "n = 2, flights = [[0,1,100]], src = 0, dst = 1, k = 0",
             expected: "100", orderMatters: true),
            TestCaseData(id: "c225ac34-40c5-4e62-b470-a8e313eea2c5",
             input: "n = 10, flights = [[0,1,100],[1,2,100],[2,3,100],[3,4,100],[4,5,100],[5,6,100],[6,7,100],[7,8,100],[8,9,100]], src = 0, dst = 9, k = 5",
             expected: "-1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "cheapest-flights-within-k-stops"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 5 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 5, got \(params.count)"
                )
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_flights = InputParser.parse2DIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [[Int]]"
                )
                return
            }
            guard p_flights.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: flights 2D array too large (\(p_flights.count))"
                )
                return
            }
            guard let p_src = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }
            guard let p_dst = InputParser.parseInt(params[3]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 3 as Int"
                )
                return
            }
            guard let p_k = InputParser.parseInt(params[4]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 4 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 100"
                )
                return
            }
            guard p_flights.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: flights[i].length == 3"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findCheapestPrice(p_n, p_flights, p_src, p_dst, p_k)
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
