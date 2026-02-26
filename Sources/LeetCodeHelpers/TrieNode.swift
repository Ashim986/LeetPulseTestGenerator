import Foundation

/// Standard Trie node used by Trie problems (implement-trie, word-search-ii, etc.)
/// Uses LeetCode's exact naming: `TrieNode` with 26-child array for lowercase English letters
public class TrieNode {
    public var children: [TrieNode?]
    public var isEnd: Bool
    public var val: Character?
    public var word: String?

    public init() {
        self.children = Array(repeating: nil, count: 26)
        self.isEnd = false
        self.val = nil
        self.word = nil
    }
}
