class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinaryTree {
  Node? root;

  insert(int data) {
    root = _insert(root, data);
  }

  _insert(Node? node, int data) {
    if (node == null) {
      return Node(data);
    }

    if (data < node.data) {
      node.left = _insert(node.left, data);
    } else if (data > node.data) {
      node.right = _insert(node.right, data);
    }
    return node;
  }

  // in Order printing
  printInOrder(Node? node) {
    if (node != null) {
      printInOrder(node.left);
      print(node.data);
      printInOrder(node.right);
    }
  }

  printInPostOrder(Node? node) {
    if (node == null) {
      return 'tree is empty';
    }
    printInPostOrder(node.left);
    printInPostOrder(node.right);
    print(node.data);
  }

  printInPreOrder(Node? node) {
    if (node == null) {
      return 'tree is empty';
    }
    print(node.data);
    printInPreOrder(node.left);
    printInPreOrder(node.right);
  }

  remove(int data) {
    root = _remove(root, data);
  }

  Node? _remove(Node? node, int data) {
    if (node == null) return null;

    if (data < node.data) {
      // navigating to the target to the left
      node.left = _remove(node.left, data);
    } else if (data > node.data) {
      // navigating to the target to the right
      node.right = _remove(node.right, data);
    } else {
      // data found
      // 0 children? remove;
      if (node.left == null && node.right == null) {
        return null;
      }

      // 1 child? return child;
      if (node.right == null) {
        return node.left;
      } else if (node.left == null) {
        return node.right;
      }

      // 2 children? findMin, make it root;
      Node? succesor = _findMin(node.right);
      node.data = succesor!.data;
      node.right = _remove(node.right, succesor.data);
    }
    return node;
  }

  Node? _findMin(Node? node) {
    while (node!.left != null) {
      node = node.left;
    }
    return node;
  }

  bool isBST(Node? root) {
    return _isBST(root, null, null);
  }

  bool _isBST(Node? node, int? max, int? min) {
    if (node == null) {
      return true;
    }

    if (min != null && node.data < min) {
      return false;
    }
    if (max != null && node.data > max) {
      return false;
    }
    return _isBST(node.left, node.data, min) &&
        _isBST(node.right, max, node.data);
  }

  findClosest(Node? node, int target) {
    int closest = node!.data;
    int diff = (target - closest).abs();

    while (node != null) {
      if (target == node.data) {
        return target;
      } else {
        if (target < node.data) {
          if (target - node.data < diff) {
            closest = node.data;
            diff = (target - closest).abs();
          }
          node = node.left;
        } else {
          if (target - node.data < diff) {
            closest = node.data;
            diff = (target - closest).abs();
          }
          node = node.right;
        }
      }
    }
    return closest;
  }

  findTheClosest(Node? node, int target) {
    int closest = node!.data;
    int difference = target - closest;

    while (node != null) {
      if (node.data == target) {
        return target;
      }
      if (node.data < target) {
        if ((target - node.data) < difference) {
          closest = node.data;
          difference = target - closest;
        }
        node = node.right;
      } else {
        if ((target - node.data) < difference) {
          closest = node.data;
          difference = target - closest;
        }
        node = node.left;
      }
    }
    return closest;
  }
}

main() {
  BinaryTree tree = BinaryTree();

  tree.insert(10);
  tree.insert(20);
  tree.insert(15);
  tree.insert(5);
  tree.insert(25);
  tree.printInPostOrder(tree.root);
  tree.printInPreOrder(tree.root);

  // tree.printInOrder(tree.root);
  // tree.remove(15);
  // tree.printInOrder(tree.root);
  // print({tree.isBST(tree.root)});
  // print({tree.findClosest(tree.root, 12)});
  // print({tree.findTheClosest(tree.root, 3)});
}

