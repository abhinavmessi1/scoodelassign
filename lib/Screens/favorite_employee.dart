import 'package:flutter/material.dart';
import 'package:hitesh_blocapp/Employee.dart';
import 'package:hitesh_blocapp/bloc/Employee_bloc.dart';

class FavoriteEmployees extends StatefulWidget {
  const FavoriteEmployees({super.key});

  @override
  State<FavoriteEmployees> createState() => _FavoriteEmployeesState();
}

class _FavoriteEmployeesState extends State<FavoriteEmployees> {
  final EmployeeBloc _employeeBLoc = EmployeeBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Employee>>(
        stream: _employeeBLoc.favoriteEmployeeStreamList,
        builder:
            (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
          return Center(
              child: snapshot.hasData
                  ? Container(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              color: Colors.orange,
                              surfaceTintColor: Colors.amber,
                              child: ListTile(
                                leading: Text("${snapshot.data![index].name}"),
                                trailing: IconButton(
                                  onPressed: () {
                                    _employeeBLoc.deletefavEmployeesink
                                        .add(snapshot.data![index]);
                                  },
                                  icon: const Icon(Icons.delete_forever),
                                ),
                              ),
                            );
                          }),
                    )
                  : Text("Add the favorite Employee"));
        });
  }
}
