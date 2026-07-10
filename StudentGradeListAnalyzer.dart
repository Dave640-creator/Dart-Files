//dart StudentGradeListAnalyzer.dart
import "dart:io";

void main() {
  List<double> grades = [90, 85, 78, 92, 88];
  double total = 0;
  double average = 0;
  double highest = 0;
  double lowest = 90;
  int passed = 0;
  int failed = 0;

  for (double grade in grades) {
    total += grade;
    print(grade);

    if (grade > highest) {
      highest = grade;
    }

    if (grade < lowest) {
      lowest = grade;
    }

    if (grade >= 75) {
      passed++;
    } else {
      failed++;
    }
  }
  average = total / grades.length;
  print("Total :$total");
  print("Average : $average");
  print("Highest Grade: $highest");
  print("Lowest Grade: $lowest");

  print("Passed: $passed");
  print("Failed: $failed");
}
