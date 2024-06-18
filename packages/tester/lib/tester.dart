import 'dart:io';

class Tester {
  final Task _task;

  Tester(this._task);

  void run({bool withOutput = true, String? additionalInfo}) {
    int number = 0;
    print('==================================================');
    print('µs == microseconds, ms == milliseconds');
    print('1 ms == 1000 µs');

    while (true) {
      final input = '${_task.path}test.$number.in';
      final output = '${_task.path}test.$number.out';

      if (!File(input).existsSync() || !File(output).existsSync()) break;

      print('==================================================');
      print('Test #$number ${_runTest(
        input,
        output,
        testNumber: number,
        withOutput: withOutput,
      )}\n');

      number++;
    }
  }

  bool _runTest(
    String input,
    String output, {
    required int testNumber,
    required bool withOutput,
  }) {
    try {
      final dataString =
          File(input).readAsStringSync().replaceAll('\n', ' ').trim();
      if (withOutput) print('Test #$testNumber input = $dataString');
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
      if (withOutput) {
        print('Test #$testNumber expect = $expect, actual = $actual');
      }

      return expect == actual;
    } catch (e) {
      print('Test #$testNumber failed: $e');
      return false;
    }
  }
}

abstract interface class Task {
  String get path;

  String run(
    List<String> data, {
    required Stopwatch stopwatch,
  });
}
