import 'dictionary.dart';

final class DictionaryParallelArrays<K, V> implements Dictionary<K, V> {
  final List<K> _keys = List.empty(growable: true);
  final List<V> _values = List.empty(growable: true);

  int _size = 0;
  int get size => _size;

  /// O(n)
  @override
  V? get(K key) {
    for (int i = 0; i < _keys.length; i++) {
      if (_keys[i] == key) return _values[i];
    }
    return null;
  }

  /// O(1)
  @override
  void put(K key, V value) {
    _keys.add(key);
    _values.add(value);
    _size++;
  }
}
