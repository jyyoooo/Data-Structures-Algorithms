class Node {
  Node? prev;
  int? data;
  Node? next;
  Node(this.data, {this.prev, this.next});

  @override
  String toString() {
    if (next == null) return '$data';
    return ' $data  $next';
  }
}

class DoublyLinkedList {
  Node? head;
  Node? tail;
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) {
      return 'nothing in list';
    } else {
      return head.toString();
    }
  }

  append(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.prev = tail;
      tail!.next = newNode;
      tail = newNode;
    }
    return;
  }

  prepend(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      newNode.next = head;
      newNode.prev = newNode;
      head?.prev = newNode;
      head = newNode;
    }
    return;
  }

  printList() {
    Node? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  printReversed() {
    Node? current = tail;
    while (current != null) {
      print(current.data);
      current = current.prev;
    }
  }

  insertBefore(int data, int before) {
    Node? current = head;
    Node newNode = Node(data);

    if (head != null && head!.data == before) {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
      return;
    }

    while (current != null && current.data != before) {
      current = current.next;
    }
    if (current == null) {
      print('value dont exist');
      return;
    }
    if (current.prev != null) {
      Node? prev = current.prev;

      prev?.next = newNode;
      newNode.next = current;
      current.prev = newNode;
      newNode.prev = prev;
    }
  }

  delete(int data) {
    Node? current = head;

    if (current == null) {
      print('list is empty');
      return;
    }
    while (current?.data != data) {
      current = current?.next;
    }
    Node? prev = current!.prev;

    prev!.next = current.next;
    current.next!.prev = prev;

  }
}

void main() {
  DoublyLinkedList list = DoublyLinkedList();

  list.append(10);
  list.append(20);
  list.append(30);
  list.append(40);
  list.append(50);
  list.append(60);
  list.prepend(5);

  list.insertBefore(69, 20);
  list.delete(69);

  print(list);
  list.printList();

  // list.printReversed();
}
