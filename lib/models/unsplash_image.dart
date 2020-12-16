class UnsplashImage {
  UnsplashUrls urls;

  String get regularUrl => this.urls?.regular ?? "";

  UnsplashImage.fromJson(Map<String, dynamic> parsedJson) {
    this.urls = UnsplashUrls.fromJson(parsedJson['urls']);
  }
}

class UnsplashUrls {
  String regular;

  UnsplashUrls.fromJson(Map<String, dynamic> parsedJson) {
    this.regular = parsedJson['regular'];
  }
}
