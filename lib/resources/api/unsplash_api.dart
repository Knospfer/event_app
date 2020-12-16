import 'dart:convert';

import 'package:event_app/models/unsplash_image.dart';
import 'package:http/http.dart' show Client;

final _endpoint = 'https://api.unsplash.com';

class UnsplashApi {
  Client client = Client();

  Future<List<String>> fetchImages() async {
    final response = await client.get(
        '$_endpoint/photos?R&client_id=45_aoM8PPbvAmKV90vZLXGjiDOsZzLRa_K3hux63a5E');
    List<dynamic> photos = json.decode(response.body);

    final mappedUrls =
        photos.map((m) => UnsplashImage.fromJson(m).regularUrl).toList();
    return mappedUrls;
  }
}
