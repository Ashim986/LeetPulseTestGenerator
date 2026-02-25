import Foundation
import Testing
@testable import LeetCodeHelpers

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

    @Test func test_0() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "8de90064-4954-47df-b4d2-92c3e2aaf2aa"
        let rawInput = "root = [1]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "f9ad8729-c5ad-4602-8648-a1f2a5da53c1"
        let rawInput = "root = [1,2]"
        let expectedOutput = "[[\"\",\"1\",\"\"],  [\"2\",\"\",\"\"]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "eae12905-4b91-4b6f-8bfc-aada34ce73ff"
        let rawInput = "root = [1,null,2]"
        let expectedOutput = "1\n2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "571cc010-2e06-485f-895b-aa0fbcc4fd8d"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10]"
        let expectedOutput = "1\n2\n4\n8\n9\n5\n3\n6\n10\n7"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "0d0466c9-b3dc-4f7d-bb4a-689aa63486fb"
        let rawInput = "root = [1,-2,3,-4,5,-6,7,-8,9,-10]"
        let expectedOutput = "1\n-2\n-4\n-8\n9\n5\n3\n-6\n-10\n7"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "119a9ffd-54cd-4663-968a-dd2459979a12"
        let rawInput = "root = [1,1,1,1,1,1,1,1,1,1]"
        let expectedOutput = "1\n1\n1\n1\n1\n1\n1\n1\n1\n1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "a0fdbdc6-de89-4f43-bfc4-807fe5aa67b3"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]"
        let expectedOutput = "1\n2\n4\n8\n9\n5\n10\n11\n3\n6\n12\n13\n7\n14\n15"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "ad57a186-2e4b-454e-bbad-1805ff7bcfba"
        let rawInput = "root = [1,null,null]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "84cf92f3-081d-469e-80b5-b33402b986ad"
        let rawInput = "root = [1,2,null,null]"
        let expectedOutput = "1\n2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "29e38a71-9f99-4b96-8974-2be744af99c5"
        let rawInput = "root = [1,2,3,null,null,null,null]"
        let expectedOutput = "1\n2\n3"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "7fb5c2ee-9825-4b8c-b012-bcf2171b5d62"
        let rawInput = "root = [1,2,3,4,5,6,7,8,null,null]"
        let expectedOutput = "1\n2\n4\n8\n5\n3\n6\n7"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "02e7cc82-6b4e-4e9e-8f12-e089d70be33a"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,null,null]"
        let expectedOutput = "1\n2\n4\n8\n9\n5\n3\n6\n7"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "7278173e-9531-43a1-9c54-880140032c69"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,null,null]"
        let expectedOutput = "1\n2\n4\n8\n9\n5\n10\n3\n6\n7"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "31de2413-118a-44c1-b1b1-d6905f105cd0"
        let rawInput = "root = [1,null,2,null,3,null,4,null,5]"
        let expectedOutput = "1\n2\n3\n4\n5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "89cd402d-9216-4f7a-950b-107fe4b78a1c"
        let rawInput = "root = [1,2,null,3,null,4,null,5]"
        let expectedOutput = "1\n2\n3\n4\n5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "5540fbe8-bf95-4aad-a61b-b0f4f9942bd4"
        let rawInput = "root = [1,2,3,null,4,null,5,null,6]"
        let expectedOutput = "1\n2\n4\n6\n3\n5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "5d64cd25-4b2d-461b-8dd9-c2d296a47ccf"
        let rawInput = "root = [1,2,3,4,null,5,null,6]"
        let expectedOutput = "1\n2\n4\n6\n3\n5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "151a3156-adec-4578-b6f0-0544d1b6b025"
        let rawInput = "root = [1,2,3,4,5,null,6,null,7]"
        let expectedOutput = "1\n2\n4\n7\n5\n3\n6"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "8938401e-54af-4c65-8f1b-3bd8a0a6451e"
        let rawInput = "root = [1,2,3,4,5,6,null,7,null,8]"
        let expectedOutput = "1\n2\n4\n7\n5\n8\n3\n6"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "cd99ca0e-933d-49b7-9fd1-b952d20923b5"
        let rawInput = "root = [1,2,3,4,5,6,7,null,8,null,9]"
        let expectedOutput = "1\n2\n4\n8\n5\n9\n3\n6\n7"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "2410dcc9-8143-4ee4-babd-ff43cdb731d4"
        let rawInput = "root = [1,2,3,4,5,6,7,8,null,9,null,10]"
        let expectedOutput = "1\n2\n4\n8\n5\n9\n3\n6\n10\n7"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "6b983762-8411-4d63-8d9b-26e50c238ad7"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,null,10,null,11]"
        let expectedOutput = "1\n2\n4\n8\n9\n5\n10\n3\n6\n11\n7"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "67822ccf-9666-4f70-bee8-44c3ebedae83"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,null,11,null,12]"
        let expectedOutput = "1\n2\n4\n8\n9\n5\n10\n3\n6\n11\n7\n12"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "290b9bf3-d810-41ff-b56a-92acf1d04ea8"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,null,12,null,13]"
        let expectedOutput = "1\n2\n4\n8\n9\n5\n10\n11\n3\n6\n12\n7\n13"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "print-binary-tree"
        let topic = "trees"
        let testId = "9d8f9167-b301-4786-ae41-2e515aab61de"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,null,13,null,14]"
        let expectedOutput = "1\n2\n4\n8\n14\n9\n5\n10\n11\n3\n6\n12\n7\n13"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.printTree(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
