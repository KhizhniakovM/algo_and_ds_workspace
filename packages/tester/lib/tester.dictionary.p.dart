part of 'tester.dart';

class TesterDictionary implements Tester {
  final Task _task;

  TesterDictionary(this._task);

  @override
  void run({bool showExpectActual = true}) {
    print('==================================================');
    print('µs == microseconds, ms == milliseconds');
    print('1 ms == 1000 µs');

    final input = '${_task.path}2000_english_words.txt';

    if (!File(input).existsSync()) return;

    _runTest(
      input,
      showExpectActual: showExpectActual,
    );
  }

  void _runTest(
    String input, {
    required bool showExpectActual,
  }) {
    try {
      final dataString =
          File(input).readAsStringSync().replaceAll('\n', ' ').trim();
      if (showExpectActual) print('Test dictionary, input = $dataString');
      final data = File(input).readAsLinesSync();

      final stopwatch = Stopwatch();
      final actual = _task.run(data, stopwatch: stopwatch).trim();
      final result = StringBuffer('Test dictionary, duration:');
      stopwatch.elapsedMilliseconds != 0
          ? result.write(' ${stopwatch.elapsedMilliseconds} ms')
          : result.write(' ${stopwatch.elapsedMicroseconds} µs');
      print(result.toString());
      if (showExpectActual) {
        print('Test dictionary, actual = $actual');
      }
    } catch (e) {
      print('Test dictionary, failed: $e');
    }
  }
}
