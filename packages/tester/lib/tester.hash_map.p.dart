part of 'tester.dart';

class TesterHashMap implements Tester {
  final Task _task;

  TesterHashMap(this._task);

  @override
  void run({bool showExpectActual = true}) {
    int number = 0;
    print('==================================================');
    print('µs == microseconds, ms == milliseconds');
    print('1 ms == 1000 µs');

    while (true) {
      final input = '${_task.path}test.$number.in';

      if (!File(input).existsSync()) break;

      _runTest(
        input,
        testNumber: number,
        showExpectActual: showExpectActual,
      );

      number++;
    }
  }

  void _runTest(
    String input, {
    required int testNumber,
    required bool showExpectActual,
  }) {
    try {
      final dataString =
          File(input).readAsStringSync().replaceAll('\n', ' ').trim();
      if (showExpectActual) print('Test #$testNumber input = $dataString');
      final data = File(input).readAsLinesSync();

      final stopwatch = Stopwatch();
      final actual = _task.run(data, stopwatch: stopwatch).trim();
      final result = StringBuffer('Test #$testNumber duration:');
      stopwatch.elapsedMilliseconds != 0
          ? result.write(' ${stopwatch.elapsedMilliseconds} ms')
          : result.write(' ${stopwatch.elapsedMicroseconds} µs');
      print(result.toString());
      if (showExpectActual) {
        print('Test #$testNumber actual = $actual');
      }
    } catch (e) {
      print('Test #$testNumber failed: $e');
    }
  }
}
