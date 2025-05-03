class OnboardingModel {
  OnboardingModel({
    required this.splashScreens,
    required this.responseStatus,
    required this.responseMessage,
  });

  final List<SplashScreen> splashScreens;
  final int? responseStatus;
  final String? responseMessage;

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      splashScreens: json["splashScreens"] == null
          ? []
          : List<SplashScreen>.from(
              json["splashScreens"]!.map((x) => SplashScreen.fromJson(x))),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
    );
  }
}

class SplashScreen {
  SplashScreen({
    required this.language,
    required this.items,
  });

  final int? language;
  final List<Item> items;

  factory SplashScreen.fromJson(Map<String, dynamic> json) {
    return SplashScreen(
      language: json["language"],
      items: json["items"] == null
          ? []
          : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }
}

class Item {
  Item({
    required this.title,
    required this.description,
    required this.media,
    required this.step,
  });

  final String? title;
  final String? description;
  final Media? media;
  final int? step;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json["title"],
      description: json["description"],
      media: json["media"] == null ? null : Media.fromJson(json["media"]),
      step: json["step"],
    );
  }
}

class Media {
  Media({
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

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      imageId: json["imageId"],
      mediaType: json["mediaType"],
      source: json["source"],
      mediaStatus: json["mediaStatus"],
      sortOrder: json["sortOrder"],
    );
  }
}
