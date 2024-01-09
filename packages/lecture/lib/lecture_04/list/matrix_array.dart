import 'package:lecture/lecture_04/list/factor_array.dart';

import 'array.dart';

class MatrixArray<T> implements Array<T> {
  Array<List<T?>> _lists = FactorArray(increment: 2);

  final int defaultSize;

  MatrixArray({required this.defaultSize});

  @override
  int get size => _size;
  int _size = 0;

  @override
  T? operator [](int index) =>
      _lists[index ~/ defaultSize]?[index % defaultSize];

  @override
  void operator []=(int index, T? item) =>
      _lists[index ~/ defaultSize]?[index % defaultSize] = item;

  @override
  void add(T item) {
    _resize();

    _lists[_size ~/ defaultSize]?[_size % defaultSize] = item;
    _size++;
  }

  void _resize() {
    if (_size == _lists.size * defaultSize) {
      _lists.add(List.filled(defaultSize, null));
    }
  }

  @override
  void clear() {
    _lists = FactorArray<List<T?>>(increment: 2);
    _size = 0;
  }

  @override
  void insert(T item, int index) {
    _resize();

    if (_size == 0) {
      add(item);
      return;
    }

    for (int i = size - 1; i >= index; i--) {
      _lists[(i + 1) ~/ defaultSize]?[(i + 1) % defaultSize] =
          _lists[i ~/ defaultSize]?[i % defaultSize];
    }

    _lists[index ~/ defaultSize]?[index % defaultSize] = item;
    _size++;
  }

  @override
  T? remove(int index) {
    final result = _lists[index ~/ defaultSize]?[index % defaultSize];

    for (int i = index; i < size - 1; i++) {
      this[i] = this[i + 1];
    }

    if (result != null) this[size - 1] = null;
    if (result != null) _size--;
    _resizeDown();

    return result;
  }

  void _resizeDown() {
    if (_size == 0) {
      _lists = FactorArray(increment: 2);
      return;
    }
    if ((_lists.size * defaultSize) - _size >= defaultSize) {
      _lists.remove(_lists.size - 1);
    }
  }

  @override
  String toString() => _lists.toString();
}
