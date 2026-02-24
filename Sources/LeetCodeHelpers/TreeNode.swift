import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public init() { self.val = 0; self.left = nil; self.right = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
    }
}

/// Build a binary tree from a level-order array like [1, 2, 3, nil, nil, 4, 5]
public func buildTree(_ values: [Int?]) -> TreeNode? {
    guard !values.isEmpty, let firstVal = values[0] else { return nil }
    let root = TreeNode(firstVal)
    var queue: [TreeNode] = [root]
    var i = 1
    while i < values.count {
        let node = queue.removeFirst()
        if i < values.count, let leftVal = values[i] {
            let left = TreeNode(leftVal)
            node.left = left
            queue.append(left)
        }
        i += 1
        if i < values.count, let rightVal = values[i] {
            let right = TreeNode(rightVal)
            node.right = right
            queue.append(right)
        }
        i += 1
    }
    return root
}

/// Serialize a binary tree to level-order array string like "[1,2,3,null,null,4,5]"
public func serializeTree(_ root: TreeNode?) -> String {
    guard let root = root else { return "[]" }
    var result: [String] = []
    var queue: [TreeNode?] = [root]
    while !queue.isEmpty {
        let node = queue.removeFirst()
        if let node = node {
            result.append("\(node.val)")
            queue.append(node.left)
            queue.append(node.right)
        } else {
            result.append("null")
        }
    }
    // Trim trailing nulls
    while result.last == "null" {
        result.removeLast()
    }
    return "[" + result.joined(separator: ",") + "]"
}
