import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCConstructStringFromBinaryTree {
    private class Solution {
        func tree2str(_ t: TreeNode?) -> String {
            guard let t = t else { return "" }
            var result = String(t.val)
            if t.left == nil && t.right == nil {
                return result
            }
            result += "("
            if let l = t.left {
                result += tree2str(l)
            }
            if t.left != nil && t.right != nil {
                result += ")("
            }
            if let r = t.right {
                result += tree2str(r)
            }
            result += ")"
            return result
        }
    }

    @Suite struct ConstructStringFromBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2bca828d-1634-4f9d-827f-86ec364f44a1",
             input: "root = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2e2c6bdb-8dee-48ad-93ae-6012942d9c08",
             input: "root = [1,2]",
             expected: "1(2)", orderMatters: true),
            TestCaseData(id: "2a61b274-d042-4f61-82c5-c1c51faa6cfa",
             input: "root = [1,null,2]",
             expected: "1()(2)", orderMatters: true),
            TestCaseData(id: "a449d2f8-a685-4bb7-9828-ddb1fdec3b3a",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "1(2(4)(5))(3(6)(7))", orderMatters: true),
            TestCaseData(id: "3b5e5d19-8171-49df-baf8-3ba1933c3486",
             input: "root = [1,-2,3]",
             expected: "1(-2)(3)", orderMatters: true),
            TestCaseData(id: "5572e994-33b5-448d-a836-29d0e13fd3ca",
             input: "root = [1,2,2]",
             expected: "1(2)(2)", orderMatters: true),
            TestCaseData(id: "2f1b60bb-aeb1-4f48-9bd4-1fb01a929e92",
             input: "root = [1,2,null,null,null]",
             expected: "1(2)", orderMatters: true),
            TestCaseData(id: "c8d196cb-569b-4a8b-820f-e52d96bef8b7",
             input: "root = [1,null,2,null,null,null]",
             expected: "1()(2)", orderMatters: true),
            TestCaseData(id: "924bcb1c-c8f5-439f-ab1c-116078bcdc6f",
             input: "root = [1,2,3,null,null,null,null]",
             expected: "1(2)(3)", orderMatters: true),
            TestCaseData(id: "6f5c4454-f9d4-4bce-85be-97eb766a8638",
             input: "root = [1,2,3,4,5,6,7,null,null,null,null]",
             expected: "1(2(4)(5))(3(6)(7))", orderMatters: true),
            TestCaseData(id: "d11d08ae-0daf-46c8-bfdc-b3933de875a7",
             input: "root = [1,null,2,3,null,null,null]",
             expected: "1()(2(3))", orderMatters: true),
            TestCaseData(id: "a9172689-bb7d-4416-b015-1b0a40cb9f77",
             input: "root = [1,null,2,3,4,null,null]",
             expected: "1()(2(3)(4))", orderMatters: true),
            TestCaseData(id: "8b3718bf-e62b-4baf-9155-e24840cac5fa",
             input: "root = [1,2,3,null,4,5,null]",
             expected: "1(2()(4))(3(5))", orderMatters: true),
            TestCaseData(id: "8bd2d378-bd23-423b-9fb9-7f76e6296108",
             input: "root = [1,null,2,3]",
             expected: "1()(2(3))", orderMatters: true),
            TestCaseData(id: "dd9c475d-9527-44f8-81b9-c4d58bea6c2f",
             input: "root = [-1,-2,-3]",
             expected: "-1(-2)(-3)", orderMatters: true),
            TestCaseData(id: "91743fbb-660f-4697-aa45-4bd0d899913a",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "1()(2()(3()(4)))", orderMatters: true),
            TestCaseData(id: "e7915ef6-c056-40a6-883c-a65079f3129d",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "1(2)(3(4)(5))", orderMatters: true),
            TestCaseData(id: "c18fb3f3-9ebf-4c27-ac14-6c50cbabf848",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "1(2(4(8)(9(10)))(5))(3(6)(7))", orderMatters: true),
            TestCaseData(id: "372a2a6b-ddfe-4a86-a3ad-4a5463de58aa",
             input: "root = [1,null,null]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0e6146e7-0d00-4815-aacf-711ef928ac50",
             input: "root = [1,2,3,null,null,null,4]",
             expected: "1(2)(3()(4))", orderMatters: true),
            TestCaseData(id: "c1c7aef7-cc8c-4225-b35d-9bae3e998003",
             input: "root = [1,2,3,4,5,null,null]",
             expected: "1(2(4)(5))(3)", orderMatters: true),
            TestCaseData(id: "e6ef6b75-3b5a-4507-9b5d-f61dfe94e8f7",
             input: "root = [1,2,3,4,null,5,null]",
             expected: "1(2(4))(3()(5))", orderMatters: true),
            TestCaseData(id: "f6801760-1c66-4a82-81e5-1535e8e41754",
             input: "root = [1,null,2,null,3,null,null]",
             expected: "1()(2()(3))", orderMatters: true),
            TestCaseData(id: "32a32477-0b62-4e53-a909-cd629c3370fa",
             input: "root = [1,2,null,null,3,null,null]",
             expected: "1(2()(3))", orderMatters: true),
            TestCaseData(id: "a7c4945e-46fb-4bba-b4f5-63a7c5abf6cc",
             input: "root = [1,null,2,3,null,null,4]",
             expected: "1()(2(3()(4)))", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "construct-string-from-binary-tree"
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

            guard let p_t = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
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
            let result = solution.tree2str(p_t)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
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
