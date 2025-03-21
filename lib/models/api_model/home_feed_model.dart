import 'dart:convert';

class HomeFeedModel {
  List<TopBanner>? banners;
  List<Coupon>? coupons;
  List<Business>? businesses;
  List<Article>? articles;
  List<Category>? categories;
  List<Attraction>? attractions;
  int? responseStatus;
  String? responseMessage;

  HomeFeedModel({
    this.banners,
    this.coupons,
    this.businesses,
    this.articles,
    this.categories,
    this.attractions,
    this.responseStatus,
    this.responseMessage,
  });

  factory HomeFeedModel.fromJson(Map<String, dynamic> json) {
    return HomeFeedModel(
      banners: json['banners'] != null
          ? (json['banners'] as List).map((i) => TopBanner.fromJson(i)).toList()
          : null,
      coupons: json['coupons'] != null
          ? (json['coupons'] as List).map((i) => Coupon.fromJson(i)).toList()
          : null,
      businesses: json['businesses'] != null
          ? (json['businesses'] as List)
              .map((i) => Business.fromJson(i))
              .toList()
          : null,
      articles: json['articles'] != null
          ? (json['articles'] as List).map((i) => Article.fromJson(i)).toList()
          : null,
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((i) => Category.fromJson(i))
              .toList()
          : null,
      attractions: json['attractions'] != null
          ? (json['attractions'] as List)
              .map((i) => Attraction.fromJson(i))
              .toList()
          : null,
      responseStatus: json['responseStatus'],
      responseMessage: json['responseMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banners': banners?.map((v) => v.toJson()).toList(),
      'coupons': coupons?.map((v) => v.toJson()).toList(),
      'businesses': businesses?.map((v) => v.toJson()).toList(),
      'articles': articles?.map((v) => v.toJson()).toList(),
      'categories': categories?.map((v) => v.toJson()).toList(),
      'attractions': attractions?.map((v) => v.toJson()).toList(),
      'responseStatus': responseStatus,
      'responseMessage': responseMessage,
    };
  }
}

class Article {
  int? pkid;
  String? name;
  String? urlSlug;

  Article({this.pkid, this.name, this.urlSlug});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      pkid: json['pkid'],
      name: json['name'],
      urlSlug: json['urlSlug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pkid': pkid,
      'name': name,
      'urlSlug': urlSlug,
    };
  }
}

class Attraction {
  int? id;
  String? name;
  int? reviewCount;
  int? rating;
  dynamic image;
  int? businessCategory;

  Attraction(
      {this.id,
      this.name,
      this.reviewCount,
      this.rating,
      this.image,
      this.businessCategory});

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      id: json['id'],
      name: json['name'],
      reviewCount: json['reviewCount'],
      rating: json['rating'],
      image: json['image'],
      businessCategory: json['businessCategory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'reviewCount': reviewCount,
      'rating': rating,
      'image': image,
      'businessCategory': businessCategory,
    };
  }
}

class Business {
  int? id;
  String? name;
  int? reviewCount;
  int? rating;
  dynamic image;
  int? businessCategory;

  Business(
      {this.id,
      this.name,
      this.reviewCount,
      this.rating,
      this.image,
      this.businessCategory});

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      name: json['name'],
      reviewCount: json['reviewCount'],
      rating: json['rating'],
      image: json['image'],
      businessCategory: json['businessCategory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'reviewCount': reviewCount,
      'rating': rating,
      'image': image,
      'businessCategory': businessCategory,
    };
  }
}

class TopBanner {
  int? mediaType;
  String? source;
  int? mediaStatus;

  TopBanner({this.mediaType, this.source, this.mediaStatus});

  factory TopBanner.fromJson(Map<String, dynamic> json) {
    return TopBanner(
      mediaType: json['mediaType'],
      source: json['source'],
      mediaStatus: json['mediaStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mediaType': mediaType,
      'source': source,
      'mediaStatus': mediaStatus,
    };
  }
}

class Category {
  int? categoryId;
  String? name;
  String? translatedValue;
  int? language;

  Category({this.categoryId, this.name, this.translatedValue, this.language});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['categoryId'],
      name: json['name'],
      translatedValue: json['translatedValue'],
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'name': name,
      'translatedValue': translatedValue,
      'language': language,
    };
  }
}

class Coupon {
  int? id;
  String? image;
  String? name;

  Coupon({this.id, this.image, this.name});

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }
}
