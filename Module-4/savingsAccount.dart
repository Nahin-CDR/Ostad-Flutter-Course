import 'account.dart';

/*
Define a class SavingsAccount that extends the Account class. 
It should have an additional property called interestRate (double).

Implement the withdraw() method in the SavingsAccount class as follows:
● Subtract the specified amount from the account balance.
● Apply the interest rate to the remaining balance.
*/
class SavingsAccount extends Account {
  double interestRate;
  SavingsAccount(super.accountNumber, super.balance, this.interestRate);

  @override
  withdraw(double amount) {
    if (balance - amount >= 0) {
      balance = balance - amount;
      // now apply the interest rate to the remaining balance
      double newBalance = (interestRate * balance) / 100;
      balance = newBalance;
    } else {
      print("failed to withdraw due to insufficient balance");
    }
  }
}
