import 'package:event_app/core/models/event_model.dart';

abstract class FetchEventListRepository {
  Stream<List<EventModel>> fetchEventList();
}
