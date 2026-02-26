import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var parent: [String: String] = [:]
        var emailToName: [String: String] = [:]

        func find(_ x: String) -> String {
            if parent[x] == nil { parent[x] = x }
            if parent[x] != x { parent[x] = find(parent[x]!) }
            return parent[x]!
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
            [emailToName[emails[0]]!] + emails.sorted()
        }
    }
}

@Suite struct AccountsMergeTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "09ae9a97-489b-4f00-a9a3-069148612d91"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_1() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "01e1cd5c-09c7-46fb-b164-5377e688a457"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_2() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "6f44ec5f-71a3-4294-920f-29c1bfc3f4ff"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_3() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "fdcbecf1-1903-4e68-97e5-a2caea1e521d"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_4() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "70c4e24c-83c7-4b6f-9279-9ea1806034b9"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_5() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "d170f7f9-17dd-4663-80fb-a8075c8c4be5"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_6() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "5cddef3a-98ea-4f88-b57f-434b3e9d20aa"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_7() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "b48682fb-e5b0-44f1-95e3-b0830f684582"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_8() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "812882a4-cb4f-480f-b65b-8dc5554273b2"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_9() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "c33e310a-daae-45d2-be3a-8a314eb72e0b"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_10() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "ac5af1d2-6a26-431b-b15e-b6f03c020ba5"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_11() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "3ad1161a-eda0-4a01-b78c-2ac606a9e149"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_12() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "4e3ea7c2-85dc-452f-9bc2-d24cb2881242"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_13() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "c1916551-bc48-4ea5-bb38-b32746f611c7"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_14() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "2062ed99-6342-4ea4-87f9-a2558afed26f"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"],[\"John\",\"john00@mail.com\"],[\"John\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_15() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "d8b75c2a-d001-459e-b05f-36cabbaae9d9"
        let rawInput = "accounts = [[\"John\",\"johnsmith@mail.com\",\"john_newyork@mail.com\"],[\"John\",\"johnsmith@mail.com\",\"john00@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]"
        let expectedOutput = "[[\"John\",\"john00@mail.com\",\"john_newyork@mail.com\",\"johnsmith@mail.com\"],[\"Mary\",\"mary@mail.com\"],[\"John\",\"johnnybravo@mail.com\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_16() async {
        let slug = "accounts-merge"
        let topic = "graphs"
        let testId = "e0598e2e-db04-4474-a63a-866344b86e9e"
        let rawInput = "accounts = [[\"Gabe\",\"Gabe0@m.co\",\"Gabe3@m.co\",\"Gabe1@m.co\"],[\"Kevin\",\"Kevin3@m.co\",\"Kevin5@m.co\",\"Kevin0@m.co\"],[\"Ethan\",\"Ethan5@m.co\",\"Ethan4@m.co\",\"Ethan0@m.co\"],[\"Hanzo\",\"Hanzo3@m.co\",\"Hanzo1@m.co\",\"Hanzo0@m.co\"],[\"Fern\",\"Fern5@m.co\",\"Fern1@m.co\",\"Fern0@m.co\"]]"
        let expectedOutput = "[[\"Ethan\",\"Ethan0@m.co\",\"Ethan4@m.co\",\"Ethan5@m.co\"],[\"Gabe\",\"Gabe0@m.co\",\"Gabe1@m.co\",\"Gabe3@m.co\"],[\"Hanzo\",\"Hanzo0@m.co\",\"Hanzo1@m.co\",\"Hanzo3@m.co\"],[\"Kevin\",\"Kevin0@m.co\",\"Kevin3@m.co\",\"Kevin5@m.co\"],[\"Fern\",\"Fern0@m.co\",\"Fern1@m.co\",\"Fern5@m.co\"]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_accounts = InputParser.parse2DStringArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[String]]: '\(params[0])'")
            return
        }
        guard p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: accounts 2D array too large (\(p_accounts.count))")
            return
        }

        // Constraint precondition checks
        guard p_accounts.count >= 1 && p_accounts.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= accounts.length <= 1000")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

}
