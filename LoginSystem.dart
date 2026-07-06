import 'dart:io';

void main() {
  print("Login System");

  print("Input username : ");
  String username = stdin.readLineSync()!;

  print("Input password : ");
  String password = stdin.readLineSync()!;

  String check = checkCredentials(username, password);
  print(check);
}

String checkCredentials(String username, String password) {
  if (username == "dave123" && password == "1234") {
    return "Login Succesfully";
  } else {
    return "Invalid Credentials!!";
  }
}
