import 'dart:io';

class Tester {
  final Task _task;
  final String _path;

  Tester(this._task, this._path);

  void run() {
    int number = 0;

    while (true) {
      final input = '${_path}test.$number.in';
      final output = '${_path}test.$number.out';

      if (!File(input).existsSync() || !File(output).existsSync()) break;
      print('==================================================');
      print('Test #$number ${_runTest(input, output, testNumber: number)}\n');
      
      number++;
    }
  }

  bool _runTest(String input, String output, {required int testNumber}) {
    try {
      final data = File(input).readAsLinesSync();
      final expect = File(output).readAsStringSync().trim();

      final stopwatch = Stopwatch()..start();
      final actual = _task.run(data).trim();
      stopwatch.stop();
      print('Test #$testNumber duration: ${stopwatch.elapsed}');
      print('Test #$testNumber expect = $expect, actual = $actual');
      
      return expect == actual;
    } catch (e) {
      print('Test #$testNumber failed: $e');
      return false;
    }
  }
}

abstract interface class Task {
  String run(List<String> data);
}
