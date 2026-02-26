import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
    public init(val: Int) { self.val = val; self.next = nil }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val && lhs.next == rhs.next
    }
}

/// Build a linked list from an array like [1, 2, 3, 4, 5]
public func buildList(_ values: [Int]) -> ListNode? {
    guard !values.isEmpty else { return nil }
    let dummy = ListNode(0)
    var tail = dummy
    for val in values {
        tail.next = ListNode(val)
        tail = tail.next!
    }
    return dummy.next
}

/// Serialize a linked list to array string like "[1,2,3,4,5]"
public func serializeList(_ head: ListNode?) -> String {
    var result: [String] = []
    var current = head
    var safety = 10000 // prevent infinite loops from cycles
    while let node = current, safety > 0 {
        result.append("\(node.val)")
        current = node.next
        safety -= 1
    }
    return "[" + result.joined(separator: ",") + "]"
}

/// Build a linked list with a cycle. pos = index of node where tail connects (-1 for no cycle)
public func buildListWithCycle(_ values: [Int], pos: Int) -> ListNode? {
    guard !values.isEmpty else { return nil }
    var nodes: [ListNode] = values.map { ListNode($0) }
    for i in 0..<nodes.count - 1 {
        nodes[i].next = nodes[i + 1]
    }
    if pos >= 0 && pos < nodes.count {
        nodes[nodes.count - 1].next = nodes[pos]
    }
    return nodes[0]
}
