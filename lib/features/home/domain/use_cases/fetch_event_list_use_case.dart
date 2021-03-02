import 'package:event_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/core/use_cases/use_case.dart';
import 'package:event_app/features/home/domain/repositories/fetch_event_list_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchEventListUseCase
    implements StreamUseCase<List<EventModel>, NoParams> {
  final FetchEventListRepository repository;

  FetchEventListUseCase(this.repository);

  Stream<List<EventModel>> call(NoParams params) {
    return repository.fetchEventList();
  }
}
