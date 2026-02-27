import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindSmallestLetterGreaterThanTarget {
    private class Solution {
        func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
            let n = letters.count
            var left = 0
            var right = n
            while left < right {
                let mid = left + (right - left) / 2
                if letters[mid] <= target {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left == n ? letters[0] : letters[left]
        }
    }

    @Suite struct FindSmallestLetterGreaterThanTargetTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "69f1d70c-d20f-4816-b88e-08a0e2d94ac7",
             input: "letters = [\"a\"], target = \"b\"",
             expected: "\"a\"", orderMatters: true),
            TestCaseData(id: "5e9800e4-c1b9-4721-bf69-17a945f16250",
             input: "letters = [\"a\",\"b\"], target = \"c\"",
             expected: "\"a\"", orderMatters: true),
            TestCaseData(id: "cfb8996d-d257-4966-8eb1-e9bd193c7b8c",
             input: "letters = [\"b\",\"c\"], target = \"a\"",
             expected: "\"b\"", orderMatters: true),
            TestCaseData(id: "2ea96b61-5073-4a8e-97df-ce403896ba8d",
             input: "letters = [\"z\"], target = \"a\"",
             expected: "\"z\"", orderMatters: true),
            TestCaseData(id: "c3de5ef8-edf6-4435-9771-ecbe4d055e0a",
             input: "letters = [\"a\",\"a\"], target = \"b\"",
             expected: "\"a\"", orderMatters: true),
            TestCaseData(id: "d4539be4-edc3-471c-9844-c1b222859245",
             input: "letters = [\"a\",\"b\",\"c\"], target = \"d\"",
             expected: "\"a\"", orderMatters: true),
            TestCaseData(id: "c901f89a-5881-40e6-a652-ab67890a5349",
             input: "letters = [\"c\",\"d\",\"e\"], target = \"b\"",
             expected: "\"c\"", orderMatters: true),
            TestCaseData(id: "91a49635-f781-4afb-a7ba-09961afaa9e7",
             input: "letters = [\"z\",\"a\"], target = \"y\"",
             expected: "\"z\"", orderMatters: true),
            TestCaseData(id: "b773b28e-6852-4901-a98d-878de5f0d728",
             input: "letters = [\"a\",\"z\"], target = \"y\"",
             expected: "\"a\"", orderMatters: true),
            TestCaseData(id: "685d7bd2-4819-48eb-94f7-ae7bd9e82b3b",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"a\"",
             expected: "\"b\"", orderMatters: true),
            TestCaseData(id: "a0e7224b-1cfb-4224-b185-fdef42b0502c",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"z\"",
             expected: "\"a\"", orderMatters: true),
            TestCaseData(id: "1e797d3e-3f38-414a-a8e9-7c56cda80e86",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"m\"",
             expected: "\"n\"", orderMatters: true),
            TestCaseData(id: "c5dac4ff-7ce6-4a00-94c2-e351d3bb799e",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"n\"",
             expected: "\"o\"", orderMatters: true),
            TestCaseData(id: "9015c7da-3055-4623-b91a-4025c79a505e",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"p\"",
             expected: "\"q\"", orderMatters: true),
            TestCaseData(id: "61d7356c-dfe7-4e8d-a708-d47b6779d8f2",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"q\"",
             expected: "\"r\"", orderMatters: true),
            TestCaseData(id: "825e3bc1-ed0c-4703-833b-5f4a45ac14f4",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"r\"",
             expected: "\"s\"", orderMatters: true),
            TestCaseData(id: "520bff3e-25ba-4238-93a8-bdf7ea136882",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"s\"",
             expected: "\"t\"", orderMatters: true),
            TestCaseData(id: "31e85f0b-98f1-4c0a-bf9b-6606d5c30bb3",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"t\"",
             expected: "\"u\"", orderMatters: true),
            TestCaseData(id: "8ec75eef-1c10-4dd9-9cdc-2cae4e1ae7c8",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"u\"",
             expected: "\"v\"", orderMatters: true),
            TestCaseData(id: "b483c0c5-763c-4d18-9b66-7888c2745c4a",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"v\"",
             expected: "\"w\"", orderMatters: true),
            TestCaseData(id: "672257d9-f706-42f8-baba-d95e9b264245",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"w\"",
             expected: "\"x\"", orderMatters: true),
            TestCaseData(id: "fda29571-b7b7-4c23-a925-4ad6f2896071",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"x\"",
             expected: "\"y\"", orderMatters: true),
            TestCaseData(id: "ddd8884d-0be6-4ad5-843c-bda0e5d24ec8",
             input: "letters = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\""
                + ",\"v\",\"w\",\"x\",\"y\",\"z\"], target = \"A\"",
             expected: "\"a\"", orderMatters: true),
            TestCaseData(id: "e04fbd66-26ca-486b-9fa4-750a1124be5e",
             input: "letters = [\"a\",\"b\",\"c\"], target = \"b\"",
             expected: "\"c\"", orderMatters: true),
            TestCaseData(id: "f5e587fa-d825-42c7-a352-86970a3fcb7b",
             input: "letters = [\"a\",\"b\",\"c\"], target = \"c\"",
             expected: "\"a\"", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-smallest-letter-greater-than-target"
            let topic = "binary-search"
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

            guard let p_letters = InputParser.parseCharacterArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Character]"
                )
                return
            }
            guard p_letters.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: letters array too large (\(p_letters.count))"
                )
                return
            }
            guard let p_target = InputParser.parseCharacter(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Character"
                )
                return
            }

            // Constraint precondition checks
            guard p_letters.count >= 2 && p_letters.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= letters.length <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Character?
            let didCrash = withCrashGuard {
                resultHolder = solution.nextGreatestLetter(p_letters, p_target)
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
