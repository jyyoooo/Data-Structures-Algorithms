class Heap {
  List<int> elements = [];

  Heap(); // Default constructor for max heap

  void buildHeap(List<int> elements) {
    this.elements = elements;
    for (int i = _parentIndex(elements.length - 1); i >= 0; i--) {
      heapifyDown(i);
    }
  }

  void insert(int value) {
    elements.add(value);
    heapifyUp(elements.length - 1);
  }

  int remove() {
    if (elements.isEmpty) {
      throw Exception("Heap is empty");
    }
    int top = elements[0];
    elements[0] = elements.removeLast();
    heapifyDown(0);
    return top;
  }

  void heapifyDown(int index) {
    int left = _leftChildIndex(index);
    int right = _rightChildIndex(index);
    int largest = index;

    if (left < elements.length && elements[left] > elements[largest]) {
      largest = left;
    }
    if (right < elements.length && elements[right] > elements[largest]) {
      largest = right;
    }

    if (largest != index) {
      swap(index, largest);
      heapifyDown(largest);
    }
  }

  void heapifyUp(int index) {
    if (index == 0) return;
    int parent = _parentIndex(index);
    if (elements[index] > elements[parent]) {
      swap(index, parent);
      heapifyUp(parent);
    }
  }

  int _parentIndex(int index) => (index - 1) ~/ 2;
  int _leftChildIndex(int index) => index * 2 + 1;
  int _rightChildIndex(int index) => index * 2 + 2;
  
  void swap(int a, int b) {
    int temp = elements[a];
    elements[a] = elements[b];
    elements[b] = temp;
  }
}

main() {
  Heap heap = Heap();

  // List<int> list = [5,3,6,8,1];
  // print(heap.elements);
  // heap.buildHeap(list);
  // print(heap.elements);
  heap.insert(8);
  heap.insert(5);
  heap.insert(6);
  heap.insert(10);
  heap.insert(4);
  print(heap.elements);



}
