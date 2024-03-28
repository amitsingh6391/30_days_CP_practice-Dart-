/// Set Matrix Zero
/// Problem Statement: Given a matrix if an element in the matrix is 0 then
/// you will have to set its entire column and row to 0 and then return the matrix.
///```dart
///
/// Examples 1:
/// Input: matrix=[
/// [1,1,1],
/// [1,0,1],
/// [1,1,1]
/// ]
/// Output: [[1,0,1],[0,0,0],[1,0,1]]
/// Explanation: Since matrix[2][2]=0.Therfore the 2nd column and 2nd row wil be set to 0.
///
/// Input: matrix=[[0,1,2,0],[3,4,5,2],[1,3,1,5]]
/// Output:[[0,0,0,0],[0,4,5,0],[0,3,1,0]]
/// Explanation:Since matrix[0][0]=0 and matrix[0][3]=0. Therefore 1st row, 1st column and 4th column will be set to 0
///```
///

void main() {
  final matrix = [
    [1, 1, 1],
    [1, 0, 1],
    [1, 1, 1]
  ];

  print("this is our intialMatrix: $matrix");
  final resultMatrix = findZeroElement(matrix);
  print("this is our resultMatrix: $resultMatrix");
}

/// Time complexity of our algo is O(r*n) where r is row len and c is column length;

List<List<int>> findZeroElement(List<List<int>> matrix) {
  final row = matrix[0].length;
  final column = matrix.length;

  List<int> valueIndex = [];

  for (int i = 0; i < row; i++) {
    for (int j = 0; j < column; j++) {
      if (matrix[i][j] == 0) {
        valueIndex.addAll([i, j]);
      }
    }
  }

  for (int i = 0; i < row; i++) {
    for (int j = 0; j < column; j++) {
      if (valueIndex.any((element) => element == i || element == j)) {
        matrix[i][j] = 0;
      }
    }
  }

  return matrix;
}
