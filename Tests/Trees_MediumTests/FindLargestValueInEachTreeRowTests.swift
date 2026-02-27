import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindLargestValueInEachTreeRow {
    private class Solution {
     func largestValues(_ root: TreeNode?) -> [Int] {
         var result = [Int]()
         var queue = [TreeNode?]()
         if root != nil {
             queue.append(root)
         }
         while !queue.isEmpty {
             var levelMax = Int.min
             var levelSize = queue.count
             for _ in 1...levelSize {
                 let node = queue.removeFirst()
                 levelMax = max(levelMax, node.unsafelyUnwrapped.val)
                 if node?.left != nil {
                     queue.append(node?.left)
                 }
                 if node?.right != nil {
                     queue.append(node?.right)
                 }
             }
             result.append(levelMax)
         }
         return result
     }
     }

    @Suite struct FindLargestValueInEachTreeRowTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0586f919-25e5-495d-beb8-78a2eef59a5d",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "[1, 3, 5]", orderMatters: true),
            TestCaseData(id: "7d553e78-73cc-4b2d-a5b0-edb1cffc3258",
             input: "root = [1,null,2]",
             expected: "[1, 2]", orderMatters: true),
            TestCaseData(id: "c587c755-347a-4a28-bc76-b64c73949c0f",
             input: "root = [1,2]",
             expected: "[1, 2]", orderMatters: true),
            TestCaseData(id: "2ed95b68-0ca4-40fa-bd21-0b6e204ed747",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[1, 3, 7]", orderMatters: true),
            TestCaseData(id: "e2d70c9e-7463-4530-8cae-757df4975cce",
             input: "root = [1,null,2,null,3]",
             expected: "[1, 2, 3]", orderMatters: true),
            TestCaseData(id: "0a5b542b-4a19-43c5-89a7-27841bb5cbb7",
             input: "root = [1,-2,3]",
             expected: "[1, 3]", orderMatters: true),
            TestCaseData(id: "1e765ed4-2aa3-45ac-bf0c-1332902fe7a5",
             input: "root = [1,2,3,-4,-5,-6]",
             expected: "[1, 3, -4]", orderMatters: true),
            TestCaseData(id: "c9583da7-8164-4dbe-a61c-86d915e0dc85",
             input: "root = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "775974f6-4999-4e24-85e8-276de50314d9",
             input: "root = [1,null]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "255560e0-2bf4-4370-870f-43d022528840",
             input: "root = [1,2,null,null,3]",
             expected: "[1, 2, 3]", orderMatters: true),
            TestCaseData(id: "7516f945-e062-412a-8b56-2fb198fe6bf0",
             input: "root = [1,2,3,4,5,6,7,8,9]",
             expected: "[1, 3, 7, 9]", orderMatters: true),
            TestCaseData(id: "ca57bea5-0e8f-4409-9ddb-1aa7be101ada",
             input: "root = [1,-2,-3]",
             expected: "[1, -2]", orderMatters: true),
            TestCaseData(id: "1e8b4851-6270-4883-a14e-edb571c433a5",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "[1, 2, 3, 4]", orderMatters: true),
            TestCaseData(id: "489d1ccd-8e4c-404f-bff7-06671afb4e66",
             input: "root = [1,2,3,4,null,5,6]",
             expected: "[1, 3, 6]", orderMatters: true),
            TestCaseData(id: "fde47bbf-934d-4407-b9f9-3798a71f83c3",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[1, 3, 7, 15]", orderMatters: true),
            TestCaseData(id: "443e651a-6251-405b-a87e-61d6f025d8c1",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "438a46f6-63a8-45f2-a79e-363e520e6cb2",
             input: "root = [1,-2,-3,-4,-5,-6]",
             expected: "[1, -2, -4]", orderMatters: true),
            TestCaseData(id: "c23e340f-ab7d-4b3d-9e74-a7930dec1cd8",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13]",
             expected: "[1, 3, 7, 13]", orderMatters: true),
            TestCaseData(id: "e6418282-3673-411c-820d-6aa9527b70a2",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6]",
             expected: "[1, 2, 3, 4, 5, 6]", orderMatters: true),
            TestCaseData(id: "decebe2a-17eb-4014-8fc9-5ff3b5c0588b",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "[1, 3, 7, 14]", orderMatters: true),
            TestCaseData(id: "a537749f-8300-40ff-ba06-1c2c339c6c06",
             input: "root = [1,-2,-3,-4,-5,-6,-7,-8]",
             expected: "[1, -2, -4, -8]", orderMatters: true),
            TestCaseData(id: "3d07cc3b-cc8a-40a4-8d5a-d457f966e649",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7]",
             expected: "[1, 2, 3, 4, 5, 6, 7]", orderMatters: true),
            TestCaseData(id: "ff123598-25d6-4b1e-b398-ba07f74a705a",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]",
             expected: "[1, 3, 7, 15, 17]", orderMatters: true),
            TestCaseData(id: "cd085dc7-77d6-4550-a2bf-2cd705f7e448",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]",
             expected: "[1, 3, 7, 15, 18]", orderMatters: true),
            TestCaseData(id: "a8c47859-cff4-4d46-9b30-5a2a0ea97f54",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-largest-value-in-each-tree-row"
            let topic = "trees"
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

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as TreeNode?"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.largestValues(p_root)
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

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
