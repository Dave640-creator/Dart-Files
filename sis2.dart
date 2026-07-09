import "dart:io";

void main() {
  String Fullname;
  int age;
  String course;
  int numOfSubjects;
  double tuitionFee;
  double SchoolarshipDiscount;

  stdout.write("Input Name: ");
  Fullname = stdin.readLineSync()!.trim();
  stdout.write("Enter Age: ");
  age = int.parse(stdin.readLineSync()!);
  stdout.write("Input Course : ");
  course = stdin.readLineSync()!;
  stdout.write("Input number of sumbjects: ");
  numOfSubjects = int.parse(stdin.readLineSync()!);
  stdout.write("Input the Tuition Fee: ");
  tuitionFee = double.parse(stdin.readLineSync()!);
  stdout.write("Input the Schoolarhip Discount : ");
  SchoolarshipDiscount = double.parse(stdin.readLineSync()!);

  double discount = tuitionFee * (SchoolarshipDiscount / 100);
  double finalTuition = tuitionFee - discount;

  print(" Name: $Fullname");
  print(" Age: $age");
  int nextAge = age += 1;
  print("Age Next Year $nextAge");
  print(" Course: $course");
  print(" Number of Subjects: $numOfSubjects");

  print("Tution Fee: $tuitionFee");
  print(" Schoolar Discount: $SchoolarshipDiscount %");
  print(" Discount: $discount");
  print(" Final Tuition: $finalTuition");

  String Status = finalTuition > 20000 ? "HighPayment" : "Low Payment";

  print(Status);
}
