import 'package:event_app/app.dart';
import 'package:event_app/database/db_initializer.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbInitalizer.initDb();
  runApp(App());
}
