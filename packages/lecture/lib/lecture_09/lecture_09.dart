/*
  Доказано, что для сравнения n чисел нельзя улучшить асимптотику n * log n 
  используя только операции сравнения

  Нахождение медианы за линейное время
  https://habr.com/ru/articles/346930/
*/
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
      buckets[bidx].head = ListNode(value: list[i], next: buckets[bidx].head);
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
    final result = List.generate(n, (_) => 0, growable: false);

    int max = list[0];
    for (int i = 1; i < n; i++) {
      if (list[i] > max) max = list[i];
    }

    final counter = List<int>.generate(max + 1, (_) => 0, growable: false);
    for (int i = 0; i < n; i++) {
      counter[list[i]] += 1;
    }

    for (int i = 1; i < counter.length; i++) {
      counter[i] = counter[i] + counter[i - 1];
    }

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
  void radixSort() {}
}
