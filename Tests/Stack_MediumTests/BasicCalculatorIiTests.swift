import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBasicCalculatorIi {
    private class Solution {
        func calculate(_ s: String) -> Int {
            var stack: [Int] = []
            var num = 0, op: Character = "+"
            let s = s + "+"
            for char in s {
                if char.isNumber {
                    num = num * 10 + Int(String(char)).unsafelyUnwrapped
                } else if char != " " {
                    switch op {
                    case "+": stack.append(num)
                    case "-": stack.append(-num)
                    case "*": stack.append(stack.removeLast() * num)
                    case "/": stack.append(stack.removeLast() / num)
                    default: break
                    }
                    op = char; num = 0
                }
            }
            return stack.reduce(0, +)
        }
    }

    @Suite struct BasicCalculatorIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "16802536-0f32-4f97-a2f7-9f1c9edae7e2",
             input: "s = \"1+1\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e20d1dc6-1c67-4007-ad81-22b788074a06",
             input: "s = \"6-4/2\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "042a437d-f46f-49a2-a730-9efcae514c36",
             input: "s = \"2*3+4*5\"",
             expected: "26", orderMatters: true),
            TestCaseData(id: "714ebe05-8775-4832-906e-2c73ab4b9dac",
             input: "s = \"0\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c0ca8bde-2d31-4c6d-99e0-1577b0bbc9de",
             input: "s = \"10\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "0f752255-764b-49d1-ab74-11c87b2bfdae",
             input: "s = \"-1+1\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "153e56d0-a82e-4963-9525-e23449ad3c30",
             input: "s = \"1+2*3-4/2\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "6ed77eaf-578f-436b-95f2-bb02a81131d3",
             input: "s = \"1000*1000\"",
             expected: "1000000", orderMatters: true),
            TestCaseData(id: "738b0dfc-412d-4bc5-870d-1e9878a052f5",
             input: "s = \"1+2+3+4+5\"",
             expected: "15", orderMatters: true),
            TestCaseData(id: "99bdfb2c-e0fb-4fdc-99f2-47b30b0b62f6",
             input: "s = \"-10+20-30+40-50\"",
             expected: "-30", orderMatters: true),
            TestCaseData(id: "7438e63f-130a-4c9c-9e25-ff7b8ffedd54",
             input: "s = \"10/2*3\"",
             expected: "15", orderMatters: true),
            TestCaseData(id: "2a19784c-34f3-494b-b317-2858c4bba326",
             input: "s = \"10/2/2\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5ffd61fa-4c2a-467a-b65c-6d0cfbc29112",
             input: "s = \"10*2/2\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "dfaaf00f-c868-4b89-a11a-4f542b8834cb",
             input: "s = \"10+10+10\"",
             expected: "30", orderMatters: true),
            TestCaseData(id: "22b97967-3c7b-4727-92b5-3e1c292f95d6",
             input: "s = \"-10-20-30\"",
             expected: "-60", orderMatters: true),
            TestCaseData(id: "6bed3e16-2f50-45c4-a9ad-d93705dc2015",
             input: "s = \"10-10-10\"",
             expected: "-10", orderMatters: true),
            TestCaseData(id: "31896091-ffac-47a2-b3e6-e7f885cc4567",
             input: "s = \"10*10*10\"",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "c548aadc-e4b6-41d5-ba30-b84689caa9fa",
             input: "s = \"10/10/10\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "727dda6c-971f-4301-88cf-880839d8675d",
             input: "s = \"10+20*30\"",
             expected: "610", orderMatters: true),
            TestCaseData(id: "992dcb7e-3368-4abb-b777-7d05a55294fb",
             input: "s = \"10*20+30\"",
             expected: "230", orderMatters: true),
            TestCaseData(id: "d77d4cdd-1176-4c07-a6cf-caa6f52f5a67",
             input: "s = \"10/20+30\"",
             expected: "30", orderMatters: true),
            TestCaseData(id: "0c40f182-90cb-4b4c-8fec-e42539eb82af",
             input: "s = \"10+20/30\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "901f5c44-9279-4aa7-825a-c8938c13b24a",
             input: "s = \"10-20*30\"",
             expected: "-590", orderMatters: true),
            TestCaseData(id: "0f666ed1-adfa-4897-85a7-11560de17489",
             input: "s = \"10*20-30\"",
             expected: "170", orderMatters: true),
            TestCaseData(id: "5af7bd53-f1e0-48af-a923-66b0d7316ef6",
             input: "s = \"10/20-30\"",
             expected: "-30", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "basic-calculator-ii"
            let topic = "stack"
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

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 3 * 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.calculate(p_s)
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
