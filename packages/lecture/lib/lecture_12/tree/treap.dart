import 'dart:math';

import '../../lecture_10/tree/tree.dart';

/// Tree + Heap
class Treap<T extends Comparable> implements Tree<T> {
  @override
  TreapNode<T>? get root => _root;
  TreapNode<T>? _root;

  @override
  void insert(T value) {
    final (left, right) = _split(_root, value);
    final less = _merge(left, TreapNode(value: value));
    _root = _merge(less, right);
  }

  @override
  void remove(T value) => _root = _remove(_root, value);
  TreapNode<T>? _remove(TreapNode<T>? node, T value) {
    if (node == null) return node;
    if (node.value == value) {
      return _merge(node.left, node.right);
    }

    if (node.value.compareTo(value) > 0) {
      node.left = _remove(node.left, value);
    } else {
      node.right = _remove(node.right, value);
    }
    return node;
  }

  @override
  TreapNode<T>? search(T value) => _search(_root, value);
  TreapNode<T>? _search(TreapNode<T>? node, T value) {
    if (node == null || node.value == value) return node;

    if (node.value.compareTo(value) < 0) {
      return _search(node.right, value);
    }

    return _search(node.left, value);
  }

  @override
  void dfs({void Function(TreapNode<T> node)? use}) => _dfs(_root, use: use);
  void _dfs(
    TreapNode<T>? node, {
    void Function(TreapNode<T> node)? use,
  }) {
    if (node == null) return;

    _dfs(node.left, use: use);
    use?.call(node);
    _dfs(node.right, use: use);
  }

  TreapNode<T>? _merge(TreapNode<T>? a, TreapNode<T>? b) {
    if (a == null) return b;
    if (b == null) return a;

    if (a.priority > b.priority) {
      a.right = _merge(a.right, b);
      return a;
    } else {
      b.left = _merge(a, b.left);
      return b;
    }
  }

  (TreapNode<T>? a, TreapNode<T>? b) _split(TreapNode<T>? root, T value) {
    if (root == null) return (null, null);

    if (root.value.compareTo(value) < 0) {
      final (a1, b1) = _split(root.right, value);
      root.right = a1;
      return (root, b1);
    } else {
      final (a1, b1) = _split(root.left, value);
      root.left = b1;
      return (a1, root);
    }
  }
}

class TreapNode<T extends Comparable> implements Node<T> {
  final double priority;

  @override
  T value;

  @override
  TreapNode<T>? left;

  @override
  TreapNode<T>? right;

  TreapNode({required this.value}) : priority = Random().nextDouble();
}
