import 'package:lecture/lecture_10/lecture_10.dart';
import 'package:tester/tester.dart';

import '../lecture_06/sorter.dart';

part 'homework_10.avl.p.dart';
part 'homework_10.bst.p.dart';
part 'homework_10.treap.p.dart';

Future<void> launch() async {
  final task = TreapReverseTask();
  final tester = Tester(task);
  tester.run(showExpectActual: false);
}
