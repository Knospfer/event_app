part of 'event_list_bloc.dart';

abstract class EventListState extends Equatable {
  const EventListState();

  @override
  List<Object> get props => [];
}

class EventListInitial extends EventListState {}

class EventListLoaded extends EventListState {
  final List<EventModel> events;

  EventListLoaded(this.events);
}
