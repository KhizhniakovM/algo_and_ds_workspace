import 'array.dart';

/// Массив, который динамически увеличивает свой размер в increment раз
class FactorArray<T> implements Array<T> {
  List<T?> _list = List<T>.empty(growable: false);

  FactorArray({required this.increment});

  @override
  int get size => _size;
  int _size = 0;

  int get _capacity => _list.length;

  @override
  T? operator [](int index) => _list[index];

  @override
  void operator []=(int index, T? item) => _list[index] = item;

  final int increment;

  @override
  void add(T item) {
    _resize();

    _list[_size] = item;
    _size++;
  }

  @override
  void clear() {
    _list = List<T>.empty(growable: false);
    _size = 0;
  }

  void _resize() {
    if (_capacity != size) return;
    final newList = List<T?>.filled(
      _list.length * increment + 1,
      null,
      growable: false,
    );

    for (int i = 0; i < size; i++) {
      newList[i] = _list[i];
    }

    _list = newList;
  }

  @override
  void insert(T item, int index) {
    _resize();

    for (int i = size - 1; i >= index; i--) {
      _list[i + 1] = _list[i];
    }

    _list[index] = item;
    _size++;
  }

  @override
  T? remove(int index) {
    final result = _list[index];

    for (int i = index; i < size - 1; i++) {
      _list[i] = _list[i + 1];
    }

    if (result != null) _list[size - 1] = null;
    if (result != null) _size--;
    _resizeDown();

    return result;
  }

  void _resizeDown() {
    if (_size == 0) {
      _list = List<T>.empty(growable: false);
      return;
    }

    if (_capacity ~/ _size == increment) {
      final newList = List<T?>.filled(
        _list.length ~/ increment,
        null,
        growable: false,
      );

      for (int i = 0; i < size; i++) {
        newList[i] = _list[i];
      }

      _list = newList;
    }
  }

  @override
  String toString() => _list.toString();
}
