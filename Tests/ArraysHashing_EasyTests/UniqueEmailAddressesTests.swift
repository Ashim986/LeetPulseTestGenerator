import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCUniqueEmailAddresses {
    private class Solution {
        func numUniqueEmails(_ emails: [String]) -> Int {
            var seen = Set<String>()
            for email in emails {
                let parts = email.split(separator: "@", maxSplits: 1, omittingEmptySubsequences: true)
                guard parts.count == 2 else { continue }
                let local = parts[0]
                let domain = parts[1]
                var normalizedLocal = ""
                for ch in local {
                    if ch == "+" { break }
                    if ch == "." { continue }
                    normalizedLocal.append(ch)
                }
                let normalized = normalizedLocal + "@" + domain
                seen.insert(normalized)
            }
            return seen.count
        }
    }

    @Suite struct UniqueEmailAddressesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2135d67d-b6c3-4048-8bca-6ad025b24187",
             input: "emails = [\"a@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1dcceafc-3dee-4e33-9cc3-742f940e5f15",
             input: "emails = [\"a@leetcode.com\", \"b@leetcode.com\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "651aa490-89b9-406e-ae08-8f4ca750d08f",
             input: "emails = [\"a@leetcode.com\", \"a@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8f7d2fd4-6859-4a25-92a9-520a5ad55a5d",
             input: "emails = [\"test.email+alex@leetcode.com\", \"testemail+david@lee.tcode.com\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f20df303-b016-4af0-9194-63fa98c252b7",
             input: "emails = [\"test.email+alex@leetcode.com\", \"test.email+alex@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5f188c4d-227d-45ec-b3da-92c46fc1ef15",
             input: "emails = [\"test.email+alex@leetcode.com\", \"test.e.mail+bob.cathy@leetcode.com\", \"testemail+david@lee.tcode.com\", \"testemail+david"
                + "@lee.tcode.com\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "28ea216b-b878-41f6-89b4-055eddd0e017",
             input: "emails = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f1307115-bd38-46c2-99f6-771ae68ff25a",
             input: "emails = [\"a@leetcode.com\", \"b@leetcode.com\", \"c@leetcode.com\", \"d@leetcode.com\", \"e@leetcode.com\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "abe0240a-e1b4-4330-bbab-97097999c90c",
             input: "emails = [\"a@leetcode.com\", \"a@leetcode.com\", \"a@leetcode.com\", \"a@leetcode.com\", \"a@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7ad876e2-014a-4f41-9df6-21e8c84d5587",
             input: "emails = [\"test.email+alex@leetcode.com\", \"test.e.mail+bob.cathy@leetcode.com\", \"testemail+david@lee.tcode.com\", \"testemail+david"
                + "@lee.tcode.com\", \"testemail+david@lee.tcode.com\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "165ae81c-8ea3-4a71-93fa-671353320b2e",
             input: "emails = [\"a+b@leetcode.com\", \"a+b@leetcode.com\", \"a+b@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "47b17616-b330-45ad-995f-9daac61388f8",
             input: "emails = [\"a+b+c@leetcode.com\", \"a+b+c@leetcode.com\", \"a+b+c@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "54146815-b2f3-49a8-8912-249ac2183f39",
             input: "emails = [\"a+b+c+d@leetcode.com\", \"a+b+c+d@leetcode.com\", \"a+b+c+d@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2ea06ca8-02fc-48cb-ad41-a766c7ef1f06",
             input: "emails = [\"a+b+c+d+e@leetcode.com\", \"a+b+c+d+e@leetcode.com\", \"a+b+c+d+e@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dac64a93-2594-412d-b722-8d395831397b",
             input: "emails = [\"a+b+c+d+e+f@leetcode.com\", \"a+b+c+d+e+f@leetcode.com\", \"a+b+c+d+e+f@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fb4a45f8-98a1-4ee9-8ccc-f7b6d272d33e",
             input: "emails = [\"a+b+c+d+e+f+g@leetcode.com\", \"a+b+c+d+e+f+g@leetcode.com\", \"a+b+c+d+e+f+g@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "885a616e-79b7-418f-bd2b-fe13f97b29c8",
             input: "emails = [\"a+b+c+d+e+f+g+h@leetcode.com\", \"a+b+c+d+e+f+g+h@leetcode.com\", \"a+b+c+d+e+f+g+h@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ec3c0845-c8b6-4d1b-9bb4-5d99db6bd698",
             input: "emails = [\"a+b+c+d+e+f+g+h+i@leetcode.com\", \"a+b+c+d+e+f+g+h+i@leetcode.com\", \"a+b+c+d+e+f+g+h+i@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b4cb950a-e30d-46db-8eb5-28739b4707f0",
             input: "emails = [\"a+b+c+d+e+f+g+h+i+j@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0c242c71-bf9b-4cd4-a0ec-e98c4bff2033",
             input: "emails = [\"a+b+c+d+e+f+g+h+i+j+k@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2b0a4727-8d97-4f58-b468-e372d67b6593",
             input: "emails = [\"a+b+c+d+e+f+g+h+i+j+k+l@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k+l@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k+l@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2993a423-9f91-4ffd-be40-9cc866ec927c",
             input: "emails = [\"a+b+c+d+e+f+g+h+i+j+k+l+m@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k+l+m@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k+l+m@leetcode.c"
                + "om\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9dec7341-578d-449f-bdf0-4cd0ccc7e684",
             input: "emails = [\"a+b+c+d+e+f+g+h+i+j+k+l+m+n@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k+l+m+n@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k+l+m+n@leet"
                + "code.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "63be2243-5316-48a5-a838-9b8a17ebea2b",
             input: "emails = [\"a+b+c+d+e+f+g+h+i+j+k+l+m+n+o@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k+l+m+n+o@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k+l+m+n+"
                + "o@leetcode.com\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "506bca8b-2eaf-4d71-97ff-c9c12e527a45",
             input: "emails = [\"a+b+c+d+e+f+g+h+i+j+k+l+m+n+o+p@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k+l+m+n+o+p@leetcode.com\", \"a+b+c+d+e+f+g+h+i+j+k+l+"
                + "m+n+o+p@leetcode.com\"]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "unique-email-addresses"
            let topic = "arrays-hashing"
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

            guard let p_emails = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_emails.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: emails array too large (\(p_emails.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_emails.count >= 1 && p_emails.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= emails.length <= 100"
                )
                return
            }
            guard p_emails.allSatisfy({ $0.count >= 1 && $0.count <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= emails[i].length <= 100"
                )
                return
            }

            let solution = Solution()
            let result = solution.numUniqueEmails(p_emails)
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
