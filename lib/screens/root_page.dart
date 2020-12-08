import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootState();
}

class RootState extends State<RootPage> {
  int _selectedIndex = 0;
  final pages = [
    Center(
      child: Text('Home Page!'),
    ),
    //workaroung for spacing real tab buttons
    Center(
      child: Text('mock Page!'),
    ),
    Center(
      child: Text('Settings Page!'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages.elementAt(_selectedIndex),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange[300],
          onPressed: null,
          elevation: 2.0,
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 10.0,
          child: BottomNavigationBar(
            backgroundColor: Colors.blue,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              //workaroung for spacing real tab buttons
              BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ));
  }

  _onItemTapped(int index) {
    //workaroung for spacing real tab buttons
    if (index != 1) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
