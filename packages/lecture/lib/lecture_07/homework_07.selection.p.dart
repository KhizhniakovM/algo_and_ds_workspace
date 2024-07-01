part of 'homework_07.dart';

/// N = 10; cmp = 45; asg = 27; 163 µs
/// N = 100; cmp = 4950; asg = 297; 232 µs
/// N = 1000; cmp = 499500; asg = 2997; 1 ms
/// N = 10000; cmp = 49995000; asg = 29997; 62 ms
/// N = 100000; cmp = 4999950000; asg = 299997; 6184 ms
class SelectionSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.selectionSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 45; asg = 27; 162 µs
/// N = 100; cmp = 4950; asg = 297; 239 µs
/// N = 1000; cmp = 499500; asg = 2997; 1 ms
/// N = 10000; cmp = 49995000; asg = 29997; 82 ms
/// N = 100000; cmp = 4999950000; asg = 299997; 6179 ms
class SelectionSortDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.selectionSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 45; asg = 27; 188 µs
/// N = 100; cmp = 4950; asg = 297; 270 µs
/// N = 1000; cmp = 499500; asg = 2997; 1 ms
/// N = 10000; cmp = 49995000; asg = 29997; 63 ms
/// N = 100000; cmp = 4999950000; asg = 299997; 6207 ms
class SelectionSortSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.selectionSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 45; asg = 27; 163 µs
/// N = 100; cmp = 4950; asg = 297; 232 µs
/// N = 1000; cmp = 499500; asg = 2997; 1 ms
/// N = 10000; cmp = 49995000; asg = 29997; 62 ms
/// N = 100000; cmp = 4999950000; asg = 299997; 6184 ms
class SelectionSortReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.selectionSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
