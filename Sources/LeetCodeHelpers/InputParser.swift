import Foundation

/// Parses LeetCode-style input strings into Swift values.
/// Handles all 5 input formats:
///   1. Named params: "nums = [2,7,11,15], target = 9"
///   2. Bare values: "[-1,0,1,2,-1,-4]"
///   3. JSON objects: {"nums": [2, 7, 11, 15], "target": 9}
///   4. Multi-line bare values: "100\n4\n200\n1\n3\n2"
///   5. Raw strings: "leetcode"
public enum InputParser {

    // MARK: - Parse integer from string
    public static func parseInt(_ s: String) -> Int {
        Int(s.trimmingCharacters(in: .whitespaces)) ?? 0
    }

    // MARK: - Parse double from string
    public static func parseDouble(_ s: String) -> Double {
        Double(s.trimmingCharacters(in: .whitespaces)) ?? 0.0
    }

    // MARK: - Parse boolean from string
    public static func parseBool(_ s: String) -> Bool {
        let trimmed = s.trimmingCharacters(in: .whitespaces).lowercased()
        return trimmed == "true" || trimmed == "1"
    }

    // MARK: - Parse a string value (may be quoted or unquoted)
    public static func parseString(_ s: String) -> String {
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        if trimmed.hasPrefix("\"") && trimmed.hasSuffix("\"") && trimmed.count >= 2 {
            return String(trimmed.dropFirst().dropLast())
        }
        return trimmed
    }

    // MARK: - Parse character
    public static func parseCharacter(_ s: String) -> Character {
        let str = parseString(s)
        return str.first ?? Character(" ")
    }

    // MARK: - Parse 1D int array: "[1, 2, 3]" -> [Int]
    public static func parseIntArray(_ s: String) -> [Int] {
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        guard trimmed.hasPrefix("[") && trimmed.hasSuffix("]") else { return [] }
        let inner = String(trimmed.dropFirst().dropLast()).trimmingCharacters(in: .whitespaces)
        if inner.isEmpty { return [] }
        return inner.split(separator: ",").map { Int($0.trimmingCharacters(in: .whitespaces)) ?? 0 }
    }

    // MARK: - Parse 1D double array
    public static func parseDoubleArray(_ s: String) -> [Double] {
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        guard trimmed.hasPrefix("[") && trimmed.hasSuffix("]") else { return [] }
        let inner = String(trimmed.dropFirst().dropLast()).trimmingCharacters(in: .whitespaces)
        if inner.isEmpty { return [] }
        return inner.split(separator: ",").map { Double($0.trimmingCharacters(in: .whitespaces)) ?? 0.0 }
    }

    // MARK: - Parse 1D string array: ["a", "b", "c"] -> [String]
    public static func parseStringArray(_ s: String) -> [String] {
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        guard trimmed.hasPrefix("[") && trimmed.hasSuffix("]") else { return [] }
        let inner = String(trimmed.dropFirst().dropLast()).trimmingCharacters(in: .whitespaces)
        if inner.isEmpty { return [] }
        // Split respecting quoted strings
        var result: [String] = []
        var current = ""
        var inQuote = false
        var escaped = false
        for ch in inner {
            if escaped {
                current.append(ch)
                escaped = false
                continue
            }
            if ch == "\\" {
                escaped = true
                current.append(ch)
                continue
            }
            if ch == "\"" {
                inQuote = !inQuote
                current.append(ch)
                continue
            }
            if ch == "," && !inQuote {
                result.append(parseString(current))
                current = ""
                continue
            }
            current.append(ch)
        }
        if !current.trimmingCharacters(in: .whitespaces).isEmpty {
            result.append(parseString(current))
        }
        return result
    }

    // MARK: - Parse 1D character array: ["a", "b"] -> [Character]
    public static func parseCharacterArray(_ s: String) -> [Character] {
        parseStringArray(s).map { $0.first ?? Character(" ") }
    }

    // MARK: - Parse 2D int array: "[[1,2],[3,4]]" -> [[Int]]
    public static func parse2DIntArray(_ s: String) -> [[Int]] {
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        guard trimmed.hasPrefix("[") && trimmed.hasSuffix("]") else { return [] }
        // Find inner arrays by bracket matching
        var depth = 0
        var current = ""
        var result: [[Int]] = []
        let inner = String(trimmed.dropFirst().dropLast())

        for ch in inner {
            if ch == "[" {
                depth += 1
                current.append(ch)
            } else if ch == "]" {
                depth -= 1
                current.append(ch)
                if depth == 0 {
                    result.append(parseIntArray(current))
                    current = ""
                }
            } else if ch == "," && depth == 0 {
                continue
            } else {
                current.append(ch)
            }
        }
        return result
    }

    // MARK: - Parse 2D string array: [["a","b"],["c","d"]] -> [[String]]
    public static func parse2DStringArray(_ s: String) -> [[String]] {
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        guard trimmed.hasPrefix("[") && trimmed.hasSuffix("]") else { return [] }
        var depth = 0
        var current = ""
        var result: [[String]] = []
        var inQuote = false
        var escaped = false
        let inner = String(trimmed.dropFirst().dropLast())

        for ch in inner {
            if escaped { current.append(ch); escaped = false; continue }
            if ch == "\\" && inQuote { escaped = true; current.append(ch); continue }
            if ch == "\"" { inQuote = !inQuote; current.append(ch); continue }
            if inQuote { current.append(ch); continue }
            if ch == "[" {
                depth += 1
                current.append(ch)
            } else if ch == "]" {
                depth -= 1
                current.append(ch)
                if depth == 0 {
                    result.append(parseStringArray(current))
                    current = ""
                }
            } else if ch == "," && depth == 0 {
                continue
            } else {
                current.append(ch)
            }
        }
        return result
    }

    // MARK: - Parse 2D character array (boards)
    public static func parse2DCharacterArray(_ s: String) -> [[Character]] {
        parse2DStringArray(s).map { $0.map { $0.first ?? Character(" ") } }
    }

    // MARK: - Parse nullable int array for trees: "[1,2,null,3]" -> [Int?]
    public static func parseNullableIntArray(_ s: String) -> [Int?] {
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        guard trimmed.hasPrefix("[") && trimmed.hasSuffix("]") else { return [] }
        let inner = String(trimmed.dropFirst().dropLast()).trimmingCharacters(in: .whitespaces)
        if inner.isEmpty { return [] }
        return inner.split(separator: ",", omittingEmptySubsequences: false).map { element in
            let e = element.trimmingCharacters(in: .whitespaces)
            if e == "null" || e == "nil" || e == "None" { return nil }
            return Int(e)
        }
    }

    // MARK: - Parse raw args list for class design: [[2],[1,1],[3,3]] -> [["2"],["1","1"],["3","3"]]
    public static func parseRawArgsList(_ s: String) -> [[String]] {
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        guard trimmed.hasPrefix("[") && trimmed.hasSuffix("]") else { return [] }
        // Split outer array into inner arrays by bracket matching
        var depth = 0
        var current = ""
        var result: [[String]] = []
        var inQuote = false
        var escaped = false
        let inner = String(trimmed.dropFirst().dropLast())

        for ch in inner {
            if escaped { current.append(ch); escaped = false; continue }
            if ch == "\\" && inQuote { escaped = true; current.append(ch); continue }
            if ch == "\"" { inQuote = !inQuote; current.append(ch); continue }
            if inQuote { current.append(ch); continue }
            if ch == "[" {
                depth += 1
                if depth > 1 { current.append(ch) }
            } else if ch == "]" {
                depth -= 1
                if depth == 0 {
                    // Parse inner: split by comma, keeping nested structures intact
                    let items = splitRawArgs(current)
                    result.append(items)
                    current = ""
                } else {
                    current.append(ch)
                }
            } else if ch == "," && depth == 0 {
                continue
            } else {
                current.append(ch)
            }
        }
        return result
    }

    /// Split raw args string by top-level commas, preserving nested brackets/quotes
    private static func splitRawArgs(_ s: String) -> [String] {
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty { return [] }
        var result: [String] = []
        var depth = 0
        var current = ""
        var inQuote = false
        var escaped = false

        for ch in trimmed {
            if escaped { current.append(ch); escaped = false; continue }
            if ch == "\\" && inQuote { escaped = true; current.append(ch); continue }
            if ch == "\"" { inQuote = !inQuote; current.append(ch); continue }
            if inQuote { current.append(ch); continue }
            if ch == "[" || ch == "{" { depth += 1; current.append(ch); continue }
            if ch == "]" || ch == "}" { depth -= 1; current.append(ch); continue }
            if ch == "," && depth == 0 {
                result.append(current.trimmingCharacters(in: .whitespaces))
                current = ""
                continue
            }
            current.append(ch)
        }
        if !current.trimmingCharacters(in: .whitespaces).isEmpty {
            result.append(current.trimmingCharacters(in: .whitespaces))
        }
        return result
    }

    // MARK: - Strip parameter names from input string
    /// Converts "nums = [2,7,11,15], target = 9" to ["[2,7,11,15]", "9"]
    public static func stripParamNames(_ input: String) -> [String] {
        let trimmed = input.trimmingCharacters(in: .whitespaces)

        // Format 3: JSON object
        if trimmed.hasPrefix("{") {
            if let data = trimmed.data(using: .utf8),
               let obj = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                return obj.sorted(by: { $0.key < $1.key }).map { _, v in
                    if let data = try? JSONSerialization.data(withJSONObject: v),
                       let str = String(data: data, encoding: .utf8) {
                        return str
                    }
                    return "\(v)"
                }
            }
        }

        // Split multi-line inputs
        let lines = trimmed.components(separatedBy: "\n")
        var result: [String] = []

        for line in lines {
            let parts = splitMultiParams(line.trimmingCharacters(in: .whitespaces))
            for part in parts {
                result.append(stripOneParam(part))
            }
        }
        return result
    }

    /// Split "a = [...], b = [...]" into ["a = [...]", "b = [...]"]
    /// respecting nested brackets
    private static func splitMultiParams(_ line: String) -> [String] {
        var depth = 0
        var inString = false
        var stringChar: Character = "\""
        var splits: [String] = []
        var start = line.startIndex
        var i = line.startIndex

        while i < line.endIndex {
            let ch = line[i]
            if inString {
                if ch == "\\" {
                    i = line.index(after: i)
                    if i < line.endIndex { i = line.index(after: i) }
                    continue
                }
                if ch == stringChar { inString = false }
            } else if ch == "\"" || ch == "'" {
                inString = true
                stringChar = ch
            } else if ch == "[" || ch == "(" || ch == "{" {
                depth += 1
            } else if ch == "]" || ch == ")" || ch == "}" {
                depth = max(0, depth - 1)
            } else if ch == "," && depth == 0 {
                let rest = String(line[line.index(after: i)...]).trimmingCharacters(in: .whitespaces)
                // Check if next part starts with "name ="
                if rest.range(of: #"^[A-Za-z_]\w*\s*="#, options: .regularExpression) != nil {
                    splits.append(String(line[start...line.index(before: i)]).trimmingCharacters(in: .whitespaces))
                    start = line.index(after: i)
                }
            }
            i = line.index(after: i)
        }
        splits.append(String(line[start...]).trimmingCharacters(in: .whitespaces))
        return splits
    }

    /// Strip "name = value" to "value"
    private static func stripOneParam(_ s: String) -> String {
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        if let range = trimmed.range(of: " = ") {
            return String(trimmed[range.upperBound...]).trimmingCharacters(in: .whitespaces)
        }
        if let range = trimmed.range(of: "= ") {
            return String(trimmed[range.upperBound...]).trimmingCharacters(in: .whitespaces)
        }
        if let range = trimmed.range(of: " =") {
            return String(trimmed[range.upperBound...]).trimmingCharacters(in: .whitespaces)
        }
        return trimmed
    }
}
