void main() {
  print("Number Checker System....");
  print("Input a number : ");
  int number = int.parse(stdin.readLineSync()!);

  String checker = checknumber(number);

  print(checker);
}

String checknumber(int number) {
  if (number < 0) {
    return "Negative";
  } else if (number > 0) {
    return "Positive";
  } else {
    return "Zero";
  }
}
