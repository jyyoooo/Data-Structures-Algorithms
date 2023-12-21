void main() {
  String originalString = "abcdefg";
  int shifter = 3;
  String countChar = 'jyyoooo';
  dynamic result = replaceAlphabets(originalString, shifter);
  String resultStr = charCount(countChar);

  // print("Original String: $originalString");
  // print("String shifted $shifter places: $result");
  // print('counting  $countChar $resultStr');
  print(replaceWithNth(originalString, shifter));
}

replaceAlphabets(String input, int shifter) {
  return String.fromCharCodes(input.runes.map((e) => e + shifter));
}

charCount(String input) {
  int count = 1;
  String result = '';
  for (int i = 1; i < input.length; i++) {
    if (input[i] == input[i - 1]) {
      count++;
    } else {
      result += '$count${input[i - 1]} ';
      count = 1;
    }
  }
  result += '$count${input[input.length - 1]} ';
  return result;
}

replaceWithNth(String input, int shifter) {
  List<String> inputAsList = input.split('');

  for (int i = 0; i < inputAsList.length; i++) {
    String temp = inputAsList[i];
    inputAsList[i] = inputAsList[shifter];
    inputAsList[shifter] = temp;
  }
  return inputAsList.join();
}
