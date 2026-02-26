import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCVideoStitching {
    private class Solution {
        func videoStitching(_ clips: [[Int]], _ T: Int) -> Int {
            var result = 0
            var last = 0
            var far = 0
            var i = 0
            let n = clips.count
            while i < n && clips[i][0] <= last {
                far = max(far, clips[i][1])
                i += 1
            }
            if last == far {
                return -1
            }
            result += 1
            last = far
            while i < n {
                var j = i
                while j < n && clips[j][0] <= last {
                    far = max(far, clips[j][1])
                    j += 1
                }
                if last == far {
                    return -1
                }
                result += 1
                last = far
                i = j
            }
            return last < T ? -1 : result
        }
    }

    @Suite struct VideoStitchingTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3734a5a7-6e62-48a5-8d3a-ec3e71cfc863",
             input: "clips = [[0,1],[1,2]], T = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7b2bedbd-5818-494e-bdd9-ae6eeab976c1",
             input: "clips = [[0,2],[2,4]], T = 4",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7d9f8e61-3db4-46d1-bc8f-ad40f8c2830e",
             input: "clips = [[0,1],[2,3]], T = 3",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "bbc5e5b0-19d2-4012-acf4-a17f6f752326",
             input: "clips = [[0,5]], T = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "00d175ea-19f9-4339-aea5-4ba31af52ee4",
             input: "clips = [[0,1],[1,2],[2,3]], T = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "61ab54c6-b50a-40cf-a70e-b302613ada7b",
             input: "clips = [[1,2],[3,4],[5,6]], T = 6",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "3e120aeb-d57d-4866-8e29-1b6168c48e7d",
             input: "clips = [[0,10]], T = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c5faa286-bd62-471f-beae-60d00bbd78e6",
             input: "clips = [[0,1],[0,1],[0,1]], T = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bd13b399-ef83-439f-a371-573eb3598c31",
             input: "clips = [[0,1],[2,3],[4,5]], T = 5",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "73fb8d1a-667e-4ee8-bd5a-9a91f274bcd6",
             input: "clips = [[0,10],[0,10],[0,10]], T = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "31d61696-87f3-41bf-a17f-9f4ce6dded6b",
             input: "clips = [[0,100]], T = 100",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f02ae084-dbdf-4136-be27-47f0f8fa74f9",
             input: "clips = [[0,1],[1,2],[2,3],[3,4]], T = 4",
             expected: "4", orderMatters: true),
            TestCaseData(id: "e74588ac-b79a-4a68-b1e5-de058cba43c6",
             input: "clips = [[0,1],[2,3],[4,5],[6,7]], T = 7",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "3ce44af1-08ea-4228-bd56-e639b5f1afc8",
             input: "clips = [[0,1],[1,2],[2,3],[3,4],[4,5]], T = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "cc3cfea9-a9c1-4a78-87d4-7eb801081617",
             input: "clips = [[0,1],[2,3],[4,5],[6,7],[8,9]], T = 9",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "52eb6056-818e-4af8-ac65-cdc811653b16",
             input: "clips = [[0,1000]], T = 1000",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cebfd2c6-6624-485c-8293-f747c814d866",
             input: "clips = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6]], T = 6",
             expected: "6", orderMatters: true),
            TestCaseData(id: "81f26795-645e-42c9-a862-2513516c9b1d",
             input: "clips = [[0,1],[2,3],[4,5],[6,7],[8,9],[10,11]], T = 11",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "1cf61843-7d02-4b85-921a-5a667ea9fd68",
             input: "clips = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]], T = 7",
             expected: "7", orderMatters: true),
            TestCaseData(id: "4801c012-103f-4b91-92c6-4bd535aae907",
             input: "clips = [[0,1],[2,3],[4,5],[6,7],[8,9],[10,11],[12,13]], T = 13",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "47b23016-2b9d-4422-8a8e-ef75acf98e45",
             input: "clips = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8]], T = 8",
             expected: "8", orderMatters: true),
            TestCaseData(id: "3e84234b-5208-4407-b826-625e9efe51b7",
             input: "clips = [[0,1],[2,3],[4,5],[6,7],[8,9],[10,11],[12,13],[14,15]], T = 15",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "c23f2d77-77f3-44dd-9d96-4d952765adfd",
             input: "clips = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9]], T = 9",
             expected: "9", orderMatters: true),
            TestCaseData(id: "805ae31f-097a-4820-ba0e-fda5b1260bb5",
             input: "clips = [[0,1],[2,3],[4,5],[6,7],[8,9],[10,11],[12,13],[14,15],[16,17]], T = 17",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "24783a27-0d37-4a32-a7a0-315f6144b976",
             input: "clips = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10]], T = 10",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "video-stitching"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_clips = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_clips.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: clips 2D array too large (\(p_clips.count))"
                )
                return
            }
            guard let p_T = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_clips.count >= 1 && p_clips.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= clips.length <= 100"
                )
                return
            }
            guard p_T >= 0 && p_T <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= starti <= endi <= 100"
                )
                return
            }

            let solution = Solution()
            let result = solution.videoStitching(p_clips, p_T)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
