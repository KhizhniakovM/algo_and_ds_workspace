part of 'homework_08.dart';

/// N = 10; cmp = 31; asg = 72; 223 µs
/// N = 100; cmp = 690; asg = 1155; 61 µs
/// N = 1000; cmp = 11404; asg = 16197; 1 ms
/// N = 10000; cmp = 155089; asg = 251610; 1 ms
/// N = 100000; cmp = 2065627; asg = 3168309; 13 ms
/// N = 1000000; cmp = 25482502; asg = 38832207; 164 ms
/// N = 10000000; cmp = 302644940; asg = 452452449; 1895 ms
class QuickSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.quickSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 31; asg = 45; 223 µs
/// N = 100; cmp = 880; asg = 2250; 61 µs
/// N = 1000; cmp = 54477; asg = 155970; 1 ms
/// N = 10000; cmp = 5038978; asg = 15071970; 22 ms
/// N = 100000; Stack Overflow
/// N = 1000000; Stack Overflow
/// N = 10000000; Stack Overflow
class QuickSortDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.quickSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 48; asg = 129; 193 µs
/// N = 100; cmp = 2760; asg = 8148; 333 µs
/// N = 1000; cmp = 175339; asg = 477348; 1 ms
/// N = 10000; cmp = 802285; asg = 581355; 2 ms
/// N = 100000; cmp = 17718857; asg = 28927680; 67 ms
/// N = 1000000; cmp = 262302136; asg = 405635235; 972 ms
/// N = 10000000; cmp = 3434202112; asg = 5375285124; 12807 ms
class QuickSortSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.quickSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 54; asg = 87; 254 µs
/// N = 100; cmp = 5049; asg = 7647; 408 µs
/// N = 1000; cmp = 500499; asg = 751497; 2 ms
/// N = 10000; Stack Overflow
/// N = 100000; Stack Overflow
/// N = 1000000; Stack Overflow
/// N = 10000000; Stack Overflow
class QuickSortReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.quickSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
