import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCShortestDistanceToACharacter {
    private class Solution {
        func shortestToChar(_ s: String, _ c: Character) -> [Int] {
            let chars = Array(s)
            var res = Array(repeating: Int.max, count: chars.count)
            var lastSeen = -Int.max

            // pass 1: from left to right
            for i in 0..<chars.count {
                if chars[i] == c {
                    lastSeen = i
                }
                if lastSeen != -Int.max {
                    res[i] = min(res[i], abs(i - lastSeen))
                }
            }

            // pass 2: from right to left
            lastSeen = Int.max
            for i in stride(from: chars.count - 1, through: 0, by: -1) {
                if chars[i] == c {
                    lastSeen = i
                }
                if lastSeen != Int.max {
                    res[i] = min(res[i], abs(i - lastSeen))
                }
            }

            return res
        }
    }

    @Suite struct ShortestDistanceToACharacterTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c2a8c873-20c6-41fa-a0e6-1169f7311f56",
             input: "s = \"a\", c = 'a'",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "e05b284c-b591-4434-af5a-2af9a7f9db30",
             input: "s = \"\", c = 'a'",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "738f1974-dc6f-4f2c-9172-0871a805c7c0",
             input: "s = \"ab\", c = 'a'",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "184812cf-f8d0-4bb7-9c34-7d2626f45f5b",
             input: "s = \"ab\", c = 'b'",
             expected: "[1,0]", orderMatters: true),
            TestCaseData(id: "39adc61b-86cf-436e-a9c2-d52f721d04c8",
             input: "s = \"abc\", c = 'b'",
             expected: "[1,0,1]", orderMatters: true),
            TestCaseData(id: "31c1cd5f-48d3-4cdb-af1b-af5938744913",
             input: "s = \"aaa\", c = 'a'",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "300fd455-71b8-469c-a4b3-1fc753f705db",
             input: "s = \"aba\", c = 'a'",
             expected: "[0,1,0]", orderMatters: true),
            TestCaseData(id: "a73c18f0-e397-4808-85b9-3674d695b2f5",
             input: "s = \"abab\", c = 'a'",
             expected: "[0,1,0,1]", orderMatters: true),
            TestCaseData(id: "27366e45-7cbf-4490-b813-d24077cf5375",
             input: "s = \"abcabc\", c = 'a'",
             expected: "[0,1,2,1,0,1]", orderMatters: true),
            TestCaseData(id: "199c1ee3-3ea1-44f4-829b-fc8fb8d52546",
             input: "s = \"aaaa\", c = 'a'",
             expected: "[0,0,0,0]", orderMatters: true),
            TestCaseData(id: "1afd5c07-cb25-46b0-bcc4-7903b352d004",
             input: "s = \"aaaaa\", c = 'a'",
             expected: "[0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "3d99950a-530f-439b-9ee8-944f3ed2713e",
             input: "s = \"ababab\", c = 'a'",
             expected: "[0,1,0,1,0,1]", orderMatters: true),
            TestCaseData(id: "b877f112-98b6-4974-8ed9-f63b2063ab72",
             input: "s = \"abababa\", c = 'a'",
             expected: "[0,1,0,1,0,1,0]", orderMatters: true),
            TestCaseData(id: "0e45a8a1-b8f5-4cb4-850e-57d1ccf26d7f",
             input: "s = \"abababab\", c = 'a'",
             expected: "[0,1,0,1,0,1,0,1]", orderMatters: true),
            TestCaseData(id: "f77b957b-6a39-428c-80a6-75b0d8dae620",
             input: "s = \"abcde\", c = 'c'",
             expected: "[2,1,0,1,2]", orderMatters: true),
            TestCaseData(id: "67a1ea29-bc0e-4fa8-a13d-90976b617e2b",
             input: "s = \"abcde\", c = 'e'",
             expected: "[4,3,2,1,0]", orderMatters: true),
            TestCaseData(id: "8ae67d3b-64a6-41c1-82ce-1dac502351ce",
             input: "s = \"abcde\", c = 'a'",
             expected: "[0,1,2,3,4]", orderMatters: true),
            TestCaseData(id: "a29f8c88-88cf-4a7b-abc5-160eb026a458",
             input: "s = \"abcde\", c = 'b'",
             expected: "[1,0,1,2,3]", orderMatters: true),
            TestCaseData(id: "bb1e4da1-8271-49df-83ae-3337ee49c3b7",
             input: "s = \"abcde\", c = 'd'",
             expected: "[3,2,1,0,1]", orderMatters: true),
            TestCaseData(id: "0abb8ce1-0aff-483e-9e84-872799694073",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", c = 'a'",
             expected: "[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]", orderMatters: true),
            TestCaseData(id: "c16c9fe7-0d1e-4a02-8a3e-9ad81d1c2d66",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", c = 'z'",
             expected: "[25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0]", orderMatters: true),
            TestCaseData(id: "c11df6bc-6e8c-4d3c-8580-20597f243422",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", c = 'm'",
             expected: "[12,11,10,9,8,7,6,5,4,3,2,1,0,1,2,3,4,5,6,7,8,9,10,11,12,13]", orderMatters: true),
            TestCaseData(id: "7505de26-7736-4d85-8d34-81c75f43ffd3",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", c = 'n'",
             expected: "[13,12,11,10,9,8,7,6,5,4,3,2,1,0,1,2,3,4,5,6,7,8,9,10,11,12]", orderMatters: true),
            TestCaseData(id: "40a06d5a-81f0-48a7-b364-dd541c321334",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", c = 'x'",
             expected: "[23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,1,2]", orderMatters: true),
            TestCaseData(id: "6d83b6b0-0018-4b50-8bb4-b9fbc568253e",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", c = 'y'",
             expected: "[24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "shortest-distance-to-a-character"
            let topic = "two-pointers"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }
            guard let p_c = InputParser.parseCharacter(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Character"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.shortestToChar(p_s, p_c)
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
