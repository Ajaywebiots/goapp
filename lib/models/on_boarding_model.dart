class OnboardingModel {
  List<SplashScreens>? splashScreens;

  OnboardingModel({this.splashScreens});

  OnboardingModel.fromJson(Map<String, dynamic> json) {
    if (json['splashScreens'] != null) {
      splashScreens = <SplashScreens>[];
      json['splashScreens'].forEach((v) {
        splashScreens!.add(SplashScreens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (splashScreens != null) {
      data['splashScreens'] = splashScreens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SplashScreens {
  int? language;
  List<Items>? items;

  SplashScreens({this.language, this.items});

  SplashScreens.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language'] = language;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? title;
  String? description;
  Media? media;

  Items({this.title, this.description, this.media});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    return data;
  }
}

class Media {
  int? mediaType;
  String? source;
  int? mediaStatus;

  Media({this.mediaType, this.source, this.mediaStatus});

  Media.fromJson(Map<String, dynamic> json) {
    mediaType = json['mediaType'];
    source = json['source'];
    mediaStatus = json['mediaStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mediaType'] = mediaType;
    data['source'] = source;
    data['mediaStatus'] = mediaStatus;
    return data;
  }
}
