import 'package:event_app/models/event.dart';
import 'package:rxdart/rxdart.dart';

class EventBloc {
  final _events = BehaviorSubject<List<EventModel>>();

  Stream<List<EventModel>> get events => _events.stream;

  addNewEvent(EventModel eventModel) {
    List<EventModel> events = _events?.value ?? [];
    events.add(eventModel);
    _events.sink.add(events);
  }

  dispose() {
    _events.close();
  }
}
