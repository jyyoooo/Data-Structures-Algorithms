quickSort(List<int> list) {
  quickSortHelper(list, 0, list.length-1);
  return list;
}

quickSortHelper(List<int> list, int start, int end) {

  if (start >= end) {
    return;
  }

  int pivot = start;
  int left = start + 1;
  int right = end;

  while (left <= right) {
    if (list[left] >= list[pivot] && list[right] <= list[pivot]) {
      swap(list, left, right);
      left++;
      right--;
    }
    if (list[left] <= list[pivot]) {
      left++;
    }
    if (list[right] >= list[pivot]) {
      right--;
    }
  }
  swap(list, right, pivot);
  quickSortHelper(list, start, right - 1);
  quickSortHelper(list, right + 1, end);
}

swap(List<int> list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

void main() {
  List<int> list = [3, 2, 5, 4, 1, 7, 6, 8, 9];
  // List<int> exampleList = [3, 1, 2, 5, 4];

  print("Original List: $list");

  quickSort(list);
  // print(quickSort(exampleList));

  print("Sorted List: $list");
}
