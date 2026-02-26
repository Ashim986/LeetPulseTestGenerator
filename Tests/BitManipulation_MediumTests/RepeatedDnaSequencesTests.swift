import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRepeatedDnaSequences {
    private class Solution {
        func findRepeatedDnaSequences(_ s: String) -> [String] {
            let base = 4
            let mod = Int(1e9) + 7

            let nucleotideToIndex: [Character: Int] = [
                "A": 0,
                "C": 1,
                "G": 2,
                "T": 3
            ]

            var hashValues = Set<Int>()
            var repeatedHashValues = Set<Int>()
            var currentHash = 0

            let sChars = Array(s)

            // Compute initial hash
            for i in 0..<10 {
                currentHash = (currentHash * base) % mod + nucleotideToIndex[sChars[i]].unsafelyUnwrapped
            }

            hashValues.insert(currentHash)

            let power = Int(pow(Double(base), 9))

            // Compute hashes for subsequent substrings
            for i in 10..<(s.count) {
                currentHash = ((currentHash * base - nucleotideToIndex[sChars[i - 10]].unsafelyUnwrapped * power % mod + mod) % mod + nucleotideToIndex[sChars[i]].unsafelyUnwrapped)

                if hashValues.contains(currentHash) {
                    repeatedHashValues.insert(currentHash)
                }
                hashValues.insert(currentHash)
            }

            var repeatedSequences = [String]()
            for i in 0..<(s.count - 9) {
                let substring = String(s.dropFirst(i).prefix(10))
                let hash = getHash(for: substring, base: base, mod: mod, nucleotideToIndex: nucleotideToIndex)
                if repeatedHashValues.contains(hash) {
                    repeatedSequences.append(substring)
                }
            }

            // Remove duplicates
            let uniqueSequences = Array(Set(repeatedSequences))

            return uniqueSequences
        }

        func getHash(for substring: String, base: Int, mod: Int, nucleotideToIndex: [Character: Int]) -> Int {
            var hash = 0
            let substringChars = Array(substring)

            for i in 0..<10 {
                hash = (hash * base) % mod + nucleotideToIndex[substringChars[i]].unsafelyUnwrapped
            }

            return hash
        }
    }

    @Suite struct RepeatedDnaSequencesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "65c76d89-cc5a-4dcb-9fac-230fe5357d68",
             input: "s = \"ATCG\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "061c1739-09ba-43ba-b9b5-0f436b5386fe",
             input: "s = \"\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "edb666bd-8962-41b1-8fa6-805cc5486659",
             input: "s = \"A\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "023ead70-7b04-4685-a644-a2f81fcf2bdd",
             input: "s = \"AA\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "1c9ab50d-35b8-48a2-8e42-29e47a362eda",
             input: "s = \"AAA\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "a6a7153e-694c-4736-a2b9-63e2d9fe56b3",
             input: "s = \"AAAAACCCCCAAAAACCCCCCAAAAACCCCCC\"",
             expected: "[\"AAAAACCCCC\",\"AAAACCCCCA\",\"AAACCCCCAA\",\"AACCCCCAAA\",\"ACCCCCAAAA\",\"CAAAAACCCC\",\"CCAAAAACCC\",\"CCCAAAAACC\",\"CCCCAAAAAC\"]", orderMatters: false),
            TestCaseData(id: "de2d8036-d347-41ae-8706-1fea4f44996c",
             input: "s = \"ATCGATCG\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "c930a178-c0e3-4055-803d-b5d14f577552",
             input: "s = \"AAAAAAAAAAAAAAAAAAA\"",
             expected: "[\"AAAAAAAAAA\"]", orderMatters: false),
            TestCaseData(id: "00f5b9c1-bd5d-4b88-ae15-010419f9f53e",
             input: "s = \"AAAA\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "9505b241-c9d7-4162-8624-329d218c63d9",
             input: "s = \"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\"",
             expected: "[\"AAAAAAAAAA\"]", orderMatters: false),
            TestCaseData(id: "8d17070c-05ee-420e-9c22-eb46f9afa430",
             input: "s = \"ATCGATCGATCGATCGATCG\"",
             expected: "[\"CGATCGATCG\",\"TCGATCGATCG\"]", orderMatters: false),
            TestCaseData(id: "80b020e3-238e-4eb5-a33a-84f261be7767",
             input: "s = \"ATCGATCGATCGATCGATCGATCG\"",
             expected: "[\"ATCGATCGATCG\",\"CGATCGATCGAT\",\"GATCGATCGATC\",\"TCGATCGATCG\"]", orderMatters: false),
            TestCaseData(id: "17f00099-3e77-4941-a1f7-26eda4f900c7",
             input: "s = \"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\"",
             expected: "[\"AAAAAAAAAA\"]", orderMatters: false),
            TestCaseData(id: "62cd6163-7e29-4657-87d6-f915e69de84c",
             input: "s = \"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\"",
             expected: "[\"AAAAAAAAAA\"]", orderMatters: false),
            TestCaseData(id: "0b6c2fe3-ba25-4e1a-90f1-aedfc5234a3a",
             input: "s = \"ATCGATCGATCGATCGATCGATCGATCG\"",
             expected: "[\"ATCGATCGATCG\",\"CGATCGATCG\",\"CGATCGATCGAT\",\"GATCGATCGATC\",\"TCGATCGATCG\"]", orderMatters: false),
            TestCaseData(id: "f5683869-3ef8-4efd-af83-aa5fe71b094a",
             input: "s = \"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\"",
             expected: "[\"AAAAAAAAAA\"]", orderMatters: false),
            TestCaseData(id: "a68cff28-6fa1-4f8d-9789-15cabd7d4e02",
             input: "s = \"ATCGATCGATCGATCGATCGATCGATCGATCG\"",
             expected: "[\"ATCGATCGATCG\",\"CGATCGATCG\",\"CGATCGATCGAT\",\"GATCGATCGATC\",\"TCGATCGATCG\"]", orderMatters: false),
            TestCaseData(id: "97ea7b85-0fa7-40fb-af4d-2bc9d04f2e80",
             input: "s = \"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\"",
             expected: "[\"AAAAAAAAAA\"]", orderMatters: false),
            TestCaseData(id: "0314b4cb-93e9-4658-b95c-c44d184f2866",
             input: "s = \"ATCGATCGATCGATCGATCGATCGATCGATCGATCG\"",
             expected: "[\"ATCGATCGATCG\",\"CGATCGATCG\",\"CGATCGATCGAT\",\"GATCGATCGATC\",\"TCGATCGATCG\"]", orderMatters: false),
            TestCaseData(id: "6337a7a2-0c60-4f2e-b7f6-9330ab32df6a",
             input: "s = \"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\"",
             expected: "[\"AAAAAAAAAA\"]", orderMatters: false),
            TestCaseData(id: "ed615155-c969-4274-95cd-a6f155c9b055",
             input: "s = \"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\"",
             expected: "[\"AAAAAAAAAA\"]", orderMatters: false),
            TestCaseData(id: "122e86e0-768a-4a97-925b-d8ce09f2a442",
             input: "s = \"ATCGATCGATCGATCGATCGATCGATCGATCGATCGATCG\"",
             expected: "[\"ATCGATCGAT\",\"TCGATCGATC\",\"CGATCGATCG\",\"GATCGATCGA\"]", orderMatters: false),
            TestCaseData(id: "f8707999-6227-41e2-aa5b-6c0355457564",
             input: "s = \"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\"",
             expected: "[\"AAAAAAAAAA\"]", orderMatters: false),
            TestCaseData(id: "4b5efdae-3ab6-40a5-bb73-47ce5e869722",
             input: "s = \"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\"",
             expected: "[\"AAAAAAAAAA\"]", orderMatters: false),
            TestCaseData(id: "d809816a-394e-4dd5-a07f-3f2a6f074c18",
             input: "s = \"ATCGATCGATCGATCGATCGATCGATCGATCGATCGATCGATCG\"",
             expected: "[\"ATCGATCGAT\",\"TCGATCGATC\",\"CGATCGATCG\",\"GATCGATCGA\"]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "repeated-dna-sequences"
            let topic = "bit-manipulation"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.findRepeatedDnaSequences(p_s)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
