import 'package:lecture/lecture_13/hash_table/hash_table_with_chain.dart';
import 'package:tester/tester.dart';

part 'homework_13.hash_table_with_chain.p.dart';

Future<void> launch() async {
  final task = HashTableWithChainAddTask();
  final tester = TesterHashMap(task);
  tester.run(showExpectActual: false);
}
