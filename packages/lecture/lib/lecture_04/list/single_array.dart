import 'array.dart';

class SingleArray<T> implements Array<T> {
  List<T?> _list = List<T>.empty(growable: false);

  @override
  int get size => _list.length;

  @override
  T? operator [](int index) => _list[index];

  @override
  void operator []=(int index, T? item) => _list[index] = item;

  @override
  void add(T item) {
    _resize();
    _list[size - 1] = item;
  }

  void _resize() {
    final newList = List<T?>.filled(_list.length + 1, null, growable: false);

    for (int i = 0; i < size; i++) {
      newList[i] = _list[i];
    }

    _list = newList;
  }

  @override
  void clear() => _list = List<T>.empty(growable: false);

  @override
  void insert(T item, int index) {
    _resize();

    for (int i = size - 1; i > index; i--) {
      _list[i] = _list[i - 1];
    }

    _list[index] = item;
  }

  @override
  String toString() => _list.toString();

  @override
  T? remove(int index) {
    final result = _list[index];

    final newList = List<T?>.filled(_list.length - 1, null, growable: false);

    for (int i = 0; i < index; i++) {
      newList[i] = _list[i];
    }
    for (int i = index; i < size - 1; i++) {
      newList[i] = _list[i + 1];
    }

    _list = newList;

    return result;
  }
}
