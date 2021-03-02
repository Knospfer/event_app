import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/features/home/data/data_sources/fetch_event_list_local_data_source.dart';
import 'package:event_app/features/home/domain/repositories/fetch_event_list_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FetchEventListRepository)
class FetchEventListRepositoryConcrete implements FetchEventListRepository {
  final FetchEventListLocalDataSource localDataSource;

  FetchEventListRepositoryConcrete(this.localDataSource);

  @override
  Stream<List<EventModel>> fetchEventList() {
    return localDataSource.listenToEventChanges();
  }
}
