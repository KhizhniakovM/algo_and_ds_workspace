/*
  Как выполнять домашнюю работу
*/

void main() {
  final resolver = HappyTickets();
  final count = 1000;
  final stopwatch = Stopwatch()..start();
  late int result;

  for (int i = 0; i < count; i++) {
    result = resolver.middleSolutionRecursive_2(3);
  }
  stopwatch.stop();
  print('Count: $count');
  print('Time: ${stopwatch.elapsed}');
  print('Result: $result');
}

/// Билет с 2N значным номером считается счастливым,
/// если сумма N первых цифр равна сумме последних N цифр.
///
/// Посчитать, сколько существует счастливых 2N-значных билетов.
///
/// Начальные данные: число N от 1 до 10.
///
/// Вывод результата: количество 2N-значных счастливых билетов.
class HappyTickets {
  /// Bruteforce метод для 6 цифр в билете
  /// Count: 1000
  /// Time: 0:00:00.644203
  /// Result: 55252
  /// Сложность алгоритма - экспоненциальная:
  /// O(n^6) - неверный ответ, так как непонятно о каком n идет речь
  /// O(10^6) - верный ответ, так как каждый цикл выполняется 10 раз, n == 10
  int bruteforceSolutionFor3_1() {
    int counter = 0;

    for (int a = 0; a <= 9; a++) {
      for (int b = 0; b <= 9; b++) {
        for (int c = 0; c <= 9; c++) {
          for (int x = 0; x <= 9; x++) {
            for (int y = 0; y <= 9; y++) {
              for (int z = 0; z <= 9; z++) {
                final sum1 = a + b + c;
                final sum2 = x + y + z;

                if (sum1 == sum2) counter++;
              }
            }
          }
        }
      }
    }

    return counter;
  }

  /// Count: 1000
  /// Time: 0:00:00.085694
  /// Result: 55252
  int bruteforceSolutionFor3_2() {
    int counter = 0;

    for (int a = 0; a <= 9; a++) {
      for (int b = 0; b <= 9; b++) {
        for (int c = 0; c <= 9; c++) {
          // Вынесем расчет суммы первых трех элементов,
          // так как эта сумма не будет меняться всю следующую тысячу циклов

          // Тем самым мы улучшим скорость на 10^6 операций
          final sum1 = a + b + c;

          for (int x = 0; x <= 9; x++) {
            for (int y = 0; y <= 9; y++) {
              // Уберем последний цикл и будем высчитывать переменную z
              final z = sum1 - x - y;
              // Если 1+2+3 == 5+0+z, то z = (1+2+3) - (5+0)
              // то есть только один вариант для того, чтобы уровнение сошлось
              // и этот вариант должен быть цифрой (0-9)

              // Из-за удаления одного цикла скорость программы выросла в 10 раз
              if (z >= 0 && z <= 9) counter++;
            }
          }
        }
      }
    }

    return counter;
  }

  /// Time: 0:00:00.012522
  /// Result: 55252
  int bruteforceSolutionFor3_3() {
    int counter = 0;

    for (int a = 0; a <= 9; a++) {
      for (int b = 0; b <= 9; b++) {
        final sum1 = a + b;

        for (int x = 0; x <= 9; x++) {
          for (int y = 0; y <= 9; y++) {
            final sum2 = x + y;
            // Предположим, что 1+2+с == 1+2+z,
            // Может быть 10 различных случаев, когда c == z (0==0, 1==1, 2==2, ...)
            // Если модуль разности sum1 и sum2 равен 1
            // 1+2+с == 1+1+z, то таких случаев уже будет 9 и т.д.
            // Например: 3+9+с == 3+0+z, разница по модулю == 9, получаем:
            // с == z - 9 (Есть только одно решение для этого уравнения,
            // чтобы и с и z оставались цифрой от 0 до 9)
            final abs = (sum1 - sum2).abs();
            if (abs <= 9) counter += (10 - abs);
          }
        }
      }
    }

    return counter;
  }

  /// Count: 1000 for n == 3
  /// Time: 0:00:01.633983
  /// Result: 55252
  ///
  /// ! Скорость этого алгоритма для трех значительно ниже, чем скорость bruteforce алгоритма.
  /// ! Вероятно это особенности работы языка или устройства
  int middleSolutionRecursive_1(int n) {
    int counter = 0;

    void next(int n, int sum1, int sum2) {
      if (n == 0) {
        if (sum1 == sum2) counter++;
        return;
      }

      for (int a = 0; a <= 9; a++) {
        for (int b = 0; b <= 9; b++) {
          next(n - 1, sum1 + a, sum2 + b);
        }
      }
    }

    next(n, 0, 0);
    return counter;
  }

  /// Count: 1000
  /// Time: 0:00:00.054972
  /// Result: 55252
  int middleSolutionRecursive_2(int n) {
    int counter = 0;

    void next(int n, int sum1, int sum2) {
      if (n == 1) {
        // Избавились от одной операции вглубь и улучшили алгоритм в 100 раз
        final abs = (sum1 - sum2).abs();
        if (abs <= 9) counter += (10 - abs);
        return;
      }

      for (int a = 0; a <= 9; a++) {
        for (int b = 0; b <= 9; b++) {
          next(n - 1, sum1 + a, sum2 + b);
        }
      }
    }

    next(n, 0, 0);
    return counter;
  }
}
