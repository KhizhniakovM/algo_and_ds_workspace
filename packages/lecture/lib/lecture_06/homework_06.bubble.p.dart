part of 'homework_06.dart';

class BubbleSortRandomTask implements Task {
  // 1 - 1 µs
  // 10 - 48 µs
  // 100 - 297 µs
  // 1 000 - 3 ms
  // 10 000 - 193 ms
  // 100 000 - 25342 ms
  // 1 000 000 - ?
  // 10 000 000 - ?

  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bubbleSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

class BubbleSortDigitsTask implements Task {
  // 1 - 1 µs
  // 10 - 71 µs
  // 100 - 317 µs
  // 1 000 - 2 ms
  // 10 000 - 188 ms
  // 100 000 - 24733 ms
  // 1 000 000 - ?
  // 10 000 000 - ?

  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bubbleSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

class BubbleSortSortedTask implements Task {
  // 1 - 1 µs
  // 10 - 47 µs
  // 100 - 153 µs
  // 1 000 - 1 ms
  // 10 000 - 91 ms
  // 100 000 - 7481 ms
  // 1 000 000 - ?
  // 10 000 000 - ?

  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bubbleSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

class BubbleSortReverseTask implements Task {
  // 1 - 1 µs
  // 10 - 49 µs
  // 100 - 443 µs
  // 1 000 - 9 ms
  // 10 000 - 184 ms
  // 100 000 - 18873 ms
  // 1 000 000 - ?
  // 10 000 000 - ?

  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bubbleSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
