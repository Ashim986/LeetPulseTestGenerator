import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLetterCombinationsOfAPhoneNumber {
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
                let letters = map[digitsArray[index]].unsafelyUnwrapped
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

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "A4B12FC3-F4B2-42C7-BC1A-7D5BF21DA958",
             input: "23",
             expected: "[\"ad\",\"ae\",\"af\",\"bd\",\"be\",\"bf\",\"cd\",\"ce\",\"cf\"]", orderMatters: false),
            TestCaseData(id: "B65E7ADD-6BBE-4DC4-84ED-AC9A512C9FF8",
             input: "9",
             expected: "[\"w\",\"x\",\"y\",\"z\"]", orderMatters: false),
            TestCaseData(id: "4236BB10-DA94-4E77-8B22-B4866C5B8A5F",
             input: "234",
             expected: "[\"adg\",\"adh\",\"adi\",\"aeg\",\"aeh\",\"aei\",\"afg\",\"afh\",\"afi\",\"bdg\",\"bdh\",\"bdi\",\"beg\",\"beh\",\"bei\",\"bfg\",\"bfh\""
                + ",\"bfi\",\"cdg\",\"cdh\",\"cdi\",\"ceg\",\"ceh\",\"cei\",\"cfg\",\"cfh\",\"cfi\"]", orderMatters: false),
            TestCaseData(id: "46DAB5CD-DA7C-4E17-B7C8-8137FDD10D11",
             input: "27",
             expected: "[\"ap\",\"aq\",\"ar\",\"as\",\"bp\",\"bq\",\"br\",\"bs\",\"cp\",\"cq\",\"cr\",\"cs\"]", orderMatters: false),
            TestCaseData(id: "6BFBFAB2-9161-465A-A8BD-5C056B54D1B1",
             input: "89",
             expected: "[\"tw\",\"tx\",\"ty\",\"tz\",\"uw\",\"ux\",\"uy\",\"uz\",\"vw\",\"vx\",\"vy\",\"vz\"]", orderMatters: false),
            TestCaseData(id: "EF9C9E79-5327-40EA-AF78-6D6AD7CB2FEC",
             input: "2",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: false),
            TestCaseData(id: "84508507-BFC6-47F1-983F-E169FD9BB9B1",
             input: "92",
             expected: "[\"wa\",\"wb\",\"wc\",\"xa\",\"xb\",\"xc\",\"ya\",\"yb\",\"yc\",\"za\",\"zb\",\"zc\"]", orderMatters: false),
            TestCaseData(id: "690CC13F-2288-49B0-97D7-466CD245BEA7",
             input: "22",
             expected: "[\"aa\",\"ab\",\"ac\",\"ba\",\"bb\",\"bc\",\"ca\",\"cb\",\"cc\"]", orderMatters: false),
            TestCaseData(id: "056E0CE8-A016-4362-B3E4-D208D47B26D3",
             input: "2345",
             expected: "[\"adgj\",\"adgk\",\"adgl\",\"adhj\",\"adhk\",\"adhl\",\"adij\",\"adik\",\"adil\",\"aegj\",\"aegk\",\"aegl\",\"aehj\",\"aehk\",\"aehl\","
                + "\"aeij\",\"aeik\",\"aeil\",\"afgj\",\"afgk\",\"afgl\",\"afhj\",\"afhk\",\"afhl\",\"afij\",\"afik\",\"afil\",\"bdgj\",\"bdgk\",\"bdgl\","
                + "\"bdhj\",\"bdhk\",\"bdhl\",\"bdij\",\"bdik\",\"bdil\",\"begj\",\"begk\",\"begl\",\"behj\",\"behk\",\"behl\",\"beij\",\"beik\",\"beil\","
                + "\"bfgj\",\"bfgk\",\"bfgl\",\"bfhj\",\"bfhk\",\"bfhl\",\"bfij\",\"bfik\",\"bfil\",\"cdgj\",\"cdgk\",\"cdgl\",\"cdhj\",\"cdhk\",\"cdhl\","
                + "\"cdij\",\"cdik\",\"cdil\",\"cegj\",\"cegk\",\"cegl\",\"cehj\",\"cehk\",\"cehl\",\"ceij\",\"ceik\",\"ceil\",\"cfgj\",\"cfgk\",\"cfgl\","
                + "\"cfhj\",\"cfhk\",\"cfhl\",\"cfij\",\"cfik\",\"cfil\"]", orderMatters: false),
            TestCaseData(id: "71B50ED4-DC26-4135-A95C-062C2C365490",
             input: "432",
             expected: "[\"gda\",\"gdb\",\"gdc\",\"gea\",\"geb\",\"gec\",\"gfa\",\"gfb\",\"gfc\",\"hda\",\"hdb\",\"hdc\",\"hea\",\"heb\",\"hec\",\"hfa\",\"hfb\""
                + ",\"hfc\",\"ida\",\"idb\",\"idc\",\"iea\",\"ieb\",\"iec\",\"ifa\",\"ifb\",\"ifc\"]", orderMatters: false),
            TestCaseData(id: "5CD03678-8F34-48B0-96F4-30C7E316335F",
             input: "222",
             expected: "[\"aaa\",\"aab\",\"aac\",\"aba\",\"abb\",\"abc\",\"aca\",\"acb\",\"acc\",\"baa\",\"bab\",\"bac\",\"bba\",\"bbb\",\"bbc\",\"bca\",\"bcb\""
                + ",\"bcc\",\"caa\",\"cab\",\"cac\",\"cba\",\"cbb\",\"cbc\",\"cca\",\"ccb\",\"ccc\"]", orderMatters: false),
            TestCaseData(id: "895712C6-2C25-4846-B0EA-6CED59A48A55",
             input: "345",
             expected: "[\"dgj\",\"dgk\",\"dgl\",\"dhj\",\"dhk\",\"dhl\",\"dij\",\"dik\",\"dil\",\"egj\",\"egk\",\"egl\",\"ehj\",\"ehk\",\"ehl\",\"eij\",\"eik\""
                + ",\"eil\",\"fgj\",\"fgk\",\"fgl\",\"fhj\",\"fhk\",\"fhl\",\"fij\",\"fik\",\"fil\"]", orderMatters: false),
            TestCaseData(id: "BED95A57-5AEF-4426-ACCC-C3BCD5533085",
             input: "237",
             expected: "[\"adp\",\"adq\",\"adr\",\"ads\",\"aep\",\"aeq\",\"aer\",\"aes\",\"afp\",\"afq\",\"afr\",\"afs\",\"bdp\",\"bdq\",\"bdr\",\"bds\",\"bep\""
                + ",\"beq\",\"ber\",\"bes\",\"bfp\",\"bfq\",\"bfr\",\"bfs\",\"cdp\",\"cdq\",\"cdr\",\"cds\",\"cep\",\"ceq\",\"cer\",\"ces\",\"cfp\",\"cfq\""
                + ",\"cfr\",\"cfs\"]", orderMatters: false),
            TestCaseData(id: "5C42C84D-E6C9-4045-A00F-5C40EA7F920C",
             input: "279",
             expected: "[\"apw\",\"apx\",\"apy\",\"apz\",\"aqw\",\"aqx\",\"aqy\",\"aqz\",\"arw\",\"arx\",\"ary\",\"arz\",\"asw\",\"asx\",\"asy\",\"asz\",\"bpw\""
                + ",\"bpx\",\"bpy\",\"bpz\",\"bqw\",\"bqx\",\"bqy\",\"bqz\",\"brw\",\"brx\",\"bry\",\"brz\",\"bsw\",\"bsx\",\"bsy\",\"bsz\",\"cpw\",\"cpx\""
                + ",\"cpy\",\"cpz\",\"cqw\",\"cqx\",\"cqy\",\"cqz\",\"crw\",\"crx\",\"cry\",\"crz\",\"csw\",\"csx\",\"csy\",\"csz\"]", orderMatters: false),
            TestCaseData(id: "3308816C-3626-4F96-B642-3C0EBBA0C764",
             input: "79",
             expected: "[\"pw\", \"px\", \"py\", \"pz\", \"qw\", \"qx\", \"qy\", \"qz\", \"rw\", \"rx\", \"ry\", \"rz\", \"sw\", \"sx\", \"sy\", \"sz\"]", orderMatters: false),
            TestCaseData(id: "FE244B28-6D13-4C60-B3FE-813F2F50AAB6",
             input: "789",
             expected: "[\"ptw\", \"ptx\", \"pty\", \"ptz\", \"puw\", \"pux\", \"puy\", \"puz\", \"pvw\", \"pvx\", \"pvy\", \"pvz\", \"qtw\", \"qtx\", \"qty\", "
                + "\"qtz\", \"quw\", \"qux\", \"quy\", \"quz\", \"qvw\", \"qvx\", \"qvy\", \"qvz\", \"rtw\", \"rtx\", \"rty\", \"rtz\", \"ruw\", \"rux\", "
                + "\"ruy\", \"ruz\", \"rvw\", \"rvx\", \"rvy\", \"rvz\", \"stw\", \"stx\", \"sty\", \"stz\", \"suw\", \"sux\", \"suy\", \"suz\", \"svw\", "
                + "\"svx\", \"svy\", \"svz\"]", orderMatters: false),
            TestCaseData(id: "D732850E-7EF0-418A-8F60-E577DF2927E6",
             input: "723",
             expected: "[\"pad\", \"pae\", \"paf\", \"pbd\", \"pbe\", \"pbf\", \"pcd\", \"pce\", \"pcf\", \"qad\", \"qae\", \"qaf\", \"qbd\", \"qbe\", \"qbf\", "
                + "\"qcd\", \"qce\", \"qcf\", \"rad\", \"rae\", \"raf\", \"rbd\", \"rbe\", \"rbf\", \"rcd\", \"rce\", \"rcf\", \"sad\", \"sae\", \"saf\", "
                + "\"sbd\", \"sbe\", \"sbf\", \"scd\", \"sce\", \"scf\"]", orderMatters: false),
            TestCaseData(id: "BE8AEE3E-B340-477C-B26B-E71F48AEB8E2",
             input: "78",
             expected: "[\"pt\", \"pu\", \"pv\", \"qt\", \"qu\", \"qv\", \"rt\", \"ru\", \"rv\", \"st\", \"su\", \"sv\"]", orderMatters: false),
            TestCaseData(id: "84b3f40f-ee72-47b9-9e09-b78a04492aa4",
             input: "digits = \"\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "86630eae-edf9-48a3-83e4-ecf877ded4fa",
             input: "digits = \"2\"",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: false),
            TestCaseData(id: "62d1fc69-2562-4375-85fc-4d867e36708c",
             input: "digits = \"222\"",
             expected: "[\"aaa\",\"aab\",\"aac\",\"aba\",\"abb\",\"abc\",\"aca\",\"acb\",\"acc\",\"baa\",\"bab\",\"bac\",\"bba\",\"bbb\",\"bbc\",\"bca\",\"bcb\""
                + ",\"bcc\",\"caa\",\"cab\",\"cac\",\"cba\",\"cbb\",\"cbc\",\"cca\",\"ccb\",\"ccc\"]", orderMatters: false),
            TestCaseData(id: "075c9018-98df-4ea2-8b45-73dd0d107b05",
             input: "digits = \"9\"",
             expected: "[\"w\",\"x\",\"y\",\"z\"]", orderMatters: false),
            TestCaseData(id: "15C94A3D-CCE1-4FAF-8BFB-C63B5F9F70AD",
             input: "456",
             expected: "[\"gjm\",\"gjn\",\"gjo\",\"gkm\",\"gkn\",\"gko\",\"glm\",\"gln\",\"glo\",\"hjm\",\"hjn\",\"hjo\",\"hkm\",\"hkn\",\"hko\",\"hlm\",\"hln\""
                + ",\"hlo\",\"ijm\",\"ijn\",\"ijo\",\"ikm\",\"ikn\",\"iko\",\"ilm\",\"iln\",\"ilo\"]", orderMatters: false),
            TestCaseData(id: "CB3F1B06-3D64-4E28-8D01-71E9101EA548",
             input: "3",
             expected: "[\"d\",\"e\",\"f\"]", orderMatters: false),
            TestCaseData(id: "9264DD25-C2BA-447C-B2BF-57A1B055E36D",
             input: "7",
             expected: "[\"p\",\"q\",\"r\",\"s\"]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "letter-combinations-of-a-phone-number"
            let topic = "backtracking"
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

            let p_digits = InputParser.parseString(params[0])
            guard p_digits.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: digits string too long (\(p_digits.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_digits.count >= 0 && p_digits.count <= 4 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= digits.length <= 4"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [String]?
            let didCrash = withCrashGuard {
                resultHolder = solution.letterCombinations(p_digits)
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

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [String]"
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
