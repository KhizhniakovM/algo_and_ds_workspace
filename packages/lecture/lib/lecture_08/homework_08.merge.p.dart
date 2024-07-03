part of 'homework_08.dart';

/// N = 1000; cmp = 8721; asg = 19952; 1 ms
/// N = 10000; cmp = 120481; asg = 267232; 2 ms
/// N = 100000; cmp = 1536652; asg = 3337856; 30 ms
/// N = 1000000; cmp = 18674508; asg = 39902848; 333 ms
/// N = 10000000; cmp = 220101952; asg = 466445568; 4225 ms
class MergeSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.mergeSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; cmp = 8488; asg = 19952; 1 ms
/// N = 10000; cmp = 116872; asg = 267232; 2 ms
/// N = 100000; cmp = 1483484; asg = 3337856; 21 ms
/// N = 1000000; cmp = 17970393; asg = 39902848; 235 ms
/// N = 10000000; cmp = 211522718; asg = 466445568; 3336 ms
class MergeSortDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.mergeSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; cmp = 6645; asg = 19952; 1 ms
/// N = 10000; cmp = 101839; asg = 267232; 2 ms
/// N = 100000; cmp = 1341875; asg = 3337856; 20 ms
/// N = 1000000; cmp = 16606871; asg = 39902848; 231 ms
/// N = 10000000; cmp = 200958059; asg = 466445568; 3031 ms
class MergeSortSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.mergeSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 1000; cmp = 4932; asg = 19952; 1 ms
/// N = 10000; cmp = 64608; asg = 267232; 2 ms
/// N = 100000; cmp = 815024; asg = 3337856; 19 ms
/// N = 1000000; cmp = 9884992; asg = 39902848; 221 ms
/// N = 10000000; cmp = 114434624; asg = 466445568; 2890 ms
class MergeSortReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.mergeSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
