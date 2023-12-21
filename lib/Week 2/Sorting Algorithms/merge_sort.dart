mergeSort(List<int> list) {
  if (list.length <= 1) {
    return list;
  }
  int mid = (list.length / 2).floor();
  List<int> left = list.sublist(0, mid);
  List<int> right = list.sublist(mid);
  // print("left :$left");
  // print("right :$right");

  return merge(mergeSort(left), mergeSort(right));
}

List<int> merge(List<int> left, List<int> right) {
  List<int> merged = [];
  int leftIdx = 0;
  int rightIdx = 0;

  while (leftIdx < left.length && rightIdx < right.length) {
    if (left[leftIdx] < right[rightIdx]) {
      merged.add(left[leftIdx]);
      leftIdx++;
    } else {
      merged.add(right[rightIdx]);
      rightIdx++;
    }
  }
  merged.addAll(left.sublist(leftIdx));
  merged.addAll(right.sublist(rightIdx));
  // print('merged : $merged');
  return merged;
}

void main() {
  List<int> list = [3, 2, 5, 4, 1, 7, 6, 8, 9];
  // List<int> exampleList = [3, 1, 2, 5, 4];

  print("Original List: $list");

  print('sorted list: ${mergeSort(list)}');
  // print(quickSort(exampleList));
}
