import 'dart:io';

List<int> generateA000124(int n) {
  List<int> result = [];
  for (int i = 0; i < n; i++) {
    int value = (i * (i + 1)) ~/ 2 + 1;
    result.add(value);
  }
  return result;
}

void main() {
  stdout.write('Input: ');
  int? input = int.tryParse(stdin.readLineSync() ?? '');

  if (input == null || input <= 0) {
    print('Input invalid');
    return;
  }

  List<int> sequence = generateA000124(input);
  print('Output: ${sequence.join('-')}');
}
