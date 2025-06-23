class MyBusinessModel {
  MyBusinessModel({
    required this.businesses,
    required this.responseStatus,
    required this.responseMessage,
  });

  final List<Business> businesses;
  final int? responseStatus;
  final String? responseMessage;

  factory MyBusinessModel.fromJson(Map<String, dynamic> json) {
    return MyBusinessModel(
      businesses: json["businesses"] == null
          ? []
          : List<Business>.from(
              json["businesses"]!.map((x) => Business.fromJson(x))),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
    );
  }
}

class Business {
  Business({
    required this.id,
    required this.name,
    required this.logo,
    required this.businessCategory,
    required this.priceRange,
    required this.description,
  });

  final int? id;
  final String? name;
  final Logo? logo;
  final BusinessCategory? businessCategory;
  final int? priceRange;
  final String? description;

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json["id"],
      name: json["name"],
      logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
      businessCategory: json["businessCategory"] == null
          ? null
          : BusinessCategory.fromJson(json["businessCategory"]),
      priceRange: json["priceRange"],
      description: json["description"],
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

class Logo {
  Logo({
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

  factory Logo.fromJson(Map<String, dynamic> json) {
    return Logo(
      imageId: json["imageId"],
      mediaType: json["mediaType"],
      source: json["source"],
      mediaStatus: json["mediaStatus"],
      sortOrder: json["sortOrder"],
    );
  }
}
