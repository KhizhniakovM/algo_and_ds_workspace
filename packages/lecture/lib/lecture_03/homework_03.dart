class Power {
  /// Простой, итеративный метод возведения числа в степень
  /// Сложность алгоритма - O(n) (линейная).
  /// Count: 10000000000
  /// Time: 0:00:12.562803
  double simpleIterative(double basic, double power) {
    double result = 1;

    for (int i = 0; i < power; i++) {
      result *= basic;
    }

    return result;
  }

  /// Простой, рекурсивный метод возведения числа в степень
  /// Сложность алгоритма - O(n) (линейная).
  /// Больше 100 000 падает с переполнением стека
  double simpleRecursive(double basic, double power) {
    if (power == 0) return 1;

    return basic * simpleRecursive(basic, power - 1);
  }

  /// Метод возведения в квадрат используя степени двойки, рекурсивный
  /// Сложность алгоритма - O(log n)
  /// Count: 10000000000
  /// Time: 0:00:00.000005
  double seniorRecursive(double basic, double power) {
    if (power == 0) return 1;
    if (power == 1) return basic;

    if (power % 2 == 0) {
      final tmp = seniorRecursive(basic, power / 2);
      return tmp * tmp;
    } else {
      return basic * seniorRecursive(basic, power - 1);
    }
  }
}

class Fibo {
  /// Простая итеративная реализация алгоритма поиска числа Фиббоначчи
  /// Сложность алгоритма - O(n) (линейная)
  ///
  /// Для работы с очень большими числами используем BigInt
  /// Number: 1 000 000
  /// Time: 0:00:07.149347
  BigInt simpleIterative(int n) {
    BigInt f0 = BigInt.from(0);
    BigInt f1 = BigInt.from(1);

    for (int i = 1; i < n; i++) {
      final f2 = f0 + f1;
      f0 = f1;
      f1 = f2;
    }

    return f1;
  }

  /// Простая рекурсивная реализация алгоритма поиска числа Фиббоначчи
  /// Реализация крайне неудачная
  /// Сложность алгоритма - O(2^n) (экспоненциальная)
  /// По памяти также будет O(2^n)
  int simpleRecursive(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;

    return simpleRecursive(n - 1) + simpleRecursive(n - 2);
  }
}

class Primes {
  /// Сложность алгоритма - O(n^2) (квадратичная)
  /// Вне зависимости от того метода, который мы будем использовать внутри
  int simpleIterative(int n) {
    int result = 0;

    for (int i = 2; i < n; i++) {
      if (_isPrime_3(i)) result++;
    }

    return result;
  }

  /// Метода выведен из определения простого числа
  /// То есть мы считаем все возможные делители для числа
  /// И если их всего два (1 и само это число), то число простое
  /// Count: 100_000
  /// Time: 0:00:03.575488
  bool _isPrime_1(int i) {
    int result = 0;

    for (int j = 1; j <= i; j++) {
      if (i % j == 0) result++;
    }

    return result == 2;
  }

  /// Count: 100_000
  /// Time: 0:00:00.317742
  /// Count: 1_000_000
  /// Time: 0:00:26.362860
  bool _isPrime_2(int i) {
    // Будем выходить из цикла, если будет найден хотя бы один делитель
    for (int j = 2; j < i; j++) {
      if (i % j == 0) return false;
    }

    return true;
  }

  /// Count: 1_000_000
  /// Time: 0:00:13.591773
  bool _isPrime_3(int i) {
    // Перестанем проверять все четные ыисла
    if (i % 2 == 0) return false;
    for (int j = 3; j < i; j += 2) {
      if (i % j == 0) return false;
    }

    return true;
  }
}
