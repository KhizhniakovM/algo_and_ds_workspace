part of 'homework_10.dart';

/// N = 1000; 1 ms
/// N = 10000; 4 ms
/// N = 100000; 47 ms
/// N = 1000000; 805 ms
/// N = 10000000; 16919 ms
class BSTRandomTask implements Task {
  @override
  String get path => 'assets/sorting/0.random/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final list = data[1].split(' ').map((n) => int.parse(n)).toList();
    final resolver = Sorter.fromList(list: list);

    stopwatch.start();
    resolver.bstSort();
    stopwatch.stop();

    print(resolver);

    return resolver.list.join(' ');
  }
}
