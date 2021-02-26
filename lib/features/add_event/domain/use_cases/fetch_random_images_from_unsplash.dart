import 'package:event_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:event_app/core/use_cases/use_case.dart';
import 'package:event_app/features/add_event/domain/repositories/unsplash_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchRandomImagesFromUnsplash implements UseCase<List<String>, NoParams> {
  final UnsplashRepository repository;

  FetchRandomImagesFromUnsplash(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    return await repository.fetchRandomImages();
  }
}
