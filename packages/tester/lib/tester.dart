import 'dart:io';

part 'tester.hash_map.p.dart';
part 'tester.sort.p.dart';

abstract interface class Task {
  String get path;

  String run(
    List<String> data, {
    required Stopwatch stopwatch,
  });
}

abstract interface class Tester {
  void run({bool showExpectActual = true});
}
