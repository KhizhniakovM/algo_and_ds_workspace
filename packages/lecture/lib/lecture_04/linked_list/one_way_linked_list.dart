import 'linked_list.dart';

class OneWayLinkedList<T> implements LinkedList<T> {
  @override
  ListNode<T>? head;

  @override
  int get size => _size;
  int _size = 0;

  @override
  void add(T item) {
    final newNode = OneWayListNode(item);
    final last = _getLast();
    if (last == null) head = newNode;
    if (last != null) last.next = newNode;
    _size++;
  }

  @override
  void clear() {
    head = null;
    _size = 0;
  }

  @override
  void insert(T item, int index) {
    if (index <= 0) {
      final tmp = head;
      head = OneWayListNode(item, next: tmp);
    } else {
      final prev = _getIndex(index - 1);
      final tmp = prev?.next;
      prev?.next = OneWayListNode(item, next: tmp);
    }
    _size++;
  }

  @override
  T? remove(int index) {
    ListNode<T>? node;
    if (index <= 0) {
      node = head;
      head = head?.next;
    } else {
      final prev = _getIndex(index - 1);
      node = prev?.next;
      prev?.next = node?.next;
    }
    _size--;
    return node?.value;
  }

  @override
  T? operator [](int index) => _getIndex(index)?.value;

  @override
  void operator []=(int index, T? item) =>
      item != null ? insert(item, index) : null;

  ListNode<T>? _getLast() {
    ListNode<T>? current = head;
    while (current?.next != null) {
      current = current?.next;
    }
    return current;
  }

  ListNode<T>? _getIndex(int index) {
    ListNode<T>? current = head;
    int counter = 0;
    while (counter != index) {
      current = current?.next;
      counter++;
    }
    if (current == null) throw Exception('We dont have node with that index');
    return current;
  }
}

class OneWayListNode<T> implements ListNode<T> {
  @override
  ListNode<T>? next;

  @override
  T value;

  OneWayListNode(
    this.value, {
    this.next,
  });
}
