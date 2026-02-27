import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOfBoomerangs {
    private class Solution {
        func numberOfBoomerangs(_ points: [[Int]]) -> Int {
            var count = 0
            for i in 0..<points.count {
                var map: [Int:Int] = [:]
                for j in 0..<points.count where i != j {
                    let x = points[i][0] - points[j][0]
                    let y = points[i][1] - points[j][1]
                    let distance = x*x + y*y
                    map[distance, default: 0] += 1
                }
                for (_, value) in map {
                    count += value * (value - 1)
                }
            }
            return count
        }
    }

    @Suite struct NumberOfBoomerangsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "00316e40-6059-491e-bcde-78b0c9fa27c1",
             input: "points = [[0,0],[0,1],[0,2]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a92cac09-c73a-4c6b-85b0-21543b96190b",
             input: "points = [[1,1],[2,2],[3,3]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "27e5b8c1-d45a-48a0-ad5c-8ccc0eb9bfe6",
             input: "points = [[0,0],[1,1],[2,2]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8f562f5d-10bb-45ef-871d-1a1ba7f73432",
             input: "points = [[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "eda6b6df-da66-4e78-8293-21dd92fa0507",
             input: "points = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0e0952ef-017f-4322-b0cb-aa890075fe78",
             input: "points = [[-1,-1],[-2,-2],[-3,-3]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "0214ded3-fad0-40b9-82df-5e15205a4ea6",
             input: "points = [[0,0],[0,0],[0,0]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "6b9b2319-e64e-4f7f-8535-332ba1b0ddaa",
             input: "points = [[1,1],[1,1],[1,1]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "16a74f4a-a162-4f8a-b5ff-0cff45e3a7d4",
             input: "points = [[100,100],[200,200],[300,300]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ea62ac33-ecc6-4d4d-8dc3-eef3449b26fd",
             input: "points = [[-100,-100],[-200,-200],[-300,-300]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d7b11580-5f1e-4d7c-83e4-be9a76115c17",
             input: "points = [[0,100],[0,200],[0,300]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "3e8df2af-7848-4cd4-a9e1-b05c62c646cb",
             input: "points = [[100,0],[200,0],[300,0]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5193487e-491b-419f-bc9b-897888f9d351",
             input: "points = [[0,0],[1,0],[2,0],[3,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "28ae119f-cc42-493f-9812-959608aec117",
             input: "points = [[0,0],[0,1],[0,2],[0,3]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "62fd266a-af23-4e1d-9357-d93b4a83540d",
             input: "points = [[0,0],[1,1],[2,2],[3,3]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "749eab75-cd0f-4995-ba06-7197e319e2d0",
             input: "points = [[-1,-1],[-2,-2],[-3,-3],[-4,-4]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "9bda49dd-1ced-441b-9d5e-5bcd350c8182",
             input: "points = [[0,0],[100,100],[200,200],[300,300],[400,400]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "01118b22-7634-4af8-9084-6955185fc8fc",
             input: "points = [[0,0],[0,100],[0,200],[0,300],[0,400]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "f3f3476b-80da-4445-89a9-4e79c6830715",
             input: "points = [[0,0],[100,0],[200,0],[300,0],[400,0]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "20ab464f-124d-46b8-b989-f86e79fe95bd",
             input: "points = [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "a8a50709-4416-4be4-9d62-dd20926f10e0",
             input: "points = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5]]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "04106ee9-02a5-40f4-aa8e-99217c81980d",
             input: "points = [[0,0],[1,1],[2,2],[3,3],[4,4],[5,5]]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "a22ddf5a-d08c-4281-9812-691b916bddc8",
             input: "points = [[-1,-1],[-2,-2],[-3,-3],[-4,-4],[-5,-5],[-6,-6]]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "1f88b614-830f-45d2-94db-160e8f35bb45",
             input: "points = [[100,100],[200,200],[300,300],[400,400],[500,500],[600,600]]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "dc44eace-6f4d-4e39-ae0e-d67ba7690f0b",
             input: "points = [[0,0],[0,100],[0,200],[0,300],[0,400],[0,500]]",
             expected: "12", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-boomerangs"
            let topic = "math-geometry"
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

            guard let p_points = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_points.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: points 2D array too large (\(p_points.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_points.count >= 1 && p_points.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 500"
                )
                return
            }
            guard p_points.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: points[i].length == 2"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.numberOfBoomerangs(p_points)
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
