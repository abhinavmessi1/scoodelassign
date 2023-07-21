class Employee {
  int _id;
  String _name;

  Employee(this._id, this._name);
  //setter and getter

  set id(int id) {
    this._id = id;
  }

  set name(String name) {
    this._name = name;
  }

  int get id => this._id;
  String get name => this._name;
}
