void main() {
  Set<String> students = {};

// Function لإضافة طالب
  void addStudent(String name) {
    students.add(name);
  }

  void printStudentsRecursive(List<String> list, [int index = 0]) {
    if (index >= list.length) return;

    print(list[index]);
    printStudentsRecursive(list, index + 1);
  }

  
  addStudent("Andrew");
  addStudent("Ali");
  addStudent("Sara");

  print("Students using recursion:");
  printStudentsRecursive(students.toList());

  
  print("\nStudents using lambda:");
  students.forEach((student) => print(student));

  
  Set<String> newStudents = {"Mona", "Omar"};

  
  students = {...students, ...newStudents};

  print("\nAfter merging sets:");
  students.forEach((s) => print(s));


  Map<String, List<double>> studentCourses = {};

  void addCourse(String student, String course, [double grade = 0]) {
    studentCourses.putIfAbsent(student, () => []);
    studentCourses[student]!.add(grade);
  }

  // Function لحساب متوسط الدرجات
  double averageGrade(String student) {
    var grades = studentCourses[student];

    if (grades == null || grades.isEmpty) {
      return 0;
    }

    double sum = grades.reduce((a, b) => a + b); // lambda
    return sum / grades.length;
  }

  // إضافة كورسات
  addCourse("Andrew", "Math", 90);
  addCourse("Andrew", "Programming", 95);
  addCourse("Ali", "Math", 80);

  print("\nAverage grade of Andrew:");
  print(averageGrade("Andrew"));
}
