import 'dart:convert';

import 'package:event_app/models/unsplash_image.dart';
import 'package:http/http.dart' show Client;

final _endpoint = 'https://api.unsplash.com';
final _clientId = '45_aoM8PPbvAmKV90vZLXGjiDOsZzLRa_K3hux63a5E';
final _itemPerPage = 30;

class UnsplashApi {
  Client client = Client();

  Future<List<String>> fetchRandomImages() async {
    String queryString =
        '$_endpoint/photos/random?client_id=$_clientId&count=$_itemPerPage';
    final response = await client.get(queryString);
    List<dynamic> photos = json.decode(response.body);

    final mappedUrls =
        photos.map((m) => UnsplashImage.fromJson(m).regularUrl).toList();
    return mappedUrls;
  }

  Future<List<String>> searchImages(String search) async {
    String queryString =
        "$_endpoint/search/photos?client_id=$_clientId&query=$search&count=$_itemPerPage";

    final response = await client.get(queryString);
    final photos = json.decode(response.body);

    List<String> mappedUrls = photos['results']
        .map((m) => UnsplashImage.fromJson(m).regularUrl)
        .toList()
        .cast<String>();

    return mappedUrls;
  }
}
