part of 'homework_10.dart';

/// N = 1000; 1 ms
/// N = 10000; 4 ms
/// N = 100000; 47 ms
/// N = 1000000; 805 ms
/// N = 10000000; 16919 ms
class BSTRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bstSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 540 µs
/// N = 10000; 2 ms
/// N = 100000; 9 ms
/// N = 1000000; 87 ms
/// N = 10000000; 935 ms
class BSTDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bstSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 4 ms
/// N = 10000; 66 ms
/// N = 100000; 1218 ms
/// N = 1000000; 12270 ms
/// N = 10000000; Stack Overflow
class BSTSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bstSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 15 ms
/// N = 10000; Stack Overflow
/// N = 100000; Stack Overflow
/// N = 1000000; Stack Overflow
/// N = 10000000; Stack Overflow
class BSTReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bstSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
