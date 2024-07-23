abstract interface class HashTable<K, V> {
  int get length;

  void put(K key, V value);
  V? get(K key);
  V? delete(K key);
}
