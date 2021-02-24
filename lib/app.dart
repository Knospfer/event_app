import 'package:event_app/core/enums/routes.dart';
import 'package:event_app/dipendency_injection.dart';
import 'package:event_app/features/add_event/presentation/blocs/add_event_bloc.dart';
import 'package:event_app/features/add_event/presentation/screens/add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  //  TODO sarà add page
  if (settings.name == RoutesName.rootPage)
    return MaterialPageRoute(builder: (context) {
      return BlocProvider<AddEventBloc>(
        create: (_) => getIt<AddEventBloc>(),
        child: AddPage(),
      );
    });
  //TODO verrà rimosso
  return MaterialPageRoute(builder: (_) => Center());
}
