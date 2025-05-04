class BusinessDashboardDetailsModel {
  BusinessDashboardDetailsModel({
    required this.business,
    required this.responseStatus,
    required this.responseMessage,
  });

  final Business? business;
  final num? responseStatus;
  final String? responseMessage;

  factory BusinessDashboardDetailsModel.fromJson(Map<String, dynamic> json) {
    return BusinessDashboardDetailsModel(
      business:
          json["business"] == null ? null : Business.fromJson(json["business"]),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
    );
  }

  @override
  String toString() {
    return "$business, $responseStatus, $responseMessage, ";
  }
}

class Business {
  Business({
    required this.id,
    required this.name,
    required this.logo,
    required this.businessCategory,
    required this.priceRange,
    required this.phoneNumber,
    required this.email,
    required this.description,
  });

  final int? id;
  final String? name;
  final Logo? logo;
  final BusinessCategory? businessCategory;
  final num? priceRange;
  final String? phoneNumber;
  final String? email;
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
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      description: json["description"],
    );
  }

  @override
  String toString() {
    return "$id, $name, $logo, $businessCategory, $priceRange, $phoneNumber, $email, $description, ";
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

  final num? categoryId;
  final String? icon;
  final String? name;
  final String? translatedValue;
  final num? language;
  final num? businessCategoryType;

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

  @override
  String toString() {
    return "$categoryId, $icon, $name, $translatedValue, $language, $businessCategoryType, ";
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

  final num? imageId;
  final num? mediaType;
  final String? source;
  final num? mediaStatus;
  final num? sortOrder;

  factory Logo.fromJson(Map<String, dynamic> json) {
    return Logo(
      imageId: json["imageId"],
      mediaType: json["mediaType"],
      source: json["source"],
      mediaStatus: json["mediaStatus"],
      sortOrder: json["sortOrder"],
    );
  }

  @override
  String toString() {
    return "$imageId, $mediaType, $source, $mediaStatus, $sortOrder, ";
  }
}
