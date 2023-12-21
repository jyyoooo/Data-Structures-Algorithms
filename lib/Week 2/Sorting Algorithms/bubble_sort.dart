void bubbleSort(List<int> list) {
  for (int p = 0; p < list.length - 1; p++) {
    for (int i = 0; i < list.length - 1; i++) {
      if (list[i] > list[i + 1]) {
        int temp = list[i];
        list[i] = list[i + 1];
        list[i + 1] = temp;
      }
    }
  }
}

void main() {
  List<int> exampleList = [3, 2, 5, 4, 1, 7, 6, 8, 9];

  print("Original List: $exampleList");

  bubbleSort(exampleList);

  print("Sorted List: $exampleList");
}
