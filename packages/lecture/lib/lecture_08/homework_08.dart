import 'package:lecture/lecture_08/lecture_08.dart';
import 'package:tester/tester.dart';

import '../lecture_06/sorter.dart';

part 'homework_08.quick.p.dart';

Future<void> launch() async {
  final task = QuickSortReverseTask();
  final tester = Tester(task);
  tester.run(showExpectActual: false);
}
