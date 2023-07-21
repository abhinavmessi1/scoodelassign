import 'package:hitesh_blocapp/Employee.dart';

class EmployeeData {
  static List<Employee> _employeeList = [
    Employee(1, "Abhinav"),
    Employee(2, "Shaun"),
    Employee(3, "Shivam"),
    Employee(4, "Stuti"),
    Employee(5, "Akshit"),
    Employee(6, "crist"),
  ];

  List<Employee> get employeeList => _employeeList;
}
