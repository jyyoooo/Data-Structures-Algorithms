import 'package:dsa/Week%202/Sorting%20Algorithms/quick_sort.dart';

bubble(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    for (int j = 0; j < list.length - 1; j++) {
      if (list[j + 1] > list[j]) {
        int temp = list[j + 1];
        list[j + 1] = list[j];
        list[j] = temp;
      }
    }
  }
}

quick(List<int> list, int start, int end) {
  int pivot = start;
  int left = start + 1;
  int right = end;

  swap(list, i, j) {
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }

  while (start <= end) {
    if (list[left] >= list[pivot] && list[right] < list[pivot]) {
      swap(list, left, right);
      left++;
      right--;
    }
    if(list[left]<=list[pivot]){
      left++;
    }
    if(list[right]>=list[pivot]){
      right--;
    }
  }
}


class Node{
  int? data;
  Node? next;

  Node(this.data);
}
class Stack{
  Node? top;

  push(int data){
    Node newNode = Node(data);

    if(top ==null){
      top = newNode;
    }else{
      newNode.next = top;
      top = newNode;
    }
  }

  pop(int data){
    if(top == null){
      return;
    }else{
      top = top!.next;
    }
  }

  delete(int data){
    Node current = top!;
    Node prev;

    while(current != null){
      if(current.data == data){

      }
    }
  }
}