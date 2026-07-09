import "dart:io";

void main() {
  print("Input a Number of Students: ");
  int number = int.parse(stdin.readLineSync()!);
  double grade;
  for (int i = 0; i < number; i++) {
    print("Input Student ${i + 1} grade: ");
    grade = double.parse(stdin.readLineSync()!);
    print("Student Grade is $grade");
  }
}
