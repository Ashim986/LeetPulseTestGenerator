import Foundation

/// Records algorithm execution steps for visualization.
///
/// Usage in a solution function:
/// ```swift
/// func twoSum(_ nums: [Int], _ target: Int, trace: Trace) -> [Int] {
///     var map: [Int: Int] = [:]
///     for (i, num) in nums.enumerated() {
///         let complement = target - num
///         trace.step("i=\(i), num=\(num)", ["i": i, "num": num, "hashMap": map])
///         if let j = map[complement] { return [j, i] }
///         map[num] = i
///     }
///     return []
/// }
/// ```
public final class Trace: @unchecked Sendable {
    private var steps: [[String: Any]] = []

    public init() {}

    /// Record a single algorithm step.
    ///
    /// - Parameters:
    ///   - label: Short human-readable description, e.g. `"i=0, num=2, complement=7"`
    ///   - values: Variable snapshot at this point. Supports `Int`, `String`, `Bool`,
    ///     `Double`, `[Int]`, `[String]`, `[String: Int]`, `[[Int]]`, and `[Any]`.
    public func step(_ label: String, _ values: [String: Any]) {
        var serialized: [String: Any] = [:]
        for (key, value) in values {
            serialized[key] = serializeValue(value)
        }
        steps.append([
            "label": label,
            "values": serialized
        ])
    }

    /// Returns all recorded steps as JSON-compatible dictionaries.
    public func serializedSteps() -> [[String: Any]] {
        steps
    }

    private func serializeValue(_ value: Any) -> Any {
        switch value {
        case let v as Int:
            return v
        case let v as Double:
            return v
        case let v as Bool:
            return v
        case let v as String:
            return v
        case let v as [Int]:
            return v
        case let v as [String]:
            return v
        case let v as [Bool]:
            return v
        case let v as [Double]:
            return v
        case let v as [[Int]]:
            return v
        case let v as [String: Int]:
            // Convert int keys in dict values to strings for JSON compat
            return v.reduce(into: [String: Any]()) { result, pair in
                result[pair.key] = pair.value
            }
        case let v as [String: Any]:
            return v.reduce(into: [String: Any]()) { result, pair in
                result[pair.key] = serializeValue(pair.value)
            }
        case let v as [Any]:
            return v.map { serializeValue($0) }
        default:
            return String(describing: value)
        }
    }
}
