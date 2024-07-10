abstract interface class Tree<T extends Comparable> {
  Node<T>? get root;

  void insert(T value);
  Node<T>? search(T value);
  void remove(T value);

  void dfs({
    void Function(Node<T> node)? use,
  });
}

abstract interface class Node<T extends Comparable> {
  T value;

  Node<T>? get left;
  Node<T>? get right;

  Node({
    required this.value,
  });
}
