import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCInsertDeleteGetrandomO1 {
    private class Solution {
        class RandomizedSet {
            var dict: [Int: Int] = [:]
            var elements: [Int] = []
            func insert(_ val: Int) -> Bool {
                if dict.keys.contains(val) {
                    return false
                }
                dict[val] = elements.count
                elements.append(val)
                return true
            }
            func remove(_ val: Int) -> Bool {
                if let index = dict[val] {
                    let last = elements[elements.count - 1]
                    elements[index] = last
                    dict[last] = index
                    elements.removeLast()
                    dict.removeValue(forKey: val)
                    return true
                }
                return false
            }
            func getRandom() -> Int {
                return elements.randomElement().unsafelyUnwrapped
            }
        }
    }

    @Suite struct InsertDeleteGetrandomO1Tests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d1c4e8a8-8e7f-4900-85d2-b54dcfe3a1bc",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"remove\",\"insert\",\"insert\",\"remove\"]",
             expected: "[null,true,true,true,true,true,true,true]", orderMatters: true),
            TestCaseData(id: "554f2e94-4ce6-4c77-a0d1-fa0e61c90528",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\"]",
             expected: "[null,true,true,true,true,true,true,true]", orderMatters: true),
            TestCaseData(id: "d1682692-9947-4c1b-a25a-8b680c1ac506",
             input: "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\"]",
             expected: "[null,true,false,true,true,true,true,true]", orderMatters: true),
            TestCaseData(id: "f95c516a-0e43-4545-bb26-57aeabf004a8",
             input: "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"getRandom\",\"remove\",\"insert\",\"getRandom\"]",
             expected: "[null,true,false,true,1,true,false,2]", orderMatters: true),
            TestCaseData(id: "c0602f12-d5d0-4244-bbe4-2140df6fce90",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"getRandom\",\"remove\",\"insert\",\"getRandom\"]",
             expected: "[null,true,true,1,true,true,2]", orderMatters: true),
            TestCaseData(id: "b071064a-0126-497a-b5ac-86f6c01deba6",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"getRandom\",\"remove\",\"getRandom\"]",
             expected: "[null,true,true,true,1,true,1]", orderMatters: true),
            TestCaseData(id: "50e001e9-a67c-438a-9d5a-58d85cf0ed7b",
             input: "[\"RandomizedSet\",\"remove\",\"insert\",\"remove\",\"insert\",\"getRandom\"]",
             expected: "[null,false,true,true,true,2]", orderMatters: true),
            TestCaseData(id: "55d0dc56-4434-4948-ae42-1fc68f19e608",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"getRandom\",\"remove\",\"getRandom\"]",
             expected: "[null,true,true,true,true,1,true,1]", orderMatters: true),
            TestCaseData(id: "4cc4f7c7-aa5e-40a6-b48a-ea407b2cad80",
             input: "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"remove\",\"insert\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "1d7fc6b5-bd1f-4d6d-b350-1cf3ba13c9f3",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"remove\",\"insert\",\"remove\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "e544c527-54b0-4456-aefc-b31b48844f20",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"remove\",\"remove\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,2]", orderMatters: true),
            TestCaseData(id: "d3f4b983-a081-4597-88c1-ba37eec613ae",
             input: "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"remove\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "d57be839-857c-4d9e-9aa8-bfc4c2e8426f",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"remove\",\"insert\",\"insert\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,2]", orderMatters: true),
            TestCaseData(id: "88e1cd7b-ed86-41d6-9f80-0f691fe7d547",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"getRandom\",\"remove\"]",
             expected: "[null,true,true,true,true,true,1,true]", orderMatters: true),
            TestCaseData(id: "c5ad945c-b77a-47b3-800e-41ca6bc6778b",
             input: "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"remove\",\"insert\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "fd608459-f1d7-4a78-9bb4-3763173083a3",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"remove\",\"insert\",\"remove\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "21a37256-d152-40eb-bc8f-15de758a9c1f",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"remove\",\"insert\",\"insert\",\"insert\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,true,2]", orderMatters: true),
            TestCaseData(id: "4eaa34aa-c85a-4fba-a8a3-4823bb4ccc15",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"remove\",\"remove\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "5317687f-c0a4-40df-8eed-6ab7fb7fbd38",
             input: "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"insert\",\"remove\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "6f098b72-52f5-496e-8f59-5efb7af972f2",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,true,1]", orderMatters: true),
            TestCaseData(id: "517e04f2-2465-405c-8dc2-8f9cbd08f5a5",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"remove\",\"remove\",\"insert\",\"insert\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "2e600a4c-ceb0-41b1-a562-369b02754203",
             input: "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"insert\",\"insert\",\"getRandom\"]",
             expected: "[null,true,true,true,true,true,true,2]", orderMatters: true),
            TestCaseData(id: "57066931-66ea-455a-8d01-64d363a9c42e",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"remove\",\"remove\",\"remove\"]",
             expected: "[null,true,true,true,true,false,false,false]", orderMatters: true),
            TestCaseData(id: "a782baaa-dec9-449b-99e6-5f2ab8d57d0f",
             input: "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"remove\"]",
             expected: "[null,true,true,true,true,true,true,false]", orderMatters: true),
            TestCaseData(id: "1ec94497-1db9-4f72-b1e4-690eccfa739e",
             input: "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"insert\",\"remove\",\"insert\"]",
             expected: "[null,true,false,true,true,true,false,true]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "insert-delete-getrandom-o1"
            let topic = "math-geometry"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

            var results: [String] = []
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                switch methodName {
                case "insert":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    let rv = obj.insert(mArg_0)
                    results.append(rv ? "true" : "false")
                case "remove":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    let rv = obj.remove(mArg_0)
                    results.append(rv ? "true" : "false")
                case "getRandom":
                    let rv = obj.getRandom()
                    results.append("\(rv)")
                default:
                    results.append("null")
                }
            }

            let computedOutput = "[" + results.joined(separator: ",") + "]"
            // Class-design comparison: normalize null representations and whitespace
            func normalizeClassOutput(_ s: String) -> String {
                var result = s.replacingOccurrences(of: " ", with: "")
                result = result.replacingOccurrences(of: "nil", with: "null")
                result = result.replacingOccurrences(of: "None", with: "null")
                result = result.replacingOccurrences(of: "NULL", with: "null")
                return result
            }
            let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
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
