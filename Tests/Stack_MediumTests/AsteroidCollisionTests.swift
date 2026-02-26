import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAsteroidCollision {
    private class Solution {
        func asteroidCollision(_ asteroids: [Int]) -> [Int] {
            var stack: [Int] = []

            for asteroid in asteroids {
                var alive = true

                while alive && asteroid < 0 && !stack.isEmpty && stack[stack.count - 1] > 0 {
                    let top = stack[stack.count - 1]
                    if top < -asteroid {
                        stack.removeLast()  // Top explodes, continue checking
                    } else if top == -asteroid {
                        stack.removeLast()  // Both explode
                        alive = false
                    } else {
                        alive = false  // Incoming explodes
                    }
                }

                if alive {
                    stack.append(asteroid)
                }
            }

            return stack
        }
    }

    @Suite struct AsteroidCollisionTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "52688a4d-d616-45ff-8056-713ac2629dd1",
             input: "asteroids = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "942ef884-3890-401f-bd7d-7c0b3ab79a9c",
             input: "asteroids = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "451f0fcb-e6bf-4f8f-9f8a-b5b1a1fd68f2",
             input: "asteroids = [1, 2]",
             expected: "[1, 2]", orderMatters: true),
            TestCaseData(id: "a06119c1-dfc5-46d6-9c1f-a946843094a9",
             input: "asteroids = [-1, -2]",
             expected: "[-2, -1]", orderMatters: true),
            TestCaseData(id: "78c26d42-2e49-4386-82c7-d13423a93235",
             input: "asteroids = [1, -1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "3bd990ad-3a36-475c-b832-b2621f85e220",
             input: "asteroids = [1, 1, 1]",
             expected: "[1, 1, 1]", orderMatters: true),
            TestCaseData(id: "6d58dac3-defa-426b-94af-ef9d14b26fb3",
             input: "asteroids = [-1, -1, -1]",
             expected: "[-1, -1, -1]", orderMatters: true),
            TestCaseData(id: "d13b6d25-a29a-4766-993e-5565d1c68bf4",
             input: "asteroids = [5, 5, 5]",
             expected: "[5, 5, 5]", orderMatters: true),
            TestCaseData(id: "e6912477-877f-49c5-8a78-4206faa55687",
             input: "asteroids = [-5, -5, -5]",
             expected: "[-5, -5, -5]", orderMatters: true),
            TestCaseData(id: "691ccbc5-1632-47fd-965a-08e197822e71",
             input: "asteroids = [10, 20, 30]",
             expected: "[10, 20, 30]", orderMatters: true),
            TestCaseData(id: "c1eaece1-c772-4693-a264-4abceb8ccdf9",
             input: "asteroids = [-10, -20, -30]",
             expected: "[-30, -20, -10]", orderMatters: true),
            TestCaseData(id: "127cc980-6c51-4049-91f4-1d7c1fd65046",
             input: "asteroids = [1000, 2000, 3000]",
             expected: "[1000, 2000, 3000]", orderMatters: true),
            TestCaseData(id: "6a44e3d3-9cfa-4a60-836a-1ec4b5b8ff3c",
             input: "asteroids = [-1000, -2000, -3000]",
             expected: "[-3000, -2000, -1000]", orderMatters: true),
            TestCaseData(id: "f3ec3408-bb99-4a64-92c2-6366c9e8c250",
             input: "asteroids = [1, -1, 1, -1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "ff9a776f-299f-4a7b-96a1-808ac921a70a",
             input: "asteroids = [10, -10, 10, -10]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "f042dd6b-0da8-4f8c-ae23-3cc6340fcc64",
             input: "asteroids = [100, -100, 100, -100]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "5a39e778-1673-4717-b1cf-b2f3f9eee196",
             input: "asteroids = [1, 2, 3, 4, 5]",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "29fd310e-7fc4-4f3b-aa76-f50769eecbae",
             input: "asteroids = [-1, -2, -3, -4, -5]",
             expected: "[-5, -4, -3, -2, -1]", orderMatters: true),
            TestCaseData(id: "ec1a19cf-310f-46ec-9a9b-b1c59a55cdb9",
             input: "asteroids = [10, 20, 30, 40, 50]",
             expected: "[10, 20, 30, 40, 50]", orderMatters: true),
            TestCaseData(id: "ea4e6a21-a727-473a-a9ae-a43984900fc6",
             input: "asteroids = [-10, -20, -30, -40, -50]",
             expected: "[-50, -40, -30, -20, -10]", orderMatters: true),
            TestCaseData(id: "c9c1b07e-fc2a-41f7-b01e-d71c1462b4e5",
             input: "asteroids = [1000, 2000, 3000, 4000, 5000]",
             expected: "[1000, 2000, 3000, 4000, 5000]", orderMatters: true),
            TestCaseData(id: "a7cf66f8-c10d-4f47-af37-5fb681768af1",
             input: "asteroids = [-1000, -2000, -3000, -4000, -5000]",
             expected: "[-5000, -4000, -3000, -2000, -1000]", orderMatters: true),
            TestCaseData(id: "c63287d2-6445-413f-8d1a-ca314f48aecd",
             input: "asteroids = [1, -1, 2, -2, 3, -3]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "fd1085a7-f149-4cb3-aaaa-91c1937d4d4f",
             input: "asteroids = [1, -2, 3, -4]",
             expected: "[-2,-4]", orderMatters: true),
            TestCaseData(id: "23b507d7-5883-403d-b190-bae7dd658516",
             input: "asteroids = [1, 2, -3, 4]",
             expected: "[-3,4]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "asteroid-collision"
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

            guard let p_asteroids = InputParser.parseIntArray(params[0]) else {
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
            guard p_asteroids.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: asteroids array too large (\(p_asteroids.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_asteroids.count >= 2 && p_asteroids.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= asteroids.length <= 104"
                )
                return
            }
            guard p_asteroids.allSatisfy({ $0 >= -1000 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= asteroids[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.asteroidCollision(p_asteroids)
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
