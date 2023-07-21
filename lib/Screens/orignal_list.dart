import 'package:flutter/material.dart';
import 'package:hitesh_blocapp/Employee.dart';
import 'package:hitesh_blocapp/bloc/Employee_bloc.dart';

class OrignalListScreen extends StatefulWidget {
  const OrignalListScreen({super.key});

  @override
  State<OrignalListScreen> createState() => _OrignalListScreenState();
}

class _OrignalListScreenState extends State<OrignalListScreen> {
  final EmployeeBloc _employeeBLoc = EmployeeBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _employeeBLoc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Employee>>(
          stream: _employeeBLoc.employeeListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "${snapshot.data![index].id}",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data![index].name}",
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: IconButton(
                                  onPressed: () {
                                    _employeeBLoc.employeeFavoriteSink
                                        .add(snapshot.data![index]);
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )),
                            ),
                            Container(
                              child: IconButton(
                                  onPressed: () {
                                    _employeeBLoc.cartStreamSink
                                        .add(snapshot.data![index]);
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.green,
                                  )),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: snapshot.data!.length)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
