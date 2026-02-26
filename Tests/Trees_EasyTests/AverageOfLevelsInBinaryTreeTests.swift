import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAverageOfLevelsInBinaryTree {
    private class Solution {
        func averageOfLevels(_ root: TreeNode?) -> [Double] {
            var result = [Double]()
            var queue = [TreeNode]()
            if let root = root {
                queue.append(root)
            }
            while !queue.isEmpty {
                var levelSum = 0
                var levelCount = 0
                var levelQueue = [TreeNode]()
                while !queue.isEmpty {
                    levelCount += 1
                    let node = queue.removeFirst()
                    levelSum += node.val
                    if let left = node.left {
                        levelQueue.append(left)
                    }
                    if let right = node.right {
                        levelQueue.append(right)
                    }
                }
                result.append(Double(levelSum) / Double(levelCount))
                queue = levelQueue
            }
            return result
        }
    }

    @Suite struct AverageOfLevelsInBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "745f2fd0-85bf-4770-b680-9624b4895929",
             input: "root = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "841455b4-25ba-4916-9db8-5e3c9fae55d9",
             input: "root = [1]",
             expected: "[1.0]", orderMatters: true),
            TestCaseData(id: "f2884f3a-5324-4b66-9c89-f5c48fc7613d",
             input: "root = [1,2]",
             expected: "[1.0,2.0]", orderMatters: true),
            TestCaseData(id: "c9d66bf9-ee26-4c1e-8a59-3e1f101a4885",
             input: "root = [1,null,2]",
             expected: "[1.0,2.0]", orderMatters: true),
            TestCaseData(id: "cb5e4d87-9d55-4648-9c16-54d173a0b329",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[1.0,2.5,5.5]", orderMatters: true),
            TestCaseData(id: "0e0833eb-0319-458a-9828-b16b1be383c4",
             input: "root = [1,-2,3,-4,5,-6,7]",
             expected: "[1.0,0.5,0.5]", orderMatters: true),
            TestCaseData(id: "229b3b9c-021f-4560-859c-fc730078b95b",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "[1.0,1.0,1.0]", orderMatters: true),
            TestCaseData(id: "0ad4e4e4-110c-4002-930f-d40dd4eea442",
             input: "root = [10,20,30,40,50,60,70,80,90,100]",
             expected: "[10.0,25.0,55.0,90.0]", orderMatters: true),
            TestCaseData(id: "c50545f0-c182-48cc-9188-5497ae47b2fb",
             input: "root = [10,-20,30,-40,50,-60,70,-80,90,-100]",
             expected: "[10.0,5.0,5.0,-30.0]", orderMatters: true),
            TestCaseData(id: "f3469417-bc38-46aa-b9e4-09b0e9355997",
             input: "root = [1,2,2,2,2,2,2]",
             expected: "[1.0,2.0,2.0]", orderMatters: true),
            TestCaseData(id: "86ae5860-6d52-4f34-8691-520efa20d59f",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65]",
             expected: "[1.0,2.5,5.5,11.5,23.5,47.5,64.5]", orderMatters: true),
            TestCaseData(id: "a705622d-2430-4c6d-9b0b-de45bc9ccef1",
             input: "root = [1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,-23,-24,-25,-26,-27,-28,-29,-30,-31,-32,-33,-34,-3"
                + "5,-36,-37,-38,-39,-40,-41,-42,-43,-44,-45,-46,-47,-48,-49,-50,-51,-52,-53,-54,-55,-56,-57,-58,-59,-60,-61,-62,-63,-64,-65]",
             expected: "[1.0,-2.5,-5.5,-11.5,-23.5,-47.5,-64.5]", orderMatters: true),
            TestCaseData(id: "5a0cb343-4426-4f99-aa64-799f98317e18",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46"
                + ",47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70]",
             expected: "[1.0,2.5,5.5,11.5,23.5,47.5,67.0]", orderMatters: true),
            TestCaseData(id: "daa9dacd-c246-4681-8b80-20ad99d86476",
             input: "root = [1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,-23,-24,-25,-26,-27,-28,-29,-30,-31,-32,-33,-34,-3"
                + "5,-36,-37,-38,-39,-40,-41,-42,-43,-44,-45,-46,-47,-48,-49,-50,-51,-52,-53,-54,-55,-56,-57,-58,-59,-60,-61,-62,-63,-64,-65,-66,-67,-68,-6"
                + "9,-70]",
             expected: "[1.0,-2.5,-5.5,-11.5,-23.5,-47.5,-67.0]", orderMatters: true),
            TestCaseData(id: "f962c311-cfd8-4f17-91f8-6ed6ccb03a82",
             input: "root = [3,9,20,null,null,15,7]",
             expected: "[3.00000,14.50000,11.00000]", orderMatters: true),
            TestCaseData(id: "7a2c492f-b72a-461b-84c3-e611e56eb92a",
             input: "root = [3,9,20,15,7]",
             expected: "[3.00000,14.50000,11.00000]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "average-of-levels-in-binary-tree"
            let topic = "trees"
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

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as TreeNode?"
                )
                return
            }

            let solution = Solution()
            let result = solution.averageOfLevels(p_root)
            let computedOutput = OutputSerializer.serialize(result)

            // Element-wise epsilon comparison for [Double] (QUAL-02)
            guard let expectedArray = InputParser.parseDoubleArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Double]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if result.count != expectedArray.count {
                matches = false
            } else {
                matches = zip(result, expectedArray).allSatisfy { abs($0 - $1) < 1e-5 }
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
