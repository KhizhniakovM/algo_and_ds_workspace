import 'tree.dart';

class BSTree<T extends Comparable> extends Tree<T> {
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
    // На данном этапе представим, что в нашем дереве не может быть одинаковых элементов
    // if (value.compareTo(node.value) == 0) {}

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
}
