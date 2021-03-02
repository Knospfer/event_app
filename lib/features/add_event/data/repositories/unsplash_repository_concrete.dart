import 'package:event_app/core/errors/exceptions.dart';
import 'package:event_app/features/add_event/data/data_sources/unsplash_remote_data_source.dart';
import 'package:event_app/features/add_event/data/models/unsplash_image.dart';
import 'package:event_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:event_app/features/add_event/domain/repositories/unsplash_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UnsplashRepository)
class UnsplashRepositoryConcrete implements UnsplashRepository {
  final UnplashRemoteDataSource remoteDataSource;

  UnsplashRepositoryConcrete(this.remoteDataSource);

  @override
  Future<Either<Failure, List<String>>> fetchRandomImages() async {
    try {
      return Right(await remoteDataSource.fetchRandomImages());
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> searchImages(String search) async {
    try {
      return Right(await remoteDataSource.searchImages(search));
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }
}
