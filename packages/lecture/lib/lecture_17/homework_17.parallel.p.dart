part of 'homework_17.dart';

final class DictionaryParallelTask implements Task {
  @override
  String get path => 'assets/dict/';

  @override
  String run(List<String> data, {required Stopwatch stopwatch}) {
    final map = DictionaryParallelArrays<String, Word>();
    final words = data.map((str) => Word.fromString(str)).toList();

    stopwatch.start();
    for (int i = 0; i < words.length; i++) {
      final word = words[i];
      map.put(word.english, word);
    }
    stopwatch.stop();

    return map.toString();
  }
}
