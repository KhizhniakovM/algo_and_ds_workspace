part of 'homework_09.dart';

/// N = 1000; 746 µs
/// N = 10000; 3 ms
/// N = 100000; 15 ms
/// N = 1000000; 160 ms
/// N = 10000000; 1916 ms
class RadixSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.radixSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 222 µs
/// N = 10000; 2 ms
/// N = 100000; 5 ms
/// N = 1000000; 24 ms
/// N = 10000000; 284 ms
class RadixSortDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.radixSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 735 µs
/// N = 10000; 3 ms
/// N = 100000; 16 ms
/// N = 1000000; 162 ms
/// N = 10000000; 1898 ms
class RadixSortSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.radixSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 719 µs
/// N = 10000; 3 ms
/// N = 100000; 15 ms
/// N = 1000000; 163 ms
/// N = 10000000; 1945 ms
class RadixSortReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.radixSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
