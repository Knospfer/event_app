import 'package:event_app/core/enums/routes.dart';
import 'package:event_app/dipendency_injection.dart';
import 'package:event_app/features/home/presentation/blocs/event_list/event_list_bloc.dart';
import 'package:event_app/features/home/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootState();
}

class RootState extends State<RootPage> {
  int _selectedIndex = 0;
  final pages = [
    BlocProvider<EventListBloc>(
      create: (_) => getIt<EventListBloc>(),
      child: HomePage(),
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
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.addPage);
          },
          elevation: 2.0,
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          notchMargin: 10.0,
          child: BottomNavigationBar(
            backgroundColor: Colors.grey,
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
