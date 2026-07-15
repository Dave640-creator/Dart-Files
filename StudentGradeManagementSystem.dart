//StudentGradeManagementSystem.dart

import "dart:io";

void main() {
  int choice = 0;

  List<double> grades = [];
  do {
    print("========== Student Grade Management ==========");
    print("1. Add Grade");
    print("2. Display Grades");
    print("3. Calculate Average");
    print("4. Highest Grade");
    print("5. Lowest Grade");
    print("6. Count Passed");
    print("7. Count Failed");
    print("8. Exit");
    print("==============================================");
    stdout.write("Choose:");
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addGrade(grades);
        break;
      case 2:
        if (hasGrades(grades)) {
          displayGrades(grades);
        } else {
          print("No Grades are in the List");
        }
        break;
      case 3:
        if (hasGrades(grades)) {
          calculateAverage(grades);
        } else {
          print("No Grades are in the List");
        }

        break;
      case 4:
        if (hasGrades(grades)) {
          highestGrade(grades);
        } else {
          print("No Grades are in the List");
        }

        break;
      case 5:
        if (hasGrades(grades)) {
          lowestGrade(grades);
        } else {
          print("No Grades are in the List");
        }

        break;
      case 6:
        if (hasGrades(grades)) {
          passed(grades);
        } else {
          print("No Grades are in the List");
        }

        break;
      case 7:
        if (hasGrades(grades)) {
          failed(grades);
        } else {
          print("No Grades are in the List");
        }

        break;
      case 8:
        print("Exit.");
        break;
    }
  } while (choice != 8);
}

void addGrade(List<double> grades) {
  stdout.write("Enter Grade: ");
  double grade = double.parse(stdin.readLineSync()!);
  grades.add(grade);
}

void displayGrades(List<double> grades) {
  for (var grade in grades) {
    print(grade);
  }
}

void calculateAverage(List<double> grades) {
  double total = 0;
  for (var grade in grades) {
    total += grade;
  }
  double finalAverage = total / grades.length;
  print(" Average:   $finalAverage");
}

void highestGrade(List<double> grades) {
  double highest = grades[0];
  for (int i = 0; i < grades.length; i++) {
    if (grades[i] > highest) {
      highest = grades[i];
    }
  }
  print("Highest Grade: $highest");
}

void lowestGrade(List<double> grades) {
  double lowest = grades[0];

  for (int i = 0; i < grades.length; i++) {
    /*   if (i == 0) {
      lowest = grades[i];
    } else if (grades[i] < lowest) {
      lowest = grades[i];
    }
  }
  */
    if (grades[i] < lowest) {
      lowest = grades[i];
    }
  }

  print("Lowest Grade : $lowest");
}

void passed(List<double> grades) {
  int passed = 0;
  for (int i = 0; i < grades.length; i++) {
    if (grades[i] >= 75) {
      passed++;
    }
  }
  print("Passed: $passed");
}

void failed(List<double> grades) {
  int failed = 0;
  for (int i = 0; i < grades.length; i++) {
    if (grades[i] < 75) {
      failed++;
    }
  }
  print("Failed: $failed");
}

bool hasGrades(List<double> grades) {
  if (grades.isEmpty) {
    return false;
  } else {
    return true;
  }
}
