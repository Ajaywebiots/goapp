import 'business_details_model.dart';

class AttractionsDetailsModel {
  AttractionsDetailsModel({
    required this.attraction,
    required this.responseStatus,
    required this.responseMessage,
  });

  final Attraction? attraction;
  final int? responseStatus;
  final String? responseMessage;

  factory AttractionsDetailsModel.fromJson(Map<String, dynamic> json) {
    return AttractionsDetailsModel(
      attraction: json["attraction"] == null
          ? null
          : Attraction.fromJson(json["attraction"]),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
    );
  }
}

class Attraction {
  Attraction({
    required this.description,
    required this.gallery,
    required this.workingHours,
    required this.reviews,
    required this.offers,
    required this.contact,
    required this.id,
    required this.name,
    required this.rating,
    required this.image,
    required this.location,
    required this.attractionCategories,
    required this.isFavourite,
    required this.appObject,
  });

  final String? description;
  final List<dynamic> gallery;
  final List<WorkingHour> workingHours;
  final List<Review> reviews;
  final dynamic offers;
  final dynamic contact;
  final int? id;
  final String? name;
  final Rating? rating;
  final Image? image;
  final Location? location;
  final List<AttractionCategory> attractionCategories;
  final bool? isFavourite;
  final AppObject? appObject;

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      description: json["description"],
      gallery: json["gallery"] == null
          ? []
          : List<dynamic>.from(json["gallery"]!.map((x) => x)),
      workingHours: json["workingHours"] == null
          ? []
          : List<WorkingHour>.from(
              json["workingHours"]!.map((x) => WorkingHour.fromJson(x))),
      reviews: json["reviews"] == null
          ? []
          : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
      offers: json["offers"],
      contact: json["contact"],
      id: json["id"],
      name: json["name"],
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      attractionCategories: json["attractionCategories"] == null
          ? []
          : List<AttractionCategory>.from(json["attractionCategories"]!
              .map((x) => AttractionCategory.fromJson(x))),
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

  final int? appObjectType;
  final int? appObjectId;

  factory AppObject.fromJson(Map<String, dynamic> json) {
    return AppObject(
      appObjectType: json["appObjectType"],
      appObjectId: json["appObjectId"],
    );
  }
}

class AttractionCategory {
  AttractionCategory({
    required this.categoryId,
    required this.icon,
    required this.name,
    required this.translatedValue,
    required this.language,
    required this.attractionCategoryType,
  });

  final int? categoryId;
  final String? icon;
  final String? name;
  final String? translatedValue;
  final int? language;
  final int? attractionCategoryType;

  factory AttractionCategory.fromJson(Map<String, dynamic> json) {
    return AttractionCategory(
      categoryId: json["categoryId"],
      icon: json["icon"],
      name: json["name"],
      translatedValue: json["translatedValue"],
      language: json["language"],
      attractionCategoryType: json["attractionCategoryType"],
    );
  }
}

class Image {
  Image({
    required this.mediaType,
    required this.source,
    required this.mediaStatus,
    required this.sortOrder,
  });

  final int? mediaType;
  final String? source;
  final int? mediaStatus;
  final int? sortOrder;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      mediaType: json["mediaType"],
      source: json["source"],
      mediaStatus: json["mediaStatus"],
      sortOrder: json["sortOrder"],
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
  final int? selfLocationdistance;

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
  final int? reviewCount;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
        starts:
            (json["starts"] is num) ? (json["starts"] as num).toDouble() : null,
        reviewCount: json["reviewCount"] ?? 0);
  }
}

class Review {
  Review({
    required this.title,
    required this.description,
    required this.rating,
    required this.createdAt,
    required this.ownerName,
  });

  final String? title;
  final String? description;
  final int? rating;
  final DateTime? createdAt;
  final String? ownerName;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      title: json["title"],
      description: json["description"],
      rating: json["rating"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      ownerName: json["ownerName"],
    );
  }
}

// class WorkingHour {
//   WorkingHour({
//     required this.weekDay,
//     required this.openTime,
//     required this.closeTime,
//     required this.remark,
//     required this.isClosed,
//   });
//
//   final int? weekDay;
//   final String? openTime;
//   final String? closeTime;
//   final String? remark;
//   final bool? isClosed;
//
//   factory WorkingHour.fromJson(Map<String, dynamic> json){
//     return WorkingHour(
//       weekDay: json["weekDay"],
//       openTime: json["openTime"],
//       closeTime: json["closeTime"],
//       remark: json["remark"],
//       isClosed: json["isClosed"],
//     );
//   }
//
// }
