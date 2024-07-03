/*
  https://www.geeksforgeeks.org/quick-sort-algorithm/

  https://www.geeksforgeeks.org/merge-sort/

  https://ru.wikipedia.org/wiki/Timsort

  https://present5.com/algoritmy-vneshnej-sortirovki-lekciya-4-1-algoritmy/
*/

import '../lecture_06/sorter.dart';

/// O          | M | <> сравнение | = присваивание | adaptive | stable | online
/// n * log n  | 1 | -            | -              | -        | -      | -
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

/// O         | M | <> сравнение | = присваивание | adaptive | stable | online
/// n * log n | 1 | -            | -              | -        | +      | +-
extension MergeSort on Sorter {
  void mergeSort() => _msort(0, n - 1);

  void _msort(int l, int r) {
    if (l >= r) return;
    final m = (l + r) ~/ 2;
    _msort(l, m);
    _msort(m + 1, r);
    _merge(l, m, r);
  }

  void _merge(int l, int m, int r) {
    final res = <int>[];
    int a = l;
    int b = m + 1;

    while (a <= m && b <= r) {
      if (more(list[a], list[b])) {
        res.add(list[b]);
        b++;
      } else {
        res.add(list[a]);
        a++;
      }
    }
    while (a <= m) {
      res.add(list[a]);
      a++;
    }
    while (b <= r) {
      res.add(list[b]);
      b++;
    }
    for (int i = l; i <= r; i++) {
      list[i] = res[i - l];
    }
    asg += 2 * (r - l + 1);
  }
}
