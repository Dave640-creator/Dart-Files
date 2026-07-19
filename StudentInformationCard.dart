// dart StudentInformationCard.dart

import "dart:io";

void main() {
  studentInfo("Dave");
}

void studentInfo(String name, [int? age, String? course]) {
  print("Name : $name");
  if (age == null) {
    print("Age:Not Provided");
  } else {
    print("Age : $age");
  }
  if (course == null) {
    print(course ?? "Not Provided");
  }
  print("Course : $course");
}
