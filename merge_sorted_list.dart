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

  Node? sortedListWithLinkedList = sortListWithLinkedList(
    Node(
      value: 1,
      next: Node(
        value: 3,
        next: Node(
          value: 5,
        ),
      ),
    ),
    Node(
      value: 2,
      next: Node(value: 4),
    ),
  );
  while (sortedListWithLinkedList != null) {
    print(sortedListWithLinkedList.value);
    sortedListWithLinkedList = sortedListWithLinkedList.next;
  }
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

///Solve this problem using LinkedList;
///Will create our node class which have value and next Node of our linkedList
class Node {
  Node({required this.value, this.next});
  int value;
  Node? next;
}

sortListWithLinkedList(Node? n1, Node? n2) {
  //will create one dummy node;
  Node? dummyNode = Node(
    value: -1,
  );

  Node? currentNode = dummyNode;

  while (n1 != null && n2 != null) {
    if (n1.value <= n2.value) {
      currentNode?.next = n1;
      n1 = n1.next;
    } else {
      currentNode?.next = n2;
      n2 = n2.next;
    }
    currentNode = currentNode?.next;
  }
  while (n1 != null) {
    currentNode?.next = n1;
    n1 = n1.next;
  }
  while (n2 != null) {
    currentNode?.next = n2;
    n2 = n2.next;
  }

  return dummyNode.next; //will return head of our merged list
}
