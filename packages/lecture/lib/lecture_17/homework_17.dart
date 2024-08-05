import 'package:tester/tester.dart';

import 'dictionary/dictionary_parallel_arrays.dart';
import 'lecture_17.dart';

part 'homework_17.parallel.p.dart';

Future<void> launch() async {
  final task = DictionaryParallelTask();
  final tester = TesterDictionary(task);
  tester.run(showExpectActual: false);
}
