import 'dart:io';

List<int> denseRanking(List<int> scores, List<int> teamScore) {
  List<int> uniqueScores = scores.toSet().toList()
    ..sort((a, b) => b.compareTo(a));
  List<int> rankings = [];

  int index = uniqueScores.length - 1;

  for (int score in teamScore) {
    while (index >= 0 && score >= uniqueScores[index]) {
      index--;
    }
    rankings.add(index + 2);
  }

  return rankings;
}

void main() {
  stdout.write('Masukan jumlah partisipan: ');
  int? participant = int.tryParse(stdin.readLineSync() ?? '');
  if (participant == null || participant <= 0) {
    print('Input partisipan tidak valid.');
    return;
  }

  stdout.write('Masukan skor: ');
  List<int> score = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  if (score.length != participant) {
    print('Jumlah skor tidak sesuai dengan jumlah partisipan.');
    return;
  }

  stdout.write('Jumlah permainan: ');
  int? games = int.tryParse(stdin.readLineSync() ?? '');
  if (games == null || games <= 0) {
    print('Input permainan tidak valid.');
    return;
  }

  stdout.write('Masukan skor permainan: ');
  List<int> gameScore =
      stdin.readLineSync()!.split(' ').map(int.parse).toList();

  if (gameScore.length != games) {
    print('Jumlah skor permainan tidak sesuai dengan jumlah permainan.');
    return;
  }

  List<int> result = denseRanking(score, gameScore);
  print('Peringkat tim Anda: ${result.join(' ')}');
}
