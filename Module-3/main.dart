import 'class.dart';

/*
Assignment of  " Nazmul Haque Nahin "
Date : 15-05-2023
*/

/*

=> In the main() function, create three Car objects with different 
brands, 
models, 
and years.

=> Drive each car a different number of miles using the drive() method.


Print out the 
brand, 
model, 
year, 
and miles driven 
for each car using the

getBrand(), getModel(), getYear(), and getMilesDriven() methods, 
respectively.
Also print out the age of each car using the getAge() method.

Finally, print out the total number of Car objects created using the numberOfCars static
property.
*/
void main() {
  var bmw = Car('BMW', 'BX20-1', 2011);
  var ferrari = Car('Ferrari', 'YU-92734', 2001);
  var lamborghini = Car('lamborghini', 'XW-ZTE10', 2009);

  bmw.drive(23.0);
  ferrari.drive(33.0);
  lamborghini.drive(89.21);

  print("Car Name : ${bmw.getBrand()}");
  print("Car Model : ${bmw.getModel()}");
  print("This Car was made on the year : ${bmw.getYear()}");
  print("Total number of miles driven by this car : ${bmw.getMilesDriven()}");
  print("Age of this Car : ${bmw.getAge()}");

  print("\n***********************************\n");

  print("Car Name : ${ferrari.getBrand()}");
  print("Car Model : ${ferrari.getModel()}");
  print("This Car was made on the year : ${ferrari.getYear()}");
  print(
      "Total number of miles driven by this car : ${ferrari.getMilesDriven()}");
  print("Age of this Car : ${ferrari.getAge()}");

  print("\n***********************************\n");

  print("Car Name : ${lamborghini.getBrand()}");
  print("Car Model : ${lamborghini.getModel()}");
  print("This Car was made on the year : ${lamborghini.getYear()}");
  print("Total number of miles driven by this car : ${lamborghini.getMilesDriven()}");
  print("Age of this Car : ${lamborghini.getAge()}");
  
  print("\n***********************************\n");
  
  print("total number of Car objects : ${Car.numberOfCars}");
}
