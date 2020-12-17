import 'package:event_app/blocs/unsplash_bloc.dart';
import 'package:flutter/material.dart';

class UnsplashProvider extends InheritedWidget {
  final bloc = UnsplashBloc();

  UnsplashProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static UnsplashBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UnsplashProvider>().bloc;
  }
}
