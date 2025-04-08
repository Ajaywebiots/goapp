// To parse this JSON data, do
//
//     final homeFeedModel = homeFeedModelFromJson(jsonString);

class HomeFeedModel {
  List<TopBanner> banners;
  List<Offer> offers;
  List<Business> businesses;
  List<Article> articles;
  List<Category> categories;
  List<Attraction> attractions;
  int responseStatus;
  String responseMessage;

  HomeFeedModel({
    required this.banners,
    required this.offers,
    required this.businesses,
    required this.articles,
    required this.categories,
    required this.attractions,
    required this.responseStatus,
    required this.responseMessage,
  });

  factory HomeFeedModel.fromJson(Map<String, dynamic> json) => HomeFeedModel(
        banners: List<TopBanner>.from(
            json["banners"].map((x) => TopBanner.fromJson(x))),
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
        businesses: List<Business>.from(
            json["businesses"].map((x) => Business.fromJson(x))),
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        attractions: List<Attraction>.from(
            json["attractions"].map((x) => Attraction.fromJson(x))),
        responseStatus: json["responseStatus"],
        responseMessage: json["responseMessage"],
      );

  Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
        "businesses": List<dynamic>.from(businesses.map((x) => x.toJson())),
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "attractions": List<dynamic>.from(attractions.map((x) => x.toJson())),
        "responseStatus": responseStatus,
        "responseMessage": responseMessage,
      };
}

class Article {
  int id;
  String title;
  DateTime createdDate;
  Media media;
  String category;
  bool isFavourite;

  Article({
    required this.id,
    required this.title,
    required this.createdDate,
    required this.media,
    required this.category,
    required this.isFavourite,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        createdDate: DateTime.parse(json["createdDate"]),
        media: Media.fromJson(json["media"]),
        category: json["category"],
        isFavourite: json["isFavourite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "createdDate": createdDate.toIso8601String(),
        "media": media.toJson(),
        "category": category,
        "isFavourite": isFavourite,
      };
}

class Media {
  int mediaType;
  String source;
  int mediaStatus;

  Media({
    required this.mediaType,
    required this.source,
    required this.mediaStatus,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        mediaType: json["mediaType"],
        source: json["source"],
        mediaStatus: json["mediaStatus"],
      );

  Map<String, dynamic> toJson() => {
        "mediaType": mediaType,
        "source": source,
        "mediaStatus": mediaStatus,
      };
}

class Attraction {
  int id;
  String name;
  dynamic rating;
  Media image;
  Location location;
  dynamic attractionCategories;
  bool isFavourite;

  Attraction(
      {required this.id,
      required this.name,
      required this.rating,
      required this.image,
      required this.location,
      required this.attractionCategories,
      required this.isFavourite});

  factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
      id: json["id"],
      name: json["name"],
      rating: json["rating"],
      image: Media.fromJson(json["image"]),
      location: Location.fromJson(json["location"]),
      attractionCategories: json["attractionCategories"],
      isFavourite: json["isFavourite"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rating": rating,
        "image": image.toJson(),
        "location": location.toJson(),
        "attractionCategories": attractionCategories,
        "isFavourite": isFavourite
      };
}

class Location {
  String address;
  String longitude;
  String latitude;
  dynamic selfLocationDistance;

  Location({
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.selfLocationDistance,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
      address: json["address"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      selfLocationDistance: json['selfLocationdistance']);

  Map<String, dynamic> toJson() => {
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "selfLocationdistance": selfLocationDistance
      };
}

class TopBanner {
  Media image;
  String link;
  String title;
  String subTitle;
  String buttonText;
  String tagText;

  TopBanner(
      {required this.image,
      required this.link,
      required this.title,
      required this.subTitle,
      required this.buttonText,
      required this.tagText});

  factory TopBanner.fromJson(Map<String, dynamic> json) => TopBanner(
      image: Media.fromJson(json["image"]),
      link: json["link"],
      title: json["title"],
      subTitle: json["subTitle"],
      buttonText: json["buttonText"],
      tagText: json["tagText"]);

  Map<String, dynamic> toJson() => {
        "image": image.toJson(),
        "link": link,
        "title": title,
        "subTitle": subTitle,
        "buttonText": buttonText,
        "tagText": tagText
      };
}

class Business {
  int id;
  String name;
  List<Category> businessCategories;
  dynamic rating;
  Media image;
  Media logo;
  dynamic location;
  dynamic topOffer;
  Contact contact;
  bool isFavourite;

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
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        id: json["id"],
        name: json["name"],
        businessCategories: List<Category>.from(
            json["businessCategories"].map((x) => Category.fromJson(x))),
        rating: json["rating"],
        image: Media.fromJson(json["image"]),
        logo: Media.fromJson(json["logo"]),
        location: json["location"],
        topOffer: json["topOffer"],
        contact: Contact.fromJson(json["contact"]),
        isFavourite: json["isFavourite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "businessCategories":
            List<dynamic>.from(businessCategories.map((x) => x.toJson())),
        "rating": rating,
        "image": image.toJson(),
        "logo": logo.toJson(),
        "location": location,
        "topOffer": topOffer,
        "contact": contact.toJson(),
        "isFavourite": isFavourite,
      };
}

class Category {
  int categoryId;
  String icon;
  String name;
  String translatedValue;
  int language;
  int businessCategoryType;

  Category({
    required this.categoryId,
    required this.icon,
    required this.name,
    required this.translatedValue,
    required this.language,
    required this.businessCategoryType,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["categoryId"],
        icon: json["icon"],
        name: json["name"],
        translatedValue: json["translatedValue"],
        language: json["language"],
        businessCategoryType: json["businessCategoryType"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "icon": icon,
        "name": name,
        "translatedValue": translatedValue,
        "language": language,
        "businessCategoryType": businessCategoryType,
      };
}

class Contact {
  String phoneNumber;
  String email;
  String address;
  String website;
  String facebookPage;
  String instagramPage;
  String tiktokPage;
  String youtubePage;

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

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        address: json["address"],
        website: json["website"],
        facebookPage: json["facebookPage"],
        instagramPage: json["instagramPage"],
        tiktokPage: json["tiktokPage"],
        youtubePage: json["youtubePage"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "email": email,
        "address": address,
        "website": website,
        "facebookPage": facebookPage,
        "instagramPage": instagramPage,
        "tiktokPage": tiktokPage,
        "youtubePage": youtubePage,
      };
}

class Offer {
  int id;
  String name;
  String title;
  String tag;
  Media image;
  DateTime expirationDate;
  bool isFavourite;
  String description;

  Offer({
    required this.id,
    required this.name,
    required this.title,
    required this.tag,
    required this.image,
    required this.expirationDate,
    required this.isFavourite,
    required this.description,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
      id: json["id"],
      name: json["name"],
      title: json["title"],
      tag: json["tag"],
      image: Media.fromJson(json["image"]),
      expirationDate: DateTime.parse(json["expirationDate"]),
      isFavourite: json["isFavourite"],
      description: json["description"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": title,
        "tag": tag,
        "image": image.toJson(),
        "expirationDate": expirationDate.toIso8601String(),
        "isFavourite": isFavourite,
        "description": description,
      };
}
