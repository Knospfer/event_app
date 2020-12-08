import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootState();
}

class RootState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_applications_outlined),
              label: 'Settings')
        ],
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                  child: Center(
                child: Text('Home page!'),
              ));
            },
          );
        }
        if (index == 1) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                  child: Center(
                child: Text('Settings page!'),
              ));
            },
          );
        }
        return null;
      },
    );
  }
}
