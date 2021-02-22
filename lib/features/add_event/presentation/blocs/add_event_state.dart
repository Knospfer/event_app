part of 'add_event_bloc.dart';

abstract class AddEventState extends Equatable {
  const AddEventState();

  @override
  List<Object> get props => [];
}

class AddEventInitial extends AddEventState {}

class AddEventLoading extends AddEventState {}

class AddEventLoaded extends AddEventState {}

class AddEventError extends AddEventState {}
