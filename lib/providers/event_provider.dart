import 'package:event_app/blocs/event_bloc.dart';
import 'package:flutter/material.dart';

class EventProvider extends InheritedWidget {
  final bloc = EventBloc();

  EventProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static EventBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EventProvider>().bloc;
  }
}
