/// Remove Duplicates from Sorted Array
///
/// Topic: Array, Two Pointers
/// Statement: Given a sorted array nums, remove the duplicates in-place such
/// that each element appears only once and returns the new length.
///
/// ```dart
/// Example:
/// Input: nums = [1, 1, 2]
/// Output: 2
/// ```

void main() {
  final nums = [1, 2, 2, 3, 4];
  final nums2 = [1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5];
  final resultList = removeDuplicate(nums);
  final resultWithPointer = removeDuplicateWithPointer(nums2);
  print("this is before: $nums and after resultList : $resultList");
  print(
      "this is before $nums2 and after resultListWith2Pointer : $resultWithPointer");
}

// with toSet Method.
List<int> removeDuplicateWithToSet(List<int> nums) {
  return nums.toSet().toList();
}

/// without toSetMethod but it will tool O(2N)==> O(N)
List<int> removeDuplicate(List<int> nums) {
  Map<int, int> hasMap = {};
  final List<int> resultList = [];
  for (int i = 0; i < nums.length; i++) {
    hasMap[nums[i]] = 0;
  }
  hasMap.forEach((key, value) {
    resultList.add(key);
  });
  return resultList;
}

List<int> removeDuplicateWithPointer(List<int> nums) {
  int j = 0;
  final List<int> resultList = [];

  while (j < nums.length) {
    if (resultList.isNotEmpty && resultList.last == nums[j]) {
    } else {
      resultList.add(nums[j]);
    }
    j++;
  }
  return resultList;
}
