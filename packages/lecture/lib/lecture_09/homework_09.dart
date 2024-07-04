import 'package:lecture/lecture_09/lecture_09.dart';
import 'package:tester/tester.dart';

import '../lecture_06/sorter.dart';

part 'homework_09.bucket.p.dart';
part 'homework_09.counting.p.dart';

Future<void> launch() async {
  final task = CountingSortReverseTask();
  final tester = Tester(task);
  tester.run(showExpectActual: false);
}
