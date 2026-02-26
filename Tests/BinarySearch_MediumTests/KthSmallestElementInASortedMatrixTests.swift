import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCKthSmallestElementInASortedMatrix {
    private class Solution {
        func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
            var minHeap = [Element]()
            for i in 0..<matrix.count {
                minHeap.append(Element(val: matrix[i][0], row: i, col: 0))
            }

            var heap = Heap(minHeap, isSorted: true)
            heap.sort()

            var kthSmallest = 0

            for _ in 1...k {
                let smallest = heap.pop()
                kthSmallest = smallest.val

                if smallest.col + 1 < matrix[smallest.row].count {
                    heap.insert(Element(val: matrix[smallest.row][smallest.col + 1], row: smallest.row, col: smallest.col + 1))
                    heap.sort()
                }
            }

            return kthSmallest
        }

        struct Element {
            let val: Int
            let row: Int
            let col: Int
        }

        struct Heap {
            var elements: [Element]
            let isSorted: Bool

            init(_ elements: [Element], isSorted: Bool) {
                self.elements = elements
                self.isSorted = isSorted
            }

            mutating func sort() {
                if isSorted {
                    elements.sort { $0.val < $1.val }
                }
            }

            mutating func insert(_ element: Element) {
                elements.append(element)
            }

            mutating func pop() -> Element {
                let smallest = elements.removeFirst()
                sort()
                return smallest
            }
        }
    }

    @Suite struct KthSmallestElementInASortedMatrixTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9613d3e1-4a05-4ab5-bf1b-a4d657e1dcd5",
             input: "matrix = [[1]], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e013d561-027d-423b-8e72-09bd0e13a4f2",
             input: "matrix = [[1,2],[3,4]], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e5d74527-9fd8-496d-8fc2-d54f15b4ac7f",
             input: "matrix = [[1,2],[3,4]], k = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "bb1801b5-6bac-409b-b935-206411e016e1",
             input: "matrix = [[1,2],[3,4]], k = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "632b9e06-8619-46a9-92b8-6b469fc7947e",
             input: "matrix = [[1,2],[3,4]], k = 4",
             expected: "4", orderMatters: true),
            TestCaseData(id: "bcf4724d-200f-4eac-ab5f-2bca51effd06",
             input: "matrix = [[5,5],[5,5]], k = 1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f295e19f-701d-4bd7-9039-fcb0b868d8b8",
             input: "matrix = [[5,5],[5,5]], k = 2",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9ec0ac20-345c-4e59-a85d-a723dabc6c1f",
             input: "matrix = [[5,5],[5,5]], k = 3",
             expected: "5", orderMatters: true),
            TestCaseData(id: "d269aab4-9fbb-4af0-8988-8d3c3102a401",
             input: "matrix = [[5,5],[5,5]], k = 4",
             expected: "5", orderMatters: true),
            TestCaseData(id: "2217eb94-919a-4efc-a026-a858529a004f",
             input: "matrix = [[-1,-2],[-3,-4]], k = 1",
             expected: "-4", orderMatters: true),
            TestCaseData(id: "e865688b-030a-446b-b840-0786527ad867",
             input: "matrix = [[-1,-2],[-3,-4]], k = 2",
             expected: "-3", orderMatters: true),
            TestCaseData(id: "8269644b-5caa-456b-952c-8ca94292577b",
             input: "matrix = [[-1,-2],[-3,-4]], k = 3",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "f913dc59-139b-47fe-ac94-783d362b66fa",
             input: "matrix = [[-1,-2],[-3,-4]], k = 4",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "6e2e97b7-2d07-4068-ba50-3ab2435d0879",
             input: "matrix = [[1,100],[2,200]], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "02a0ba43-33aa-44af-9ccf-9db071eb2114",
             input: "matrix = [[1,100],[2,200]], k = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "160af627-d6fa-48be-b948-7edf5d2bfffc",
             input: "matrix = [[1,100],[2,200]], k = 3",
             expected: "100", orderMatters: true),
            TestCaseData(id: "28501619-e2ff-407a-a7d3-1e6ed7abb77a",
             input: "matrix = [[1,100],[2,200]], k = 4",
             expected: "200", orderMatters: true),
            TestCaseData(id: "4cd23003-a1b0-4bd9-821e-e6df8639ef87",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "653e62a6-9e47-4433-ac64-f36b9fce1eef",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], k = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "bed84d4c-c793-4317-86a7-e8cca9b96b11",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], k = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "2b85c2a3-d90d-485a-b656-061f05d22a78",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], k = 9",
             expected: "9", orderMatters: true),
            TestCaseData(id: "40e9a9c3-991d-46b8-a24f-ffe3e0e15a48",
             input: "matrix = [[10,20,30],[40,50,60],[70,80,90]], k = 1",
             expected: "10", orderMatters: true),
            TestCaseData(id: "4af0e792-c933-4125-9394-0b8eb570b2c2",
             input: "matrix = [[10,20,30],[40,50,60],[70,80,90]], k = 2",
             expected: "20", orderMatters: true),
            TestCaseData(id: "c6955db0-ac19-4f45-ade9-451d58494779",
             input: "matrix = [[10,20,30],[40,50,60],[70,80,90]], k = 3",
             expected: "30", orderMatters: true),
            TestCaseData(id: "40c83b9e-3aec-4462-82f9-be143a9f5292",
             input: "matrix = [[10,20,30],[40,50,60],[70,80,90]], k = 9",
             expected: "90", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "kth-smallest-element-in-a-sorted-matrix"
            let topic = "binary-search"
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

            guard let p_matrix = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_matrix.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))"
                )
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
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
            guard p_k >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= n2"
                )
                return
            }

            let solution = Solution()
            let result = solution.kthSmallest(p_matrix, p_k)
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
