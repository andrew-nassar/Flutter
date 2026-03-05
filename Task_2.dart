import 'dart:io';
import 'dart:math';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  // Ask for number of students
  int numStudents = _readInt("Enter number of students: ");

  for (int i = 0; i < numStudents; i++) {
    stdout.write("Enter name of student ${i + 1}: ");
    String name = stdin.readLineSync()!.trim();
    studentNames.add(name);

    int numSubjects = _readInt("Enter number of subjects for $name: ");
    List<double> grades = [];

    for (int j = 0; j < numSubjects; j++) {
      double grade = _readDouble("Enter grade for subject ${j + 1}: ");
      grades.add(grade);
    }

    studentGrades.add(grades);
  }

  // Infinite loop menu
  while (true) {
    print("\nMenu:");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");

    int choice = _readInt("Enter your choice: ");

    switch (choice) {
      case 1:
        _showAllResults(studentNames, studentGrades);
        break;
      case 2:
        _searchStudent(studentNames, studentGrades);
        break;
      case 3:
        print("Exiting program...");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}

// Helper: read integer safely
int _readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input != null) {
      try {
        return int.parse(input);
      } catch (e) {
        print("Invalid input. Please enter a valid integer.");
      }
    }
  }
}

// Helper: read double safely
double _readDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input != null) {
      try {
        return double.parse(input);
      } catch (e) {
        print("Invalid input. Please enter a valid number.");
      }
    }
  }
}

// Show all results
void _showAllResults(List<String> names, List<List<double>> grades) {
  for (int i = 0; i < names.length; i++) {
    double avg = grades[i].reduce((a, b) => a + b) / grades[i].length;
    String letter = _getLetterGrade(avg);
    print("${names[i].toUpperCase()} - Average: ${avg.toStringAsFixed(2)} - Grade: $letter");
  }
}

// Search student
void _searchStudent(List<String> names, List<List<double>> grades) {
  stdout.write("Enter student name to search: ");
  String searchName = stdin.readLineSync()!.trim();

  int index = names.indexWhere((n) => n.toLowerCase() == searchName.toLowerCase());
  if (index == -1) {
    print("Student not found.");
  } else {
    double avg = grades[index].reduce((a, b) => a + b) / grades[index].length;
    print("${names[index]} - Average (rounded): ${avg.round()}");
  }
}

// Get letter grade
String _getLetterGrade(double avg) {
  if (avg >= 90) return "A";
  if (avg >= 75) return "B";
  if (avg >= 60) return "C";
  return "F";
}
