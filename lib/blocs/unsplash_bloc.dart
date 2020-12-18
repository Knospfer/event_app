import 'package:event_app/resources/api/unsplash_api.dart';
import 'package:rxdart/rxdart.dart';

class UnsplashBloc {
  UnsplashApi _api = UnsplashApi();

  final _urls = PublishSubject<List<String>>();

  Stream<List<String>> get urls => _urls.stream;

  fetchPhotoUrls() async {
    final urls = await _api.fetchImages();
    _urls.sink.add(urls);
  }

  fetchPhotoBySearch(String search) async {
    final urls = await _api.fetchImages(queryParams: {'query': search});
    _urls.sink.add(urls);
  }

  dispose() {
    _urls.close();
  }
}
