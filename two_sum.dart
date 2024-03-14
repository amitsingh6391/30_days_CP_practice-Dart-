/// Two Sum:
/// Topic: [Arrays, Hashing]
///
///  Statement: Given an array of integers nums and an integer target, return the indices of the two numbers such that they add up to target.
///
/// Example:
/// ```dart
///  Input: nums = [2, 7, 11, 15], target = 9
///  Output: [0, 1]
///
///  Explanation: nums[0] + nums[1] = 2 + 7 = 9.
/// ```

void main() {
  final nums = [2, 7, 11, 15, 5, 4];
  final target = 9;
  final targetIndices = getTargetIndices(nums, target);
  print("this is target Indices with O(N)^2: $targetIndices");

  final targetIndciesWithHashTable = getTargetIndicesWithHasTable(nums, target);
  print("this is target Indices with O(N): $targetIndciesWithHashTable");
}

///BruteForce Approach
///
///In this way Time complexity would be O(n)^2;
List<(int, int)> getTargetIndices(
  List<int> myArray,
  int target,
) {
  List<(int, int)> targetIndices = [];
  for (int i = 0; i < myArray.length - 1; i++) {
    for (int j = i + 1; j < myArray.length; j++) {
      int sum = myArray[i] + myArray[j];
      if (sum == target) {
        targetIndices.add((i, j));
      }
    }
  }
  return targetIndices;
}

List<(int, int)> getTargetIndicesWithHasTable(
  List<int> myArray,
  int target,
) {
  Map<int, int> myHasTable = {};
  List<(int, int)> targetIndices = [];
  for (int i = 0; i < myArray.length; i++) {
    final result = target - myArray[i];
    if (myHasTable.containsKey(result)) {
      targetIndices.add((i, myHasTable[result]!));
    }
    myHasTable[myArray[i]] = i;
  }
  return targetIndices;
}
