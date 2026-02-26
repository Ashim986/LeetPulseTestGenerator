import Foundation

/// Reusable data type for parameterized test cases, replacing large tuples.
public struct TestCaseData: Sendable {
    public let id: String
    public let input: String
    public let expected: String
    public let orderMatters: Bool

    public init(id: String, input: String, expected: String, orderMatters: Bool) {
        self.id = id
        self.input = input
        self.expected = expected
        self.orderMatters = orderMatters
    }
}
