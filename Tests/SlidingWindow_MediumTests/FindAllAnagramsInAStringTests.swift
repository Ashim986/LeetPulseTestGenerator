import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindAllAnagramsInAString {
    private class Solution {
        func findAnagrams(_ s: String, _ p: String) -> [Int] {
            if s.count < p.count { return [] }
            let sChars = Array(s), pChars = Array(p)
            var pCount = [Character: Int]()
            var sCount = [Character: Int]()
            for c in pChars { pCount[c, default: 0] += 1 }
            var result: [Int] = []
            for i in 0..<sChars.count {
                sCount[sChars[i], default: 0] += 1
                if i >= pChars.count {
                    let c = sChars[i - pChars.count]
                    if sCount[c] == 1 { sCount.removeValue(forKey: c) }
                    else { sCount[c, default: 0] -= 1 }
                }
                if sCount == pCount { result.append(i - pChars.count + 1) }
            }
            return result
        }
    }

    @Suite struct FindAllAnagramsInAStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "E8ED6B86-8230-4D37-A39F-A1D01F7F7191",
             input: "cbaebabacd\nabc",
             expected: "[0,6]", orderMatters: false),
            TestCaseData(id: "3307705A-0CEC-4648-A649-8A007D1CDE8B",
             input: "abab\nab",
             expected: "[0,1,2]", orderMatters: false),
            TestCaseData(id: "F551F7A1-C959-4503-8022-6CC04BDEB960",
             input: "aaaa\naa",
             expected: "[0,1,2]", orderMatters: false),
            TestCaseData(id: "1E3AEAE9-4067-41A1-965B-BCA6DD367D8B",
             input: "a\na",
             expected: "[0]", orderMatters: false),
            TestCaseData(id: "DB94DB9A-419E-4605-834D-0321A2621CA1",
             input: "abcdef\nxyz",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "4111D426-3BEE-4302-885F-9D3AB1A83329",
             input: "aaa\naa",
             expected: "[0,1]", orderMatters: false),
            TestCaseData(id: "A204AF03-500A-4936-83B6-FF4827D87DCE",
             input: "bac\nabc",
             expected: "[0]", orderMatters: false),
            TestCaseData(id: "7E2DB343-3610-4822-A798-5E4051A86819",
             input: "abcdef\nabcdef",
             expected: "[0]", orderMatters: false),
            TestCaseData(id: "5991F5CC-90F5-4327-805F-AFC4B53F8531",
             input: "aaaaaa\naaaaa",
             expected: "[0,1]", orderMatters: false),
            TestCaseData(id: "A7BCC4AB-95C6-4CD7-9B7A-CD5C57D1A98F",
             input: "aaaaaa\naaaa",
             expected: "[0,1,2]", orderMatters: false),
            TestCaseData(id: "E87BFDB8-56EB-4D47-AFBB-B13851361435",
             input: "aaaaaaa\naaa",
             expected: "[0,1,2,3,4]", orderMatters: false),
            TestCaseData(id: "169F1215-9EAD-4576-8B20-D72CE335D638",
             input: "def\nabc",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "F1FCAD18-98B8-4C60-B0D2-609D92621BC5",
             input: "aabac\nabc",
             expected: "[2]", orderMatters: false),
            TestCaseData(id: "EE3018ED-0586-4FD3-A060-725DF3229A9A",
             input: "aaaaaa\na",
             expected: "[0,1,2,3,4,5]", orderMatters: false),
            TestCaseData(id: "2EA3101C-378F-4F9A-A3AF-B1E184EB18CD",
             input: "aaaaaa\naa",
             expected: "[0,1,2,3,4]", orderMatters: false),
            TestCaseData(id: "43323990-7242-4C58-B204-6330B5F5A691",
             input: "b",
             expected: "[1]", orderMatters: false),
            TestCaseData(id: "CD973BB7-5AC5-4BBD-8263-C8D8AC606CA8",
             input: "abcdef\nbca",
             expected: "[0]", orderMatters: false),
            TestCaseData(id: "662EC637-7FED-4102-AA4D-6E52F63A06B8",
             input: "bba\nab",
             expected: "[1]", orderMatters: false),
            TestCaseData(id: "3024F526-8875-4DBF-807F-526AA4C182C3",
             input: "abcdabc\nabc",
             expected: "[0,4]", orderMatters: false),
            TestCaseData(id: "1443373B-9D5A-4808-9414-AC5F7B92B48C",
             input: "acac\naca",
             expected: "[0]", orderMatters: false),
            TestCaseData(id: "2CE0E2E6-303E-496E-904B-3E448DF16527",
             input: "abcabcabc\nabc",
             expected: "[0,1,2,3,4,5,6]", orderMatters: false),
            TestCaseData(id: "D6CFC233-EA27-4255-8B43-A8B9DF8527E5",
             input: "abcdabcde\nabc",
             expected: "[0,4]", orderMatters: false),
            TestCaseData(id: "B3EC4705-1E14-4D4A-B082-91CFCE168F0D",
             input: "abcdabcdabcd\nabcd",
             expected: "[0,1,2,3,4,5,6,7,8]", orderMatters: false),
            TestCaseData(id: "AAB2EC11-7945-4D28-B701-E760C9360993",
             input: "abc",
             expected: "[1,2,3]", orderMatters: false),
            TestCaseData(id: "7AE039E7-8E90-4E10-BF2F-82647A3DBEEF",
             input: "def",
             expected: "[1,2,3]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-all-anagrams-in-a-string"
            let topic = "sliding-window"
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
            let p_p = InputParser.parseString(params[1])
            guard p_p.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: p string too long (\(p_p.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length, p.length <= 3 * 104"
                )
                return
            }
            guard p_p.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length, p.length <= 3 * 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.findAnagrams(p_s, p_p)
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
