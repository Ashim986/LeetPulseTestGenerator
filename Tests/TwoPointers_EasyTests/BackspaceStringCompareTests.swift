import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBackspaceStringCompare {
    private class Solution {
        func backspaceCompare(_ s: String, _ t: String) -> Bool {
            let sArray = Array(s), tArray = Array(t)
            var i = sArray.count - 1, j = tArray.count - 1
            var skipS = 0, skipT = 0
            while i >= 0 || j >= 0 {
                while i >= 0 {
                    if sArray[i] == "#" {
                        skipS += 1
                        i -= 1
                    }
                    else if skipS > 0 {
                        skipS -= 1
                        i -= 1
                    }
                    else {
                        break
                    }
                }
                while j >= 0 {
                    if tArray[j] == "#" {
                        skipT += 1
                        j -= 1
                    }
                    else if skipT > 0 {
                        skipT -= 1
                        j -= 1
                    }
                    else {
                        break
                    }
                }
                if i >= 0 && j >= 0 && sArray[i] != tArray[j] {
                    return false
                }
                if (i >= 0) != (j >= 0) {
                    return false
                }
                i -= 1
                j -= 1
            }
            return true
        }
    }

    @Suite struct BackspaceStringCompareTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5855ab3e-b3e2-4efb-914c-b32348f2e940",
             input: "s = \"abc\", t = \"abc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9a48d369-19ff-421e-839e-55f0afc9ed58",
             input: "s = \"abc\", t = \"abcd\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "904a2940-c591-437d-af49-c7b3b0c4a1b9",
             input: "s = \"a##\", t = \"a##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "19a5632f-42bf-40a0-9f7b-5c26d085cde6",
             input: "s = \"a##\", t = \"b##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5cdfd35b-1c2f-4c39-b8e1-2dcf2d144399",
             input: "s = \"a#b\", t = \"a#b\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1528dc53-f4fd-4929-9373-1a29788aa5ca",
             input: "s = \"a#b\", t = \"a#c\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "948ebb82-d415-4038-92d6-849db654ecf7",
             input: "s = \"\", t = \"\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "13564e3d-cdac-4be5-be40-eeca2e8c4cdb",
             input: "s = \"a\", t = \"\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7693253d-1d80-4902-a590-c5e9748059d2",
             input: "s = \"\", t = \"a\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "378da5b3-5e93-4ef5-b3c6-87d6042b3a34",
             input: "s = \"a#\", t = \"a#\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "43c13f18-94ca-4d53-9f2b-1d5ffe6fdcd8",
             input: "s = \"a##b\", t = \"a##b\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4142d57d-33aa-471f-8834-08c203bbb7a7",
             input: "s = \"a##b\", t = \"a##c\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "88f37109-3a5f-456e-9c29-1cde5e95a715",
             input: "s = \"a##b##\", t = \"a##b##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b2a9689b-9faa-44eb-8e76-153a3f635c3f",
             input: "s = \"a##b##\", t = \"a##c##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a7d226ef-28b6-41c7-b79d-ec806ab1371f",
             input: "s = \"abc##\", t = \"abc##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7e942af7-8283-44fc-9970-585cce5d664a",
             input: "s = \"abc#d\", t = \"abc#d\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7386e91d-f9b1-4472-a70b-0a78bb870776",
             input: "s = \"abc#d\", t = \"abc#e\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4b6f9c1c-6ab6-42eb-9346-09492ae4f580",
             input: "s = \"a##b##c##\", t = \"a##b##c##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "470a3da7-6048-44be-b79f-c50d49a1cd82",
             input: "s = \"a##b##c##\", t = \"a##b##d##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a431c582-40de-4143-a9ed-86a9e4f2c345",
             input: "s = \"a##b##c##d##\", t = \"a##b##c##d##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "dfb731cc-aada-4682-a5f7-f5d260b7c83f",
             input: "s = \"a##b##c##d##\", t = \"a##b##c##e##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e42e1248-e5e3-418d-a979-599aa9eec0f2",
             input: "s = \"a##b##c##d##e##\", t = \"a##b##c##d##e##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d06e7437-5ed7-4cd6-8111-7e87cf9337a0",
             input: "s = \"a##b##c##d##e##\", t = \"a##b##c##d##f##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4bd870d3-5633-4428-9da0-5123723ad81a",
             input: "s = \"a##b##c##d##e##f##\", t = \"a##b##c##d##e##f##\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c348f431-cbf1-45f6-b66e-a3f4deaca63e",
             input: "s = \"a##b##c##d##e##f##\", t = \"a##b##c##d##e##g##\"",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "backspace-string-compare"
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
            let p_t = InputParser.parseString(params[1])
            guard p_t.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: t string too long (\(p_t.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length, t.length <= 200"
                )
                return
            }
            guard p_t.count >= 1 && p_t.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length, t.length <= 200"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.backspaceCompare(p_s, p_t)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
