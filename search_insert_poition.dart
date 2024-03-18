/// Search Insert Position

/// Topic: Array, Binary Search
///
/// Statement: Given a sorted array nums and a target value target, return the index where target should be inserted into the array if it were inserted in order.
///```dart
/// Example:
/// Input: nums = [1,3,5,6], target = 5
/// Output: 2
/// Implement strStr()
/// ```

void main() {
  final int target = 5;
  final List<int> input = [1, 2, 5, 6, 7, 8];
  final targetIndex = findTargetElement(input, target);
  final targetIndexByBinarySearch = findElementBybinarySearch(input, target);

  print(
      'this is targetValue index: $targetIndex by BinarySeach: $targetIndexByBinarySearch');
}

///bruteForce Approach
///
///This will took O(N) time where N is number of element in array.
int findTargetElement(List<int> array, int target) {
  for (int i = 0; i < array.length; i++) {
    if (target == array[i]) {
      return i;
    }
  }
  return -1;
}

// [1,2,3,4];
findElementBybinarySearch(List<int> array, int target) {
  int intialIndex = 0;
  int lastIndex = array.length - 1;

  if (array.isEmpty) {
    return -1;
  }

  while (intialIndex <= lastIndex) {
    final middleIndex = (intialIndex + lastIndex) ~/ 2;
    if (array[middleIndex] == target) {
      return middleIndex;
    } else if (array[middleIndex] < target) {
      intialIndex = middleIndex + 1;
    } else {
      lastIndex = middleIndex - 1;
    }
  }
  return -1;
}
