import 'dart:math';

class Sorter {
  final List<int> list;

  int get n => list.length;

  int asg = 0;
  int cmp = 0;

  Sorter.fromList({
    required this.list,
  });

  Sorter.random({
    required int n,
  }) : list = List.generate(n, (_) => Random().nextInt(n), growable: false);

  Sorter.digitsOnly({
    required int n,
  }) : list = List.generate(n, (_) => Random().nextInt(10), growable: false);

  Sorter.sorted({
    required int n,
  }) : list = List.generate(n, (i) => i, growable: false);

  Sorter.reversed({
    required int n,
  }) : list = List.generate(n, (i) => n - i - 1, growable: false);

  void swap(int i, int j) {
    asg += 3;

    final t = list[i];
    list[i] = list[j];
    list[j] = t;
  }

  bool more(int i, int j) {
    cmp += 1;

    return i > j;
  }

  bool moreq(int i, int j) {
    cmp += 1;

    return i >= j;
  }

  int binarySearch(int key, int low, int high) {
    if (high <= low) {
      if (moreq(key, list[low])) {
        return low + 1;
      } else {
        return low;
      }
    }

    int mid = (low + high) ~/ 2;

    if (more(key, list[mid])) {
      return binarySearch(key, mid + 1, high);
    } else {
      return binarySearch(key, low, mid - 1);
    }
  }

  @override
  String toString() => 'N = $n; cmp = $cmp; asg = $asg;\n';
}
