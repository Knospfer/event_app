import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:event_app/features/add_event/data/data_sources/add_event_local_data_source.dart';
import 'package:event_app/features/add_event/domain/repositories/add_event_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AddEventRepositoy)
class AddEventRepositoryConcrete implements AddEventRepositoy {
  final AddEventLocalDataSource dataSource;

  AddEventRepositoryConcrete(this.dataSource);

  @override
  Future<Either<Failure, void>> cacheEvent(EventModel data) async {
    try {
      return Right(await dataSource.cacheData(data));
    } catch (error) {
      return Left(CacheFailure());
    }
  }
}
