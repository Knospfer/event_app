import 'package:dartz/dartz.dart';
import 'package:event_app/core/errors/failures.dart';
import 'package:event_app/core/models/event_model.dart';

abstract class AddEventRepositoy {
  Future<Either<Failure, void>> cacheEvent(EventModel data);
}
