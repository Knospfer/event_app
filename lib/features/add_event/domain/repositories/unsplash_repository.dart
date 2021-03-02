import 'package:dartz/dartz.dart';
import 'package:event_app/core/errors/failures.dart';

abstract class UnsplashRepository {
  Future<Either<Failure, List<String>>> fetchRandomImages();

  Future<Either<Failure, List<String>>> searchImages(String serach);
}
