import 'dart:io';

void main() {
  List<String> names = [];
  List<List<double>> grades = [];

  print("Enter number of students: ");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    print("Enter student name: ");
    String name = stdin.readLineSync()!;
    names.add(name);

    print("Enter number of subjects: ");
    int subjects = int.parse(stdin.readLineSync()!);

    List<double> studentGrades = [];

    for (int j = 0; j < subjects; j++) {
      print("Enter grade: ");
      double grade = double.parse(stdin.readLineSync()!);
      studentGrades.add(grade);
    }

    grades.add(studentGrades);
  }

  while (true) {
    print("\n1- Show Results");
    print("2- Search Student");
    print("3- Exit");

    print("Choose: ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      for (int i = 0; i < names.length; i++) {
        double sum = 0;

        for (double g in grades[i]) {
          sum += g;
        }

        double avg = sum / grades[i].length;

        String grade;
        if (avg >= 90) {
          grade = "A";
        } else if (avg >= 75) {
          grade = "B";
        } else if (avg >= 60) {
          grade = "C";
        } else {
          grade = "F";
        }

        print("${names[i]} - Average: ${avg.toStringAsFixed(2)} - Grade: $grade");
      }
    }

    else if (choice == 2) {
      print("Enter student name: ");
      String search = stdin.readLineSync()!;

      int index = names.indexOf(search);

      if (index == -1) {
        print("Student not found");
      } else {
        double sum = 0;
        for (double g in grades[index]) {
          sum += g;
        }

        double avg = sum / grades[index].length;
        print("${names[index]} Average: ${avg.round()}");
      }
    }

    else if (choice == 3) {
      break;
    }
  }
}