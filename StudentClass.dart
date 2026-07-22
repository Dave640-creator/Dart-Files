void main() {
  Student s1 = Student("Dave", 22, "BSCS");
  Student s2 = Student("Elaura", 21, "BSCS");
  print("Student Information");
  s1.introduce();
  s2.introduce();
}

class Student {
  String name;
  int age;
  String course;

  Student(this.name, this.age, this.course);

  void introduce() {
    print("Name:$name");
    print("Age :$age");

    print("Course: $course");
  }
}
