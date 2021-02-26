import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:event_app/core/errors/failures.dart';
import 'package:event_app/core/use_cases/use_case.dart';
import 'package:event_app/features/add_event/domain/use_cases/fetch_random_images_from_unsplash.dart';
import 'package:event_app/features/add_event/domain/use_cases/search_images_from_unsplash.dart';
import 'package:injectable/injectable.dart';

part 'unsplash_event.dart';
part 'unsplash_state.dart';

@injectable
class UnsplashBloc extends Bloc<UnsplashEvent, UnsplashState> {
  final FetchRandomImagesFromUnsplash fetchRandomImagesFromUnsplash;
  final SearchImagesFromUnsplashUseCase searchImagesFromUnsplash;

  UnsplashBloc(
      this.fetchRandomImagesFromUnsplash, this.searchImagesFromUnsplash)
      : super(UnsplashInitial());

  @override
  Stream<UnsplashState> mapEventToState(
    UnsplashEvent event,
  ) async* {
    if (event is FetchRandomImagesEvent) {
      yield UnsplashLoading();
      final either = await fetchRandomImagesFromUnsplash(NoParams());
      yield* _handleEither(either);
    }
    if (event is SearchImagesEvent) {
      yield UnsplashLoading();
      final either = await searchImagesFromUnsplash(SearchParams(event.search));
      yield* _handleEither(either);
    }
  }

  Stream<UnsplashState> _handleEither(
      Either<Failure, List<String>> either) async* {
    yield* either.fold((failure) async* {
      yield UnsplashError();
    }, (images) async* {
      yield UnsplashLoaded(images);
    });
  }
}
