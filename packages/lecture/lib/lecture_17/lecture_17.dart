/*

  Зачётный англо-русский словарь

*/

final class Word {
  final String english;
  final String transcription;
  final String russian;

  const Word({
    required this.english,
    required this.transcription,
    required this.russian,
  });

  factory Word.fromString(String str) {
    final parts = str.split('	');

    return Word(
      english: parts[0],
      transcription: parts[1],
      russian: parts[2],
    );
  }
}
