part of 'homework_06.dart';

/// N = 10; cmp = 24; asg = 48; 66 µs
/// N = 100; cmp = 2253; asg = 6471; 209 µs
/// N = 1000; cmp = 248479; asg = 742467; 1 ms
/// N = 10000; cmp = 25298615; asg = 75865872; 95 ms
/// N = 100000; cmp = 2501837753; asg = 7505213289; 9474 ms
class InsertionSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.insertionSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

class InsertionSortDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.insertionSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

class InsertionSortSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.insertionSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

class InsertionSortReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.insertionSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

// ==================================================

/// N = 10; cmp = 24; asg = 34; 73 µs
/// N = 100; cmp = 2253; asg = 2355; 167 µs
/// N = 1000; cmp = 248479; asg = 249487; 2 ms
/// N = 10000; cmp = 25298615; asg = 25308622; 70 ms
/// N = 100000; cmp = 2501837753; asg = 2501937761; 6967 ms
class InsertShiftSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.insertShiftSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

// ==================================================

/// N = 10; cmp = 24; asg = 43; 159 µs
/// N = 100; cmp = 546; asg = 2454; 136 µs
/// N = 1000; cmp = 8754; asg = 250486; 2 ms
/// N = 10000; cmp = 120526; asg = 25318621; 66 ms
/// N = 100000; cmp = 1540609; asg = 2502037760; 6402 ms
class InsertBinaryShiftSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.insertBinaryShiftSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
