abstract interface class Array<T> {
  int get size;

  T? operator [](int index);
  void operator []=(int index, T? item);

  void add(T item);
  void insert(T item, int index);
  T? remove(int index);

  void clear();
}
