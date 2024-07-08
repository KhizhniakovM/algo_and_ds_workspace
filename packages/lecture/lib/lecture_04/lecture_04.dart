/*

  Виды массивов:

  - Фиксированный 
    Фиксированный размер.

  - Динамический 
    Размер меняется в зависимости от количества элементов.

  - Разряженный
  
  - Ассоциативный. 
    Позволяет обращаться к элементам не по индексу, а по ключу.

  - Параллельный

*/

import 'package:lecture/lecture_04/linked_list/one_way_linked_list.dart';

import 'array_tester.dart';

void launch() {
  final array = OneWayLinkedList<int>();
  final tester = ArrayTester();

  // tester.testAdd(array);
  // tester.testInsertAtRandom(array);
  // tester.testInsertAtStart(array);
  // tester.testInsertAtEnd(array);
  // tester.testRemoveFromRandom(array);
  // tester.testRemoveFromStart(array);
  tester.testRemoveFromEnd(array);
}
