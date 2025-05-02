import 'dart:io';

String isBalanced(String input) {
  final stack = <String>[];
  final Map<String, String> brackets = {
    ')': '(',
    ']': '[',
    '}': '{',
  };

  for (var char in input.split('')) {
    if (char == '(' || char == '[' || char == '{') {
      stack.add(char);
    } else if (char == ')' || char == ']' || char == '}') {
      if (stack.isEmpty || stack.removeLast() != brackets[char]) {
        return 'NO';
      }
    }
  }

  return stack.isEmpty ? 'YES' : 'NO';
}

void main() {
  stdout.write('Masukkan string bracket: ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('Input tidak boleh kosong.');
    return;
  }

  String cleanedInput = input.replaceAll(' ', ''); // hapus spasi
  String result = isBalanced(cleanedInput);
  print('Output: $result');
}
