String studentGrade(String studentName, int testScore) {
  if (testScore >= 90 && testScore <= 100) {
    return "A";
  } else if (testScore >= 80 && testScore <= 89) {
    return "B";
  }
  else if (testScore >= 70 && testScore <= 79) {
    return "C";
  }
  else if (testScore >= 60 && testScore <= 69) {
    return "D";
  }
  else if (testScore >= 0 && testScore <= 59) {
    return "F";
  }
  else{
    return "Invalid Grade";
  }
}

void main() {
  String studentName = "Nazmul Haque Nahin";
  int testScore = 85;
  String grade = studentGrade(studentName, testScore);
  print("$studentName's grade: $grade");
}
