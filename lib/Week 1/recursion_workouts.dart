int factorial(int num) {
  int answer = num <= 1 ? 1 : num * factorial(num - 1);
  return answer;
}

f(int n) {
  if (n <= 1) {
    return;
  }
  f(n - 1);
  print(n);
  f(n - 1);
}

int fibonacci(int num) {
  return num <= 1 ? 1 : fibonacci(num - 1) + fibonacci(num - 2);
}

firstUnique(List<int> list) {
  Set<int> set = Set<int>();

  for (int i = 0; i < list.length; i++) {
    if (!set.contains(list[i])) {
      set.add(list[i]);
    } else {
      set.remove(list[i]);
    }
  }
  return set.first;
}

void main() {
  List<int> list = [4, 2, 6, 1, 4, 6, 3];

  print(firstUnique(list));
  // int n =  10;

  // factorial
  // print(factorial(5));

  // Brototype DSA challenge
  // print(f(5));

  // fibonacci
  // print('fibonacci num of position ${n} is ${fibonacci(n)}');
}
