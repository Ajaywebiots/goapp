class ArticlesDetailModel {
  ArticlesDetailModel({
    required this.article,
    required this.responseStatus,
    required this.responseMessage,
  });

  final Articles? article;
  final int? responseStatus;
  final String? responseMessage;

  factory ArticlesDetailModel.fromJson(Map<String, dynamic> json) {
    return ArticlesDetailModel(
        article:
            json["article"] == null ? null : Articles.fromJson(json["article"]),
        responseStatus: json["responseStatus"],
        responseMessage: json["responseMessage"]);
  }
}

class Articles {
  Articles({
    required this.subTitle,
    required this.sections,
    required this.summary,
    required this.id,
    required this.title,
    required this.createdDate,
    required this.media,
    required this.category,
    required this.isFavourite,
    required this.appObject,
  });

  final String? subTitle;
  final List<Section> sections;
  final String? summary;
  final int? id;
  final String? title;
  final DateTime? createdDate;
  final Media? media;
  final String? category;
  late final bool? isFavourite;
  final AppObject? appObject;

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      subTitle: json["subTitle"],
      sections: json["sections"] == null
          ? []
          : List<Section>.from(
              json["sections"]!.map((x) => Section.fromJson(x))),
      summary: json["summary"],
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
    required this.sortOrder,
  });

  final int? mediaType;
  final String? source;
  final int? mediaStatus;
  final int? sortOrder;

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      mediaType: json["mediaType"],
      source: json["source"],
      mediaStatus: json["mediaStatus"],
      sortOrder: json["sortOrder"],
    );
  }
}

class Section {
  Section({
    required this.title,
    required this.text,
  });

  final String? title;
  final String? text;

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json["title"],
      text: json["text"],
    );
  }
}
