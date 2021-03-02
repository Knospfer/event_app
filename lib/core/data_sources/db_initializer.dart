import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

@preResolve
@LazySingleton(as: Database)
class DBInitializer implements Database {
  @factoryMethod
  static Future<Database> initDB() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final databasePath = join(appDir.path, "sembast.db");
    return await databaseFactoryIo.openDatabase(databasePath);
  }

  @override
  Future close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  // TODO: implement path
  String get path => throw UnimplementedError();

  @override
  Future<T> transaction<T>(
      FutureOr<T> Function(Transaction transaction) action) {
    throw UnimplementedError();
  }

  @override
  // TODO: implement version
  int get version => throw UnimplementedError();
}
