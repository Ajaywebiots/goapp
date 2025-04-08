class ArticlesSearchModel {
  ArticlesSearchModel({
    required this.articles,
    required this.responseStatus,
    required this.responseMessage,
  });

  final List<Articles> articles;
  final int? responseStatus;
  final String? responseMessage;

  factory ArticlesSearchModel.fromJson(Map<String, dynamic> json) {
    return ArticlesSearchModel(
      articles: json["articles"] == null
          ? []
          : List<Articles>.from(
              json["articles"]!.map((x) => Articles.fromJson(x))),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
    );
  }
}

class Articles {
  Articles({
    required this.id,
    required this.title,
    required this.createdDate,
    required this.media,
    required this.category,
    required this.isFavourite,
    required this.appObject,
  });

  final int? id;
  final String? title;
  final DateTime? createdDate;
  final Media? media;
  final String? category;
  final bool? isFavourite;
  final AppObject? appObject;

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      id: json["id"],
      title: json["title"],
      createdDate: DateTime.tryParse(json["createdDate"] ?? ""),
      media: json["media"] == null ? null : Media.fromJson(json["media"]),
      category: json["category"],
      isFavourite: json["isFavourite"],
      appObject: json["appObject"] == null
          ? null
          : AppObject.fromJson(json["appObject"]),
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
