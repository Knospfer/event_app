import 'package:event_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/core/use_cases/use_case.dart';
import 'package:event_app/features/add_event/domain/repositories/add_event_repository.dart';
import 'package:injectable/injectable.dart';

class AddEventParams {
  final EventModel data;

  AddEventParams(this.data);
}

@lazySingleton
class AddEventUseCase implements UseCase<void, AddEventParams> {
  final AddEventRepositoy repositoy;

  AddEventUseCase(this.repositoy);

  @override
  Future<Either<Failure, void>> call(AddEventParams params) async {
    return await repositoy.cacheEvent(params.data);
  }
}
