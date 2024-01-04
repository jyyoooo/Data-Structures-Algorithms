class Heap {
  List<int> list = [];
  buildHeap(List<int> list) {
    this.list = list;
    for (int i = parentIndex(list.length - 1); i >= 0; i--) {
      heapifyDownwards(i);
    }
  }

  heapifyDownwards(index) {
    int left = leftIndex(index);
    int right = rightIndex(index);
    int largest = index;

    if (left < list.length && list[left] > list[largest]) {
      largest = left;
    }
    if (right < list.length && list[right] > list[largest]) {
      largest = right;
    }
    if (largest != index) {
      swap(index, largest);
      heapifyDownwards(largest);
    }
  }

  swap(index, largest) {
    int temp = list[largest];
    list[largest] = list[index];
    list[index] = temp;
  }

  insert(int data) {
    list.add(data);
    heapifyUpwards(list.length - 1);
  }

  heapifyUpwards(int lastIndex) {
    if (lastIndex == 0) return;
    int parent = parentIndex(lastIndex);
    if (list[lastIndex] > list[parent]) {
      swap(lastIndex, parent);
      heapifyUpwards(parent);
    }
  }

  int parentIndex(int index) => (index - 1) ~/ 2;
  int leftIndex(int index) => (index * 2 + 1);
  int rightIndex(int index) => index * 2 + 2;
}

void main() {
  List<int> list = [8, 5, 6, 10, 4];

  Heap heap = Heap();
  // heap.buildHeap(list);
  // print(heap.list);
  heap.insert(8);
  heap.insert(5);
  heap.insert(6);
  heap.insert(10);
  heap.insert(4);
  print(heap.list);
}
