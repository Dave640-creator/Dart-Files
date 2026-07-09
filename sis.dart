import "dart:io";

void main() {
  int? age;
  String? email;

  print("student Information System");
  print("");

  print("Input Your Name: ");
  String? name;
  name = stdin.readLineSync();
  print("Input Your Age: ");
  age = int.tryParse(stdin.readLineSync()!);
  print("Input your Email: ");
  email = stdin.readLineSync();
  if (name == "") {
    name = null;
    print(name ?? "Unknown");
  } else {
    print(name);
  }

  print(age ?? 0);

  if (email == "") {
    email = null;
    print(email ?? "Unknown");
  } else {
    print(email);
  }

  if (email != null) {
    print(email.length);
  } else {
    email = null;
    print(email?.length);
  }

  if (name != null && age != null && email != null) {
    print("Registration Complete");
  } else {
    print("Incomplete Information");
  }
}
