class AppPagesModel {
  AppPagesModel({
    required this.page,
    required this.responseStatus,
    required this.responseMessage,
    this.language,
  });

  final Page? page;
  final int? responseStatus;
  final String? responseMessage;
  final int? language;

  factory AppPagesModel.fromJson(Map<String, dynamic> json) {
    return AppPagesModel(
      page: json["page"] == null ? null : Page.fromJson(json["page"]),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
      language: json["language"],
    );
  }

  @override
  String toString() {
    return "AppPagesModel(page: $page, responseStatus: $responseStatus, responseMessage: $responseMessage, language: $language)";
  }
}

class Page {
  Page({
    required this.heroImage,
    required this.thumbnail,
    required this.video,
    required this.title,
    required this.subTitle,
    required this.summary,
    required this.metaTitle,
    required this.metaDescription,
    required this.pageTitle,
    required this.pageSubTitle,
    required this.pageContentTitle,
    required this.pageContentText,
    required this.pageSEOTitle,
    required this.pageSEOText,
  });

  final HeroImage? heroImage;
  final dynamic thumbnail;
  final dynamic video;
  final String? title;
  final String? subTitle;
  final dynamic summary;
  final String? metaTitle;
  final String? metaDescription;
  final String? pageTitle;
  final String? pageSubTitle;
  final String? pageContentTitle;
  final String? pageContentText;
  final String? pageSEOTitle;
  final String? pageSEOText;

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      heroImage:
      json["heroImage"] == null ? null : HeroImage.fromJson(json["heroImage"]),
      thumbnail: json["thumbnail"],
      video: json["video"],
      title: json["title"],
      subTitle: json["subTitle"],
      summary: json["summary"],
      metaTitle: json["metaTitle"],
      metaDescription: json["metaDescription"],
      pageTitle: json["pageTitle"],
      pageSubTitle: json["pageSubTitle"],
      pageContentTitle: json["pageContentTitle"],
      pageContentText: json["pageContentText"],
      pageSEOTitle: json["pageSEOTitle"],
      pageSEOText: json["pageSEOText"],
    );
  }

  @override
  String toString() {
    return "Page(title: $title, pageContentTitle: $pageContentTitle)";
  }
}

class HeroImage {
  HeroImage({
    required this.imageId,
    required this.mediaType,
    required this.source,
    required this.mediaStatus,
    required this.sortOrder,
  });

  final int? imageId;
  final int? mediaType;
  final String? source;
  final int? mediaStatus;
  final int? sortOrder;

  factory HeroImage.fromJson(Map<String, dynamic> json) {
    return HeroImage(
      imageId: json["imageId"],
      mediaType: json["mediaType"],
      source: json["source"],
      mediaStatus: json["mediaStatus"],
      sortOrder: json["sortOrder"],
    );
  }

  @override
  String toString() {
    return "HeroImage(source: $source)";
  }
}
