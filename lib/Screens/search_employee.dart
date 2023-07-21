import 'package:flutter/material.dart';
import 'package:hitesh_blocapp/Employee.dart';
import 'package:hitesh_blocapp/bloc/Employee_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final EmployeeBloc _employeeBLoc = EmployeeBloc();
  final textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Employee>>(
      builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 80,
              child: Card(
                elevation: 4,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: "enter the Employee name here",
                      label: Text("search bar"),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                  autofocus: true,
                  enableSuggestions: true,
                  controller: textFieldController,
                  onChanged: (value) {
                    _employeeBLoc.inputStringStream.add(value);
                    // _employeeBLoc.searchList(value);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            snapshot.hasData
                ? Container(
                    width: double.infinity,
                    height: 250,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.orange,
                          surfaceTintColor: Colors.amber,
                          elevation: 5,
                          child: ListTile(
                            leading: Text("${snapshot.data![index].name}"),
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length,
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Text("please search Employee"),
                      ),
                    ),
                  ),
          ],
        );
      },
      stream: _employeeBLoc.employeesearch,
    );
  }
}
