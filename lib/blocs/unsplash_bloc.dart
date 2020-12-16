import 'package:event_app/resources/api/unsplash_api.dart';

class UnsplashBloc {
  UnsplashApi _api = UnsplashApi();

  Future<List<String>> fetchPhotoUrls() async {
    final urls = await _api.fetchImages();
    return urls;
  }
}
