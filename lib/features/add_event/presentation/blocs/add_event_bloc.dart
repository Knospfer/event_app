import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/features/add_event/domain/use_cases/add_event_use_case.dart';
import 'package:injectable/injectable.dart';

part 'add_event_event.dart';
part 'add_event_state.dart';

@injectable
class AddEventBloc extends Bloc<AddEventEvent, AddEventState> {
  final AddEventUseCase addEventUseCase;

  AddEventBloc(this.addEventUseCase) : super(AddEventInitial());

  @override
  Stream<AddEventState> mapEventToState(
    AddEventEvent event,
  ) async* {
    if (event is AddToCacheEvent) {
      yield AddEventLoading();
      final either = await addEventUseCase(AddEventParams(event.data));
      yield* either.fold((failure) async* {
        yield AddEventError();
      }, (_) async* {
        yield AddEventLoaded();
      });
    }
  }
}
