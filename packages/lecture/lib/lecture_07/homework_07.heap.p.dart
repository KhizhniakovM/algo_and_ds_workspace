part of 'homework_07.dart';

/// N = 10; cmp = 39; asg = 84; 220 µs
/// N = 100; cmp = 1034; asg = 1773; 107 µs
/// N = 1000; cmp = 16850; asg = 27195; 1 ms
/// N = 10000; cmp = 235395; asg = 372666; 2 ms
/// N = 100000; cmp = 3020053; asg = 4725009; 28 ms
/// N = 1000000; cmp = 36792142; asg = 57139560; 378 ms
/// N = 10000000; cmp = 434640382; asg = 671495136; 5623 ms
class HeapSortRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.heapSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 37; asg = 81; 329 µs
/// N = 100; cmp = 980; asg = 1572; 360 µs
/// N = 1000; cmp = 15801; asg = 24813; 2 ms
/// N = 10000; cmp = 217737; asg = 338082; 2 ms
/// N = 100000; cmp = 2766452; asg = 4261539; 20 ms
/// N = 1000000; cmp = 33483726; asg = 51331686; 227 ms
/// N = 10000000; cmp = 394975504; asg = 603632994; 2621 ms
class HeapSortDigitsTask implements Task {
  @override
  String get path => 'assets/sorting/1.digits/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.heapSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 39; asg = 84; 220 µs
/// N = 100; cmp = 1081; asg = 1935; 107 µs
/// N = 1000; cmp = 17560; asg = 29040; 1 ms
/// N = 10000; cmp = 244307; asg = 394440; 2 ms
/// N = 100000; cmp = 3110584; asg = 4945860; 21 ms
/// N = 1000000; cmp = 37692154; asg = 59295588; 259 ms
/// N = 10000000; cmp = 444849813; asg = 694817772; 3038 ms
class HeapSortSortedTask implements Task {
  @override
  String get path => 'assets/sorting/2.sorted/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.heapSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}

/// N = 10; cmp = 35; asg = 63; 220 µs
/// N = 100; cmp = 944; asg = 1548; 107 µs
/// N = 1000; cmp = 15965; asg = 24948; 1 ms
/// N = 10000; cmp = 226682; asg = 350088; 2 ms
/// N = 100000; cmp = 2926640; asg = 4492302; 21 ms
/// N = 1000000; cmp = 36001436; asg = 55000224; 238 ms
/// N = 10000000; cmp = 426919609; asg = 650737284; 2730 ms
class HeapSortReverseTask implements Task {
  @override
  String get path => 'assets/sorting/3.revers/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.heapSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
