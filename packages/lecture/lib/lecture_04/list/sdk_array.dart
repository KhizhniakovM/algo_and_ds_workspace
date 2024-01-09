import 'array.dart';

class SdkArray<T> implements Array<T> {
  final _list = List<T?>.empty(growable: true);

  @override
  T? operator [](int index) => _list[index];

  @override
  void operator []=(int index, T? item) => _list[index] = item;

  @override
  void add(T item) => _list.add(item);

  @override
  void clear() => _list.clear();

  @override
  void insert(T item, int index) => _list.insert(index, item);

  @override
  T? remove(int index) => _list.removeAt(index);

  @override
  int get size => _list.length;
}
