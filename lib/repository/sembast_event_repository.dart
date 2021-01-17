import 'package:event_app/models/event.dart';
import 'package:event_app/repository/event_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';

class SembastEventRepository extends EventRepository {
  final Database _database = GetIt.I.get();
  final StoreRef _store = intMapStoreFactory.store("event_store");

  @override
  Future<List<EventModel>> getAllEvents() async {
    final snapshots = await _store.find(_database);
    return snapshots
        .map((snapshot) => EventModel.fromMap(snapshot.key, snapshot.value))
        .toList();
  }

  @override
  Future<int> insertEvent(EventModel eventModel) async {
    return await _store.add(_database, eventModel.toMap());
  }
}
