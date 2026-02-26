import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDiagonalTraverse {
    private class Solution {
        func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
          var diagonals: [Int: [Int]] = [:]
          let m = nums.count
          let n = nums[0].count

          for i in 0..<m {
            for j in 0..<n {
              let diagonalIndex = i + j

              if diagonals[diagonalIndex] == nil {
                diagonals[diagonalIndex] = []
              }

              diagonals[diagonalIndex]?.append(nums[i][j])
            }
          }

          var res: [Int] = []

          for (k, v) in diagonals {
            if k % 2 == 0 {
              res.append(contentsOf: v.reversed())
            } else {
              res.append(contentsOf: v)
            }
          }

          return res
        }
    }

    @Suite struct DiagonalTraverseTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4c227319-ec58-4522-8640-b0014a6cec98",
             input: "nums = [[1]]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "2ca519f6-ec2f-4291-906f-c4dc3becc492",
             input: "nums = [[1,2]]",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "8a282e4e-da69-4499-8370-ab6665f358d7",
             input: "nums = [[1],[2]]",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "2fe9dbb3-0443-4c2b-b40e-573cfd99bf79",
             input: "nums = [[1,2,3],[4,5,6]]",
             expected: "[1,2,4,5,3,6]", orderMatters: true),
            TestCaseData(id: "b63dbd30-d791-4bf5-832c-bde132cf8726",
             input: "nums = [[1,2],[3,4],[5,6]]",
             expected: "[1,2,3,5,4,6]", orderMatters: true),
            TestCaseData(id: "79f8c33b-b5f0-464c-8232-e3824e5104b4",
             input: "nums = [[-1,-2,-3],[-4,-5,-6]]",
             expected: "[-1,-2,-4,-5,-3,-6]", orderMatters: true),
            TestCaseData(id: "5afbc4af-8007-45ae-a47a-fe7711812d44",
             input: "nums = [[1,1,1],[2,2,2],[3,3,3]]",
             expected: "[1,1,2,2,1,3,3,2,3]", orderMatters: true),
            TestCaseData(id: "7bcda33b-9eec-481f-9d9d-678716b40c04",
             input: "nums = [[1,2,3],[4,5,6],[7,8,9],[10,11,12]]",
             expected: "[1,2,4,7,5,3,6,8,10,11,9,12]", orderMatters: true),
            TestCaseData(id: "a239096c-3e0f-4ea9-aff5-10005365ed1f",
             input: "nums = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]",
             expected: "[1,2,5,9,6,3,4,7,10,11,8,12]", orderMatters: true),
            TestCaseData(id: "a5ae74a0-63d2-46fc-ae18-4d3a7ff1d91c",
             input: "nums = [[1,2],[3,4],[5,6],[7,8]]",
             expected: "[1,2,3,5,4,6,7,8]", orderMatters: true),
            TestCaseData(id: "b8f734b1-e9a4-481d-838d-9b473e00c499",
             input: "nums = [[1,1],[2,2],[3,3],[4,4]]",
             expected: "[1,1,2,3,2,4,3,4]", orderMatters: true),
            TestCaseData(id: "d0e78916-d66d-4be7-988d-34921f427184",
             input: "nums = [[-1,-2],[-3,-4],[-5,-6]]",
             expected: "[-1,-2,-3,-5,-4,-6]", orderMatters: true),
            TestCaseData(id: "b73e516e-ff29-43f2-b4ac-1660b9b356cc",
             input: "nums = [[10,20,30],[40,50,60],[70,80,90]]",
             expected: "[10,20,40,70,50,30,60,80,90]", orderMatters: true),
            TestCaseData(id: "8c067d5b-1782-4ef1-8db0-d74fc6a7c5d0",
             input: "nums = [[100,200,300],[400,500,600],[700,800,900]]",
             expected: "[100,200,400,700,500,300,600,800,900]", orderMatters: true),
            TestCaseData(id: "8fa5ec73-1428-46ea-bbee-b054adb6db86",
             input: "nums = [[1,2,3,4,5],[6,7,8,9,10]]",
             expected: "[1,2,6,7,3,4,8,9,5,10]", orderMatters: true),
            TestCaseData(id: "a1abcf58-19cd-4279-a563-c4876051ee4d",
             input: "nums = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15]]",
             expected: "[1,2,4,7,10,5,3,6,8,11,13,9,12,14,15]", orderMatters: true),
            TestCaseData(id: "4e8c9966-7da2-4aad-ac54-a062135eff01",
             input: "nums = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]]",
             expected: "[1,2,6,11,7,3,4,8,12,9,5,10,13,14,15]", orderMatters: true),
            TestCaseData(id: "4786e0c0-c430-400a-a0cb-696d14e06051",
             input: "nums = [[1,2],[3,4],[5,6],[7,8],[9,10]]",
             expected: "[1,2,3,5,4,6,7,9,8,10]", orderMatters: true),
            TestCaseData(id: "9e87df98-50af-4edc-adca-44fa8e6af722",
             input: "nums = [[-10,-20,-30],[-40,-50,-60]]",
             expected: "[-10,-20,-40,-50,-30,-60]", orderMatters: true),
            TestCaseData(id: "4f7598e9-b333-4367-92a0-9f7af9d98375",
             input: "nums = [[1,2,3,4,5,6,7,8,9],[10,11,12,13,14,15,16,17,18]]",
             expected: "[1,2,10,11,3,4,12,13,5,6,14,15,7,8,16,17,9,18]", orderMatters: true),
            TestCaseData(id: "10d2ce5f-d3af-4f46-9ae0-ffeb36fe5f9e",
             input: "nums = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14]]",
             expected: "[1,2,3,5,4,6,7,9,8,10,11,13,12,14]", orderMatters: true),
            TestCaseData(id: "0a5f0dd3-a742-4858-95c6-f4aa7a46a715",
             input: "nums = [[-1000,-2000,-3000],[-4000,-5000,-6000]]",
             expected: "[-1000,-2000,-4000,-5000,-3000,-6000]", orderMatters: true),
            TestCaseData(id: "23da200a-4fb0-4439-ab5a-f0b1511b4cc2",
             input: "nums = [[100000,200000,300000],[400000,500000,600000]]",
             expected: "[100000,200000,400000,500000,300000,600000]", orderMatters: true),
            TestCaseData(id: "b0b52f50-728c-4299-88d8-83249e1a29e4",
             input: "nums = [[1,1,1,1],[2,2,2,2],[3,3,3,3]]",
             expected: "[1,1,2,1,2,3,1,2,3,2,3,3]", orderMatters: true),
            TestCaseData(id: "c8393078-f3c7-4c15-897b-270cf7515354",
             input: "nums = [[1,1,1,1,1,1],[2,2,2,2,2,2],[3,3,3,3,3,3]]",
             expected: "[1,1,2,1,2,3,1,2,3,1,2,3,1,2,3,2,3,3]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "diagonal-traverse"
            let topic = "arrays-hashing"
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

            guard let p_nums = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_nums.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums 2D array too large (\(p_nums.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.findDiagonalOrder(p_nums)
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
