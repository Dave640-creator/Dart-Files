import "dart:io";

void main() {
  String? name;
  int? age;
  String? email;

  print("Student Information System");

  print("Input your name: ");
  name = stdin.readLineSync()?.trim();
  print("Input  your Age: ");
  age = int.tryParse(stdin.readLineSync()!);
  print("Input your email: ");
  email = stdin.readLineSync()?.trim();

  if (name?.isEmpty ?? true) {
    name = null;
  }

  if (email?.isEmpty ?? true) {
    email = null;
  }

  print(name ?? "unknown");
  print(age ?? 0);
  print(email ?? "unknown");
}
