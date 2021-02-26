import 'package:http/http.dart' show Client;
import 'package:injectable/injectable.dart';

@module
abstract class ClientModule {
  Client get client => Client();
}
