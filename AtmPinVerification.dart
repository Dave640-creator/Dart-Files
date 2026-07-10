import "dart:io";

void main() {
  String pin = "1234";
  int attemps = 3;
  print("========ATM=======");

  if (attemps != 0) {
    stdout.write("Enter Pin: ");
    pin = stdin.readLineSync()!;

    while (pin != "1234" && attemps != 1) {
      attemps--;
      print("You Have $attemps attemps");
      stdout.write("Enter Pin: ");
      pin = stdin.readLineSync()!;

      if (attemps == 1) {
        print("Account Locked");
      }
    }
    if (pin == "1234") {
      print("Acount Opened");
    }
  }
}
//dart AtmPinVerification.dart