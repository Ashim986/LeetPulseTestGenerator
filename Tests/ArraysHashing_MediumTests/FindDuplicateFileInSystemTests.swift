import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindDuplicateFileInSystem {
    private class Solution {
        func findDuplicate(
           paths: [String]) -> [[String]] {
           var result: [[String]] = []
           var contentMap: [String: [String]] = [:]

           for path in paths {
              let components = path.components(separatedBy: " ")
              let fileName = components[components.startIndex]
              let fileContent = components[components.count - 1]

              if contentMap[fileContent] != nil {
                 contentMap[fileContent].unsafelyUnwrapped.append(fileName)
              } else {
                 contentMap[fileContent] = [fileName]
              }
           }

           for (_, values) in contentMap {
              if values.count > 1 {
                 result.append(values)
              }
           }

           return result
        }
    }

    @Suite struct FindDuplicateFileInSystemTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e89e587b-feb1-4a74-bc55-220e0e2972e3",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(efgh)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "85ef4cf5-f584-492a-b86d-4ae0220bd5f9",
             input: "paths = []",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "f88957f9-517d-4b5c-9bd9-dd532a6a19e0",
             input: "paths = [\"root/a\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "c3dca01c-6f18-49d8-8378-18317c8b98df",
             input: "paths = [\"root/a 1.txt(abcd)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "bbea6466-d078-4504-b069-d47e5fdc28d4",
             input: "paths = [\"root/a 1.txt(abcd)\", \"root/b 1.txt(abcd)\"]",
             expected: "[[\"root/a\",\"root/b\"]]", orderMatters: false),
            TestCaseData(id: "1ff31458-8663-4988-bbac-74c9557851a1",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "de5f24ff-74a5-42e5-a316-a9b4ccfcc6fe",
             input: "paths = [\"root/a 1.txt(abcd)\", \"root/b 2.txt(abcd)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "d591abf8-14cf-4d7c-b7d2-13d124c16e76",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd) 3.txt(abcd)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "d2eb4a4d-81fa-49de-886f-2d79bbc91653",
             input: "paths = [\"root/a 1.txt(abcd)\", \"root/b 1.txt(abcd)\", \"root/c 1.txt(abcd)\"]",
             expected: "[[\"root/a\",\"root/b\",\"root/c\"]]", orderMatters: false),
            TestCaseData(id: "19194f10-7d10-4ef2-8faa-d85302445d7a",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd) 3.txt(abcd)\", \"root/b 1.txt(abcd) 2.txt(abcd) 3.txt(abcd)\"]",
             expected: "[[\"root/a\",\"root/b\"]]", orderMatters: false),
            TestCaseData(id: "f6794916-1c4c-49fb-a76b-73a2e020daca",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd) 3.txt(abcd)\", \"root/b 4.txt(abcd) 5.txt(abcd) 6.txt(abcd)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "2b000def-2f8d-4935-be08-1af780840f36",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd) 3.txt(abcd)\", \"root/b 1.txt(abcd) 2.txt(abcd) 3.txt(abcd)\", \"root/c 1.txt(abcd) 2.txt(abcd"
                + ") 3.txt(abcd)\"]",
             expected: "[[\"root/a\",\"root/b\",\"root/c\"]]", orderMatters: false),
            TestCaseData(id: "a966de0e-eaa9-43db-b5df-d0d7d01e0675",
             input: "paths = [\"root/a 1.txt(abcd)\", \"root/b 2.txt(abcd)\", \"root/c 3.txt(abcd)\", \"root/d 4.txt(abcd)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "f83c2405-8da2-40a7-825d-fc29daf32b27",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd) 3.txt(abcd) 4.txt(abcd)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "e03e51f5-eb2a-413c-ac99-f9c59e805606",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd) 3.txt(abcd) 4.txt(abcd)\", \"root/b 1.txt(abcd) 2.txt(abcd) 3.txt(abcd) 4.txt(abcd)\"]",
             expected: "[[\"root/a\",\"root/b\"]]", orderMatters: false),
            TestCaseData(id: "5281f9c6-1725-4f3e-a917-0d4785840857",
             input: "paths = [\"root/a 1.txt(abcd)\", \"root/b 1.txt(abcd)\", \"root/c 1.txt(abcd)\", \"root/d 1.txt(abcd)\", \"root/e 1.txt(abcd)\"]",
             expected: "[[\"root/a\",\"root/b\",\"root/c\",\"root/d\",\"root/e\"]]", orderMatters: false),
            TestCaseData(id: "2e905d9c-363e-4c89-b1db-4460c704d194",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd) 3.txt(abcd) 4.txt(abcd) 5.txt(abcd)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "50f3f0bf-c9b2-43d9-af7d-fd031cc14877",
             input: "paths = [\"root/a 1.txt(abcd)\", \"root/b 1.txt(abcd)\", \"root/c 1.txt(abcd)\", \"root/d 1.txt(abcd)\", \"root/e 1.txt(abcd)\", \"root/"
                + "f 1.txt(abcd)\"]",
             expected: "[[\"root/a\",\"root/b\",\"root/c\",\"root/d\",\"root/e\",\"root/f\"]]", orderMatters: false),
            TestCaseData(id: "83ac00c5-8f2d-426b-9045-f1b60b469658",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd) 3.txt(abcd) 4.txt(abcd) 5.txt(abcd) 6.txt(abcd)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "4f379765-b81b-4f95-a355-525866432956",
             input: "paths = [\"root/a 1.txt(abcd)\", \"root/b 1.txt(abcd)\", \"root/c 1.txt(abcd)\", \"root/d 1.txt(abcd)\", \"root/e 1.txt(abcd)\", \"root/"
                + "f 1.txt(abcd)\", \"root/g 1.txt(abcd)\"]",
             expected: "[[\"root/a\",\"root/b\",\"root/c\",\"root/d\",\"root/e\",\"root/f\",\"root/g\"]]", orderMatters: false),
            TestCaseData(id: "876830f6-408f-4c64-be38-480fa58aa621",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd) 3.txt(abcd) 4.txt(abcd) 5.txt(abcd) 6.txt(abcd) 7.txt(abcd)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "5c29338f-b51b-46dd-a8e8-dad9c9e75fb5",
             input: "paths = [\"root/a 1.txt(abcd)\", \"root/b 1.txt(abcd)\", \"root/c 1.txt(abcd)\", \"root/d 1.txt(abcd)\", \"root/e 1.txt(abcd)\", \"root/"
                + "f 1.txt(abcd)\", \"root/g 1.txt(abcd)\", \"root/h 1.txt(abcd)\"]",
             expected: "[[\"root/a\",\"root/b\",\"root/c\",\"root/d\",\"root/e\",\"root/f\",\"root/g\",\"root/h\"]]", orderMatters: false),
            TestCaseData(id: "fb785ac5-acbf-4af1-a597-24296410bb58",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd) 3.txt(abcd) 4.txt(abcd) 5.txt(abcd) 6.txt(abcd) 7.txt(abcd) 8.txt(abcd)\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "d0e84dc1-6dfe-4935-9d7b-a953223dd4d0",
             input: "paths = [\"root/a 1.txt(abcd)\", \"root/b 1.txt(abcd)\", \"root/c 1.txt(abcd)\", \"root/d 1.txt(abcd)\", \"root/e 1.txt(abcd)\", \"root/"
                + "f 1.txt(abcd)\", \"root/g 1.txt(abcd)\", \"root/h 1.txt(abcd)\", \"root/i 1.txt(abcd)\"]",
             expected: "[[\"root/a\",\"root/b\",\"root/c\",\"root/d\",\"root/e\",\"root/f\",\"root/g\",\"root/h\",\"root/i\"]]", orderMatters: false),
            TestCaseData(id: "3f6c17ac-b4b9-499c-95a9-80ecfa01228a",
             input: "paths = [\"root/a 1.txt(abcd) 2.txt(abcd) 3.txt(abcd) 4.txt(abcd) 5.txt(abcd) 6.txt(abcd) 7.txt(abcd) 8.txt(abcd) 9.txt(abcd)\"]",
             expected: "[]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-duplicate-file-in-system"
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

            guard let p_paths = InputParser.parseStringArray(params[0]) else {
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
            guard p_paths.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: paths array too large (\(p_paths.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_paths.count >= 1 && p_paths.count <= 20000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= paths.length <= 2 * 10^4"
                )
                return
            }
            guard p_paths.allSatisfy({ $0.count >= 1 && $0.count <= 3000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= paths[i].length <= 3000"
                )
                return
            }

            let solution = Solution()
            let result = solution.findDuplicate(paths: p_paths)
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
