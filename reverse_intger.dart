/// Reverse Integer
///
/// Topic: Math
///
/// Statement: Given a signed 32-bit integer x, reverse its digits.
///
/// ```dart
/// Example:
/// Input: x = 123
/// Output: 321
/// ```

void main() {
  final int input = 374;
  print("initial Value : $input");
  final result = reverseIntger(input);
  final res2 = reverseIntgerByDevision(input);
  print("reverse Value : $result and $res2");
}

int reverseIntger(int num) {
  final numValue = num.toString();
  String resultValue = "";

  for (int i = numValue.length - 1; i >= 0; i--) {
    resultValue += numValue[i];
  }

  return int.parse(resultValue);
}

int reverseIntgerByDevision(int num) {
  int result = 0;
  while (num > 0) {
    final reminder = num % 10;
    result = (result * 10) + reminder;
    num = num ~/ 10;
  }
  return result;
}
