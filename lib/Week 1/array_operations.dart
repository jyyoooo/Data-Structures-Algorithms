void main() {
  print(findSmallest());
  firstAndLastIndexOfTarget(9);

  //  1 ARRAY ROTATION
  List<int> list = [1, 2, 3, 4, 5];
  int n = list.length;

  for (int i = 0; i < 1; i++) {
    int temp = list[n - 1];
    for (int i = n - 1; i > 0; i--) {
      list[i] = list[i - 1];
    }
    list[0] = temp;
  }
  print(list);
  print(list.reversed);

  // 2 REMOVE DUPLICATES

  List<int> numbers = [1, 2, 3, 2, 4, 5, 5, 1];
  print('list length : ${numbers.length}');

  Set<int> uniqueNumbersSet = Set<int>();
  List<int> uniqueNumbersList = [];

  for (int nums in numbers) {
    if (uniqueNumbersSet.add(nums)) {
      uniqueNumbersList.add(nums);
    }
  }
  print(uniqueNumbersList);

// 3 Remove duplicates and return the length of unique elements ONLY IF SORTED

  List<int> nums = [1, 2, 2, 3, 4, 4, 5, 6, 6, 7];

  int removeDuplicates(List<int> nums) {
    for (int i = 0; i < nums.length - 1; i++) {
      if (nums[i] == nums[i + 1]) {
        nums.removeAt(i);
        i--;
      }
    }
    print(nums);
    return nums.length;
  }

  print(removeDuplicates(nums));
}

findSmallest() {
  List<int> list = [6, 4, 3, 1, 6, 8, 9, 4, 7, 9, 6];

  list.sort();

  return list.first;
}

firstAndLastIndexOfTarget(int target) {
  List<int> list = [6, 4, 3, 1, 6, 8, 9, 4, 7, 9, 6];
  int first = list.indexOf(list.firstWhere((element) => element == target));
  int last = list.lastIndexOf(target);
  print('first index is $first and last index is $last');
}
