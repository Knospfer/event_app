import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/core/use_cases/use_case.dart';
import 'package:event_app/features/home/domain/use_cases/fetch_event_list_use_case.dart';
import 'package:injectable/injectable.dart';

part 'event_list_event.dart';
part 'event_list_state.dart';

@injectable
class EventListBloc extends Bloc<EventListEvent, EventListState> {
  final FetchEventListUseCase useCase;
  var subscription;

  EventListBloc(this.useCase) : super(EventListInitial()) {
    subscription = useCase(NoParams()).listen((event) {
      add(SendEventList(event));
    });
  }

  @override
  Stream<EventListState> mapEventToState(
    EventListEvent event,
  ) async* {
    if (event is SendEventList) {
      yield EventListLoaded(event.events);
      return;
    }
    yield EventListInitial();
  }
}
