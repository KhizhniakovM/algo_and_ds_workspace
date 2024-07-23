import 'package:lecture/lecture_04/linked_list/one_way_linked_list.dart';

import '../../lecture_04/linked_list/linked_list.dart';
import 'hash_table.dart';

/// Хеш-таблица со способом решения коллизий - "Цепочка (Связный список)"
class HashTableWithChain<K, V> implements HashTable<K, V> {
  List<OneWayLinkedList<(K, V)>> _list;
  final double _loadFactor;

  @override
  int get length => _length;
  int _length = 0;

  double get _currentLoadFactor => _length / _list.length;

  HashTableWithChain({
    required int size,
    double loadFactor = 0.75,
  })  : _loadFactor = loadFactor,
        _list = List<OneWayLinkedList<(K, V)>>.generate(
          size,
          (_) => OneWayLinkedList<(K, V)>(),
          growable: false,
        );

  @override
  void put(K key, V value) {
    final hash = _getHashCode(key);
    final linkedlist = _list[hash];

    ListNode<(K, V)>? node = linkedlist.head;
    int idx = 0;
    while (node != null && node.value.$1 != key) {
      node = node.next;
      idx += 1;
    }

    if (node != null) linkedlist.remove(idx);
    linkedlist.add((key, value));
    _length++;

    if (_currentLoadFactor > _loadFactor) _rehash();
  }

  @override
  V? get(K key) {
    final hash = _getHashCode(key);
    final linkedlist = _list[hash];

    ListNode<(K, V)>? node = linkedlist.head;
    while (node != null || node?.value.$1 != key) {
      node = node?.next;
    }

    return node?.value.$2;
  }

  @override
  V? delete(K key) {
    final hash = _getHashCode(key);
    final linkedlist = _list[hash];

    ListNode<(K, V)>? node = linkedlist.head;
    int idx = 0;

    while (node != null && node.value.$1 != key) {
      node = node.next;
      idx += 1;
    }
    if (node != null) {
      final deleted = linkedlist.remove(idx)?.$2;
      if (deleted != null) _length--;
      return deleted;
    }
    return null;
  }

  int _getHashCode(K key) {
    // Создаем хеш и приводим его к некоторому числу
    final hashCode = key.hashCode;
    // Получаем остаток от деления этого числа на размер массива
    final idx = hashCode % _list.length;
    return idx;
  }

  void _rehash() {
    final oldList = _list;
    _length = 0;
    _list = List<OneWayLinkedList<(K, V)>>.generate(
      oldList.length * 10,
      (_) => OneWayLinkedList<(K, V)>(),
      growable: false,
    );

    for (final linkedlist in oldList) {
      ListNode<(K, V)>? node = linkedlist.head;
      while (node != null) {
        final entry = node.value;
        put(entry.$1, entry.$2);
        node = node.next;
      }
    }
  }
}
