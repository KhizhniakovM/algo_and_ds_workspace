/* 
  Сложность алгоритмов:
    - Сложность по времени выполнения
    - Сложность по используемой памяти

  Порядок роста:
    - 1 - константная
    - log n - логарифмическая
    - n - линейная
    - n log n - квазилинейная
    - n ^ 2 - квадратичный 
    - n ^ k - полиномиальный 
    - 2 ^ n - экспоненциальный
    - n! - факториал
*/

import 'dart:async';
import 'dart:collection';

import 'painter.dart';

FutureOr<void> launch() async {
  final painter = Painter();
  await painter.addRandomPixels();
  await painter.fillDFSStack(painter.width ~/ 2, painter.height ~/ 2, 1);
}

/*
  Рекурсия:
    1 вопрос. Когда рекурсия заканчивается?
*/
extension PainterRecursive on Painter {
  // Future<void> drawHLine(int y) async {
  //   for (int x = 0; x < size; x++) {
  //     await drawPoint(x, y, '#');
  //   }
  // }

  // 1. Необходимо вынести x из цикла в аргумент функции
  Future<void> drawHLineRecursive(int x, int y) async {
    // 1. Сначала выделяем условие выхода из функции
    // 2. Совершаем действие
    // 3. Вызываем функцию рекурсивно
    if (x >= width) return;
    await drawPoint(x, y, 1);
    await drawHLineRecursive(x + 1, y);

    // Можно сначала вызвать функцию рекурсивно, а потом совершить действие,
    // тогда линия будет рисоваться с конца строки

    // await drawHLineRecursive(x + 1, y);
    // await drawPoint(x, y, 1);

    // ! ==================================================
    // Но лучше чтобы рекурсия была "хвостовая" (в конце функции),
    // некоторые из таких функций могут быть оптимизированы процессором
    // ! ==================================================
  }

  Future<void> drawSquareRecursive(int x, int y, int v) async {
    if (!isPointEmpty(x, y)) return;

    await drawPoint(x, y, v);
    await drawSquareRecursive(x + 1, y, 1);
    await drawSquareRecursive(x, y + 1, 3);
    await drawPoint(x, y, 6);
  }

  /// Deep First Search
  Future<void> fillDFS(int x, int y, Object v) async {
    if (!isPointEmpty(x, y)) return;

    await drawPoint(x, y, v);
    await fillDFS(x + 1, y, 2);
    await fillDFS(x - 1, y, 3);
    await fillDFS(x, y - 1, 4);
    await fillDFS(x, y + 1, 5);
    await drawPoint(x, y, 6);
  }

  /// Breadth First Search
  Future<void> fillBFS(int x, int y, Object v) async {
    final queue = Queue<(int x, int y)>();
    queue.add((x, y));

    Future<void> push(int a, int b, Object v) async {
      if (!isPointEmpty(a, b)) return;
      await drawPoint(a, b, v);
      queue.add((a, b));
    }

    while (queue.isNotEmpty) {
      final (x, y) = queue.removeFirst();
      await drawPoint(x, y, 6);
      await push(x + 1, y, 2);
      await push(x - 1, y, 3);
      await push(x, y + 1, 4);
      await push(x, y - 1, 5);
    }
  }

  // ! ==================================================
  // Можно превратить алгоритм поиска в ширину в алгоритм поиска в глубину,
  // если просто заменим Очередь на Стек.
  // ! ==================================================

  /// Deep First Search with Stack
  Future<void> fillDFSStack(int x, int y, Object v) async {
    final stack = Queue<(int x, int y)>();
    stack.add((x, y));

    Future<void> push(int a, int b, Object v) async {
      if (!isPointEmpty(a, b)) return;
      await drawPoint(a, b, v);
      stack.add((a, b));
    }

    while (stack.isNotEmpty) {
      final (x, y) = stack.removeLast();
      await drawPoint(x, y, 6);
      await push(x + 1, y, 2);
      await push(x - 1, y, 3);
      await push(x, y + 1, 4);
      await push(x, y - 1, 5);
    }
  }
}
