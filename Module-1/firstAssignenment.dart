/*
Name : Nazmul Haque Nahin
batch 03
module 1 assignment
Ostad .
*/


void main() {
  List<String> phoneNumber = [
    "+88",
    "01768131685",
    "01768171985",
    "01768111286",
    "01768131685"
  ];

  for (int i = 0; i < phoneNumber.length; i++) {
    if (i == 0) continue;
    String finalNumber = "+88" + phoneNumber[i];
    print(finalNumber);
  }
}
