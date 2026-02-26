import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPrisonCellsAfterNDays {
    private class Solution {
        func prisonAfterNDays(_ cells: [Int], _ n: Int) -> [Int] {
            var cells = cells
            var seen: [String: Int] = [:]
            for day in 0..<n {
                let cellsStr = String(cells.map { String($0) }.joined())
                if let prevDay = seen[cellsStr] {
                    let cycleLength = day - prevDay
                    let remainingDays = (n - day) % cycleLength
                    for _ in 0..<remainingDays {
                        var nextCells = Array(repeating: 0, count: cells.count)
                        for i in 1..<cells.count-1 {
                            nextCells[i] = cells[i-1] == cells[i+1] ? 1 : 0
                        }
                        cells = nextCells
                    }
                    break
                } else {
                    seen[cellsStr] = day
                    var nextCells = Array(repeating: 0, count: cells.count)
                    for i in 1..<cells.count-1 {
                        nextCells[i] = cells[i-1] == cells[i+1] ? 1 : 0
                    }
                    cells = nextCells
                }
            }
            return cells
        }
    }

    @Suite struct PrisonCellsAfterNDaysTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "945c11f8-f506-4443-9997-7b8ec7b90a32",
             input: "cells = [1,1,1,1,1,1,1,1], n = 0",
             expected: "[1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "d1e5b969-78c3-4eed-b646-5a21ef6fe55e",
             input: "cells = [0,1,0,1,1,0,0,1], n = 1",
             expected: "[0,1,1,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "885eb028-ac75-4032-b253-ee27baf716c6",
             input: "cells = [0,0,0,0,0,0,0,0], n = 0",
             expected: "[0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "b5501541-b38c-4e68-b628-2689a284179f",
             input: "cells = [0,1,0,1,1,0,0,1], n = 8",
             expected: "[0,0,1,1,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "ca352181-c48e-4935-8fb0-7970a3898153",
             input: "cells = [0,1,0,1,1,0,0,1], n = 17",
             expected: "[0,0,1,1,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "29256c0e-f753-4360-be61-dd6650c14250",
             input: "cells = [0,1,0,1,1,0,0,1], n = 18",
             expected: "[0,0,1,1,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "7be8e374-d2b4-4fb9-86e9-e5d53e7c03ea",
             input: "cells = [1,0,0,1,0,0,1,0], n = 1",
             expected: "[0,0,0,1,0,0,1,0]", orderMatters: true),
            TestCaseData(id: "28b1fa36-9b74-4c2a-9e30-c4f70133eccd",
             input: "cells = [0,0,0,0,0,0,0,0], n = 10",
             expected: "[0,0,0,1,1,0,0,0]", orderMatters: true),
            TestCaseData(id: "a72ad765-6398-476f-934d-419f8c7260bc",
             input: "cells = [0,1,0,1,1,0,0,1], n = 14",
             expected: "[0,0,1,1,0,1,0,0]", orderMatters: true),
            TestCaseData(id: "ffe08277-85b8-49c3-b138-39c7880b468f",
             input: "cells = [0,0,0,0,0,0,0,0], n = 100000",
             expected: "[0,0,0,1,1,0,0,0]", orderMatters: true),
            TestCaseData(id: "1ea1f313-4fc5-480c-aa0f-d8fa3d8cf0b1",
             input: "cells = [1,1,1,1,1,1,1,1], n = 100000",
             expected: "[0,1,1,1,1,1,1,0]", orderMatters: true),
            TestCaseData(id: "041a7dc8-dd06-4242-bf12-9da4d03bb5c1",
             input: "cells = [0,1,0,1,1,0,0,1], n = 28",
             expected: "[0,0,1,1,0,1,0,0]", orderMatters: true),
            TestCaseData(id: "fc3f673c-0e09-4c26-b3be-5a80860cc3d4",
             input: "cells = [0,0,0,0,0,0,0,0], n = 1",
             expected: "[0,1,1,1,1,1,1,0]", orderMatters: true),
            TestCaseData(id: "1e22bdb6-27f9-4156-921b-c99354d1255f",
             input: "cells = [1,0,0,1,0,0,1,0], n = 2",
             expected: "[0,0,1,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "76095c59-6f0f-4c4b-9f42-41f17d5b9746",
             input: "cells = [1,1,1,1,1,1,1,1], n = 1",
             expected: "[0,1,1,1,1,1,1,0]", orderMatters: true),
            TestCaseData(id: "bb2970a5-2af2-4c3b-bd3d-d10ce765b241",
             input: "cells = [1,0,0,1,0,0,1,0], n = 3",
             expected: "[0,1,1,1,0,0,1,0]", orderMatters: true),
            TestCaseData(id: "3ef91e8b-8892-40b7-8ba9-805cc871ad64",
             input: "cells = [0,0,0,0,0,0,0,0], n = 8",
             expected: "[0,1,1,1,1,1,1,0]", orderMatters: true),
            TestCaseData(id: "4bb8d578-7a9c-4878-b51f-6ee5cc70cad3",
             input: "cells = [1,1,1,1,1,1,1,1], n = 8",
             expected: "[0,1,1,1,1,1,1,0]", orderMatters: true),
            TestCaseData(id: "88d15de7-64e8-4840-8695-ae38172d6706",
             input: "cells = [0,1,0,1,1,0,0,1], n = 15",
             expected: "[0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "4d732dbb-ecef-4e45-90aa-4705a7eaed3d",
             input: "cells = [1,0,0,1,0,0,1,0], n = 4",
             expected: "[0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "3b5037ea-a474-4094-a022-af9a99e9b77b",
             input: "cells = [0,0,0,0,0,0,0,0], n = 9",
             expected: "[0,1,1,1,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "ebce93d5-0750-47e6-b4c1-fd92f4baf525",
             input: "cells = [1,1,1,1,1,1,1,1], n = 9",
             expected: "[0,0,1,1,1,1,0,0]", orderMatters: true),
            TestCaseData(id: "b2fc2b0e-268e-4b0a-9fa6-9afb4467e520",
             input: "cells = [0,1,0,1,1,0,0,1], n = 16",
             expected: "[0,0,0,0,1,1,1,0]", orderMatters: true),
            TestCaseData(id: "2d9e3f59-0942-467a-886c-196460f3686b",
             input: "cells = [1,0,0,1,0,0,1,0], n = 5",
             expected: "[0,0,1,0,1,0,1,0]", orderMatters: true),
            TestCaseData(id: "d8a3ecb6-cce3-4785-aaa5-3b635eb69369",
             input: "cells = [1,1,1,1,1,1,1,1], n = 10",
             expected: "[0,0,0,0,0,0,0,0]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "prison-cells-after-n-days"
            let topic = "math-geometry"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_cells = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_cells.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: cells array too large (\(p_cells.count))"
                )
                return
            }
            guard let p_n = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 109"
                )
                return
            }
            guard p_cells.count == 8 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: cells.length == 8"
                )
                return
            }

            let solution = Solution()
            let result = solution.prisonAfterNDays(p_cells, p_n)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
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
