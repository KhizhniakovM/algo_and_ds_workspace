import 'package:lecture/lecture_12/lecture_12.dart';
import 'package:tester/tester.dart';

import '../lecture_06/sorter.dart';

part 'homework_12.treap.p.dart';

Future<void> launch() async {
  final task = TreapReverseTask();
  final tester = Tester(task);
  tester.run(showExpectActual: false);
}
