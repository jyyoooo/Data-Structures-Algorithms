selectionSort(List<int> list) {
  for (int i = 0; i < list.length; i++) {
    int min = i;
    for (int j = i; j < list.length; j++) {
      if (list[j] < list[min]) {
        min = j;
      }
    }
    int temp = list[i];
    list[i] = list[min];
    list[min] = temp;
  }
  return list;
}

void main() {
  List<int> list = [9,8,7,6,5,4,3,2,1];
  print('og list: $list');

  print('sorted : ${selectionSort(list)}');
}
