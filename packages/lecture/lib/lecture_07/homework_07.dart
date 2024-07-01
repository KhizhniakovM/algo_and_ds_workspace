import 'package:lecture/lecture_07/lecture_07.dart';
import 'package:tester/tester.dart';

import '../lecture_06/sorter.dart';

part 'homework_07.heap.p.dart';
part 'homework_07.selection.p.dart';

Future<void> launch() async {
  final task = HeapSortReverseTask();
  final tester = Tester(task);
  tester.run(showExpectActual: false);
}
