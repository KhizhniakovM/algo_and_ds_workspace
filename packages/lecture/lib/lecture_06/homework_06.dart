import 'dart:async';

import 'package:lecture/lecture_06/lecture_06.dart';
import 'package:tester/tester.dart';

part 'homework_06.bubble.p.dart';
part 'homework_06.insert.p.dart';

Future<void> launch() async {
  final task = InsertBinaryShiftSortRandomTask();
  final tester = Tester(task);
  tester.run(withOutput: false);
}
