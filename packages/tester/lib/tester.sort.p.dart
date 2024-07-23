part of 'tester.dart';

class TesterSort implements Tester {
  final Task _task;

  TesterSort(this._task);

  @override
  void run({bool showExpectActual = true}) {
    int number = 0;
    print('==================================================');
    print('µs == microseconds, ms == milliseconds');
    print('1 ms == 1000 µs');

    while (true) {
      final input = '${_task.path}test.$number.in';
      final output = '${_task.path}test.$number.out';

      if (!File(input).existsSync() || !File(output).existsSync()) break;

      final result = _runTest(
        input,
        output,
        testNumber: number,
        showExpectActual: showExpectActual,
      );

      print('==================================================');
      print('Test #$number $result\n');

      number++;
    }
  }

  bool _runTest(
    String input,
    String output, {
    required int testNumber,
    required bool showExpectActual,
  }) {
    try {
      final dataString =
          File(input).readAsStringSync().replaceAll('\n', ' ').trim();
      if (showExpectActual) print('Test #$testNumber input = $dataString');
      final data = File(input).readAsLinesSync();
      final expect =
          File(output).readAsStringSync().replaceAll('\n', ' ').trim();

      final stopwatch = Stopwatch();
      final actual = _task.run(data, stopwatch: stopwatch).trim();
      final result = StringBuffer('Test #$testNumber duration:');
      stopwatch.elapsedMilliseconds != 0
          ? result.write(' ${stopwatch.elapsedMilliseconds} ms')
          : result.write(' ${stopwatch.elapsedMicroseconds} µs');
      print(result.toString());
      if (showExpectActual) {
        print('Test #$testNumber expect = $expect, actual = $actual');
      }

      return expect == actual;
    } catch (e) {
      print('Test #$testNumber failed: $e');
      return false;
    }
  }
}


