import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }

        let map: [Character: String] = [
            "2": "abc", "3": "def", "4": "ghi", "5": "jkl",
            "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"
        ]
        let digitsArray = Array(digits)
        var result: [String] = []
        var current = ""

        func backtrack(_ index: Int) {
            if index == digitsArray.count {
                result.append(current)
                return
            }
            let letters = map[digitsArray[index]]!
            for letter in letters {
                current.append(letter)
                backtrack(index + 1)
                current.removeLast()
            }
        }

        backtrack(0)
        return result
    }
}

@Suite struct LetterCombinationsOfAPhoneNumberTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "A4B12FC3-F4B2-42C7-BC1A-7D5BF21DA958"
        let rawInput = "23"
        let expectedOutput = "[\"ad\",\"ae\",\"af\",\"bd\",\"be\",\"bf\",\"cd\",\"ce\",\"cf\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_1() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "B65E7ADD-6BBE-4DC4-84ED-AC9A512C9FF8"
        let rawInput = "9"
        let expectedOutput = "[\"w\",\"x\",\"y\",\"z\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_2() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "4236BB10-DA94-4E77-8B22-B4866C5B8A5F"
        let rawInput = "234"
        let expectedOutput = "[\"adg\",\"adh\",\"adi\",\"aeg\",\"aeh\",\"aei\",\"afg\",\"afh\",\"afi\",\"bdg\",\"bdh\",\"bdi\",\"beg\",\"beh\",\"bei\",\"bfg\",\"bfh\",\"bfi\",\"cdg\",\"cdh\",\"cdi\",\"ceg\",\"ceh\",\"cei\",\"cfg\",\"cfh\",\"cfi\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_3() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "46DAB5CD-DA7C-4E17-B7C8-8137FDD10D11"
        let rawInput = "27"
        let expectedOutput = "[\"ap\",\"aq\",\"ar\",\"as\",\"bp\",\"bq\",\"br\",\"bs\",\"cp\",\"cq\",\"cr\",\"cs\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_4() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "6BFBFAB2-9161-465A-A8BD-5C056B54D1B1"
        let rawInput = "89"
        let expectedOutput = "[\"tw\",\"tx\",\"ty\",\"tz\",\"uw\",\"ux\",\"uy\",\"uz\",\"vw\",\"vx\",\"vy\",\"vz\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_5() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "EF9C9E79-5327-40EA-AF78-6D6AD7CB2FEC"
        let rawInput = "2"
        let expectedOutput = "[\"a\",\"b\",\"c\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_6() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "84508507-BFC6-47F1-983F-E169FD9BB9B1"
        let rawInput = "92"
        let expectedOutput = "[\"wa\",\"wb\",\"wc\",\"xa\",\"xb\",\"xc\",\"ya\",\"yb\",\"yc\",\"za\",\"zb\",\"zc\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_7() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "690CC13F-2288-49B0-97D7-466CD245BEA7"
        let rawInput = "22"
        let expectedOutput = "[\"aa\",\"ab\",\"ac\",\"ba\",\"bb\",\"bc\",\"ca\",\"cb\",\"cc\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_8() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "056E0CE8-A016-4362-B3E4-D208D47B26D3"
        let rawInput = "2345"
        let expectedOutput = "[\"adgj\",\"adgk\",\"adgl\",\"adhj\",\"adhk\",\"adhl\",\"adij\",\"adik\",\"adil\",\"aegj\",\"aegk\",\"aegl\",\"aehj\",\"aehk\",\"aehl\",\"aeij\",\"aeik\",\"aeil\",\"afgj\",\"afgk\",\"afgl\",\"afhj\",\"afhk\",\"afhl\",\"afij\",\"afik\",\"afil\",\"bdgj\",\"bdgk\",\"bdgl\",\"bdhj\",\"bdhk\",\"bdhl\",\"bdij\",\"bdik\",\"bdil\",\"begj\",\"begk\",\"begl\",\"behj\",\"behk\",\"behl\",\"beij\",\"beik\",\"beil\",\"bfgj\",\"bfgk\",\"bfgl\",\"bfhj\",\"bfhk\",\"bfhl\",\"bfij\",\"bfik\",\"bfil\",\"cdgj\",\"cdgk\",\"cdgl\",\"cdhj\",\"cdhk\",\"cdhl\",\"cdij\",\"cdik\",\"cdil\",\"cegj\",\"cegk\",\"cegl\",\"cehj\",\"cehk\",\"cehl\",\"ceij\",\"ceik\",\"ceil\",\"cfgj\",\"cfgk\",\"cfgl\",\"cfhj\",\"cfhk\",\"cfhl\",\"cfij\",\"cfik\",\"cfil\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_9() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "71B50ED4-DC26-4135-A95C-062C2C365490"
        let rawInput = "432"
        let expectedOutput = "[\"gda\",\"gdb\",\"gdc\",\"gea\",\"geb\",\"gec\",\"gfa\",\"gfb\",\"gfc\",\"hda\",\"hdb\",\"hdc\",\"hea\",\"heb\",\"hec\",\"hfa\",\"hfb\",\"hfc\",\"ida\",\"idb\",\"idc\",\"iea\",\"ieb\",\"iec\",\"ifa\",\"ifb\",\"ifc\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_10() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "5CD03678-8F34-48B0-96F4-30C7E316335F"
        let rawInput = "222"
        let expectedOutput = "[\"aaa\",\"aab\",\"aac\",\"aba\",\"abb\",\"abc\",\"aca\",\"acb\",\"acc\",\"baa\",\"bab\",\"bac\",\"bba\",\"bbb\",\"bbc\",\"bca\",\"bcb\",\"bcc\",\"caa\",\"cab\",\"cac\",\"cba\",\"cbb\",\"cbc\",\"cca\",\"ccb\",\"ccc\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_11() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "895712C6-2C25-4846-B0EA-6CED59A48A55"
        let rawInput = "345"
        let expectedOutput = "[\"dgj\",\"dgk\",\"dgl\",\"dhj\",\"dhk\",\"dhl\",\"dij\",\"dik\",\"dil\",\"egj\",\"egk\",\"egl\",\"ehj\",\"ehk\",\"ehl\",\"eij\",\"eik\",\"eil\",\"fgj\",\"fgk\",\"fgl\",\"fhj\",\"fhk\",\"fhl\",\"fij\",\"fik\",\"fil\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_12() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "BED95A57-5AEF-4426-ACCC-C3BCD5533085"
        let rawInput = "237"
        let expectedOutput = "[\"adp\",\"adq\",\"adr\",\"ads\",\"aep\",\"aeq\",\"aer\",\"aes\",\"afp\",\"afq\",\"afr\",\"afs\",\"bdp\",\"bdq\",\"bdr\",\"bds\",\"bep\",\"beq\",\"ber\",\"bes\",\"bfp\",\"bfq\",\"bfr\",\"bfs\",\"cdp\",\"cdq\",\"cdr\",\"cds\",\"cep\",\"ceq\",\"cer\",\"ces\",\"cfp\",\"cfq\",\"cfr\",\"cfs\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_13() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "5C42C84D-E6C9-4045-A00F-5C40EA7F920C"
        let rawInput = "279"
        let expectedOutput = "[\"apw\",\"apx\",\"apy\",\"apz\",\"aqw\",\"aqx\",\"aqy\",\"aqz\",\"arw\",\"arx\",\"ary\",\"arz\",\"asw\",\"asx\",\"asy\",\"asz\",\"bpw\",\"bpx\",\"bpy\",\"bpz\",\"bqw\",\"bqx\",\"bqy\",\"bqz\",\"brw\",\"brx\",\"bry\",\"brz\",\"bsw\",\"bsx\",\"bsy\",\"bsz\",\"cpw\",\"cpx\",\"cpy\",\"cpz\",\"cqw\",\"cqx\",\"cqy\",\"cqz\",\"crw\",\"crx\",\"cry\",\"crz\",\"csw\",\"csx\",\"csy\",\"csz\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_14() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "3308816C-3626-4F96-B642-3C0EBBA0C764"
        let rawInput = "79"
        let expectedOutput = "[\"pw\", \"px\", \"py\", \"pz\", \"qw\", \"qx\", \"qy\", \"qz\", \"rw\", \"rx\", \"ry\", \"rz\", \"sw\", \"sx\", \"sy\", \"sz\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_15() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "FE244B28-6D13-4C60-B3FE-813F2F50AAB6"
        let rawInput = "789"
        let expectedOutput = "[\"ptw\", \"ptx\", \"pty\", \"ptz\", \"puw\", \"pux\", \"puy\", \"puz\", \"pvw\", \"pvx\", \"pvy\", \"pvz\", \"qtw\", \"qtx\", \"qty\", \"qtz\", \"quw\", \"qux\", \"quy\", \"quz\", \"qvw\", \"qvx\", \"qvy\", \"qvz\", \"rtw\", \"rtx\", \"rty\", \"rtz\", \"ruw\", \"rux\", \"ruy\", \"ruz\", \"rvw\", \"rvx\", \"rvy\", \"rvz\", \"stw\", \"stx\", \"sty\", \"stz\", \"suw\", \"sux\", \"suy\", \"suz\", \"svw\", \"svx\", \"svy\", \"svz\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_16() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "D732850E-7EF0-418A-8F60-E577DF2927E6"
        let rawInput = "723"
        let expectedOutput = "[\"pad\", \"pae\", \"paf\", \"pbd\", \"pbe\", \"pbf\", \"pcd\", \"pce\", \"pcf\", \"qad\", \"qae\", \"qaf\", \"qbd\", \"qbe\", \"qbf\", \"qcd\", \"qce\", \"qcf\", \"rad\", \"rae\", \"raf\", \"rbd\", \"rbe\", \"rbf\", \"rcd\", \"rce\", \"rcf\", \"sad\", \"sae\", \"saf\", \"sbd\", \"sbe\", \"sbf\", \"scd\", \"sce\", \"scf\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_17() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "BE8AEE3E-B340-477C-B26B-E71F48AEB8E2"
        let rawInput = "78"
        let expectedOutput = "[\"pt\", \"pu\", \"pv\", \"qt\", \"qu\", \"qv\", \"rt\", \"ru\", \"rv\", \"st\", \"su\", \"sv\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_18() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "84b3f40f-ee72-47b9-9e09-b78a04492aa4"
        let rawInput = "digits = \"\""
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_19() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "86630eae-edf9-48a3-83e4-ecf877ded4fa"
        let rawInput = "digits = \"2\""
        let expectedOutput = "[\"a\",\"b\",\"c\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_20() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "62d1fc69-2562-4375-85fc-4d867e36708c"
        let rawInput = "digits = \"222\""
        let expectedOutput = "[\"aaa\",\"aab\",\"aac\",\"aba\",\"abb\",\"abc\",\"aca\",\"acb\",\"acc\",\"baa\",\"bab\",\"bac\",\"bba\",\"bbb\",\"bbc\",\"bca\",\"bcb\",\"bcc\",\"caa\",\"cab\",\"cac\",\"cba\",\"cbb\",\"cbc\",\"cca\",\"ccb\",\"ccc\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_21() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "075c9018-98df-4ea2-8b45-73dd0d107b05"
        let rawInput = "digits = \"9\""
        let expectedOutput = "[\"w\",\"x\",\"y\",\"z\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_22() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "15C94A3D-CCE1-4FAF-8BFB-C63B5F9F70AD"
        let rawInput = "456"
        let expectedOutput = "[\"gjm\",\"gjn\",\"gjo\",\"gkm\",\"gkn\",\"gko\",\"glm\",\"gln\",\"glo\",\"hjm\",\"hjn\",\"hjo\",\"hkm\",\"hkn\",\"hko\",\"hlm\",\"hln\",\"hlo\",\"ijm\",\"ijn\",\"ijo\",\"ikm\",\"ikn\",\"iko\",\"ilm\",\"iln\",\"ilo\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_23() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "CB3F1B06-3D64-4E28-8D01-71E9101EA548"
        let rawInput = "3"
        let expectedOutput = "[\"d\",\"e\",\"f\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_24() async {
        let slug = "letter-combinations-of-a-phone-number"
        let topic = "backtracking"
        let testId = "9264DD25-C2BA-447C-B2BF-57A1B055E36D"
        let rawInput = "7"
        let expectedOutput = "[\"p\",\"q\",\"r\",\"s\"]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_digits = InputParser.parseString(params[0])
        guard p_digits.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: digits string too long (\(p_digits.count))")
            return
        }

        // Constraint precondition checks
        guard p_digits.count >= 0 && p_digits.count <= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= digits.length <= 4")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

}
