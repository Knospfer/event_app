import 'dart:convert';
import 'package:event_app/core/errors/exceptions.dart';
import 'package:event_app/features/add_event/data/models/unsplash_image.dart';
import 'package:http/http.dart' show Client;
import 'package:injectable/injectable.dart';

final _endpoint = 'https://api.unsplash.com';
final _clientId = '45_aoM8PPbvAmKV90vZLXGjiDOsZzLRa_K3hux63a5E';
final _itemPerPage = 30;

abstract class UnplashRemoteDataSource {
  Future<List<String>> fetchRandomImages();
  Future<List<String>> searchImages(String search);
}

@LazySingleton(as: UnplashRemoteDataSource)
class UnplashRemoteDataSourceConcrete implements UnplashRemoteDataSource {
  final Client client;

  UnplashRemoteDataSourceConcrete(this.client);

  Future<List<String>> fetchRandomImages() async {
    String queryString =
        '$_endpoint/photos/random?client_id=$_clientId&count=$_itemPerPage';
    final response = await client.get(queryString);

    if (response.statusCode == 200) {
      List<dynamic> photos = json.decode(response.body);
//TODO  this conversion shouldn't be here
      final mappedUrls =
          photos.map((m) => UnsplashImage.fromJson(m).regularUrl).toList();
      return mappedUrls;
    }

    throw ServerException();
  }

  Future<List<String>> searchImages(String search) async {
    String queryString =
        "$_endpoint/search/photos?client_id=$_clientId&query=$search&count=$_itemPerPage";
    final response = await client.get(queryString);

    if (response.statusCode == 200) {
      final photos = json.decode(response.body);

      List<String> mappedUrls = photos['results']
          .map((m) => UnsplashImage.fromJson(m).regularUrl)
          .toList()
          .cast<String>();

      return mappedUrls;
    }
    throw ServerException();
  }
}
