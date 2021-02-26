import 'package:event_app/core/errors/exceptions.dart';
import 'package:event_app/core/models/event_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

abstract class FetchEventListLocalDataSource {
  Stream<List<EventModel>> listenToEventChanges();
}

@LazySingleton(as: FetchEventListLocalDataSource)
class FetchEventListLocalDataSourceConcrete
    implements FetchEventListLocalDataSource {
  final Database database;
  StoreRef _store;

  FetchEventListLocalDataSourceConcrete(this.database) {
    _store = intMapStoreFactory.store("event_store");
  }

  @override
  Stream<List<EventModel>> listenToEventChanges() {
    final query = _store.query();
    try {
      return query.onSnapshots(database).map((maps) =>
          maps.map((m) => EventModel.fromMap(m.key, m.value)).toList());
    } catch (_) {
      throw CacheException();
    }
  }
}
