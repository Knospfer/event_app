part of 'unsplash_bloc.dart';

abstract class UnsplashState extends Equatable {
  const UnsplashState();

  @override
  List<Object> get props => [];
}

class UnsplashInitial extends UnsplashState {}

class UnsplashLoading extends UnsplashState {}

class UnsplashLoaded extends UnsplashState {
  final List<String> imageUrls;

  UnsplashLoaded(this.imageUrls);
}

class UnsplashError extends UnsplashState {}
