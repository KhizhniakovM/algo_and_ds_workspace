/*
  https://www.geeksforgeeks.org/quick-sort-algorithm/

  https://www.geeksforgeeks.org/merge-sort/

  https://ru.wikipedia.org/wiki/Timsort

  https://present5.com/algoritmy-vneshnej-sortirovki-lekciya-4-1-algoritmy/
*/

import '../lecture_06/sorter.dart';

/// O          | M | <> сравнение | = присваивание | adaptive | stable | online
/// n * log n  | 1 | =(n^2 - n)/2 | 3n             | -        | -      | -
extension QuickSort on Sorter {
  void quickSort() => _qsort(0, n - 1);

  void _qsort(int l, int r) {
    if (l >= r) return;

    final m = _split(l, r);
    _qsort(l, m - 1);
    _qsort(m + 1, r);
  }

  int _split(int l, int r) {
    final p = list[r];
    int m = l - 1;

    for (int j = l; j <= r; j++) {
      if (moreq(p, list[j])) {
        swap(m += 1, j);
      }
    }

    return m;
  }
}

/// O   | M | <> сравнение | = присваивание | adaptive | stable | online
/// n^2 | 1 | =(n^2 - n)/2 | 3n             | -        | -      | -
extension MergeSort on Sorter {
  void mergeSort() {}

  void _msort(int l, int r) {}
}
