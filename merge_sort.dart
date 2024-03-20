// Consider the array [38, 27, 43, 3, 9, 82, 10].
// We'll walk through the merge sort process step by step:
// [3,5,4,1,2]
void main() {
  List<int> nums = [3, 5, 4, 1, 2, 0, 9, 6, 1];
  List<int> nums2 = [13, 5, 24, 1, 2, 10];
  print('before sorting: $nums');
  print('before merge sort: $nums2 ');
  final sortedList = sortList(nums);
  final sortedListByMergeSort = mergeSort(nums2);
  print('after sorting: $sortedList');

  print('after merge sort: $sortedListByMergeSort ');

  final nums3 = [3, 4, 1, 7, 2, 5];
  print('Before unSorted reverse order:$nums3');
  final reverseSortedList = sortInReverOrder(nums3);
  print('sort in reverse order:$reverseSortedList');
}

//this is bruteForce approach will take O(N^2) time where n is number of elements.
List<int> sortList(List<int> array) {
  for (int i = 0; i < array.length; i++) {
    for (int j = 0; j < array.length - 1; j++) {
      if (array[j] > array[j + 1]) {
        final temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }
  return array;
}

List<int> sortInReverOrder(List<int> array) {
  array.sort((a, b) => b.compareTo(a));
  return array;
}

/// will use mergeSort to sort list in O(NlogN) time.
List<int> mergeSort(List<int> array) {
  if (array.length <= 1) {
    return array;
  }
  final mid = array.length ~/ 2;
  final leftArray = mergeSort(array.sublist(0, mid));
  final rightArray = mergeSort(array.sublist(mid));

  return merge(leftArray, rightArray);
}

List<int> merge(List<int> leftArray, List<int> rightArray) {
  List<int> sortedArray = [];
  int i = 0;
  int j = 0;

  while (i < leftArray.length && j < rightArray.length) {
    if (leftArray[i] <= rightArray[j]) {
      sortedArray.add(leftArray[i]);
      i++;
    } else {
      sortedArray.add(rightArray[j]);
      j++;
    }
  }
  sortedArray.addAll(leftArray.sublist(i));
  sortedArray.addAll(rightArray.sublist(j));

  return sortedArray;
}
