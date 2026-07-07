import 'dart:io';

void main() {
  double balance = 1000;

  String choose = "0";
  while (choose != "5") {
    print("========= ATM SYSTEM =========");
    print("1. Check Balance");
    print("2. Deposit");
    print("3. Withdraw");
    print("4. Transfer");
    print("5. Exit");
    print("Choose:");
    choose = stdin.readLineSync()!;

    if (choose == "1") {
      balance = checkBalance(balance);
      print("Youre Balance : $balance");
    } else if (choose == "2") {
      print("Input an amount to deposit:");
      double amount = double.parse(stdin.readLineSync()!);

      balance = deposit(amount, balance);
      print("Your new balance is :$balance");
    } else if (choose == "3") {
      print("Input an amount to Withdraw:");
      double amount = double.parse(stdin.readLineSync()!);
      balance = withdraw(amount, balance);
      print("Your new balance is :$balance");
    } else if (choose == "4") {
      print("Input an Account Number:");
      String accountNumber = stdin.readLineSync()!;
      print("Input an amount to Transfer:");
      double amount = double.parse(stdin.readLineSync()!);
      balance = transfer(accountNumber, amount, balance);
      print("You succesfully transfer an amount of $amount to $accountNumber");
      print("Your new balance is :$balance");
    } else if (choose == "5") {
      print("Exit");
    } else {
      print("Invalid Number");
    }
  }
}

double checkBalance(double balance) {
  return balance;
}

double deposit(double amount, double balance) {
  if (amount > 0) {
    return balance += amount;
  } else {
    print("Invalid deposit amount");
    return balance;
  }
}

double withdraw(double amount, double balance) {
  if (balance >= amount) {
    return balance -= amount;
  } else {
    return balance;
  }
}

double transfer(String accountNumber, double amount, double balance) {
  if (balance >= amount && amount > 0 && accountNumber.length >= 5) {
    return balance -= amount;
  } else {
    return balance;
  }
}
