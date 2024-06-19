part of 'homework_06.dart';

/// N = 10; cmp = 29; asg = 30; 172 µs
/// N = 100; cmp = 877; asg = 1239; 85 µs
/// N = 1000; cmp = 15296; asg = 23445; 1 ms
/// N = 10000; cmp = 267306; asg = 457458; 3 ms
/// N = 100000; cmp = 4562610; asg = 9339837; 27 ms
/// N = 1000000; cmp = 68027835; asg = 151592142; 390 ms
/// N = 10000000; cmp = 1041605900; asg = 2479862580; 5713 ms
class ShellSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.shellSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 32; asg = 45; 166 µs
/// N = 100; cmp = 691; asg = 684; 63 µs
/// N = 1000; cmp = 10449; asg = 8589; 1 ms
/// N = 10000; cmp = 153568; asg = 112719; 2 ms
/// N = 100000; cmp = 1860949; asg = 1204296; 8 ms
/// N = 1000000; cmp = 22383596; asg = 14369463; 100 ms
/// N = 10000000; cmp = 270196822; asg = 162761751; 1168 ms
class ShellSortDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.shellSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 22; asg = 3; 110 µs
/// N = 100; cmp = 590; asg = 261; 46 µs
/// N = 1000; cmp = 10710; asg = 8166; 1 ms
/// N = 10000; cmp = 176309; asg = 169422; 3 ms
/// N = 100000; cmp = 2833579; asg = 4004910; 15 ms
/// N = 1000000; cmp = 38939516; asg = 62863278; 223 ms
/// N = 10000000; cmp = 624139826; asg = 1212861084; 3407 ms
class ShellSortSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.shellSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 27; asg = 39; 148 µs
/// N = 100; cmp = 668; asg = 780; 63 µs
/// N = 1000; cmp = 11716; asg = 14100; 1 ms
/// N = 10000; cmp = 172578; asg = 187680; 2 ms
/// N = 100000; cmp = 2244585; asg = 2533680; 7 ms
/// N = 1000000; cmp = 26357530; asg = 28072512; 84 ms
/// N = 10000000; cmp = 317626219; asg = 322878528; 995 ms
class ShellSortReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.shellSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
