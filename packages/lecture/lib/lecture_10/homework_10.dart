import 'package:lecture/lecture_10/lecture_10.dart';
import 'package:tester/tester.dart';

import '../lecture_06/sorter.dart';

part 'homework_10.avl.p.dart';
part 'homework_10.bst.p.dart';

Future<void> launch() async {
  final task = AVLRandomTask();
  final tester = Tester(task);
  tester.run(showExpectActual: false);
}
