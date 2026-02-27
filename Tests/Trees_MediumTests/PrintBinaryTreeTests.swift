import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPrintBinaryTree {
    private class Solution {
        func printTree(_ root: TreeNode?) {
            guard let root = root else { return }
            var queue: [TreeNode] = [root]
            while !queue.isEmpty {
                let node = queue.removeFirst()
                print(node.val)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
        }
    }

    @Suite struct PrintBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "8de90064-4954-47df-b4d2-92c3e2aaf2aa",
             input: "root = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f9ad8729-c5ad-4602-8648-a1f2a5da53c1",
             input: "root = [1,2]",
             expected: "[[\"\",\"1\",\"\"],  [\"2\",\"\",\"\"]]", orderMatters: true),
            TestCaseData(id: "eae12905-4b91-4b6f-8bfc-aada34ce73ff",
             input: "root = [1,null,2]",
             expected: "1\n2", orderMatters: true),
            TestCaseData(id: "571cc010-2e06-485f-895b-aa0fbcc4fd8d",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "1\n2\n4\n8\n9\n5\n3\n6\n10\n7", orderMatters: true),
            TestCaseData(id: "0d0466c9-b3dc-4f7d-bb4a-689aa63486fb",
             input: "root = [1,-2,3,-4,5,-6,7,-8,9,-10]",
             expected: "1\n-2\n-4\n-8\n9\n5\n3\n-6\n-10\n7", orderMatters: true),
            TestCaseData(id: "119a9ffd-54cd-4663-968a-dd2459979a12",
             input: "root = [1,1,1,1,1,1,1,1,1,1]",
             expected: "1\n1\n1\n1\n1\n1\n1\n1\n1\n1", orderMatters: true),
            TestCaseData(id: "a0fdbdc6-de89-4f43-bfc4-807fe5aa67b3",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "1\n2\n4\n8\n9\n5\n10\n11\n3\n6\n12\n13\n7\n14\n15", orderMatters: true),
            TestCaseData(id: "ad57a186-2e4b-454e-bbad-1805ff7bcfba",
             input: "root = [1,null,null]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "84cf92f3-081d-469e-80b5-b33402b986ad",
             input: "root = [1,2,null,null]",
             expected: "1\n2", orderMatters: true),
            TestCaseData(id: "29e38a71-9f99-4b96-8974-2be744af99c5",
             input: "root = [1,2,3,null,null,null,null]",
             expected: "1\n2\n3", orderMatters: true),
            TestCaseData(id: "7fb5c2ee-9825-4b8c-b012-bcf2171b5d62",
             input: "root = [1,2,3,4,5,6,7,8,null,null]",
             expected: "1\n2\n4\n8\n5\n3\n6\n7", orderMatters: true),
            TestCaseData(id: "02e7cc82-6b4e-4e9e-8f12-e089d70be33a",
             input: "root = [1,2,3,4,5,6,7,8,9,null,null]",
             expected: "1\n2\n4\n8\n9\n5\n3\n6\n7", orderMatters: true),
            TestCaseData(id: "7278173e-9531-43a1-9c54-880140032c69",
             input: "root = [1,2,3,4,5,6,7,8,9,10,null,null]",
             expected: "1\n2\n4\n8\n9\n5\n10\n3\n6\n7", orderMatters: true),
            TestCaseData(id: "31de2413-118a-44c1-b1b1-d6905f105cd0",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "1\n2\n3\n4\n5", orderMatters: true),
            TestCaseData(id: "89cd402d-9216-4f7a-950b-107fe4b78a1c",
             input: "root = [1,2,null,3,null,4,null,5]",
             expected: "1\n2\n3\n4\n5", orderMatters: true),
            TestCaseData(id: "5540fbe8-bf95-4aad-a61b-b0f4f9942bd4",
             input: "root = [1,2,3,null,4,null,5,null,6]",
             expected: "1\n2\n4\n6\n3\n5", orderMatters: true),
            TestCaseData(id: "5d64cd25-4b2d-461b-8dd9-c2d296a47ccf",
             input: "root = [1,2,3,4,null,5,null,6]",
             expected: "1\n2\n4\n6\n3\n5", orderMatters: true),
            TestCaseData(id: "151a3156-adec-4578-b6f0-0544d1b6b025",
             input: "root = [1,2,3,4,5,null,6,null,7]",
             expected: "1\n2\n4\n7\n5\n3\n6", orderMatters: true),
            TestCaseData(id: "8938401e-54af-4c65-8f1b-3bd8a0a6451e",
             input: "root = [1,2,3,4,5,6,null,7,null,8]",
             expected: "1\n2\n4\n7\n5\n8\n3\n6", orderMatters: true),
            TestCaseData(id: "cd99ca0e-933d-49b7-9fd1-b952d20923b5",
             input: "root = [1,2,3,4,5,6,7,null,8,null,9]",
             expected: "1\n2\n4\n8\n5\n9\n3\n6\n7", orderMatters: true),
            TestCaseData(id: "2410dcc9-8143-4ee4-babd-ff43cdb731d4",
             input: "root = [1,2,3,4,5,6,7,8,null,9,null,10]",
             expected: "1\n2\n4\n8\n5\n9\n3\n6\n10\n7", orderMatters: true),
            TestCaseData(id: "6b983762-8411-4d63-8d9b-26e50c238ad7",
             input: "root = [1,2,3,4,5,6,7,8,9,null,10,null,11]",
             expected: "1\n2\n4\n8\n9\n5\n10\n3\n6\n11\n7", orderMatters: true),
            TestCaseData(id: "67822ccf-9666-4f70-bee8-44c3ebedae83",
             input: "root = [1,2,3,4,5,6,7,8,9,10,null,11,null,12]",
             expected: "1\n2\n4\n8\n9\n5\n10\n3\n6\n11\n7\n12", orderMatters: true),
            TestCaseData(id: "290b9bf3-d810-41ff-b56a-92acf1d04ea8",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,null,12,null,13]",
             expected: "1\n2\n4\n8\n9\n5\n10\n11\n3\n6\n12\n7\n13", orderMatters: true),
            TestCaseData(id: "9d8f9167-b301-4786-ae41-2e515aab61de",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,null,13,null,14]",
             expected: "1\n2\n4\n8\n14\n9\n5\n10\n11\n3\n6\n12\n7\n13", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "print-binary-tree"
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
            let didCrash = withCrashGuard {
                solution.printTree(p_root)
            }
            guard !didCrash else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = OutputSerializer.serializeVoid()

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
