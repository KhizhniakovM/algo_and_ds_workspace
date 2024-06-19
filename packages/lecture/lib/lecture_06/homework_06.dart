import 'dart:async';

import 'package:lecture/lecture_06/lecture_06.dart';
import 'package:tester/tester.dart';

import 'sorter.dart';

part 'homework_06.bubble.p.dart';
part 'homework_06.insert.p.dart';
part 'homework_06.shell.p.dart';

Future<void> launch() async {
  final task = ShellSortReverseTask();
  final tester = Tester(task);
  tester.run(showExpectActual: false);
}
