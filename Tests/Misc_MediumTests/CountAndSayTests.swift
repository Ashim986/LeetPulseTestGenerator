import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCountAndSay {
    private class Solution {
        func countAndSay(_ n: Int) -> String {
            var result = Array("1".utf8)
            for _ in 1..<n {
                var temp = Array<UInt8>(repeating: 0, count: result.count * 2)
                var i = 0, j = 0
                while i < result.count {
                    var count = 1
                    while i + 1 < result.count && result[i] == result[i + 1] {
                        i += 1
                        count += 1
                    }
                    temp[j] = UInt8(String(count).utf8.first.unsafelyUnwrapped)
                    j += 1
                    temp[j] = result[i]
                    j += 1
                    i += 1
                }
                result = Array(temp[0..<j])
            }
            return String(bytes: result, encoding: .utf8).unsafelyUnwrapped
        }
    }

    @Suite struct CountAndSayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "446af79d-491d-4c66-9142-cbf702298ac6",
             input: "n = 1",
             expected: "\"1\"", orderMatters: true),
            TestCaseData(id: "3aa953f4-bffe-4366-a048-dbb81bb7f04d",
             input: "n = 2",
             expected: "\"11\"", orderMatters: true),
            TestCaseData(id: "0d858b93-595b-4168-a1a8-839055af817f",
             input: "n = 3",
             expected: "\"21\"", orderMatters: true),
            TestCaseData(id: "c233023f-f96f-47dc-9fde-3be232d6cda5",
             input: "n = 4",
             expected: "\"1211\"", orderMatters: true),
            TestCaseData(id: "ca8ba03b-97da-4ea1-b727-1ba9a321d4d8",
             input: "n = 5",
             expected: "\"111221\"", orderMatters: true),
            TestCaseData(id: "5dd503eb-cfa5-440f-9f19-389b5cf817dc",
             input: "n = 6",
             expected: "\"312211\"", orderMatters: true),
            TestCaseData(id: "e7999d10-17fc-4664-a97e-223a7dd3c599",
             input: "n = 7",
             expected: "\"13112221\"", orderMatters: true),
            TestCaseData(id: "4965185f-02c3-4d3f-9f65-d21776785203",
             input: "n = 8",
             expected: "\"1113213211\"", orderMatters: true),
            TestCaseData(id: "68a62ddb-0281-4d47-8dba-1ba4bcb1efd2",
             input: "n = 9",
             expected: "\"31131211131221\"", orderMatters: true),
            TestCaseData(id: "e1501f0d-1978-4a96-91bc-26e43186316a",
             input: "n = 10",
             expected: "\"13211311123113112211\"", orderMatters: true),
            TestCaseData(id: "3a4ff478-0a91-4f68-b459-805094d5a1fe",
             input: "n = 11",
             expected: "\"11131221133112132113212221\"", orderMatters: true),
            TestCaseData(id: "0f50310e-9f1a-41e2-bc3a-3184326ce76f",
             input: "n = 12",
             expected: "\"3113112221232112111312211312113211\"", orderMatters: true),
            TestCaseData(id: "ff22482d-d2ef-4837-a494-b904714672b0",
             input: "n = 13",
             expected: "\"1321132132111213122112311311222113111221131221\"", orderMatters: true),
            TestCaseData(id: "0525d21f-29b0-40a0-b44c-e9f69a5329c2",
             input: "n = 14",
             expected: "\"11131221131211131231121113112221121321132132211331222113112211\"", orderMatters: true),
            TestCaseData(id: "1e0838ff-6270-4319-8468-d35d389398a9",
             input: "n = 15",
             expected: "\"311311222113111231131112132112311321322112111312211312111322212311322113212221\"", orderMatters: true),
            TestCaseData(id: "772555f4-846b-4089-9c48-0ae18ccb20b0",
             input: "n = 16",
             expected: "\"132113213221133112132113311211131221121321131211132221123113112221131112311332111213211322211312113211\"", orderMatters: true),
            TestCaseData(id: "f627ab77-e380-476e-81c8-466fad09c9a4",
             input: "n = 17",
             expected: "\"11131221131211132221232112111312212321123113112221121113122113111231133221121321132132211331121321231231121113122113322113111221131221\"", orderMatters: true),
            TestCaseData(id: "4e12691d-3581-4442-bd67-3034113c3c38",
             input: "n = 18",
             expected: "\"31131122211311123113321112131221123113112211121312211213211321322112311311222113311213212322211211131221131211132221232112111312111213"
                + "111213211231131122212322211331222113112211\"", orderMatters: true),
            TestCaseData(id: "ce79cdbd-ccea-4c4b-85e9-76e16751307d",
             input: "n = 19",
             expected: "\"13211321322113311213212312311211131122211213211321223112111311222112111312211312111322211213211321322123211211131211121332211231131122"
                + "21131112311332111213122112311311123112111331121113122112132113213211121332212311322113212221\"", orderMatters: true),
            TestCaseData(id: "c0650cf6-d808-4b5e-8aad-bd37570427bf",
             input: "n = 20",
             expected: "\"11131221131211132221232112111312111213111213211231132132211211131221131211221321123113213221123113112221131112311332211211131221131211"
                + "1322111213122112311311123112112322211213211321322113311213212312311211131122211213211331121321123123211231131122211211131221131211131231"
                + "12112322111213211322211312113211\"", orderMatters: true),
            TestCaseData(id: "79785029-9239-436a-ae36-9427380835bc",
             input: "n = 21",
             expected: "\"31131122211311123113321112131221123113111231121113311211131221121321131211132221123113112221131112212211131221121321131211132221121321"
                + "1321322113311213212322211231131122211311123113223112111311222112132113311213211221121332211211131221131211132221232112111312111213111213"
                + "2112311321322112111312212321121113122112131112131221121321132132211231131122211311123113111213211221121322311211131221133221131112211312"
                + "21\"", orderMatters: true),
            TestCaseData(id: "65d8363e-a1e8-43e0-aa17-039cb8df9aa7",
             input: "n = 22",
             expected: "\"13211321322113311213212312311211131122211213211331121321123123211231131122211211131221131112311332211213211321322113312211223113112221"
                + "1211131221131112311332211211131221131211132221232112111312111213322112132113213221133112132113221321123113213221121113122123211211131221"
                + "2221121123222112311311222113111231133211121312211231131112311211133112111312211213211312111322211231131122111213122112311311222112111331"
                + "12111311222112111312211312111322211213211321322113311213211331121113122122211211132213211231131122212322211331222113112211\"", orderMatters: true),
            TestCaseData(id: "eecbb179-5f14-4f20-9a49-b6fcf36c19a3",
             input: "n = 23",
             expected: "\"11131221131211132221232112111312111213111213211231132132211211131221232112111312211213111213122112132113213221123113112221133112132123"
                + "2221121113122113121113222123112221221321132132211231131122211331121321232221123113112221131112311332111213122112311311123112112322211211"
                + "1312211312111322212321121113122113221113122112132113121113222112311311221112131221123113112211322112211213322112132113213221133112132123"
                + "1231121113112221121321133112132112312321123113112221121113122113111231133221121321132122311211131122211213211321322112312321123113213221"
                + "1231131122211311123113322112111312211312111322212321121113122123211231131122113221123113221113122112132113213211121332212311322113212221"
                + "\"", orderMatters: true),
            TestCaseData(id: "1b2f96b4-fdd3-40d4-aec4-b7153ccab67b",
             input: "n = 24",
             expected: "\"31131122211311123113321112131221123113111231121113311211131221121321131211132221123113112211121312211231131122211211133112111311222112"
                + "1113122113121113222112132113213221232112111312111213322112311311222113111231133211121321321122111312211312111322211213211321322123211211"
                + "1312111213322112132113213221133112132123123112111311222112132113311213211221121332211231131122211311123113321112131221123113112221132231"
                + "1311222112111312211311123113322112132113212231121113112221121321132122211322212221121123222112111312211312111322212321121113121112131112"
                + "1321123113213221121113122123211211131221121311121312211213211321322112311311222113311213212322211211131221131211221321123113213221121113"
                + "1221131211132221121311121312211213211312111322211213211321322113311213212322211231131122211311123113321112131221123113112211121312211213"
                + "211321222113222112132113223113112221121113122113121113123112112322111213211322211312113211\"", orderMatters: true),
            TestCaseData(id: "33a3c8cb-5141-4eba-87fd-7e70b59755bb",
             input: "n = 25",
             expected: "\"13211321322113311213212312311211131122211213211331121321123123211231131122211211131221131112311332211213211321223112111311222112132113"
                + "2132211231232112311321322112311311222113111231133221121113122113121113221112131221123113111231121123222112132113213221133112132123123112"
                + "1113121113122122311311222113111231133221121113122113121113221112131221123113111231121123222112111312211312111322212321121113121112131112"
                + "1321123113213221121113122123211211131221222112112322211213211321322113311213212312311211131122211213211321322113221321132132211231131122"
                + "2113311213212322211211131221131211221321123113213221121113122113121132211332113221122112133221123113112221131112311332111213122112311311"
                + "1231121113311211131221121321131211132221123113112211121312211231131122211211133112111311222112111312211312111322211213211321322123211211"
                + "1312111213322112311311222113111221221113122112132113121113222112311311222113111231133221121113311211131122211211131221131112311332211211"
                + "1312211312111322212321121113121112133221121321132132211331121321231231121113112221121321132122311211131122211211131221131211322113322112"
                + "111312211322132113213221123113112221131112311311121321122112132231121113122113322113111221131221\"", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "count-and-say"
            let topic = "misc"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 30 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 30"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.countAndSay(p_n)
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

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
