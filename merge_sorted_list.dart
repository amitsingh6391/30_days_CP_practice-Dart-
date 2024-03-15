/// Merge Two Sorted Lists

/// Topic: [Linked List, Two Pointer]
///
/// Statement: Merge two sorted linked lists and return it as a new sorted list.
/// The new list should be made by splicing together the nodes of the first two lists.
///
/// ```dart
/// Example:
/// Input: l1 = [1, 2, 4], l2 = [1, 3, 4,5,9]
/// Output: [1, 1, 2, 3, 4, 4]
/// ```

void main() {
  List<int> l1 = [1, 2, 4];

  List<int> l2 = [1, 3, 4];

  List<int> a = [2, 3, 4, 5];
  List<int> b = [5, 6, 7, 8, 9];

  final sortedMergeList = sortTwoList(l1, l2);
  final sortedMergeListWithPointer = mergeSortedListWith2Pointer(a, b);
  print(sortedMergeList);
  print("this is sorted list: $sortedMergeListWithPointer");
}

List sortTwoList(List l1, List l2) {
  for (int i = 0; i < l2.length; i++) {
    int index = 0;
    for (int j = 0; j < l1.length; j++) {
      if (l2[i] >= l1[j]) {
        index = j + 1;
      }
    }
    l1.insert(index, l2[i]);
  }
  return l1;
}

/// Time coplexity of 2 pointer method is [O(N)]; condtion is our indivisal
/// list would be already in sorted order.
///
List<int> mergeSortedListWith2Pointer(List<int> l1, List<int> l2) {
  int i = 0;
  int j = 0;
  List<int> sortedResultList = [];

  while (i < l1.length && j < l2.length) {
    if (l1[i] < l2[j]) {
      sortedResultList.add(l1[i]);
      i++;
    } else if (l2[j] < l1[i]) {
      sortedResultList.add(l2[j]);
      j++;
    } else {
      sortedResultList.addAll([l2[j], l1[i]]);
      i++;
      j++;
    }
  }

  while (i < l1.length) {
    sortedResultList.add(l1[i]);
    i++;
  }
  while (j < l2.length) {
    sortedResultList.add(l2[j]);
    j++;
  }

  return sortedResultList;
}
