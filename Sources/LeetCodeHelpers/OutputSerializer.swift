import Foundation

/// Serializes Swift values to LeetCode output format strings.
public enum OutputSerializer {

    // MARK: - Primitives

    public static func serialize(_ value: Int) -> String {
        "\(value)"
    }

    public static func serialize(_ value: Double) -> String {
        // LeetCode uses up to 5 decimal places
        let formatted = String(format: "%.5f", value)
        // Trim trailing zeros after decimal point
        if formatted.contains(".") {
            var result = formatted
            while result.hasSuffix("0") { result.removeLast() }
            if result.hasSuffix(".") { result.removeLast() }
            return result
        }
        return formatted
    }

    public static func serialize(_ value: Bool) -> String {
        value ? "true" : "false"
    }

    public static func serialize(_ value: String) -> String {
        value
    }

    public static func serialize(_ value: Character) -> String {
        String(value)
    }

    // MARK: - Optional

    public static func serializeOptionalInt(_ value: Int?) -> String {
        if let v = value { return "\(v)" }
        return "null"
    }

    // MARK: - Arrays

    public static func serialize(_ value: [Int]) -> String {
        "[" + value.map { "\($0)" }.joined(separator: ",") + "]"
    }

    public static func serialize(_ value: [Double]) -> String {
        "[" + value.map { serialize($0) }.joined(separator: ",") + "]"
    }

    public static func serialize(_ value: [String]) -> String {
        "[" + value.map { "\"\($0)\"" }.joined(separator: ",") + "]"
    }

    public static func serialize(_ value: [Bool]) -> String {
        "[" + value.map { $0 ? "true" : "false" }.joined(separator: ",") + "]"
    }

    public static func serialize(_ value: [Character]) -> String {
        "[" + value.map { "\"\($0)\"" }.joined(separator: ",") + "]"
    }

    // MARK: - 2D Arrays

    public static func serialize(_ value: [[Int]]) -> String {
        "[" + value.map { serialize($0) }.joined(separator: ",") + "]"
    }

    public static func serialize(_ value: [[String]]) -> String {
        "[" + value.map { serialize($0) }.joined(separator: ",") + "]"
    }

    public static func serialize(_ value: [[Character]]) -> String {
        "[" + value.map { serialize($0) }.joined(separator: ",") + "]"
    }

    // MARK: - Tree

    public static func serialize(_ value: TreeNode?) -> String {
        serializeTree(value)
    }

    // MARK: - Linked List

    public static func serialize(_ value: ListNode?) -> String {
        serializeList(value)
    }

    // MARK: - Void (for in-place modifications)

    public static func serializeVoid() -> String {
        "null"
    }
}
