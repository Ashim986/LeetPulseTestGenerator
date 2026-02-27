import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSelfDividingNumbers {
    private class Solution {
        func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
            var result: [Int] = []
            for num in left...right {
                if isSelfDividing(num) {
                    result.append(num)
                }
            }
            return result
        }

        func isSelfDividing(_ num: Int) -> Bool {
            var numCopy = num
            while numCopy > 0 {
                let digit = numCopy % 10
                if digit == 0 || num % digit != 0 {
                    return false
                }
                numCopy /= 10
            }
            return true
        }
    }

    @Suite struct SelfDividingNumbersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "aaaf3778-a40f-4437-bd24-9f8e3ceecae8",
             input: "left = 10, right = 0",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "89042cb2-a9ad-4ebf-9337-f7865791b379",
             input: "left = 10, right = -10",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "a4f9ef96-ac4f-44a7-b90c-2c97c698385e",
             input: "left = 0, right = 10",
             expected: "[0,1,2,3,4,5,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "b4336d06-c70d-4422-b315-177a6316eed9",
             input: "left = -10, right = 10",
             expected: "[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "f8c864f4-1c66-4007-abce-99f7eb7354a5",
             input: "left = -100, right = -10",
             expected: "[-100,-99,-98,-97,-96,-95,-94,-93,-92,-91,-90,-89,-88,-87,-86,-85,-84,-83,-82,-81,-80,-79,-78,-77,-76,-75,-74,-73,-72,-71,-70,-69,-68,-6"
                + "7,-66,-65,-64,-63,-62,-61,-60,-59,-58,-57,-56,-55,-54,-53,-52,-51,-50,-49,-48,-47,-46,-45,-44,-43,-42,-41,-40,-39,-38,-37,-36,-35,-34,-3"
                + "3,-32,-31,-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-20,-19,-18,-17,-16,-15,-14,-13,-12,-11,-10]", orderMatters: true),
            TestCaseData(id: "72960647-1dff-44bf-8424-e57dd159835d",
             input: "left = 1, right = 22",
             expected: "[1,2,3,4,5,6,7,8,9,11,12,15,22]", orderMatters: true),
            TestCaseData(id: "fe192824-ad2c-4c7a-8f90-fb567d17db8c",
             input: "left = 47, right = 85",
             expected: "[48,55,66,77]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "self-dividing-numbers"
            let topic = "math-geometry"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_left = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_right = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_left >= 1 && p_left <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= left <= right <= 104"
                )
                return
            }
            guard p_right >= 1 && p_right <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= left <= right <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.selfDividingNumbers(p_left, p_right)
            }
            guard !didCrash, let result = resultHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
