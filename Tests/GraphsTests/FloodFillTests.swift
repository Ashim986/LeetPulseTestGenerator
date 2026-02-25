import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var image = image
        let original = image[sr][sc]
        if original == color { return image }
        func dfs(_ r: Int, _ c: Int) {
            if r < 0 || r >= image.count || c < 0 || c >= image[0].count { return }
            if image[r][c] != original { return }
            image[r][c] = color
            dfs(r+1, c); dfs(r-1, c); dfs(r, c+1); dfs(r, c-1)
        }
        dfs(sr, sc)
        return image
    }
}

@Suite struct FloodFillTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "6425dcea-fa4e-428a-8ec8-067b71ce3334"
        let rawInput = "image = [[0]], sr = 0, sc = 0, color = 1"
        let expectedOutput = "[[1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "7733acb6-49ff-4bad-888e-9b6dd5159df0"
        let rawInput = "image = [[1,1,1],[1,1,1],[1,1,1]], sr = 1, sc = 1, color = 2"
        let expectedOutput = "[[2,2,2],[2,2,2],[2,2,2]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "b716f8b2-99ed-4bab-9c55-de89fd25a7ab"
        let rawInput = "image = [[0,0,0],[0,0,0],[0,0,0]], sr = 0, sc = 0, color = 0"
        let expectedOutput = "[[0,0,0],[0,0,0],[0,0,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "2c7889d7-e394-4898-969b-604e868aa272"
        let rawInput = "image = [[1,1],[1,1]], sr = 0, sc = 0, color = 1"
        let expectedOutput = "[[1,1],[1,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "041dcde4-da21-4df3-bbf1-6f4df74fd1dd"
        let rawInput = "image = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]], sr = 2, sc = 2, color = 2"
        let expectedOutput = "[[2,2,2,2],[2,2,2,2],[2,2,2,2],[2,2,2,2]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "59504c9b-6583-4b3e-aa9b-ebbf16f5d4d8"
        let rawInput = "image = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]], sr = 0, sc = 0, color = 1"
        let expectedOutput = "[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "4578fbf1-88cf-40e1-b44f-86500d7b8e6a"
        let rawInput = "image = [[1,0],[0,1]], sr = 0, sc = 0, color = 2"
        let expectedOutput = "[[2,0],[0,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "13088d79-6fe5-4272-9408-445cab491aed"
        let rawInput = "image = [[1,1,1],[1,0,1],[1,1,1]], sr = 1, sc = 0, color = 2"
        let expectedOutput = "[[2,2,2],[2,0,2],[2,2,2]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "77ff158f-9fc6-462f-b44a-01c92fd24444"
        let rawInput = "image = [[0,0],[0,0]], sr = 0, sc = 0, color = 0"
        let expectedOutput = "[[0,0],[0,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "0c015f22-5e65-4c23-89d0-f89b8f5807fc"
        let rawInput = "image = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]], sr = 2, sc = 2, color = 2"
        let expectedOutput = "[[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "7c927a82-eec2-4071-8a82-7e41621e7bed"
        let rawInput = "image = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]], sr = 0, sc = 0, color = 1"
        let expectedOutput = "[[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "5264bd0b-fedc-4797-a830-daa7710fca2c"
        let rawInput = "image = [[1,0,0],[0,1,0],[0,0,1]], sr = 0, sc = 0, color = 2"
        let expectedOutput = "[[2,0,0],[0,1,0],[0,0,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "167e321a-6b19-47bc-b835-2333e33292a8"
        let rawInput = "image = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]], sr = 0, sc = 0, color = 2"
        let expectedOutput = "[[2,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "a850014c-7e33-4f95-b2d7-c0c0ba7f9064"
        let rawInput = "image = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]], sr = 0, sc = 0, color = 2"
        let expectedOutput = "[[2,2,2,2],[2,2,2,2],[2,2,2,2],[2,2,2,2]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "f4a6285f-1b3c-4886-9c84-24d0d40cbe58"
        let rawInput = "image = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]], sr = 3, sc = 3, color = 1"
        let expectedOutput = "[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "3a7ed5ed-d556-4b7b-a6e7-ec9d26589769"
        let rawInput = "image = [[1,0,1],[0,1,0],[1,0,1]], sr = 1, sc = 1, color = 2"
        let expectedOutput = "[[1,0,1],[0,2,0],[1,0,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "ecc8f83f-834e-435a-a1fc-49f82c10e809"
        let rawInput = "image = [[0,1,0],[1,0,1],[0,1,0]], sr = 1, sc = 1, color = 2"
        let expectedOutput = "[[0,1,0],[1,2,1],[0,1,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "23295364-5c66-4ce0-832e-9b0f0a65afbd"
        let rawInput = "image = [[1,1,1],[0,0,0],[1,1,1]], sr = 0, sc = 0, color = 2"
        let expectedOutput = "[[2,2,2],[0,0,0],[1,1,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "440d36b8-aeb7-4f2f-b9e6-b50a788b845e"
        let rawInput = "image = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]], sr = 3, sc = 3, color = 2"
        let expectedOutput = "[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,2]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "0bd77604-faaf-4068-9bd4-46f914efe0f1"
        let rawInput = "image = [[1,1,1],[1,1,1],[1,1,1]], sr = 0, sc = 0, color = 1"
        let expectedOutput = "[[1,1,1],[1,1,1],[1,1,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "fb5eee97-9f9b-4153-9290-c20bbdf7ea92"
        let rawInput = "image = [[1,0,1],[0,1,0],[1,0,1]], sr = 0, sc = 0, color = 2"
        let expectedOutput = "[[2,0,1],[0,1,0],[1,0,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "36325e5d-f4d6-4992-b2fb-5913cb286eb2"
        let rawInput = "image = [[0,1,0,0],[0,1,0,0],[0,1,0,0],[0,1,0,0]], sr = 0, sc = 1, color = 2"
        let expectedOutput = "[[0,2,0,0],[0,2,0,0],[0,2,0,0],[0,2,0,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "d474f171-a9ec-4210-9685-a77bdb43bdd4"
        let rawInput = "image = [[1,1,1],[1,1,1],[1,1,1]], sr = 1, sc = 0, color = 1"
        let expectedOutput = "[[1,1,1],[1,1,1],[1,1,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "9d66019e-f4ec-4be6-964a-6ab5482a3c18"
        let rawInput = "image = [[1,0,0],[0,1,0],[0,0,1]], sr = 2, sc = 2, color = 2"
        let expectedOutput = "[[1,0,0],[0,1,0],[0,0,2]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "flood-fill"
        let topic = "graphs"
        let testId = "cfc5a260-5196-4fd8-8225-5680522912bf"
        let rawInput = "image = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]], sr = 1, sc = 1, color = 1"
        let expectedOutput = "[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_image = InputParser.parse2DIntArray(params[0])
        guard p_image.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))")
            return
        }
        let p_sr = InputParser.parseInt(params[1])
        let p_sc = InputParser.parseInt(params[2])
        let p_color = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
