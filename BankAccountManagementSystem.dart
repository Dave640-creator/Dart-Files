//dart BankAccountManagementSystem.dart

void main() {
  BankAccount user1 = BankAccount("Dave", 123456, 1000);
  user1.displayAccount();
  user1.deposit(500);
  print(user1.balance);
  user1.withdraw(1500);
  print(" New balance: ${user1.balance}");
  user1.withdraw(100);
  user1.displayAccount();
}

class BankAccount {
  String accountHolder;
  int accountNumber;
  double balance;

  BankAccount(this.accountHolder, this.accountNumber, this.balance);

  void displayAccount() {
    print("Account Holder: $accountHolder");
    print("Account Number : $accountNumber");
    print("Current Balance : P $balance");
  }

  double deposit(double amount) {
    balance += amount;

    return balance;
  }

  double withdraw(double amount) {
    if (balance > 0 && amount <= balance) {
      balance -= amount;
    } else {
      print("Insufficient balance!");
    }
    return balance;
  }
}
