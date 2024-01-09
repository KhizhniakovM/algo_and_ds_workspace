import 'package:lecture/lecture_04/list/matrix_array.dart';
import 'package:lecture/lecture_04/tester.dart';

void launch() {
  final array = MatrixArray<int>(defaultSize: 1000);
  final tester = ArrayTester();
  
  tester.testRemoveFromRandom(array);
  // tester.testRemoveFromStart(array);
  // tester.testRemoveFromEnd(array);
}
