/// Maximum Subarray

/// Topic: Array, Dynamic Programming
/// Statement: Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
///
///```dart
///
/// Example:
/// Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
/// Output: 6 (Explanation: [4,-1,2,1] has the largest sum = 6.)
/// ```

void main() {
  final array = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
  final array2 = [-2, 1, -3, 4, -1, 2, -5, 4];
  // [-2, 1, -3, 4, -1, 1, -5, 4];
  final result = findMaxSubArray(array);
  final result2 = findMaxSumArrayKadaneAlgo(array2);
  print("this is larget Sum of contigous Array : $result");
  print(
      "larget Sum of contigous Array with findMaxSumArrayKadaneAlgo : $result2");
}

///BruteForceApproach this will take O(N^2) time complexity
///we will find all possbile subList and then will find their sum and max Sum;
/// [-,2,1-3,4,-1,2,1,-5,4]
///
({List<int> list, int sum})? findMaxSubArray(List<int> array) {
  int maxSum = -999999;
  ({int sum, List<int> list})? result;

  List<List<int>> allLists = [];
  for (int i = 0; i < array.length; i++) {
    for (int j = i; j < array.length; j++) {
      allLists.add(array.sublist(i, j + 1));
    }
  }

  for (int k = 0; k < allLists.length; k++) {
    int sum = 0;
    for (int m = 0; m < allLists[k].length; m++) {
      sum += allLists[k][m];
    }
    if (sum > maxSum) {
      maxSum = sum;
      result = (list: allLists[k], sum: maxSum);
    }
  }
  return result;
}

///Kadane's algorithm
///[-2, 1, -3, 4, -1, 2, 1, -5, 4]; and timeCoplexity would be O(N);
({List<int> list, int sum}) findMaxSumArrayKadaneAlgo(List<int> array) {
  int maxSum = -999999;
  int sum = 0;
  int indexStart = -1;
  int indexEnd = -1;
  int start = -1;

  for (int i = 0; i < array.length; i++) {
    if (sum == 0) {
      start = i;
    }
    sum += array[i];

    if (maxSum < sum) {
      maxSum = sum;
      indexStart = start;
      indexEnd = i;
    }

    if (sum < 0) {
      sum = 0;
    }
  }
  return (list: array.sublist(indexStart, indexEnd + 1), sum: maxSum);
}
