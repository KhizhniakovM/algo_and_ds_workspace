/*
  Доказано, что для сравнения n чисел нельзя улучшить асимптотику n * log n 
  используя только операции сравнения

  Нахождение медианы за линейное время
  https://habr.com/ru/articles/346930/
*/
import 'dart:math';

import 'package:lecture/lecture_04/linked_list/linked_list.dart';
import 'package:lecture/lecture_04/linked_list/one_way_linked_list.dart';
import 'package:lecture/lecture_06/sorter.dart';

extension BucketSort on Sorter {
  void bucketSort() {
    // Находим максимальный элемент
    int max = list[0];
    for (int i = 1; i < n; i++) {
      if (list[i] > max) max = list[i];
    }
    // Прибавляем к нему 1 для формулы
    max += 1;

    // Создаем наши "ведра"
    final buckets = List<OneWayLinkedList<int>>.generate(
      n,
      (_) => OneWayLinkedList<int>(),
      growable: false,
    );

    // Каждое число кладем в нужное ведро
    for (int i = 0; i < n; i++) {
      // Находим индекс ведра
      final bg = ((BigInt.from(list[i]) * BigInt.from(n)) ~/ BigInt.from(max));
      final bidx = bg.toInt();
      // Создаем ноду в самом начале списка
      buckets[bidx].head = OneWayListNode(list[i], next: buckets[bidx].head);
      // Двигаем ноду по списку, чтобы она заняла свое место
      ListNode<int>? item = buckets[bidx].head;

      while (item?.next != null) {
        if (item!.value < item.next!.value) break;
        final x = item.value;
        item.value = item.next!.value;
        item.next!.value = x;

        item = item.next;
      }
    }
    // Собираем все элементы обратно в список
    int j = 0;
    for (final bucket in buckets) {
      ListNode<int>? item = bucket.head;
      while (item != null) {
        list[j] = item.value;
        item = item.next;
        j++;
      }
    }
  }
}

extension CountingSort on Sorter {
  void countingSort() {
    // Создаем массив в который будем складывать результат
    final result = List.generate(n, (_) => 0, growable: false);

    // Находим максимальный элемент списка
    int max = list[0];
    for (int i = 1; i < n; i++) {
      if (list[i] > max) max = list[i];
    }
    // Создаем массив, где каждый индекс будет отвечать за свое число
    // и считаем количество появлений каждого числв в списке
    final counter = List<int>.generate(max + 1, (_) => 0, growable: false);
    for (int i = 0; i < n; i++) {
      counter[list[i]] += 1;
    }
    // Считаем на какой индекс выставлять каждое число из списка
    for (int i = 1; i < counter.length; i++) {
      counter[i] = counter[i] + counter[i - 1];
    }

    // Записываем каждое число из начального списка в новый на его посчитанный индекс
    for (int i = n - 1; i >= 0; i--) {
      final idx = counter[list[i]] - 1;
      result[idx] = list[i];
      counter[list[i]] -= 1;
    }

    list
      ..clear()
      ..addAll(result);
  }
}

extension RadixSort on Sorter {
  void radixSort() {
    // Находим максимальный элемент и считаем количество его разрядов
    int max = list[0];
    for (int i = 1; i < n; i++) {
      if (list[i] > max) max = list[i];
    }
    final maxDigits = max.toString().length;
    final base = 10;

    // Создаем 10 ведер в которые будем раскладывать числа по разрядам
    final buckets = List<List<int>>.generate(
      10,
      (_) => List<int>.empty(growable: true),
      growable: false,
    );

    // Количество проходов будет равно количеству разрядов максимального числа
    for (int i = 0; i < maxDigits; i++) {
      // Достаем цифру текущего разряда у каждого числа и в зависимости от нее
      // складываем число в нужное ведро
      for (int j = 0; j < n; j++) {
        final digit = (list[j] ~/ pow(base, i)) % base;
        buckets[digit].add(list[j]);
      }
      // Очищаем весь список
      list.clear();
      // Последовательно добавляем всю инфу из ведер и оцищаем их
      for (final bucket in buckets) {
        list.addAll(bucket);
        bucket.clear();
      }
    }
  }
}

extension TimSort on Sorter {
  static const run = 32;

  void timSort() {
    for (int i = 0; i < n; i += TimSort.run) {
      _insertionSort(i, min(i + 31, n - 1));
    }

    for (int size = TimSort.run; size < n; size = 2 * size) {
      for (int left = 0; left < n; left += 2 * size) {
        int middle = left + size - 1;
        int right = min((left + 2 * size - 1), (n - 1));
        _merge(left, middle, right);
      }
    }
  }

  void _insertionSort(int left, int right) {
    for (int i = left + 1; i <= right; i++) {
      for (int j = i - 1; j >= left && more(list[j], list[j + 1]); j--) {
        swap(j, j + 1);
      }
    }
  }

  void _merge(int l, int m, int r) {
    final res = <int>[];
    int a = l;
    int b = m + 1;

    while (a <= m && b <= r) {
      if (more(list[a], list[b])) {
        res.add(list[b]);
        b++;
      } else {
        res.add(list[a]);
        a++;
      }
    }
    // Change of merge_sort
    while (a <= m && a <= r) {
      res.add(list[a]);
      a++;
    }
    while (b <= r) {
      res.add(list[b]);
      b++;
    }
    for (int i = l; i <= r; i++) {
      list[i] = res[i - l];
    }
  }
}
