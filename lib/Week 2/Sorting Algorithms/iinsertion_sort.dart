void insertionSort(List<int> list) {
  for (int i = 0; i <= list.length - 1; i++) {
    int current = list[i];
    int j = i - 1;
    while (j >= 0 && list[j] > current) {
      list[j + 1] = list[j];
      j--;
    }
    list[j + 1] = current;
  }
}

void main() {
  List<int> exampleList = [3, 1, 2, 5, 4];

  print("Original List: $exampleList");

  insertionSort(exampleList);

  print("Sorted List: $exampleList");
}
