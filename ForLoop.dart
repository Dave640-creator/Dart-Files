import "dart:io";

void main() {
  print("Input a Number: ");
  int count = 0;
  int number = int.parse(stdin.readLineSync()!);

  String even = evenChecker(count, number).toString();
  print("There is $even even numbers");
}

int evenChecker(int count, int number) {
  /* for (int i = 1; i <= number; i++) {
    if (i % 2 == 0) {
      print(i);
      count++;
    }
  }
  return count;



  */

  
  while (i <= number) {
    if (i % 2 == 0) {
      print(i);
      count++;
    }
    i++;
  }
  return count;
}
