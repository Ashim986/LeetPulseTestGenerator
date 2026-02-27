import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOfProvinces {
    private class Solution {
        func findCircleNum(_ isConnected: [[Int]]) -> Int {
            let n = isConnected.count
            var parent = Array(repeating: 0, count: n)
            for i in 0..<n {
                parent[i] = i
            }

            for i in 0..<n {
                for j in i+1..<n {
                    if isConnected[i][j] == 1 {
                        union(&parent, i, j)
                    }
                }
            }

            var count = 0
            for i in 0..<n {
                if find(&parent, i) == i {
                    count += 1
                }
            }

            return count
        }

        func find(_ parent: inout [Int], _ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(&parent, parent[x])
            }
            return parent[x]
        }

        func union(_ parent: inout [Int], _ x: Int, _ y: Int) {
            let rootX = find(&parent, x)
            let rootY = find(&parent, y)
            if rootX != rootY {
                parent[rootY] = rootX
            }
        }
    }

    @Suite struct NumberOfProvincesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0130e3ae-8e94-4cfb-baa7-17bd5052abaf",
             input: "isConnected = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "996b714a-5c9e-45ce-8f5b-645cf4a3b894",
             input: "isConnected = [[1,1,1],[1,1,1],[1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "aad106c3-63e2-4cb2-9ff9-20ebc2941e5a",
             input: "isConnected = [[1,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "c1e163de-c05c-4550-8661-dd15e6d2e374",
             input: "isConnected = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "966de192-bda4-4d0f-b110-607e8b07bfd5",
             input: "isConnected = [[1,0],[0,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4b99fc3e-aa9a-4f4b-a207-6e4bd948b501",
             input: "isConnected = [[1,1],[1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "45812afa-9664-4e08-9c3d-ac55cd865af8",
             input: "isConnected = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "008d9789-a922-4753-a91d-19ce46eae794",
             input: "isConnected = [[1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "36519979-6758-4332-9e76-2a185ee539a5",
             input: "isConnected = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1],[0,0,0,0,1]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4b06e425-86cc-422b-b7d9-c5d42c22ddf0",
             input: "isConnected = [[1,1,0,0],[1,1,0,0],[0,0,1,1],[0,0,1,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "cb02e715-9ccb-466b-aead-952927a6db7a",
             input: "isConnected = [[1,0,0,0,0,0],[0,1,0,0,0,0],[0,0,1,0,0,0],[0,0,0,1,0,0],[0,0,0,0,1,0],[0,0,0,0,0,1]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "7d0aeefd-b996-4ef4-9959-18e95203c01e",
             input: "isConnected = [[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2cbc8b84-1520-4702-8b67-9a6470d691c3",
             input: "isConnected = [[1,0,0],[0,1,1],[0,1,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "897d5b08-0663-4d38-81c6-53e0347e4a17",
             input: "isConnected = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ae52574a-67e3-488d-b0b8-c91ff12a185b",
             input: "isConnected = [[1,1,0,0,0],[1,1,0,0,0],[0,0,1,1,0],[0,0,1,1,0],[0,0,0,0,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "bbbded0f-935b-4711-af45-1e0ca213c6c1",
             input: "isConnected = [[0,0,0],[0,0,0],[0,0,0]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "271e3f92-e5ba-4397-b460-59c2e57e4c83",
             input: "isConnected = [[0,1,0],[1,0,1],[0,1,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "744722c2-805d-4140-948e-16c06bbbc150",
             input: "isConnected = [[0,1,0,0,0,0],[1,0,1,0,0,0],[0,1,0,1,0,0],[0,0,1,0,1,0],[0,0,0,1,0,1],[0,0,0,0,1,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f65804fa-a3df-416c-88f2-6bce4f7a705a",
             input: "isConnected = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "7a3b5e19-51b5-42b9-ac45-898e6f2c9199",
             input: "isConnected = [[0,1,1,1,1,1],[1,0,1,1,1,1],[1,1,0,1,1,1],[1,1,1,0,1,1],[1,1,1,1,0,1],[1,1,1,1,1,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c989fd4a-0bf4-405e-be43-364ccaf514b2",
             input: "isConnected = [[1,1,0,0,0,0],[1,1,0,0,0,0],[0,0,1,1,0,0],[0,0,1,1,0,0],[0,0,0,0,1,1],[0,0,0,0,1,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "991da721-c063-446b-b973-fb5ebb525c67",
             input: "isConnected = [[1,0,1],[0,1,0],[1,0,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c9c22f09-3eef-432b-a6e7-4397d25e6e52",
             input: "isConnected = [[0,0,1,0],[0,0,0,1],[1,0,0,0],[0,1,0,0]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "06e76a10-63d8-466d-8d7a-91b2be03bfa1",
             input: "isConnected = [[1,1,0],[1,1,0],[0,0,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2ec8c927-05eb-41ac-b0c8-cd593c2b8e6d",
             input: "isConnected = [[1,0,0],[0,1,0],[0,0,1]]",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-provinces"
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

            guard let p_isConnected = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_isConnected.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: isConnected 2D array too large (\(p_isConnected.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_isConnected.count >= 1 && p_isConnected.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 200"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findCircleNum(p_isConnected)
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
