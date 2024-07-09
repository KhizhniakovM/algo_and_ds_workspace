abstract interface class ITree<T extends Comparable> {
  Node<T>? get root;

  void insert(T value);
  Node<T>? search(T value);
  void remove(T value);

  void dfs(
    Node<T>? node, {
    void Function(T val)? use,
  });
}

abstract class Tree<T extends Comparable> implements ITree<T> {
  @override
  void dfs(
    Node<T>? node, {
    void Function(T val)? use,
  }) {
    if (node == null) return;

    dfs(node.left, use: use);
    use?.call(node.value);
    dfs(node.right, use: use);
  }
}

abstract interface class Node<T extends Comparable> {
  T value;

  Node<T>? get left;
  Node<T>? get right;

  Node({
    required this.value,
  });
}
