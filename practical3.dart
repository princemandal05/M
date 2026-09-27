// Practical 3 – Dart Object-Oriented Programming (OOP)
// Aim: Class/Object/Static variables, Inheritance, Interfaces, and Mixins.
//
// Run this file with:
//   dart run practical3.dart

// -------------------- A) Class, Object, and Static Variables --------------------

class PracticalOne {
  static void func1() {
    int var1 = 10;
    dynamic var2 = 20;

    print('This is the two numbers var1 is: $var1 and var2 is: $var2');

    var2 = 'Krishhh';
    print('This is the new variable var2: $var2');
  }

  static double variableOne = 3.7;
  static var variableTwo = 'JHC';
  static const variableThree = 89.986;
}

void demonstrateStaticVariables() {
  print('\n--- A) Class, Object, and Static Variables ---');
  PracticalOne.func1();
  print(PracticalOne.variableOne);
  print(PracticalOne.variableTwo);
  print(PracticalOne.variableThree);
}

// -------------------- B) Single Inheritance --------------------

class ParentClass {
  String name = 'Krish';
  String rollno = '24BIT013';

  void studentName() {
    print('Student Name is: $name');
  }

  void studentRollNo() {
    print('Student Roll No is: $rollno');
  }
}

class ChildClass extends ParentClass {
  int marks1 = 30;
  int marks2 = 49;

  void calcMarks() {
    int total = marks1 + marks2;
    print('The total marks is $total');
  }
}

void demonstrateSingleInheritance() {
  print('\n--- B) Single Inheritance ---');
  ChildClass c = ChildClass();
  c.calcMarks();
  c.studentName();
  c.studentRollNo();
}

// -------------------- C) Multilevel Inheritance --------------------

class GrandChildClass extends ChildClass {
  String? grade;

  void functionGrade() {
    if (marks1 >= 40) {
      grade = 'A';
    } else if (marks1 >= 30) {
      grade = 'B';
    } else {
      grade = 'C';
    }

    print('GRADE IS $grade');
  }
}

void demonstrateMultilevelInheritance() {
  print('\n--- C) Multilevel Inheritance ---');
  GrandChildClass c = GrandChildClass();
  c.studentName();
  c.studentRollNo();
  c.calcMarks();
  c.functionGrade();
}

// -------------------- D) Multiple Interfaces (implements) --------------------

abstract class Student {
  void studentInfo();
}

abstract class Marks {
  void marksInfo();
}

abstract class Attendance {
  void attendanceInfo();
}

class Result implements Student, Marks, Attendance {
  @override
  void studentInfo() {
    int studentId = 13;
    String studentName = 'Krish Dubey';

    print('Student ID   : $studentId');
    print('Student Name : $studentName');
  }

  @override
  void marksInfo() {
    int maths = 90;
    int science = 95;
    int english = 88;
    int total = maths + science + english;
    double percentage = total / 3;

    print('\nMarks');
    print('Maths      : $maths');
    print('Science    : $science');
    print('English    : $english');
    print('Total      : $total');
    print('Percentage : ${percentage.toStringAsFixed(2)}%');
  }

  @override
  void attendanceInfo() {
    double attendance = 92.5;
    print('Attendance : $attendance%');
  }
}

void demonstrateInterfaces() {
  print('\n--- D) Multiple Interfaces ---');
  Result obj = Result();
  obj.studentInfo();
  obj.marksInfo();
  obj.attendanceInfo();
}

// -------------------- E) Mixins --------------------

mixin Salary {
  void showSalary() {
    print('Salary: ₹124,789');
  }
}

mixin Bonus {
  void showBonus() {
    print('Bonus: ₹37,590');
  }
}

class Employee with Salary, Bonus {
  void employeeInfo() {
    print('Employee ID: 101');
    print('Employee Name: Krish Dubey');
  }
}

void demonstrateMixins() {
  print('\n--- E) Mixins ---');
  Employee emp = Employee();
  emp.employeeInfo();
  emp.showSalary();
  emp.showBonus();
}

// -------------------- Main --------------------

void main() {
  demonstrateStaticVariables();
  demonstrateSingleInheritance();
  demonstrateMultilevelInheritance();
  demonstrateInterfaces();
  demonstrateMixins();
}
