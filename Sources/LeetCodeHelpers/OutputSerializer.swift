import Foundation

/// Serializes Swift values to LeetCode output format strings.
///
/// LeetCode canonical format rules (QUAL-03):
/// - No spaces after commas in arrays: [1,2,3] not [1, 2, 3]
/// - Brackets directly adjacent to content: [1,2,3] not [ 1, 2, 3 ]
/// - Strings in arrays are quoted: ["a","b"] not [a, b]
/// - Raw string returns are NOT quoted: "hello" not "\"hello\""
/// - Doubles: trailing zeros trimmed but keep at least one decimal place (3.0 stays as 3.0)
/// - Doubles: -0 and 0 both serialize as "0.0"
/// - Booleans: lowercase "true"/"false"
/// - Null values: "null"
/// - Linked lists: serialized as array form [1,2,3]
public enum OutputSerializer {

    // MARK: - Primitives

    public static func serialize(_ value: Int) -> String {
        "\(value)"
    }

    /// Serializes a Double to LeetCode canonical format.
    /// - Normalizes trailing zeros: 3.10000 -> 3.1
    /// - Keeps at least one decimal place: 3.0 stays as 3.0
    /// - Treats -0 and 0 as equal: both produce "0.0"
    public static func serialize(_ value: Double) -> String {
        // Normalize -0 to 0
        let normalized = value == 0.0 ? 0.0 : value
        // LeetCode uses up to 5 decimal places
        let formatted = String(format: "%.5f", normalized)
        // Trim trailing zeros after decimal point, but keep at least one decimal place
        if formatted.contains(".") {
            var result = formatted
            while result.hasSuffix("0") && !result.hasSuffix(".0") { result.removeLast() }
            return result
        }
        return formatted
    }

    public static func serialize(_ value: Bool) -> String {
        value ? "true" : "false"
    }

    /// Serializes a raw string value -- returns as-is without wrapping in quotes.
    /// LeetCode expected output for strings is unquoted.
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
    // All array serializers use LeetCode canonical format: no spaces after commas.

    public static func serialize(_ value: [Int]) -> String {
        "[" + value.map { "\($0)" }.joined(separator: ",") + "]"
    }

    public static func serialize(_ value: [Double]) -> String {
        "[" + value.map { serialize($0) }.joined(separator: ",") + "]"
    }

    /// Serializes a string array. Individual elements are wrapped in quotes.
    /// Format: ["a","b","c"] (no spaces after commas).
    public static func serialize(_ value: [String]) -> String {
        "[" + value.map { "\"\($0)\"" }.joined(separator: ",") + "]"
    }

    public static func serialize(_ value: [Bool]) -> String {
        "[" + value.map { $0 ? "true" : "false" }.joined(separator: ",") + "]"
    }

    public static func serialize(_ value: [Character]) -> String {
        "[" + value.map { "\"\($0)\"" }.joined(separator: ",") + "]"
    }

    // MARK: - Nullable arrays (for class-design outputs like [null,null,1,-1,null])

    /// Serializes a nullable int array. Null values become "null", integers become their string form.
    /// Format: [null,1,null,-1] (no spaces after commas).
    /// Normalizes nil/None/NULL representations to "null".
    public static func serialize(_ value: [Int?]) -> String {
        "[" + value.map { v in
            if let v = v { return "\(v)" }
            return "null"
        }.joined(separator: ",") + "]"
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

    public static func serialize(_ value: [[Bool]]) -> String {
        "[" + value.map { serialize($0) }.joined(separator: ",") + "]"
    }

    // MARK: - Tree

    public static func serialize(_ value: TreeNode?) -> String {
        serializeTree(value)
    }

    // MARK: - Linked List

    /// Serializes a linked list to array form: [1,2,3].
    /// Normalization: linked list arrow format (1->2->3) is NOT used;
    /// always produces canonical array form.
    public static func serialize(_ value: ListNode?) -> String {
        serializeList(value)
    }

    // MARK: - Void (for in-place modifications)

    public static func serializeVoid() -> String {
        "null"
    }
}
