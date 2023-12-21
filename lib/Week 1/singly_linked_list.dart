class Node {
  int? value;
  Node? next;

  Node({required this.value, this.next});

  @override
  String toString() {
    if (next == null) return '$value';
    return ' $value  $next';
  }
}

class LinkedList {
  Node? head;
  Node? tail;
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) {
      return 'List is empty';
    }
    return head.toString();
  }

  // head-first insertion
  prepend(value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  // tail-end insertion
  append(value) {
    if (isEmpty) {
      prepend(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  Node? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;

    while (currentIndex < index && currentNode != null) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  Node insertAfter(Node node, value) {
    if (tail == node) {
      append(value);
      return tail!;
    }
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  void delete(value) {
    Node? temp = head;
    Node? prev;

    if (temp != null && temp.value == value) {
      head = temp.next;
      return;
    }
    while (temp != null && temp.value != value) {
      prev = temp;
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      tail = prev;
      tail!.next = null;
    }
    prev!.next = temp.next;
  }

  findMid() {
    if (head == null) {
      return null;
    }
    Node? pointer = head;
    Node? pointer2 = head;

    while (pointer2 != null && pointer2.next != null) {
      pointer = pointer!.next;
      pointer2 = pointer2.next!.next;
    }
    return pointer!.value;
  }
}

void main() {
  final list = LinkedList();

  // list.prepend(10);
  list.append(15);
  list.append(20);
  list.append(30);
  list.append(35);
  list.append(40);
  list.append(50);
  list.append(60);
  // list.append(70);
  list.insertAfter(list.nodeAt(2)!, 100);

  // list.delete(20);

  print(list);
  print(list.findMid());
}
