final class Trie<V> {
  final _TrieNode<V> _root = _TrieNode();

  V? get(String key) {
    _TrieNode<V>? node = _root;

    for (int idx in key.codeUnits) {
      node = node?.list[idx];
      if (node == null) return null;
    }

    return node?.value;
  }

  void put(String key, V value) {
    _TrieNode<V>? node = _root;
    for (int idx in key.codeUnits) {
      if (node?.list[idx] == null) node?.list[idx] = _TrieNode();
      node = node?.list[idx];
    }

    node?.value = value;
  }

  V? delete(String key) {
    _TrieNode<V>? node = _root;

    for (int idx in key.codeUnits) {
      node = node?.list[idx];
      if (node == null) return null;
    }

    final value = node?.value;
    node?.value = null;
    return value;
  }
}

final class _TrieNode<V> {
  final List<_TrieNode<V>?> list = List<_TrieNode<V>?>.generate(
    128,
    (_) => null,
  );

  V? value;

  _TrieNode({this.value});
}
