import "dart:io";

void main() {
  String fullname;
  int age;
  double gwa;
  double familyMonthlyIncome;
  String scholarship;
  String academicStatus;
  String isDeanlist;
  print("============Student Evaluation==================");
  stdout.write("Enter The Name: ");
  fullname = stdin.readLineSync()!;

  stdout.write("Enter The Age: ");
  age = int.parse(stdin.readLineSync()!);

  if (age >= 18) {
    stdout.write("Enter The GWA: ");
    gwa = double.parse(stdin.readLineSync()!);
    stdout.write("Enter The Family Monthly Income: ");
    familyMonthlyIncome = double.parse(stdin.readLineSync()!);

    if (gwa <= 1.50 && familyMonthlyIncome <= 30000) {
      scholarship = "Full Schoolarship";
    } else if (gwa <= 2.00 && familyMonthlyIncome <= 50000) {
      scholarship = "Half Schoolarship";
    } else {
      scholarship = "No Schoolarship";
    }
    if (gwa <= 3.00) {
      academicStatus = "Passed";
    } else {
      academicStatus = "Failed";
    }
    if (gwa <= 1.75) {
      isDeanlist = "Yes";
    } else {
      isDeanlist = "No";
    }

    print("Name :$fullname");
    print("Age : $age");
    print("GWA : $gwa");
    print("Income : $familyMonthlyIncome");
    print("");
    print("Academic Status : $academicStatus");
    print("Schoolarship: $scholarship");
    print("DeanList: $isDeanlist");
  } else {
    print("The Student is not eligible");
  }
}
