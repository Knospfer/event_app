part of 'unsplash_bloc.dart';

abstract class UnsplashEvent extends Equatable {
  const UnsplashEvent();

  @override
  List<Object> get props => [];
}

class FetchRandomImagesEvent extends UnsplashEvent {}

class SearchImagesEvent extends UnsplashEvent {
  final String search;

  SearchImagesEvent(this.search);
}
