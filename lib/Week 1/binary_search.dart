void main() {
  List<int> list = [11, 24, 32, 46, 58, 63, 72, 87, 95];
  int target = 87;
  int result = binarySearch(list, target);
  int recursionResult = binarySearchRecursion(list, target, 0, list.length);

  // print(result == -1
  //     ? 'Target not found'
  //     : 'target $target found at $result index');

  print(result == -1
      ? 'Target not found'
      : 'target $target found at $recursionResult index using recursion');
}

int binarySearch(List<int> list, int target) {
  int start = 0;
  int end = list.length;
  while (start <= end) {
    int mid = (start + (end - start) / 2).toInt();
    if (list[mid] == target) {
      return mid;
    } else if (target < list[mid]) {
      end = mid - 1;
    } else {
      start = mid + 1;
    }
  }
  return -1;
}

int binarySearchRecursion(List<int> list, int target, int start, int end) {
  if (start > end) {
    return -1;
  }
  int mid = (start + (end - start) / 2).toInt();

  if (list[mid] == target) {
    return mid;
  } else if (target < list[mid]) {
    return binarySearchRecursion(list, target, start, mid - 1);
  } else {
    return binarySearchRecursion(list, target, mid + 1, end);
  }
}
