/// Palindrome Number

/// Topic: Math
/// Statement: Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
/// ```dart
/// Example:
/// Input: 121
/// Output: true
/// ```

void main() {
  final num = 121;

  final isPalindrom = findPalendrom(num);
  final isPalindromWithoutReverse = findPalendromWithoutReverse(num);

  print(isPalindrom);
  print(isPalindromWithoutReverse);
}

findPalendrom(int num) {
  int reverse = 0;
  int intialValue = num;

  while (num > 0) {
    final remainder = num % 10;
    reverse = (reverse * 10) + remainder;
    num ~/= 10;
  }
  return reverse == intialValue;
}

findPalendromWithoutReverse(int num) {
  int reverse = 0;

  while (num > reverse) {
    final remainder = num % 10;
    reverse = (reverse * 10) + remainder;
    num ~/= 10;
  }
  return (reverse == num || (num == reverse ~/ 10));
}
