import 'package:event_app/models/event.dart';

abstract class EventRepository {
  Future<int> insertEvent(EventModel eventModel);
  Future<List<EventModel>> getAllEvents();
}
