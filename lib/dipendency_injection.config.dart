// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:sembast/sembast.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

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
  return get;
}

class _$DBInitializer extends DBInitializer {}
