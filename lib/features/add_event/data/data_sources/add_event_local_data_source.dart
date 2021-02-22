import 'package:event_app/core/models/event_model.dart';

abstract class AddEventLocalDataSource {
  Future<void> cacheData(EventModel data);
}

