import 'home_feed_model.dart';

class BusinessDetailModel {
  BusinessDetailModel({
    required this.business,
    required this.responseStatus,
    required this.responseMessage,
  });

  final BusinessSec? business;
  final int? responseStatus;
  final String? responseMessage;

  factory BusinessDetailModel.fromJson(Map<String, dynamic> json) {
    return BusinessDetailModel(
      business: json["business"] == null
          ? null
          : BusinessSec.fromJson(json["business"]),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
    );
  }
}

class BusinessSec {
  BusinessSec({
    required this.description,
    required this.priceRange,
    required this.gallery,
    required this.workingHours,
    required this.reviews,
    required this.offers,
    required this.id,
    required this.name,
    required this.businessCategories,
    required this.rating,
    required this.image,
    required this.logo,
    required this.location,
    required this.topOffer,
    required this.contact,
    required this.isFavourite,
    required this.appObject,
  });

  final String? description;
  final int? priceRange;
  final List<Logo> gallery;
  final List<WorkingHour> workingHours;
  final List<Review> reviews;
  final List<Offer> offers;
  final int? id;
  final String? name;
  final List<BusinessCategory> businessCategories;
  final Rating? rating;
  final Media? image;
  final Logo? logo;
  final Location? location;
  final dynamic topOffer;
  final Contact? contact;
  final bool? isFavourite;
  final AppObject? appObject;

  factory BusinessSec.fromJson(Map<String, dynamic> json) {
    return BusinessSec(
      description: json["description"],
      priceRange: json["priceRange"],
      gallery: json["gallery"] == null
          ? []
          : List<Logo>.from(json["gallery"]!.map((x) => Logo.fromJson(x))),
      workingHours: json["workingHours"] == null
          ? []
          : List<WorkingHour>.from(
              json["workingHours"]!.map((x) => WorkingHour.fromJson(x))),
      reviews: json["reviews"] == null
          ? []
          : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
      offers: json["offers"] == null
          ? []
          : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
      id: json["id"],
      name: json["name"],
      businessCategories: json["businessCategories"] == null
          ? []
          : List<BusinessCategory>.from(json["businessCategories"]!
              .map((x) => BusinessCategory.fromJson(x))),
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      image: json["image"] == null ? null : Media.fromJson(json["image"]),
      logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      topOffer: json["topOffer"],
      contact:
          json["contact"] == null ? null : Contact.fromJson(json["contact"]),
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

class Logo {
  Logo({
    required this.mediaType,
    required this.source,
    required this.mediaStatus,
    required this.sortOrder,
  });

  final int? mediaType;
  final String? source;
  final int? mediaStatus;
  final int? sortOrder;

  factory Logo.fromJson(Map<String, dynamic> json) {
    return Logo(
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

  final double? starts;
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

class WorkingHour {
  WorkingHour({
    required this.weekDay,
    required this.openTime,
    required this.closeTime,
    required this.remark,
    required this.isClosed,
  });

  final int? weekDay;
  final String? openTime;
  final String? closeTime;
  final String? remark;
  final bool? isClosed;

  factory WorkingHour.fromJson(Map<String, dynamic> json) {
    return WorkingHour(
      weekDay: json["weekDay"],
      openTime: json["openTime"],
      closeTime: json["closeTime"],
      remark: json["remark"],
      isClosed: json["isClosed"],
    );
  }
}
