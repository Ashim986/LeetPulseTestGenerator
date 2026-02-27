import Foundation

// MARK: - Generic Doubly-Linked Node (design-circular-deque, etc.)
// Used by solutions that reference bare `Node` with val/next/prev

public class Node {
    public var val: Int
    public var next: Node?
    public var prev: Node?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.prev = nil
    }

    public init() {
        self.val = 0
        self.next = nil
        self.prev = nil
    }
}

// MARK: - Graph Node (clone-graph, etc.)
// Uses `neighbors` property

public class GraphNode {
    public var val: Int
    public var neighbors: [GraphNode?]

    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

/// Build graph from adjacency list like [[2,4],[1,3],[2,4],[1,3]]
public func buildGraph(_ adjList: [[Int]]) -> GraphNode? {
    guard !adjList.isEmpty else { return nil }
    var nodes: [GraphNode] = (0..<adjList.count).map { GraphNode($0 + 1) }
    for (i, neighbors) in adjList.enumerated() {
        nodes[i].neighbors = neighbors.map { nodes[$0 - 1] }
    }
    return nodes[0]
}

/// Serialize graph to adjacency list string
public func serializeGraph(_ node: GraphNode?) -> String {
    guard let node = node else { return "[]" }
    var visited: [Int: GraphNode] = [:]
    var queue: [GraphNode] = [node]
    visited[node.val] = node
    while !queue.isEmpty {
        let curr = queue.removeFirst()
        for n in curr.neighbors {
            if let n = n, visited[n.val] == nil {
                visited[n.val] = n
                queue.append(n)
            }
        }
    }
    let maxVal = visited.keys.max() ?? 0
    var result: [String] = []
    for i in 1...maxVal {
        if let n = visited[i] {
            let neighbors = n.neighbors.compactMap { $0?.val }.map { String($0) }
            result.append("[" + neighbors.joined(separator: ",") + "]")
        } else {
            result.append("[]")
        }
    }
    return "[" + result.joined(separator: ",") + "]"
}

// MARK: - N-ary Tree Node (n-ary-tree-level-order, max-depth-of-n-ary-tree, etc.)

public class NAryNode {
    public var val: Int
    public var children: [NAryNode]

    public init(_ val: Int) {
        self.val = val
        self.children = []
    }

    public init(_ val: Int, _ children: [NAryNode]) {
        self.val = val
        self.children = children
    }
}

/// Build n-ary tree from serialized format [1,null,3,2,4,null,5,6]
/// Children groups are separated by null
public func buildNAryTree(_ values: [Int?]) -> NAryNode? {
    guard !values.isEmpty, let firstVal = values[0] else { return nil }
    let root = NAryNode(firstVal)
    var queue: [NAryNode] = [root]
    var i = 2 // skip root and first null separator
    while i < values.count && !queue.isEmpty {
        let parent = queue.removeFirst()
        while i < values.count, let val = values[i] {
            let child = NAryNode(val)
            parent.children.append(child)
            queue.append(child)
            i += 1
        }
        i += 1 // skip null separator
    }
    return root
}

/// Serialize n-ary tree to string
public func serializeNAryTree(_ root: NAryNode?) -> String {
    guard let root = root else { return "[]" }
    var result: [String] = ["\(root.val)", "null"]
    var queue: [NAryNode] = [root]
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for child in node.children {
            result.append("\(child.val)")
            queue.append(child)
        }
        result.append("null")
    }
    // Trim trailing nulls
    while result.last == "null" {
        result.removeLast()
    }
    return "[" + result.joined(separator: ",") + "]"
}

// MARK: - Random Pointer Node (copy-list-with-random-pointer)

public class RandomNode {
    public var val: Int
    public var next: RandomNode?
    public var random: RandomNode?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

/// Build random list from [[val, randomIndex], ...] format
public func buildRandomList(_ pairs: [[Int?]]) -> RandomNode? {
    guard !pairs.isEmpty else { return nil }
    var nodes: [RandomNode] = pairs.map { RandomNode($0[0] ?? 0) }
    for i in 0..<nodes.count - 1 {
        nodes[i].next = nodes[i + 1]
    }
    for (i, pair) in pairs.enumerated() {
        if pair.count > 1, let randomIdx = pair[1] {
            nodes[i].random = nodes[randomIdx]
        }
    }
    return nodes[0]
}

/// Serialize random list to [[val, randomIndex], ...] string
public func serializeRandomList(_ head: RandomNode?) -> String {
    var nodes: [RandomNode] = []
    var current = head
    while let node = current {
        nodes.append(node)
        current = node.next
    }
    let _ = Dictionary(uniqueKeysWithValues: nodes.enumerated().map { ($1.val, $0) })
    var result: [String] = []
    for node in nodes {
        let randomIdx: String
        if let r = node.random {
            randomIdx = "\(nodes.firstIndex(where: { $0 === r }) ?? -1)"
        } else {
            randomIdx = "null"
        }
        result.append("[\(node.val),\(randomIdx)]")
    }
    return "[" + result.joined(separator: ",") + "]"
}

// MARK: - Doubly Linked Node (flatten-a-multilevel-doubly-linked-list)

public class DoublyNode {
    public var val: Int
    public var prev: DoublyNode?
    public var next: DoublyNode?
    public var child: DoublyNode?

    public init(_ val: Int) {
        self.val = val
    }
}

// MARK: - QuadTree Node (construct-quad-tree)

public class QuadNode {
    public var val: Bool
    public var isLeaf: Bool
    public var topLeft: QuadNode?
    public var topRight: QuadNode?
    public var bottomLeft: QuadNode?
    public var bottomRight: QuadNode?

    public init(_ val: Bool, _ isLeaf: Bool) {
        self.val = val
        self.isLeaf = isLeaf
    }

    public init(_ val: Bool, _ isLeaf: Bool,
                _ topLeft: QuadNode?, _ topRight: QuadNode?,
                _ bottomLeft: QuadNode?, _ bottomRight: QuadNode?) {
        self.val = val
        self.isLeaf = isLeaf
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomLeft = bottomLeft
        self.bottomRight = bottomRight
    }
}

// MARK: - Next Right Pointer Node (populating-next-right-pointers)

public class NextNode {
    public var val: Int
    public var left: NextNode?
    public var right: NextNode?
    public var next: NextNode?

    public init(_ val: Int) {
        self.val = val
    }

    public init(_ val: Int, _ left: NextNode?, _ right: NextNode?, _ next: NextNode?) {
        self.val = val
        self.left = left
        self.right = right
        self.next = next
    }
}

/// Build next-pointer tree from level-order array (same as normal tree, but using NextNode)
public func buildNextTree(_ values: [Int?]) -> NextNode? {
    guard !values.isEmpty, let firstVal = values[0] else { return nil }
    let root = NextNode(firstVal)
    var queue: [NextNode] = [root]
    var i = 1
    while i < values.count {
        let node = queue.removeFirst()
        if i < values.count, let leftVal = values[i] {
            let left = NextNode(leftVal)
            node.left = left
            queue.append(left)
        }
        i += 1
        if i < values.count, let rightVal = values[i] {
            let right = NextNode(rightVal)
            node.right = right
            queue.append(right)
        }
        i += 1
    }
    return root
}

/// Serialize next-pointer tree showing next connections: [1,#,2,3,#,4,5,6,7,#]
public func serializeNextTree(_ root: NextNode?) -> String {
    guard let root = root else { return "[]" }
    var result: [String] = []
    var levelStart: NextNode? = root
    while let start = levelStart {
        var curr: NextNode? = start
        while let node = curr {
            result.append("\(node.val)")
            curr = node.next
        }
        result.append("#")
        levelStart = start.left
    }
    return "[" + result.joined(separator: ",") + "]"
}

// MARK: - NestedInteger (flatten-nested-list-iterator, mini-parser)

public class NestedInteger {
    private var intValue: Int?
    private var listValue: [NestedInteger]?

    public init() { self.listValue = [] }
    public init(_ value: Int) { self.intValue = value }

    public func isInteger() -> Bool { intValue != nil }
    public func getInteger() -> Int { intValue ?? 0 }
    public func setInteger(_ value: Int) { intValue = value; listValue = nil }
    public func add(_ elem: NestedInteger) {
        if listValue == nil { listValue = [] }
        listValue?.append(elem)
    }
    public func getList() -> [NestedInteger] { listValue ?? [] }
}

// MARK: - Employee (employee-importance)

public class Employee {
    public var id: Int
    public var importance: Int
    public var subordinates: [Int]

    public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
        self.id = id
        self.importance = importance
        self.subordinates = subordinates
    }
}
