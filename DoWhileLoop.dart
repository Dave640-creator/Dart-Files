//DoWhileLoop.dart

import "dart:io";

void main() {
  String operands = "";
  stdout.write("Choose an Operatores (+  _   *    ~/): ");
  operands = stdin.readLineSync()!;
  stdout.write("Input Number 1: ");
  int num1 = int.parse(stdin.readLineSync()!);

  stdout.write("Input Number 2: ");
  int num2 = int.parse(stdin.readLineSync()!);

  switch (operands) {
    case "+":
      print(add(num1, num2));
      break;

    case "-":
      print(subtract(num1, num2));
      break;

    case "*":
      print(multiply(num1, num2));
      break;

    case "~/":
      print(division(num1, num2));
  }
}

int add(int num1, int num2) {
  return num1 + num2;
}

int subtract(int num1, int num2) {
  return num1 - num2;
}

int multiply(int num1, int num2) {
  return num1 * num2;
}

int division(int num1, int num2) {
  return num1 ~/ num2;
}
