import 'package:event_app/core/models/event_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

abstract class AddEventLocalDataSource {
  Future<void> cacheData(EventModel data);
}

@LazySingleton(as: AddEventLocalDataSource)
class AddEventLocalDataSourceConcrete implements AddEventLocalDataSource {
  //todo get it lo injecterà?
  final Database database;
  StoreRef _store;

  AddEventLocalDataSourceConcrete(this.database) {
    _store = intMapStoreFactory.store("event_store");
  }

  @override
  Future<void> cacheData(EventModel data) async {
    return await _store.add(database, data.toMap());
  }
}
