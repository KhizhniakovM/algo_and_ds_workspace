part of 'homework_09.dart';

/// N = 1000; 240 µs
/// N = 10000; 2 ms
/// N = 100000; 7 ms
/// N = 1000000; 24 ms
/// N = 10000000; 420 ms
class CountingSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.countingSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 184 µs
/// N = 10000; 1 ms
/// N = 100000; 4 ms
/// N = 1000000; 12 ms
/// N = 10000000; 136 ms
class CountingSortDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.countingSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 238 µs
/// N = 10000; 1 ms
/// N = 100000; 6 ms
/// N = 1000000; 19 ms
/// N = 10000000; 251 ms
class CountingSortSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.countingSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 302 µs
/// N = 10000; 2 ms
/// N = 100000; 6 ms
/// N = 1000000; 18 ms
/// N = 10000000; 203 ms
class CountingSortReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.countingSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
