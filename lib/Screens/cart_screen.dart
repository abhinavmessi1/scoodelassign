import 'package:flutter/material.dart';
import 'package:hitesh_blocapp/Employee.dart';
import 'package:hitesh_blocapp/bloc/Employee_bloc.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final EmployeeBloc _employeeBLoc = EmployeeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mycart"),
        ),
        body: StreamBuilder<List<Employee>>(
            stream: _employeeBLoc.cartListStream,
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
                                    leading:
                                        Text("${snapshot.data![index].name}"),
                                    trailing: IconButton(
                                      onPressed: () {
                                        // _employeeBLoc.deletecartStreamListSink
                                        //     .add(snapshot.data![index]);
                                        _employeeBLoc.cartDeleteStreamSink
                                            .add(snapshot.data![index]);
                                      },
                                      icon: const Icon(Icons.delete_forever),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : Text("Add the favorite Employee"));
            }));
  }
}
