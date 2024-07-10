import 'dart:math';

import 'tree.dart';

class AVLTree<T extends Comparable> implements Tree<T> {
  @override
  AVLNode<T>? get root => _root;
  AVLNode<T>? _root;

  @override
  void insert(T value) => _root = _insertAt(_root, value);

  AVLNode<T>? _insertAt(AVLNode<T>? node, T value) {
    if (node == null) return AVLNode(value: value);

    if (value.compareTo(node.value) < 0) {
      node.left = _insertAt(node.left, value);
    }
    if (value.compareTo(node.value) > 0) {
      node.right = _insertAt(node.right, value);
    }
    if (value.compareTo(node.value) == 0) {
      node.count += 1;
    }

    return _balance(node);
  }

  AVLNode<T>? _balance(AVLNode<T>? node) {
    if (node?.balance == 2) {
      if ((node?.right?.balance ?? 0) < 0) {
        node?.right = _rotateRight(node.right);
      }
      return _rotateLeft(node);
    }
    if (node?.balance == -2) {
      if ((node?.left?.balance ?? 0) > 0) {
        node?.left = _rotateLeft(node.left);
      }
      return _rotateRight(node);
    }
    return node;
  }

  AVLNode<T>? _rotateRight(AVLNode<T>? node) {
    final q = node?.left;
    node?.left = q?.right;
    q?.right = node;
    return q;
  }

  AVLNode<T>? _rotateLeft(AVLNode<T>? node) {
    final q = node?.right;
    node?.right = q?.left;
    q?.left = node;
    return q;
  }

  @override
  void remove(T value) => _root = _remove(_root, value);
  AVLNode<T>? _remove(AVLNode<T>? node, T value) {
    if (node == null) return node;

    if (value.compareTo(node.value) < 0) {
      node.left = _remove(node.left, value);
    } else if (value.compareTo(node.value) > 0) {
      node.right = _remove(node.right, value);
    } else {
      if (node.count > 1) {
        node.count -= 1;
        return node;
      }

      final left = node.left;
      final right = node.right;
      if (right == null) return left;
      final min = _findMin(node.right);
      min?.right = _removeMin(node.right);
      min?.left = node.left;
      return _balance(min);
    }
    return _balance(node);
  }

  AVLNode<T>? _findMin(AVLNode<T>? node) {
    if (node?.left == null) return node;
    return _findMin(node?.left);
  }

  AVLNode<T>? _removeMin(AVLNode<T>? node) {
    if (node?.left == null) return node?.right;
    node?.left = _removeMin(node.left);
    return _balance(node);
  }

  @override
  AVLNode<T>? search(T value) => _search(_root, value);
  AVLNode<T>? _search(AVLNode<T>? node, T value) {
    if (node == null || node.value == value) return node;

    if (node.value.compareTo(value) < 0) {
      return _search(node.right, value);
    }

    return _search(node.left, value);
  }

  @override
  void dfs({void Function(AVLNode<T> node)? use}) => _dfs(_root, use: use);
  void _dfs(
    AVLNode<T>? node, {
    void Function(AVLNode<T> node)? use,
  }) {
    if (node == null) return;

    _dfs(node.left, use: use);
    use?.call(node);
    _dfs(node.right, use: use);
  }
}

class AVLNode<T extends Comparable> implements Node<T> {
  @override
  T value;

  AVLNode({
    required this.value,
  });

  int get height => max(left?.height ?? 0, right?.height ?? 0) + 1;

  int get balance => (right?.height ?? 0) - (left?.height ?? 0);

  @override
  AVLNode<T>? left;

  @override
  AVLNode<T>? right;

  int count = 1;
}
