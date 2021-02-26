import 'package:event_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:event_app/core/use_cases/use_case.dart';
import 'package:event_app/features/add_event/domain/repositories/unsplash_repository.dart';
import 'package:injectable/injectable.dart';

class SearchParams {
  final String search;

  SearchParams(this.search);
}

@lazySingleton
class SearchImagesFromUnsplashUseCase implements UseCase<List<String>, SearchParams> {
  final UnsplashRepository unsplashRepository;

  SearchImagesFromUnsplashUseCase(this.unsplashRepository);

  @override
  Future<Either<Failure, List<String>>> call(SearchParams params) async {
    return await unsplashRepository.searchImages(params.search);
  }
}
