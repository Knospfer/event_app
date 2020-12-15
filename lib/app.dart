import 'package:event_app/routes.dart';
import 'package:event_app/screens/add_page.dart';
import 'package:event_app/screens/detail_page.dart';
import 'package:event_app/screens/root_page.dart';
import 'package:event_app/screens/unsplash_page.dart';
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
  if (settings.name == RoutesName.rootPage)
    return MaterialPageRoute(builder: (context) => RootPage());
  if (settings.name == RoutesName.detailPage)
    return MaterialPageRoute(builder: (context) => DetailPage());
  if (settings.name == RoutesName.addPage)
    return MaterialPageRoute(builder: (context) => AddPage());
  if (settings.name == RoutesName.unsplashPage)
    return MaterialPageRoute(builder: (context) => UnsplashPage());
  return null;
}
