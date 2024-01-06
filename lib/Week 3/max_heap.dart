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

  remove() {
    if (list.isEmpty) return 'list empty';
    int top = list[0];
    list[0] = list.removeLast();
    heapifyDownwards(0);
    return top;
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

  List<int> sort(list) {
    int n = list.length;

    // Build max heap
    // for (int i = parentIndex(list.length -1); i >= 0; i--) {
    //   heapifyDownwards(i);
    // }

    // Extract elements from the heap one by one
    for (int i = parentIndex(n - 1); i > 0; i--) {
      swap(0, i);
      heapifyDownwards(i);
    }
    return list;
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
  // heap.insert(8);
  // heap.insert(5);
  // heap.insert(6);
  // heap.insert(10);
  // heap.insert(4);
  print(heap.list);
  // heap.remove();
  heap.sort(list);
  // heap.sort();
  print(heap.list);
  // print(list);
}

// void heapSort(List<int> array) {
//   // Build a max-heap
//   for (int i = (array.length ~/ 2) - 1; i >= 0; i--) {
//     sink(array, i, array.length);
//   }

//   // Repeatedly extract the maximum element
//   for (int i = array.length - 1; i >= 1; i--) {
//     swap(array, 0, i);
//     sink(array, 0, i);
//   }
// }

// void sink(List<int> array, int index, int heapSize) {
//   while (true) {
//     int leftChildIndex = 2 * index + 1;
//     int rightChildIndex = 2 * index + 2;
//     int largest = index;

//     if (leftChildIndex < heapSize && array[leftChildIndex] > array[largest]) {
//       largest = leftChildIndex;
//     }

//     if (rightChildIndex < heapSize && array[rightChildIndex] > array[largest]) {
//       largest = rightChildIndex;
//     }

//     if (largest == index) {
//       break;
//     }

//     swap(array, index, largest);
//     index = largest;
//   }
// }

// void swap(List<int> array, int index1, int index2) {
//   int temp = array[index1];
//   array[index1] = array[index2];
//   array[index2] = temp;
// }

// void main() {
//   List<int> unsortedArray = [5, 2, 8, 1, 9, 3];

//   print("Unsorted Array: $unsortedArray");

//   heapSort(unsortedArray);

//   print("Sorted Array: $unsortedArray");
// }
