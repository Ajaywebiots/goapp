class HomeFeedModel {
  HomeFeedModel(
      {required this.banners,
      required this.offers,
      required this.businesses,
      required this.articles,
      required this.categories,
      required this.attractions,
      required this.responseStatus,
      required this.responseMessage});

  final List<Banner> banners;
  final List<Offer> offers;
  final List<Business> businesses;
  final List<Article> articles;
  final List<Category> categories;
  final List<Attraction> attractions;
  final int responseStatus;
  final String responseMessage;

  factory HomeFeedModel.fromJson(Map<String, dynamic> json) {
    return HomeFeedModel(
      banners: json["banners"] == null
          ? []
          : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
      offers: json["offers"] == null
          ? []
          : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
      businesses: json["businesses"] == null
          ? []
          : List<Business>.from(
              json["businesses"]!.map((x) => Business.fromJson(x))),
      articles: json["articles"] == null
          ? []
          : List<Article>.from(
              json["articles"]!.map((x) => Article.fromJson(x))),
      categories: json["categories"] == null
          ? []
          : List<Category>.from(
              json["categories"]!.map((x) => Category.fromJson(x))),
      attractions: json["attractions"] == null
          ? []
          : List<Attraction>.from(
              json["attractions"]!.map((x) => Attraction.fromJson(x))),
      responseStatus: json["responseStatus"] ?? 0,
      responseMessage: json["responseMessage"] ?? "",
    );
  }
}

class Article {
  Article({
    required this.id,
    required this.title,
    required this.createdDate,
    required this.media,
    required this.category,
    required this.isFavourite,
    required this.appObject,
  });

  final int id;
  final String title;
  final DateTime? createdDate;
  final Media? media;
  final String category;
  final bool isFavourite;
  final AppObject? appObject;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      createdDate: DateTime.tryParse(json["createdDate"] ?? ""),
      media: json["media"] == null ? null : Media.fromJson(json["media"]),
      category: json["category"] ?? "",
      isFavourite: json["isFavourite"] ?? false,
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

  final int appObjectType;
  final int appObjectId;

  factory AppObject.fromJson(Map<String, dynamic> json) {
    return AppObject(
      appObjectType: json["appObjectType"] ?? 0,
      appObjectId: json["appObjectId"] ?? 0,
    );
  }
}

class Media {
  Media({
    required this.mediaType,
    required this.source,
    required this.mediaStatus,
  });

  final int mediaType;
  final String source;
  final int mediaStatus;

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      mediaType: json["mediaType"] ?? 0,
      source: json["source"] ?? "",
      mediaStatus: json["mediaStatus"] ?? 0,
    );
  }
}

class Attraction {
  Attraction({
    required this.id,
    required this.name,
    required this.rating,
    required this.image,
    required this.location,
    required this.attractionCategories,
    required this.isFavourite,
    required this.appObject,
  });

  final int id;
  final String name;
  final dynamic rating;
  final Media? image;
  final Location? location;
  final dynamic attractionCategories;
  final bool isFavourite;
  final AppObject? appObject;

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      rating: json["rating"],
      image: json["image"] == null ? null : Media.fromJson(json["image"]),
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      attractionCategories: json["attractionCategories"],
      isFavourite: json["isFavourite"] ?? false,
      appObject: json["appObject"] == null
          ? null
          : AppObject.fromJson(json["appObject"]),
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

  final String address;
  final String longitude;
  final String latitude;
  final dynamic selfLocationdistance;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        address: json["address"] ?? "",
        longitude: json["longitude"] ?? "",
        latitude: json["latitude"] ?? "",
        selfLocationdistance: (json["selfLocationdistance"] is num)
            ? (json['selfLocationdistance'] as num).toDouble()
            : null);
  }
}

class Banner {
  Banner({
    required this.image,
    required this.link,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.tagText,
    required this.isFavourite,
    required this.appObject,
  });

  final Media? image;
  final String link;
  final String title;
  final String subTitle;
  final String buttonText;
  final String tagText;
  final bool isFavourite;
  final AppObject? appObject;

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      image: json["image"] == null ? null : Media.fromJson(json["image"]),
      link: json["link"] ?? "",
      title: json["title"] ?? "",
      subTitle: json["subTitle"] ?? "",
      buttonText: json["buttonText"] ?? "",
      tagText: json["tagText"] ?? "",
      isFavourite: json["isFavourite"] ?? false,
      appObject: json["appObject"] == null
          ? null
          : AppObject.fromJson(json["appObject"]),
    );
  }
}

class Business {
  Business({
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

  final int id;
  final String name;
  final List<Category> businessCategories;
  final Rating? rating;
  final Media? image;
  final Media? logo;
  final Location? location;
  final dynamic topOffer;
  final Contact? contact;
  final bool isFavourite;
  final AppObject? appObject;

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      businessCategories: json["businessCategories"] == null
          ? []
          : List<Category>.from(
              json["businessCategories"]!.map((x) => Category.fromJson(x))),
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      image: json["image"] == null ? null : Media.fromJson(json["image"]),
      logo: json["logo"] == null ? null : Media.fromJson(json["logo"]),
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      topOffer: json["topOffer"],
      contact:
          json["contact"] == null ? null : Contact.fromJson(json["contact"]),
      isFavourite: json["isFavourite"] ?? false,
      appObject: json["appObject"] == null
          ? null
          : AppObject.fromJson(json["appObject"]),
    );
  }
}

class Category {
  Category({
    required this.categoryId,
    required this.icon,
    required this.name,
    required this.translatedValue,
    required this.language,
    required this.businessCategoryType,
  });

  final int categoryId;
  final String icon;
  final String name;
  final String translatedValue;
  final int language;
  final int businessCategoryType;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json["categoryId"] ?? 0,
      icon: json["icon"] ?? "",
      name: json["name"] ?? "",
      translatedValue: json["translatedValue"] ?? "",
      language: json["language"] ?? 0,
      businessCategoryType: json["businessCategoryType"] ?? 0,
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

  final String phoneNumber;
  final String email;
  final String address;
  final String website;
  final String facebookPage;
  final String instagramPage;
  final String tiktokPage;
  final String youtubePage;

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      phoneNumber: json["phoneNumber"] ?? "",
      email: json["email"] ?? "",
      address: json["address"] ?? "",
      website: json["website"] ?? "",
      facebookPage: json["facebookPage"] ?? "",
      instagramPage: json["instagramPage"] ?? "",
      tiktokPage: json["tiktokPage"] ?? "",
      youtubePage: json["youtubePage"] ?? "",
    );
  }
}

class Rating {
  Rating({
    this.starts,
    this.reviewCount,
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

class Offer {
  Offer({
    required this.id,
    required this.title,
    required this.tag,
    required this.name,
    required this.description,
    required this.image,
    required this.expirationDate,
    required this.isFavourite,
    required this.appObject,
  });

  final int id;
  final String title;
  final String tag;
  final String name;
  final String description;
  final Media? image;
  final DateTime? expirationDate;
  final bool isFavourite;
  final AppObject? appObject;

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      tag: json["tag"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      image: json["image"] == null ? null : Media.fromJson(json["image"]),
      expirationDate: DateTime.tryParse(json["expirationDate"] ?? ""),
      isFavourite: json["isFavourite"] ?? false,
      appObject: json["appObject"] == null
          ? null
          : AppObject.fromJson(json["appObject"]),
    );
  }
}
