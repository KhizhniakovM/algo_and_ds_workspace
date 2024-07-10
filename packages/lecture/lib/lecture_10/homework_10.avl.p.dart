part of 'homework_10.dart';

/// N = 1000; 13 ms
/// N = 10000; 1549 ms
/// N = 100000; - ms
/// N = 1000000; - ms
/// N = 10000000; - ms
class AVLRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.avlSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 1 ms
/// N = 10000; 5 ms
/// N = 100000; 27 ms
/// N = 1000000; 273 ms
/// N = 10000000; 2706 ms
class AVLDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.avlSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 18 ms
/// N = 10000; 1661 ms
/// N = 100000; - ms
/// N = 1000000; - ms
/// N = 10000000; - ms
class AVLSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.avlSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 15 ms
/// N = 10000; 1339 ms
/// N = 100000; - ms
/// N = 1000000; - ms
/// N = 10000000; - ms
class AVLReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.avlSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
