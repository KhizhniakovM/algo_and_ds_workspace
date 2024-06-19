/*
  Сортировки выбором
  https://habr.com/ru/articles/422085/

  Пирамидальная сортировка
  https://habr.com/ru/companies/otus/articles/552018/
*/

import '../lecture_06/sorter.dart';

extension SelectionSort on Sorter {
  /// O   | M | <> сравнение | = присваивание | adaptive | stable | online
  /// n^2 | 1 | =(n^2 - n)/2 | 3n             | -        | -      | -
  void selectionSort() {
    for (int j = n - 1; j > 0; j--) {
      swap(_findMax(j), j);
    }
  }

  int _findMax(int j) {
    int max = 0;

    for (int i = 1; i <= j; i++) {
      if (more(list[i], list[max])) max = i;
    }

    return max;
  }
}
