import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events',
      onGenerateRoute: _routes,
    );
  }
}

Route _routes(RouteSettings settings) {
  return null;
}
