import 'account.dart';

/*
Define a class CurrentAccount that extends the Account class. 
It should have an additional property called overdraftLimit (double).
Implement the withdraw() method in the CurrentAccount class as follows:
● Allow withdrawals up to the overdraft limit.
● If the withdrawal amount exceeds the overdraft limit, print a message indicating
insufficient funds.
*/
class CurrentAccount extends Account {
  double overdraftLimit;
  CurrentAccount(super.accountNumber, super.balance, this.overdraftLimit);

  @override
  withdraw(double amount) {
    if (balance - amount >= this.overdraftLimit) {
      balance = balance - amount;
      print("$amount withdrawn successfully!");
    } else {
      print("insufficient funds");
    }
  }
}
