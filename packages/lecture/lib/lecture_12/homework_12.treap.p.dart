part of '../lecture_12/homework_12.dart';

/// N = 1000; 3 ms
/// N = 10000; 9 ms
/// N = 100000; 107 ms
/// N = 1000000; 1842 ms
/// N = 10000000; 32781 ms
class TreapRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.treapSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 3 ms
/// N = 10000; 8 ms
/// N = 100000; 70 ms
/// N = 1000000; 959 ms
/// N = 10000000; 9106 ms
class TreapDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.treapSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 2 ms
/// N = 10000; 8 ms
/// N = 100000; 68 ms
/// N = 1000000; 762 ms
/// N = 10000000; 9211 ms
class TreapSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.treapSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 2 ms
/// N = 10000; 6 ms
/// N = 100000; 45 ms
/// N = 1000000; 496 ms
/// N = 10000000; 5243 ms
class TreapReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.treapSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
