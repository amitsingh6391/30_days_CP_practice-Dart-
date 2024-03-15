/// Valid Parentheses

/// Topic: Stack
/// Statement: Given a string "S" containing just the
/// characters '(', ')', '{', '}', '[' and ']', determine if
/// the input string is valid.
/// ```dart
///
/// Example:
/// Input: s = "([)]" "(([]))"
/// Output: false
/// ```
///

void main() {
  final input = '([{}])';
  final result = isValidParentheses(input);
  print("this input is valid: $result");
}

bool isValidParentheses(String value) {
  final myPattern = {
    ')': '(',
    '}': '{',
    ']': '[',
  };
  List<String> stack = [];

  for (int i = 0; i < value.length; i++) {
    if (myPattern.containsValue(value[i])) {
      stack.add(value[i]);
    } else {
      if (stack.isEmpty || myPattern[value[i]] != stack.removeLast()) {
        return false;
      }
    }
  }
  return stack.isEmpty;
}
