abstract class Account {
  int accountNumber;
  double balance;
  Account(this.accountNumber,this.balance);

  void deposit(double amount) {
    balance = balance + amount;
  }
  withdraw(double amount);
}
