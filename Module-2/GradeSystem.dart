String studentGrade(String studentName, int testScore) {
  if (testScore >= 80 && testScore <= 100) {
    return "A+";
  } else if (testScore >= 70 && testScore < 80) {
    return "A";
  }
  else if (testScore >= 60 && testScore < 70) {
    return "A-";
  }
  else if (testScore >= 50 && testScore < 60) {
    return "B";
  }
  else if (testScore >= 40 && testScore < 50) {
    return "C";
  }
  else if (testScore >= 33 && testScore < 40) {
    return "D";
  }
  else if (testScore >= 0 && testScore < 33) {
    return "F";
  }
  else{
    return "Invalid Grade";
  }
}

void main() {
  String studentName = "Nazmul Haque Nahin";
  int testScore = 99;
  String grade = studentGrade(studentName, testScore);
  print("$studentName's grade: $grade");
}
