// Visualization of sorting algorithms
// https://www.cs.usfca.edu/~galles/visualization/ComparisonSort.html

import 'sorter.dart';

extension BubbleSort on Sorter {
  /// O   | M | <> сравнение | = присваивание | adaptive | stable | online
  /// n^2 | 1 | =(n^2 - n)/2 | 3(n^2 - n)/2   | -        | +      | -
  void bubbleSort() {
    for (int j = n - 1; j > 0; j--) {
      for (int i = 0; i < j; i++) {
        if (more(list[i], list[i + 1])) swap(i, i + 1);
      }
    }
  }
}

extension InsertionSort on Sorter {
  /// O   | M | <> сравнение | = присваивание | adaptive | stable | online
  /// n^2 | 1 | <(n^2 - n)/2 | 3(n^2 - n)/2   | +        | +      | +
  void insertionSort() {
    for (int j = 1; j < n; j++) {
      for (int i = j - 1; i >= 0 && more(list[i], list[i + 1]); i--) {
        swap(i, i + 1);
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

      for (i = j - 1; i >= 0 && more(list[i], t); i--) {
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

      final p = binarySearch(t, 0, j - 1);
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
extension ShellSort on Sorter {
  void shellSort() {
    for (int gap = n ~/ 2; gap > 0; gap = gap ~/ 2) {
      for (int j = gap; j < n; j++) {
        for (int i = j; i >= gap && more(list[i - gap], list[i]); i -= gap) {
          swap(i - gap, i);
        }
      }
    }
  }
}
