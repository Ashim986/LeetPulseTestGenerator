import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCShoppingOffers {
    private class Solution {
        func shoppingOffers(price: [Int], special: [[Int]], needs: [Int]) -> Int {
            var memo: [String: Int] = [:]
            func dfs(_ needs: [Int]) -> Int {
                let key = needs.map { String($0) }.joined(separator: ",")
                if let val = memo[key] {
                    return val
                }
                let cost = needs.enumerated().map { price[$0.offset] * $0.element }.reduce(0, +)
                var res = cost
                for offer in special {
                    var clone = needs
                    var valid = true
                    for i in 0..<offer.count-1 {
                        clone[i] -= offer[i]
                        if clone[i] < 0 {
                            valid = false
                            break
                        }
                    }
                    if valid {
                        res = min(res, dfs(clone) + offer[offer.count - 1])
                    }
                }
                memo[key] = res
                return res
            }
            return dfs(needs)
        }
    }

    @Suite struct ShoppingOffersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "62f5f520-fb62-40e5-9d22-6d8a70c7153e",
             input: "price = [1,1,1], special = [[1,1,1,0]], needs = [1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "932914ec-ec02-4387-a237-9884b76b11d3",
             input: "price = [10,10,10], special = [[1,1,1,10]], needs = [1,1,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "8406be81-dce3-43cc-aee6-c3b393b34a85",
             input: "price = [1,2,3], special = [[1,2,3,6]], needs = [1,2,3]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "8ca2322a-3bdb-40e4-881e-d7b0df536e23",
             input: "price = [1,1,1], special = [], needs = [1,1,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9be8b427-415d-4f83-b20c-659e97fb90c8",
             input: "price = [1,2,3], special = [], needs = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e816392d-45da-445a-9cdb-75be038c430c",
             input: "price = [10], special = [[1,10]], needs = [1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "c9d1fa6f-c3d9-44a2-adac-9dd8f2e28b65",
             input: "price = [1,1,1], special = [[1,1,1,0]], needs = [2,2,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8a74743b-65c6-4759-8746-b88d833f61bd",
             input: "price = [1,2,3], special = [[1,2,3,6],[1,2,3,7]], needs = [1,2,3]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "565d3c53-8ffc-474c-9295-933732138ddf",
             input: "price = [1,2,3], special = [[1,2,3,6],[1,2,3,5]], needs = [1,2,3]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9eb03df6-eb08-47a6-b830-808475950cb1",
             input: "price = [1,1,1], special = [[1,1,1,0]], needs = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "11ceeb32-3025-4353-bb8f-18f9a241a39e",
             input: "price = [10,20,30], special = [[1,1,1,10]], needs = [1,1,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "9f41e12d-b409-4520-b920-67b7fc837ff4",
             input: "price = [1,2,3], special = [[1,2,3,6]], needs = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0e837d19-0c41-4500-8742-6f2155679fd1",
             input: "price = [1,2,3], special = [[1,2,3,6],[2,2,2,12]], needs = [2,2,2]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "eee725e8-f7a0-48da-a9fe-067e9c2696cc",
             input: "price = [1,1,1], special = [[1,1,1,0]], needs = [3,3,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "969369fe-86a0-4464-b151-338c2b2bfa83",
             input: "price = [10,20,30], special = [[1,1,1,10],[2,2,2,20]], needs = [2,2,2]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "6ae6c7f8-1656-4db2-bf8a-c162024626d6",
             input: "price = [1,1,1], special = [], needs = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cc51831e-6f4b-4f39-a048-a13e9036b0d1",
             input: "price = [10], special = [], needs = [1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "bca64867-1ec9-4828-aab7-2b0f3eccbb5f",
             input: "price = [1,1,1], special = [[1,1,1,0]], needs = [1,1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1d5ed92a-aeb2-4e1b-a8e7-9800b1652944",
             input: "price = [10,20,30], special = [[1,1,1,10]], needs = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ca09e493-e1d7-4f5d-8fa8-7f06eeb55134",
             input: "price = [1,2,3], special = [[1,2,3,6]], needs = [1,1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "57dc2f1b-9250-44fa-8707-6c469e08e98c",
             input: "price = [10,20,30], special = [[1,1,1,10],[2,2,2,20]], needs = [1,1,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d3e9d95a-19e0-4be4-ad27-92ea1c088f12",
             input: "price = [1,2,3], special = [[1,2,3,6],[2,2,2,12]], needs = [1,2,3]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "66c6d179-7942-4ec6-bc73-2f5dc65a1774",
             input: "price = [10], special = [[1,10]], needs = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6e5c1f34-6098-4c5d-a105-72ccdbe1efd0",
             input: "price = [10,20,30], special = [], needs = [1,1,1]",
             expected: "60", orderMatters: true),
            TestCaseData(id: "8a6b01ba-df25-4fc2-91a8-c915945ae6da",
             input: "price = [1,2,3], special = [[1,2,3,6],[1,2,3,7]], needs = [0,0,0]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "shopping-offers"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            guard let p_price = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_price.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: price array too large (\(p_price.count))"
                )
                return
            }
            guard let p_special = InputParser.parse2DIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [[Int]]"
                )
                return
            }
            guard p_special.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: special 2D array too large (\(p_special.count))"
                )
                return
            }
            guard let p_needs = InputParser.parseIntArray(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as [Int]"
                )
                return
            }
            guard p_needs.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: needs array too large (\(p_needs.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_price.count >= 1 && p_price.count <= 6 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 6"
                )
                return
            }
            guard p_price.allSatisfy({ $0 >= 0 && $0 <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= price[i], needs[i] <= 10"
                )
                return
            }
            guard p_needs.allSatisfy({ $0 >= 0 && $0 <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= price[i], needs[i] <= 10"
                )
                return
            }
            guard p_special.count >= 1 && p_special.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= special.length <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.shoppingOffers(price: p_price, special: p_special, needs: p_needs)
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
