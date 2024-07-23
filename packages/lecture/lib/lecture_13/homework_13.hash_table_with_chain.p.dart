part of 'homework_13.dart';

final class HashTableWithChainAddTask implements Task {
  @override
  String get path => 'assets/hash_map/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final map = HashTableWithChain<String, String>(size: 100);

    stopwatch.start();
    for (int i = 0; i < data.length; i++) {
      map.put(data[i], data[i]);
    }
    stopwatch.stop();

    print(map.length);

    return map.toString();
  }
}

final class HashTableWithChainRemoveTask implements Task {
  @override
  String get path => 'assets/hash_map/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final map = HashTableWithChain<String, String>(size: 100);

    for (int i = 0; i < data.length; i++) {
      map.put(data[i], data[i]);
    }

    stopwatch.start();
    for (int i = 0; i < data.length; i++) {
      map.delete(data[i]);
    }
    stopwatch.stop();

    print(map.length);

    return map.toString();
  }
}
