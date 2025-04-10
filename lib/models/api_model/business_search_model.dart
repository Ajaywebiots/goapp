import 'home_feed_model.dart';

class BusinessSearchModel {
  BusinessSearchModel({
    required this.businesses,
    required this.responseStatus,
    required this.responseMessage,
  });

  final List<Business> businesses;
  final int? responseStatus;
  final String? responseMessage;

  factory BusinessSearchModel.fromJson(Map<String, dynamic> json) {
    return BusinessSearchModel(
        businesses: json["businesses"] == null
            ? []
            : List<Business>.from(
                json["businesses"]!.map((x) => Business.fromJson(x))),
        responseStatus: json["responseStatus"],
        responseMessage: json["responseMessage"]);
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

class BusinessCategory {
  BusinessCategory({
    required this.categoryId,
    required this.icon,
    required this.name,
    required this.translatedValue,
    required this.language,
    required this.businessCategoryType,
  });

  final int? categoryId;
  final String? icon;
  final String? name;
  final String? translatedValue;
  final int? language;
  final int? businessCategoryType;

  factory BusinessCategory.fromJson(Map<String, dynamic> json) {
    return BusinessCategory(
      categoryId: json["categoryId"],
      icon: json["icon"],
      name: json["name"],
      translatedValue: json["translatedValue"],
      language: json["language"],
      businessCategoryType: json["businessCategoryType"],
    );
  }
}

class Contact {
  Contact({
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.website,
    required this.facebookPage,
    required this.instagramPage,
    required this.tiktokPage,
    required this.youtubePage,
  });

  final String? phoneNumber;
  final String? email;
  final String? address;
  final String? website;
  final String? facebookPage;
  final String? instagramPage;
  final String? tiktokPage;
  final String? youtubePage;

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      address: json["address"],
      website: json["website"],
      facebookPage: json["facebookPage"],
      instagramPage: json["instagramPage"],
      tiktokPage: json["tiktokPage"],
      youtubePage: json["youtubePage"],
    );
  }
}

class Image {
  Image({
    required this.mediaType,
    required this.source,
    required this.mediaStatus,
  });

  final int? mediaType;
  final String? source;
  final int? mediaStatus;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      mediaType: json["mediaType"],
      source: json["source"],
      mediaStatus: json["mediaStatus"],
    );
  }
}

class Location {
  Location({
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.selfLocationdistance,
  });

  final String? address;
  final String? longitude;
  final String? latitude;
  final double? selfLocationdistance;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json["address"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      selfLocationdistance: json["selfLocationdistance"],
    );
  }
}

class Rating {
  Rating({
    required this.starts,
    required this.reviewCount,
  });

  final dynamic starts;
  final dynamic reviewCount;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      starts: json["starts"],
      reviewCount: json["reviewCount"],
    );
  }
}
