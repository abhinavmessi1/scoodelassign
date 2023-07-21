import 'package:flutter/material.dart';
import 'package:hitesh_blocapp/Screens/cart_screen.dart';
import 'package:hitesh_blocapp/Screens/favorite_employee.dart';
import 'package:hitesh_blocapp/Screens/orignal_list.dart';
import 'package:hitesh_blocapp/Screens/search_employee.dart';
import 'Employee.dart';
import 'bloc/Employee_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    OrignalListScreen(),
    SearchScreen(),
    FavoriteEmployees(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Management App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyCart()));
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Employees",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Favorites",
              backgroundColor: Colors.green),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
      ),
    );
  }
}
