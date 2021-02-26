// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:sembast/sembast.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'features/add_event/presentation/blocs/add_event_bloc.dart';
import 'features/add_event/data/data_sources/add_event_local_data_source.dart';
import 'features/add_event/data/repositories/add_event_repository_concrete.dart';
import 'features/add_event/domain/repositories/add_event_repository.dart';
import 'features/add_event/domain/use_cases/add_event_use_case.dart';
import 'core/data_sources/client_module.dart';
import 'core/data_sources/db_initializer.dart';
import 'features/add_event/domain/use_cases/fetch_random_images_from_unsplash.dart';
import 'features/add_event/domain/use_cases/search_images_from_unsplash.dart';
import 'features/add_event/data/data_sources/unsplash_remote_data_source.dart';
import 'features/add_event/presentation/blocs/unsplash/unsplash_bloc.dart';
import 'features/add_event/domain/repositories/unsplash_repository.dart';
import 'features/add_event/data/repositories/unsplash_repository_concrete.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final clientModule = _$ClientModule();
  gh.factory<Client>(() => clientModule.client);
  final resolvedDatabase = await DBInitializer.initDB();
  gh.lazySingleton<Database>(() => resolvedDatabase);
  gh.lazySingleton<UnplashRemoteDataSource>(
      () => UnplashRemoteDataSourceConcrete(get<Client>()));
  gh.lazySingleton<UnsplashRepository>(
      () => UnsplashRepositoryConcrete(get<UnplashRemoteDataSource>()));
  gh.lazySingleton<AddEventLocalDataSource>(
      () => AddEventLocalDataSourceConcrete(get<Database>()));
  gh.lazySingleton<AddEventRepositoy>(
      () => AddEventRepositoryConcrete(get<AddEventLocalDataSource>()));
  gh.lazySingleton<AddEventUseCase>(
      () => AddEventUseCase(get<AddEventRepositoy>()));
  gh.lazySingleton<FetchRandomImagesFromUnsplash>(
      () => FetchRandomImagesFromUnsplash(get<UnsplashRepository>()));
  gh.lazySingleton<SearchImagesFromUnsplashUseCase>(
      () => SearchImagesFromUnsplashUseCase(get<UnsplashRepository>()));
  gh.factory<UnsplashBloc>(() => UnsplashBloc(
      get<FetchRandomImagesFromUnsplash>(),
      get<SearchImagesFromUnsplashUseCase>()));
  gh.factory<AddEventBloc>(() => AddEventBloc(get<AddEventUseCase>()));
  return get;
}

class _$ClientModule extends ClientModule {}
