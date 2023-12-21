class Node {
  int? data;
  Node? next;

  Node(this.data);
}

class Queue {
  Node? front;
  Node? rear;

  enqueue(int data) {
    Node newNode = Node(data);
    if (front == null) {
      front = rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  dequeue() {
    if (front == null) {
      print('Nothing in queue');
    } else {
      front = front!.next;
    }
  }

  display() {
    Node? current = front;
    if (current == null) {
      print('Nothing in queue');
    }

    while (current != null) {
      if (current == front) {
        print('front is : ${current.data}');
      }
      if (current == rear) {
        print('rear is : ${current.data}');
      }
      print('${current.data} ');
      current = current.next;
    }
  }
}

void main() {
  Queue queue = Queue();

  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);

  queue.dequeue();

  queue.display();
}
