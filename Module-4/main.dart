import 'account.dart';
import 'currentAccount.dart';
import 'savingsAccount.dart';


/*
Assignment of : Nazmul Haque Nahin.
Date : 22-05-2023
*/
void main() {
  /*
    Create an instance of the SavingsAccount class by providing values 
    for the 
    account number, 
    initial balance, 
    and interest rate.
  */
  Account savingsAccount = SavingsAccount(
      100231, //account no
      25000.00, //initial balance
      5.0 //interest rate
      );
  /*
    Use the instance to perform operations like depositing and withdrawing money.
  */
  print("Current balance of savingsAccount : ${savingsAccount.balance}");
  savingsAccount.deposit(1000.00);
  print("Current balance of savingsAccount  : ${savingsAccount.balance}");
  savingsAccount.withdraw(2500.00);
  print("Current balance of savingsAccount : ${savingsAccount.balance}");

  /*
    Create an instance of the CurrentAccount class by providing values for the account
    Number, 
    Initial balance, 
    and overdraft limit.
    Use the instance to perform operations like depositing and withdrawing.
  */

  Account currentAccount = CurrentAccount(
      201222, // account number
      5000.00, // initial balance
      500.00 // overdraft limit
    );

  currentAccount.deposit(1200.00);
  print("Current balance of CurrentAccount : ${currentAccount.balance}");
  currentAccount.withdraw(1090000);
  print("Current balance of CurrentAccount : ${currentAccount.balance}");
}
