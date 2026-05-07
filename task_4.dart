// Step 1: Create Person class
class Person {
  String name;
  int _age; // private age variable

  // Constructor
  Person(this.name, this._age);

  // Getter for age
  int get age => _age;

  // Setter for age
  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print("Age must be positive.");
    }
  }

  // Static variable
  static String universityName = "Sohag University";
}

// Step 2: Create Employee class extending Person
class Employee extends Person {
  double salary;

  // Constructor using super
  Employee(String name, int age, this.salary) : super(name, age);

  // Function to show info
  void showInfo() {
    print("University: ${Person.universityName}");
    print("Name: $name");
    print("Age: $age");
    print("Salary: $salary");
  }
}

// Step 3: Abstract class Skills
abstract class Skills {
  void programming();
  void communication();
}

// Step 4: Developer class
class Developer extends Employee implements Skills {
  Developer(String name, int age, double salary) : super(name, age, salary);

  @override
  void programming() {
    print("Programming skill: Dart developer");
  }

  @override
  void communication() {
    print("Communication skill: Good team communication");
  }
}

// Step 5: Main function
void main() {
  Developer dev = Developer("Ahmed", 25, 8000);
  dev.showInfo();
  dev.programming();
  dev.communication();
}
