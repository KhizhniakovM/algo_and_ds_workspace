/*
  Алгебраические алгоритмы
  
  1. Возведение в степень
  2. Числа Фиббоначи
  3. Поиск простых чисел

*/

import 'package:tester/tester.dart';

import 'homework_03.dart';

void launch() {
  // final task = PowerTask();
  // final task = FiboTask();
  final task = PrimeTask();
  final tester = TesterSort(task);
  tester.run();
}

class PowerTask implements Task {
  @override
  String get path => 'assets/power/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final value = double.tryParse(data[0]);
    final pow = double.tryParse(data[1]);
    if (value == null || pow == null) throw Exception('Input is not valid');
    final resolver = Power();

    stopwatch.start();
    final result = resolver.seniorRecursive(value, pow);
    stopwatch.stop();

    return result.toString();
  }
}

class PrimeTask implements Task {
  @override
  String get path => 'assets/primes/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final value = int.tryParse(data[0]);
    if (value == null) throw Exception('Input is not valid');
    final resolver = Primes();

    stopwatch.start();
    final result = resolver.simpleIterative(value);
    stopwatch.stop();

    return result.toString();
  }
}

class FiboTask implements Task {
  @override
  String get path => 'assets/fibo/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final value = int.tryParse(data[0]);
    if (value == null) throw Exception('Input is not valid');
    final resolver = Fibo();

    stopwatch.start();
    final result = resolver.simpleIterative(value);
    stopwatch.stop();

    return result.toString();
  }
}
