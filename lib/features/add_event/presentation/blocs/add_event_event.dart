part of 'add_event_bloc.dart';

abstract class AddEventEvent extends Equatable {
  const AddEventEvent();

  @override
  List<Object> get props => [];
}

class AddToCacheEvent extends AddEventEvent {
  final EventModel data;

  AddToCacheEvent(this.data);
}
