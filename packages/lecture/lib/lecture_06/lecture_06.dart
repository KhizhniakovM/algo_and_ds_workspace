// Visualization of sorting algorithms
// https://www.cs.usfca.edu/~galles/visualization/ComparisonSort.html

import 'dart:math';

class SimpleSorter {
  final List<int> list;

  int get n => list.length;

  int asg = 0;
  int cmp = 0;

  SimpleSorter.fromList({
    required this.list,
  });

  SimpleSorter.random({
    required int n,
  }) : list = List.generate(n, (_) => Random().nextInt(n), growable: false);

  SimpleSorter.digitsOnly({
    required int n,
  }) : list = List.generate(n, (_) => Random().nextInt(10), growable: false);

  SimpleSorter.sorted({
    required int n,
  }) : list = List.generate(n, (i) => i, growable: false);

  SimpleSorter.reversed({
    required int n,
  }) : list = List.generate(n, (i) => n - i - 1, growable: false);

  void _swap(int i, int j) {
    asg += 3;

    final t = list[i];
    list[i] = list[j];
    list[j] = t;
  }

  bool _more(int i, int j) {
    cmp += 1;

    return i > j;
  }

  bool _moreq(int i, int j) {
    cmp += 1;

    return i >= j;
  }

  int _binarySearch(int key, int low, int high) {
    if (high <= low) {
      if (_moreq(key, list[low])) {
        return low + 1;
      } else {
        return low;
      }
    }

    int mid = (low + high) ~/ 2;

    if (_more(key, list[mid])) {
      return _binarySearch(key, mid + 1, high);
    } else {
      return _binarySearch(key, low, mid - 1);
    }
  }

  @override
  String toString() => 'N = $n; cmp = $cmp; asg = $asg;\n';
}

extension BubbleSort on SimpleSorter {
  /// O   | M | <> сравнение | = присваивание | adaptive | stable | online
  /// n^2 | 1 | =(n^2 - n)/2 | 3(n^2 - n)/2   | -        | +      | -
  void bubbleSort() {
    for (int j = n - 1; j > 0; j--) {
      for (int i = 0; i < j; i++) {
        if (_more(list[i], list[i + 1])) _swap(i, i + 1);
      }
    }
  }
}

extension InsertionSort on SimpleSorter {
  /// O   | M | <> сравнение | = присваивание | adaptive | stable | online
  /// n^2 | 1 | <(n^2 - n)/2 | 3(n^2 - n)/2   | +        | +      | +
  void insertionSort() {
    for (int j = 1; j < n; j++) {
      for (int i = j - 1; i >= 0 && _more(list[i], list[i + 1]); i--) {
        _swap(i, i + 1);
      }
    }
  }

  /// O   | M | <> сравнение | = присваивание | adaptive | stable | online
  /// n^2 | 1 | <(n^2 - n)/2 | (n^2 - n)/2   | +        | +      | +
  /// В 3 раза меньше операций присваивания, чем в обычном insertionSort
  void insertShiftSort() {
    int i = 0;
    for (int j = 1; j < n; j++) {
      final t = list[j];
      asg++;

      for (i = j - 1; i >= 0 && _more(list[i], t); i--) {
        list[i + 1] = list[i];
        asg++;
      }

      list[i + 1] = t;
      asg++;
    }
  }

  /// O   | M     | <> сравнение | = присваивание | adaptive | stable | online
  /// n^2 | log n | n * log n    | (n^2 - n)/2    | +        | +      | +
  /// Количество сравнений стало во много меньше
  void insertBinaryShiftSort() {
    int i = 0;
    for (int j = 1; j < n; j++) {
      final t = list[j];
      asg++;

      final p = _binarySearch(t, 0, j - 1);
      asg++;

      for (i = j - 1; i >= p; i--) {
        list[i + 1] = list[i];
        asg++;
      }

      list[i + 1] = t;
      asg++;
    }
  }
}

/// O     | M | <> сравнение | = присваивание | adaptive | stable | online
/// n^1.7 | 1 | -            | -              | -        | +-     | -
/// 
/// В зависимости от gap можно врьировать сложность алгоритма, подробнее на википедии
/// https://en.wikipedia.org/wiki/Shellsort
extension ShellSort on SimpleSorter {
  void shellSort() {
    for (int gap = n ~/ 2; gap > 0; gap = gap ~/ 2) {
      for (int j = gap; j < n; j++) {
        for (int i = j; i >= gap && _more(list[i - gap], list[i]); i -= gap) {
          _swap(i - gap, i);
        }
      }
    }
  }
}
