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

  ///NOTE!! If you are using equatable you must tell it the value to check
  ///otherwise bloc will not emit new values because of the
  ///distinct until changed
  @override
  List<Object> get props => [this.events];
}
