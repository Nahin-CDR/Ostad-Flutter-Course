class Car {
  static int numberOfCars = 0;

  late String brand;

  /// brand: a string representing the brand of the car
  late String model;

  /// model: a string representing the model of the car
  late int year;

  /// year: an integer representing the year the car was made

  double milesDriven = 0.0;

  ///  milesDriven: a double representing the number of miles driven by the car

  Car(String brand, String model, int year) {
    this.brand = brand;
    this.model = model;
    this.year = year;
    numberOfCars++;
  }

  /* 
  drive(double miles): a method that takes a double parameter representing the
  number of miles driven and adds it to the milesDriven property 
  */
  drive(double miles) {
    milesDriven += miles;
  }

  /// getMilesDriven() : a method that returns the value of the milesDriven property
  double getMilesDriven() {
    return milesDriven;
  }

  /// getBrand(): a method that returns the value of the brand property
  String getBrand() {
    return brand;
  }

  /// getModel(): a method that returns the value of the model property
  String getModel() {
    return model;
  }

  /// getYear(): a method that returns the value of the year property
  int getYear() {
    return year;
  }

  /* 
  getAge(): a method that returns the age of the car (i.e. the difference between the
  current year and the year property) 
  */
  int getAge() {
    return (2023 - this.year);
  }
}
