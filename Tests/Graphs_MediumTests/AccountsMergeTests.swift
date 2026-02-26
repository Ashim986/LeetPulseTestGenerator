import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAccountsMerge {
    private class Solution {
        func accountsMerge(_ accounts: [[String]]) -> [[String]] {
            var parent: [String: String] = [:]
            var emailToName: [String: String] = [:]

            func find(_ x: String) -> String {
                if parent[x] == nil { parent[x] = x }
                if parent[x] != x { parent[x] = find(parent[x].unsafelyUnwrapped) }
                return parent[x].unsafelyUnwrapped
            }

            func union(_ x: String, _ y: String) {
                parent[find(x)] = find(y)
            }

            for account in accounts {
                let name = account[0]
                for i in 1..<account.count {
                    emailToName[account[i]] = name
                    if i > 1 { union(account[1], account[i]) }
                }
            }

            var groups: [String: [String]] = [:]
            for email in emailToName.keys {
                groups[find(email), default: []].append(email)
            }

            return groups.values.map { emails in
                [emailToName[emails[0]].unsafelyUnwrapped] + emails.sorted()
            }
        }
    }

    @Suite struct AccountsMergeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "09ae9a97-489b-4f00-a9a3-069148612d91",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "01e1cd5c-09c7-46fb-b164-5377e688a457",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "6f44ec5f-71a3-4294-920f-29c1bfc3f4ff",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "fdcbecf1-1903-4e68-97e5-a2caea1e521d",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "70c4e24c-83c7-4b6f-9279-9ea1806034b9",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "d170f7f9-17dd-4663-80fb-a8075c8c4be5",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail."
                + "com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "5cddef3a-98ea-4f88-b57f-434b3e9d20aa",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "b48682fb-e5b0-44f1-95e3-b0830f684582",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "812882a4-cb4f-480f-b65b-8dc5554273b2",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "c33e310a-daae-45d2-be3a-8a314eb72e0b",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "ac5af1d2-6a26-431b-b15e-b6f03c020ba5",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "3ad1161a-eda0-4a01-b78c-2ac606a9e149",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "4e3ea7c2-85dc-452f-9bc2-d24cb2881242",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "c1916551-bc48-4ea5-bb38-b32746f611c7",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "2062ed99-6342-4ea4-87f9-a2558afed26f",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail."
                + "com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail."
                + "com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com"
                + "\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]", orderMatters: false),
            TestCaseData(id: "d8b75c2a-d001-459e-b05f-36cabbaae9d9",
             input: "accounts = [[\"John\",\"johnsmith@mail.com\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\",\"john00@mail.com\"],[\"Mary\","
                + "\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]",
             expected: "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@ma"
                + "il.com\"]]", orderMatters: false),
            TestCaseData(id: "e0598e2e-db04-4474-a63a-866344b86e9e",
             input: "accounts = [[\"Gabe\",\"Gabe0@m.co\",\"Gabe3@m.co\",\"Gabe1@m.co\"],[\"Kevin\",\"Kevin3@m.co\",\"Kevin5@m.co\",\"Kevin0@m.co\"],[\"Ethan"
                + "\",\"Ethan5@m.co\",\"Ethan4@m.co\",\"Ethan0@m.co\"],[\"Hanzo\",\"Hanzo3@m.co\",\"Hanzo1@m.co\",\"Hanzo0@m.co\"],[\"Fern\",\"Fern5@m.co\""
                + ",\"Fern1@m.co\",\"Fern0@m.co\"]]",
             expected: "[[\"Ethan\",\"Ethan0@m.co\",\"Ethan4@m.co\",\"Ethan5@m.co\"],[\"Gabe\",\"Gabe0@m.co\",\"Gabe1@m.co\",\"Gabe3@m.co\"],[\"Hanzo\",\"Hanzo0"
                + "@m.co\",\"Hanzo1@m.co\",\"Hanzo3@m.co\"],[\"Kevin\",\"Kevin0@m.co\",\"Kevin3@m.co\",\"Kevin5@m.co\"],[\"Fern\",\"Fern0@m.co\",\"Fern1@m."
                + "co\",\"Fern5@m.co\"]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "accounts-merge"
            let topic = "graphs"
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

            guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[String]]"
                )
                return
            }
            guard p_accounts.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= accounts.length <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.accountsMerge(p_accounts)
            let computedOutput = OutputSerializer.serialize(result)

            guard let expectedArrays = InputParser.parse2DStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[String]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                let sortOuter: ([[String]]) -> [[String]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
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
