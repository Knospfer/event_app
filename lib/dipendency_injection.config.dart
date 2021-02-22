// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:sembast/sembast.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'features/add_event/data/data_sources/add_event_local_data_source.dart';
import 'features/add_event/data/repositories/add_event_repository_concrete.dart';
import 'features/add_event/domain/repositories/add_event_repository.dart';
import 'core/data_sources/db_initializer.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final dBInitializer = _$DBInitializer();
  gh.factoryAsync<Database>(() => dBInitializer.sembast);
  gh.lazySingleton<AddEventLocalDataSource>(
      () => AddEventLocalDataSourceConcrete(get<Database>()));
  gh.lazySingleton<AddEventRepositoy>(
      () => AddEventRepositoryConcrete(get<AddEventLocalDataSource>()));
  return get;
}

class _$DBInitializer extends DBInitializer {}
