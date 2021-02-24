import 'package:event_app/app.dart';
import 'package:event_app/dipendency_injection.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(App());
}
