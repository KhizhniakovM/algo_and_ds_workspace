part of 'homework_09.dart';

/// N = 1000; 1 ms
/// N = 10000; 8 ms
/// N = 100000; 59 ms
/// N = 1000000; 798 ms
/// N = 10000000; 8904 ms
class BucketSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bucketSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 6 ms
/// N = 10000; 52 ms
/// N = 100000; 5998 ms
/// N = 1000000; - ms; too slow
/// N = 10000000; - ms; tooslow
class BucketSortDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bucketSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 2 ms
/// N = 10000; 7 ms
/// N = 100000; 35 ms
/// N = 1000000; 376 ms
/// N = 10000000; 3810 ms
class BucketSortSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bucketSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; 2 ms
/// N = 10000; 7 ms
/// N = 100000; 34 ms
/// N = 1000000; 368 ms
/// N = 10000000; 3934 ms
class BucketSortReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bucketSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
