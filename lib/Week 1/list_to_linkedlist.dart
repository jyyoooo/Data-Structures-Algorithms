class Node {
  int? data;
  Node? next;
  Node(this.data);

  @override
  String toString() {
    if (data == 0) {
      return 'empty bro';
    } else {
      return '$data ${next??''}';
    }
  }
}

Node listToArray(List<int> list) {
  if (list.isEmpty) {
    return Node(0);
  }
  Node dummy = Node(0);
  Node current = dummy;

  for (int? value in list) {
      current.next = Node(value);
      current = current.next!;
  }

  return dummy.next!;
}

void main() {
  List<int> list = [1, 2, 3, 4, 5];
  Node linkedList = listToArray(list);
  print(linkedList);
}
