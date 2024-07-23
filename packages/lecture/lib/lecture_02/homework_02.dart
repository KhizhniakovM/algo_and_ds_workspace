import 'dart:async';
import 'dart:math' as math;

import 'package:lecture/lecture_02/lecture_02.dart';
import 'package:tester/tester.dart';

FutureOr<void> launch() {
  final task = HappyTicketsTask();
  final tester = TesterSort(task);
  tester.run();
}

class HappyTicketsTask implements Task {
  @override
  String get path => 'assets/happy_tickets/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final input = int.tryParse(data[0]);
    if (input == null) throw Exception('Input is not valid');
    final resolver = HappyTickets();

    stopwatch.start();
    final result = resolver.seniorSolution(input);
    stopwatch.stop();

    return result.toString();
  }
}

extension HappyTicketsSenior on HappyTickets {
  int seniorSolution(int n) {
    int counter = 0;
    List<int> list = [];

    // Добавляем первые 10 единиц
    for (int i = 0; i < 10; i++) {
      list.add(1);
    }

    // Создаем следующий массив необходимое число раз
    for (int i = 0; i < n - 1; i++) {
      list = _updateList(list);
    }

    // складываем квадраты значений получившегося массива
    for (int i = 0; i < list.length; i++) {
      counter += math.pow(list[i], 2).toInt();
    }

    return counter;
  }

  static List<int> _updateList(List<int> previousList) {
    final newList = [...previousList, ...List.filled(9, 0)];

    for (int i = 0; i < newList.length; i++) {
      int newValue = 0;

      for (int j = 0; j < 10; j++) {
        final index = i - j;
        if (index >= 0 && index < previousList.length) {
          newValue += previousList[index];
        }
      }

      newList[i] = newValue;
    }
    return newList;
  }
}
