import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLinkedListCycle {
    private class Solution {
        func hasCycle(_ head: ListNode?) -> Bool {
            var visited = Set<ObjectIdentifier>()
            var current = head

            while let node = current {
                let id = ObjectIdentifier(node)
                if visited.contains(id) {
                    return true
                }
                visited.insert(id)
                current = node.next
            }

            return false
        }
    }

    @Suite struct LinkedListCycleTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "B315DD5E-CB10-477B-B4B8-D20C807D4D14",
             input: "[3,2,0,-4]\n1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0D1A685B-885B-4D0C-ACF6-91DD8A34693D",
             input: "[1,2]\n0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "21DE3D32-1295-4318-8B72-25A0BDF51613",
             input: "[1]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5CB491AC-32A9-446E-AB2A-F3EB0A9CE417",
             input: "[1,2]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0BA7B648-79F4-48AD-9F6C-CCFD6B88E541",
             input: "[]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "60E74F56-C3B4-4173-A5AF-9E02DB92285D",
             input: "[1,2,3,4,5,6]\n2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "DB1C756B-80CF-4DB9-869A-F5E689898EBE",
             input: "[1,-1,7,1]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0AE8897E-52DE-4739-B552-3FD138282680",
             input: "[-2,1,-3,4,-1,2,1,-5,4]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "E7B5E068-3FEC-4039-83C6-514698AEB466",
             input: "[1,2,3,4,5,6]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "D9E2561F-BA90-41C9-9790-721084DCDB15",
             input: "[3,2]\n0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3D1A9B0C-4840-4BFF-8CAD-FF688B4FBE1D",
             input: "[-1,-1]\n0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "57FE8EC9-59EB-4AB8-B66A-69217D04EDC6",
             input: "[0,0]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3B831820-0749-4DEC-910C-D8C81D42B0D8",
             input: "[5,6]\n0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8FC3869C-F3B9-43F5-99FA-C4A113C37974",
             input: "[7,7,7,7]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "A9C17250-622B-4CD7-84FD-5FD2AA0A50C0",
             input: "[0]\n0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "07D70E98-1FC3-4B59-8269-780311986887",
             input: "[-1]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3C40996A-40F9-4171-8428-1A8EE031F49F",
             input: "[1,2,3,4,5,6,7,8,9,10]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3741A422-76C2-484C-B931-C176F9F0FF3C",
             input: "[1,3,4,5,7,6,2,8,9]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "B9A8EEF8-D5A6-4874-9AB6-430EC35B63B0",
             input: "[1,3,4,5,7,6,2,8,9]\n5",
             expected: "true", orderMatters: true),
            TestCaseData(id: "51B6B692-EA96-4778-984B-AE97A78E12FC",
             input: "[1,3,4,5,7,6,2,8,9]\n0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4446EAD6-1865-447C-BFD5-1A7EBE6AA1F7",
             input: "[1,2,3,4,5,6,7,8]\n0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2F207E16-A2A3-486C-A787-B4B1C1B20FAD",
             input: "[7,3,1,1,2,6]\n1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "A1C66E9C-DD4F-4D1B-8262-31CD3B135301",
             input: "[7,3,1,1,2,6]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0A243221-AC28-4638-ADAB-30A7D198C266",
             input: "[5,3,7,4,2,9,1,6,8]\n-1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "A92F57D2-6E5B-40D2-AD2A-66FDFC665C12",
             input: "[3,1,2]\n-1",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "linked-list-cycle"
            let topic = "linked-list"
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

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as ListNode?"
                )
                return
            }

            let solution = Solution()
            let result = solution.hasCycle(p_head)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
