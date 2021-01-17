import 'package:event_app/models/event.dart';
import 'package:event_app/repository/event_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class EventBloc {
  EventRepository _eventRepository = GetIt.I.get();
  final _events = BehaviorSubject<List<EventModel>>();

  EventBloc() {
    _loadEvents();
  }

  Stream<List<EventModel>> get events => _events.stream;

  addNewEvent(EventModel eventModel) async {
    await _updateAndSyncWithDB(eventModel);
  }

  dispose() {
    _events.close();
  }

  _loadEvents() async {
    final events = await _eventRepository.getAllEvents();
    _events.sink.add(events ?? []);
  }

  Future<void> _updateAndSyncWithDB(EventModel eventModel) async {
    await _eventRepository.insertEvent(eventModel);
    await _loadEvents();
  }
}
