class TrieNode {
  final children = {};
  bool end = false;
}

class Trie {
  TrieNode root = TrieNode();

  insert(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      if (!node.children.containsKey(letter)) {
        node.children[letter] = TrieNode();
      }
      node = node.children[letter];
    }
    node.end = true;
  }

  search(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      if (!node.children.containsKey(letter)) {
        false;
      }
      node = node.children[letter];
    }
    return node.end;
  }
}

void main() {
  Trie trie = Trie();

  // Insert words into the trie
  trie.insert("apple");
  trie.insert("app");
  trie.insert("apricot");

  print(trie.search('ap'));
}
