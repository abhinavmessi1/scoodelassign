//TODO: imports
// List of employes
// stream controller
// stream sink getter
//constructor - add date; listen to changes
//core functions - favs , cart , search
//dispose

import 'dart:async';
import 'package:flutter/material.dart';

import '../Employee.dart';
import '../dummy data/dummy_data.dart';

class EmployeeBloc {
  //sink to add in pipe
  //stream to get data from pipe
  //by pipe = data flow

  final List<Employee> _employeeList = EmployeeData().employeeList;
  List<Employee> _searchedList = [];
  static List<Employee> _favoriteList = [];
  static List<Employee> _cartList = [];

  final _employeeFavriteListStreamController =
      StreamController<List<Employee>>();
  final _employeecartListStreamController = StreamController<List<Employee>>();
  final _employeecartStreamController = StreamController<Employee>();
  final _employeedeletecartStreamCOntroller = StreamController<Employee>();
//cart
  Stream<Employee> get cartdeletestream =>
      _employeedeletecartStreamCOntroller.stream;
  StreamSink<Employee> get cartDeleteStreamSink =>
      _employeedeletecartStreamCOntroller.sink;

  Stream<List<Employee>> get cartListStream =>
      _employeecartListStreamController.stream;
  StreamSink<List<Employee>> get cartListStreamListSink =>
      _employeecartListStreamController.sink;
  Stream<Employee> get cartStream => _employeecartStreamController.stream;
  StreamSink<Employee> get cartStreamSink => _employeecartStreamController.sink;

//streamcontrollers
  final _employeeFavoriteStreamController = StreamController<Employee>();
  final _employeeListStreamController = StreamController<List<Employee>>();

  final _inputStringStreamController = StreamController<String>();
  final _favdeletestreamcontroller = StreamController<Employee>();

//for favorite
  Stream<List<Employee>> get favoriteEmployeeStreamList =>
      _employeeFavriteListStreamController.stream;
  StreamSink<List<Employee>> get favoriteEmployeeStreamListSink =>
      _employeeFavriteListStreamController.sink;
  StreamSink<Employee> get employeeFavoriteSink =>
      _employeeFavoriteStreamController.sink;
  Stream<Employee> get deletefavemployee => _favdeletestreamcontroller.stream;
  StreamSink<Employee> get deletefavEmployeesink =>
      _favdeletestreamcontroller.sink;

  //for searched list
  final _employeesearchedListStreamController =
      StreamController<List<Employee>>();

  //for cart adding

  //for inputsearch

  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;
  StreamSink<String> get inputStringStream => _inputStringStreamController.sink;

  Stream<List<Employee>> get employeesearch =>
      _employeesearchedListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);

    _inputStringStreamController.stream.listen(_searchList);
    _employeeFavoriteStreamController.stream.listen(_favoriteemployee);
    _employeecartStreamController.stream.listen(_carteemployee);
    _favdeletestreamcontroller.stream.listen(_favDelete);
    _employeedeletecartStreamCOntroller.stream.listen(_cartdelete);
    cartListStreamListSink.add(_cartList);
    //  _employeecartStreamController.stream.listen(_cartdelete);
    favoriteEmployeeStreamListSink.add(_favoriteList);
  }

//Functions
  _searchList(String input) {
    List<Employee> dummyList = [];
    _employeeList.forEach((element) {
      if (element.name.toLowerCase().contains(input.toLowerCase()) &&
          input != "") {
        dummyList.add(element);
      }
    });
    _searchedList = dummyList;

    _employeesearchedListStreamController.add(_searchedList);
  }

  _favoriteemployee(Employee employee) async {
    _favoriteList.add(employee);
  }

  _carteemployee(Employee employee) async {
    _cartList.add(employee);
  }

  _favDelete(Employee employee) async {
    _favoriteList.remove(employee);
    _employeeFavriteListStreamController.add(_favoriteList);
  }

  _cartdelete(Employee employee) async {
    _cartList.remove(employee);
    _employeecartListStreamController.add(_cartList);
  }

  void dispose() {
    _employeeListStreamController.close();
    _employeesearchedListStreamController.close();
    _employeeFavoriteStreamController.close();
    _employeeFavriteListStreamController.close();
    _favdeletestreamcontroller.close();
  }
}
