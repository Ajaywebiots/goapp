import 'home_feed_model.dart';

class ArticlesSearchModel {
  ArticlesSearchModel({
    required this.articles,
    required this.responseStatus,
    required this.responseMessage,
  });

  final List<Article> articles;
  final int? responseStatus;
  final String? responseMessage;

  factory ArticlesSearchModel.fromJson(Map<String, dynamic> json) {
    return ArticlesSearchModel(
      articles: json["articles"] == null
          ? []
          : List<Article>.from(
              json["articles"]!.map((x) => Article.fromJson(x))),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
    );
  }
}

class AppObject {
  AppObject({
    required this.appObjectType,
    required this.appObjectId,
  });

  final dynamic appObjectType;
  final dynamic appObjectId;

  factory AppObject.fromJson(Map<String, dynamic> json) {
    return AppObject(
      appObjectType: json["appObjectType"],
      appObjectId: json["appObjectId"],
    );
  }
}

class Media {
  Media({
    required this.mediaType,
    required this.source,
    required this.mediaStatus,
  });

  final int? mediaType;
  final String? source;
  final int? mediaStatus;

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      mediaType: json["mediaType"],
      source: json["source"],
      mediaStatus: json["mediaStatus"],
    );
  }
}
