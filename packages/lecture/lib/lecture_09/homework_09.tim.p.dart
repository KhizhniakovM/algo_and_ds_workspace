part of 'homework_09.dart';

/// N = 1000; 1 ms
/// N = 10000; 2 ms
/// N = 100000; 28 ms
/// N = 1000000; 347 ms
/// N = 10000000; 4154 ms
class TimSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.timSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 1 ms
/// N = 10000; 1 ms
/// N = 100000; 20 ms
/// N = 1000000; 247 ms
/// N = 10000000; 3275 ms
class TimSortDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.timSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 1 ms
/// N = 10000; 2 ms
/// N = 100000; 18 ms
/// N = 1000000; 223 ms
/// N = 10000000; 2861 ms
class TimSortSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.timSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 1 ms
/// N = 10000; 2 ms
/// N = 100000; 25 ms
/// N = 1000000; 297 ms
/// N = 10000000; 3543 ms
class TimSortReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.timSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
