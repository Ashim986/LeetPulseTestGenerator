import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSuperPow {
    private class Solution {
        func superPow(_ a: Int, _ b: [Int], _ c: Int) -> Int {
          func pow(_ base: Int, _ exponent: Int) -> Int {
            var base = base
            var exponent = exponent
            var res = 1
            base %= 1337
            while exponent > 0 {
              if exponent % 2 == 1 { res = (res * base) % 1337 }
              base = (base * base) % 1337
              exponent /= 2
            }
            return res
          }
          return pow(a, pow(10, b.count - 1) * b[b.count - 1] + pow(10, b.count - 2) * b[b.count - 2])
        }
    }

    @Suite struct SuperPowTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f9460b71-1e1c-46a2-9c62-1346beb84a4c",
             input: "a = 1, b = [1], c = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a16e83db-baef-4131-a5a7-914c37498cff",
             input: "a = 2, b = [0], c = 3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ce7522ae-b52e-4a07-8ee1-bcfc5d42594b",
             input: "a = 3, b = [1, 0], c = 2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "78f0d208-292b-4e97-a05d-5c1cfaf70460",
             input: "a = 4, b = [2], c = 3",
             expected: "4", orderMatters: true),
            TestCaseData(id: "6480409b-a63f-4ef7-9a90-09c8db5dc276",
             input: "a = 5, b = [1, 2], c = 3",
             expected: "5", orderMatters: true),
            TestCaseData(id: "0809e598-fc59-4eee-a9cb-857e0f103357",
             input: "a = 6, b = [3], c = 2",
             expected: "6", orderMatters: true),
            TestCaseData(id: "fd1cc074-85a9-4b49-97ad-626de701289c",
             input: "a = 7, b = [1, 1], c = 3",
             expected: "7", orderMatters: true),
            TestCaseData(id: "7bd83730-691a-4348-9f11-2e986080e47f",
             input: "a = 8, b = [2, 0], c = 3",
             expected: "8", orderMatters: true),
            TestCaseData(id: "2ff97b2e-3751-41e7-9645-bebf0a63bd4d",
             input: "a = 9, b = [3], c = 1",
             expected: "9", orderMatters: true),
            TestCaseData(id: "c6451f8d-ffc2-47ce-acec-55f0d4a0b9a7",
             input: "a = 10, b = [0, 1], c = 2",
             expected: "10", orderMatters: true),
            TestCaseData(id: "932c0a24-57c4-4440-a0cb-ca91f1b6aeac",
             input: "a = 11, b = [1], c = 3",
             expected: "11", orderMatters: true),
            TestCaseData(id: "c46c3b4d-11eb-495d-8a10-4827f5c8bf43",
             input: "a = 12, b = [2, 1], c = 3",
             expected: "12", orderMatters: true),
            TestCaseData(id: "f6e0b3fc-297e-41be-bdcd-d0373d5044b9",
             input: "a = 13, b = [3, 0], c = 2",
             expected: "13", orderMatters: true),
            TestCaseData(id: "777b01b1-f0de-4c0d-9edb-af94d39af64c",
             input: "a = 14, b = [1, 2, 0], c = 3",
             expected: "14", orderMatters: true),
            TestCaseData(id: "10bfe1ad-7dd0-4202-a6e1-9f18c059fe52",
             input: "a = 15, b = [2, 2], c = 3",
             expected: "15", orderMatters: true),
            TestCaseData(id: "b0fb4dff-caee-4589-a87d-3aace227922c",
             input: "a = 16, b = [3, 1], c = 2",
             expected: "16", orderMatters: true),
            TestCaseData(id: "4ea6653e-f0c1-474c-b290-fc5d3510847d",
             input: "a = 17, b = [0, 0, 1], c = 3",
             expected: "17", orderMatters: true),
            TestCaseData(id: "757a0459-a1c7-4239-9b86-2cf0cdcd21d6",
             input: "a = 18, b = [1, 1, 1], c = 3",
             expected: "18", orderMatters: true),
            TestCaseData(id: "399599e8-dee6-46bd-8998-81ac295a7052",
             input: "a = 19, b = [2, 0, 0], c = 3",
             expected: "19", orderMatters: true),
            TestCaseData(id: "4c041529-11b6-4981-a64a-2c82799e6593",
             input: "a = 20, b = [3, 0, 0], c = 2",
             expected: "20", orderMatters: true),
            TestCaseData(id: "473e8ed8-56f1-4448-a0d9-02f00a1edc53",
             input: "a = -1, b = [1], c = 1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "e7c79a75-201f-44da-8a8d-ec2986f4666f",
             input: "a = -2, b = [0], c = 3",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "d732efd0-6eeb-4bb6-b45a-ffe8df8f9896",
             input: "a = -3, b = [1, 0], c = 2",
             expected: "-3", orderMatters: true),
            TestCaseData(id: "2c282fe9-13f0-419f-a720-305431c80445",
             input: "a = -4, b = [2], c = 3",
             expected: "-4", orderMatters: true),
            TestCaseData(id: "f91564e9-d24e-4c74-b568-d1e51b609a6b",
             input: "a = -5, b = [1, 2], c = 3",
             expected: "-5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "super-pow"
            let topic = "math-geometry"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            guard let p_a = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_b = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_b.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: b array too large (\(p_b.count))"
                )
                return
            }
            guard let p_c = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_a >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= a <= 231 - 1"
                )
                return
            }
            guard p_b.count >= 1 && p_b.count <= 2000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= b.length <= 2000"
                )
                return
            }
            guard p_b.allSatisfy({ $0 >= 0 && $0 <= 9 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= b[i] <= 9"
                )
                return
            }

            let solution = Solution()
            let result = solution.superPow(p_a, p_b, p_c)
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
