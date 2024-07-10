import 'tree.dart';

class BSTree<T extends Comparable> implements Tree<T> {
  @override
  BSTNode<T>? get root => _root;
  BSTNode<T>? _root;

  @override
  void insert(T value) => _root = _insertAt(_root, value);
  BSTNode<T> _insertAt(BSTNode<T>? node, T value) {
    if (node == null) return BSTNode(value: value);

    if (value.compareTo(node.value) < 0) {
      node.left = _insertAt(node.left, value);
    }
    if (value.compareTo(node.value) > 0) {
      node.right = _insertAt(node.right, value);
    }
    if (value.compareTo(node.value) == 0) {
      node.count += 1;
    }

    return node;
  }

  @override
  void remove(T value) => _root = _remove(_root, value);
  BSTNode<T>? _remove(BSTNode<T>? node, T value) {
    if (node == null) return node;

    if (value.compareTo(node.value) < 0) {
      node.left = _remove(node.left, value);
    }
    if (value.compareTo(node.value) > 0) {
      node.right = _remove(node.right, value);
    }

    if (node.count > 1) {
      node.count -= 1;
      return node;
    }

    if (node.left == null) {
      return node.right;
    } else if (node.right == null) {
      return node.left;
    }

    node.value = _minValue(node.right!);
    node.right = _remove(node.right, node.value);

    return node;
  }

  T _minValue(BSTNode<T> node) {
    BSTNode<T> current = node;
    while (current.left != null) {
      current = current.left!;
    }
    return current.value;
  }

  @override
  BSTNode<T>? search(T value) => _search(_root, value);
  BSTNode<T>? _search(BSTNode<T>? node, T value) {
    if (node == null || node.value == value) return node;

    if (node.value.compareTo(value) < 0) {
      return _search(node.right, value);
    }

    return _search(node.left, value);
  }

  @override
  void dfs({void Function(BSTNode<T> node)? use}) => _dfs(_root, use: use);
  void _dfs(
    BSTNode<T>? node, {
    void Function(BSTNode<T> node)? use,
  }) {
    if (node == null) return;

    _dfs(node.left, use: use);
    use?.call(node);
    _dfs(node.right, use: use);
  }
}

class BSTNode<T extends Comparable> implements Node<T> {
  @override
  T value;

  BSTNode({
    required this.value,
  });

  @override
  BSTNode<T>? left;

  @override
  BSTNode<T>? right;

  int count = 1;
}
