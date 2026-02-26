import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCopyListWithRandomPointer {
    private typealias Node = RandomNode

    private class Solution {
        func copyRandomList(_ head: Node?) -> Node? {
            guard head != nil else { return nil }

            // Phase 1: Insert copies after originals
            var curr = head
            while let node = curr {
                let copy = Node(node.val)
                copy.next = node.next
                node.next = copy
                curr = copy.next
            }

            // Phase 2: Set random pointers
            curr = head
            while let node = curr {
                let copy = node.next
                copy?.random = node.random?.next  // Random's copy is right after random
                curr = copy?.next
            }

            // Phase 3: Separate lists
            let dummy = Node(0)
            var copyTail = dummy
            curr = head
            while let node = curr {
                let copy = node.next.unsafelyUnwrapped
                let nextOrig = copy.next

                // Extract copy
                copyTail.next = copy
                copyTail = copy

                // Restore original
                node.next = nextOrig
                curr = nextOrig
            }

            return dummy.next
        }
    }

    @Suite struct CopyListWithRandomPointerTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "68691F6A-DCE3-4C3D-8B5F-E9A34A320F73",
             input: "[[7,null],[13,0],[11,4],[10,2],[1,0]]",
             expected: "[[7,null],[13,0],[11,4],[10,2],[1,0]]", orderMatters: true),
            TestCaseData(id: "307978D5-F0F8-4A98-8F7D-B7BE4FC0589F",
             input: "[[1,null]]",
             expected: "[[1,null]]", orderMatters: true),
            TestCaseData(id: "CE44A648-82EE-485C-B527-5BAFE759B04C",
             input: "[[1,0]]",
             expected: "[[1,0]]", orderMatters: true),
            TestCaseData(id: "5DD16B44-F195-4CF9-8CF3-283ABD7661CB",
             input: "[[1,1],[2,0]]",
             expected: "[[1,1],[2,0]]", orderMatters: true),
            TestCaseData(id: "A1C3C0F2-5397-40C8-8A54-6A0488521120",
             input: "[[1,1],[2,1],[3,0]]",
             expected: "[[1,1],[2,1],[3,0]]", orderMatters: true),
            TestCaseData(id: "FC040F1A-990A-46D5-B9FA-01EBF295A875",
             input: "[[1,2],[2,0],[3,1]]",
             expected: "[[1,2],[2,0],[3,1]]", orderMatters: true),
            TestCaseData(id: "59D3E68A-3137-4528-B412-12CD22A591C4",
             input: "[[1,0],[2,0],[3,0]]",
             expected: "[[1,0],[2,0],[3,0]]", orderMatters: true),
            TestCaseData(id: "81D4A608-052E-45C6-A05D-1D7FB74F0C34",
             input: "[[1,0],[1,0],[1,0]]",
             expected: "[[1,0],[1,0],[1,0]]", orderMatters: true),
            TestCaseData(id: "84A7C9EE-4D06-4321-BA1F-B37BF8135F09",
             input: "[[0,null],[1,null],[2,null]]",
             expected: "[[0,null],[1,null],[2,null]]", orderMatters: true),
            TestCaseData(id: "32446074-E601-49ED-A1DA-0C7D7705059F",
             input: "[[0,2],[1,1],[2,0]]",
             expected: "[[0,2],[1,1],[2,0]]", orderMatters: true),
            TestCaseData(id: "8B4BACFA-9052-44DA-B175-984985CE4C90",
             input: "[[1,null],[2,null],[3,null],[4,null],[5,null]]",
             expected: "[[1,null],[2,null],[3,null],[4,null],[5,null]]", orderMatters: true),
            TestCaseData(id: "C666E998-0357-45E6-82C1-D55F63534013",
             input: "[[1,4],[2,3],[3,2],[4,1],[5,0]]",
             expected: "[[1,4],[2,3],[3,2],[4,1],[5,0]]", orderMatters: true),
            TestCaseData(id: "309EB43D-02D7-4220-B0B6-F0D059988E47",
             input: "[[1,0],[2,1],[3,2],[4,3],[5,4]]",
             expected: "[[1,0],[2,1],[3,2],[4,3],[5,4]]", orderMatters: true),
            TestCaseData(id: "7D711557-81B1-47B3-B43F-9ABA55967BD5",
             input: "[[1,1],[2,0],[3,2],[4,1],[5,3]]",
             expected: "[[1,1],[2,0],[3,2],[4,1],[5,3]]", orderMatters: true),
            TestCaseData(id: "C39AEB43-855B-4403-A0E4-2E1F1CA54E6A",
             input: "[[1,2],[2,3],[3,4],[4,0],[5,1]]",
             expected: "[[1,2],[2,3],[3,4],[4,0],[5,1]]", orderMatters: true),
            TestCaseData(id: "036F5908-F179-4203-BB3E-96D22F0E6B83",
             input: "[[1,3],[2,4],[3,1],[4,2],[5,0]]",
             expected: "[[1,3],[2,4],[3,1],[4,2],[5,0]]", orderMatters: true),
            TestCaseData(id: "8A610C8A-53F9-4F1B-98A0-A833F43C94BB",
             input: "[[1,4],[2,4],[3,4],[4,4],[5,4]]",
             expected: "[[1,4],[2,4],[3,4],[4,4],[5,4]]", orderMatters: true),
            TestCaseData(id: "E0A1A53E-A287-4FFD-9DB7-F2E40CC1FDB1",
             input: "[[1,0],[1,1],[1,2],[1,3],[1,4]]",
             expected: "[[1,0],[1,1],[1,2],[1,3],[1,4]]", orderMatters: true),
            TestCaseData(id: "060C7169-55F7-48A7-A013-EC432BA67E1D",
             input: "[[1,4],[1,3],[1,2],[1,1],[1,0]]",
             expected: "[[1,4],[1,3],[1,2],[1,1],[1,0]]", orderMatters: true),
            TestCaseData(id: "65AC530E-5223-475E-8F52-243FDE96E49F",
             input: "[[1,2],[2,1],[3,3],[4,2],[5,1]]",
             expected: "[[1,2],[2,1],[3,3],[4,2],[5,1]]", orderMatters: true),
            TestCaseData(id: "97123C05-8A2D-45ED-8A34-C265D79E6824",
             input: "[[1,0],[2,1],[3,0],[4,1],[5,0]]",
             expected: "[[1,0],[2,1],[3,0],[4,1],[5,0]]", orderMatters: true),
            TestCaseData(id: "8A742F2B-CD7D-4D6B-9A56-4501795B193A",
             input: "[[1,-1]]",
             expected: "[[1,-1]]", orderMatters: true),
            TestCaseData(id: "A36FCE0C-1654-4AFD-897F-F34A46E6FE87",
             input: "[[0,0]]",
             expected: "[[0,0]]", orderMatters: true),
            TestCaseData(id: "48A9AED7-359B-4DD6-ACE0-CD381FD77F78",
             input: "[[1,0],[2,0]]",
             expected: "[[1,0],[2,0]]", orderMatters: true),
            TestCaseData(id: "B109D77A-BABD-4D86-83B2-16947682C5F4",
             input: "[[1,1],[2,1]]",
             expected: "[[1,1],[2,1]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "copy-list-with-random-pointer"
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

            guard let p_head = InputParser.parse2DIntArray(params[0]).map({ buildRandomList($0.map({ $0.map({ $0 == -1 ? nil : $0 }) as [Int?] })) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as RandomNode?"
                )
                return
            }

            let solution = Solution()
            let result = solution.copyRandomList(p_head)
            let computedOutput = serializeRandomList(result)

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
