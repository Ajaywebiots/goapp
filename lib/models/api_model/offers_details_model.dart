class OfferDetailsModel {
  OfferDetailsModel({
    required this.offer,
    required this.responseStatus,
    required this.responseMessage,
  });

  final Offers? offer;
  final int? responseStatus;
  final String? responseMessage;

  factory OfferDetailsModel.fromJson(Map<String, dynamic> json) {
    return OfferDetailsModel(
      offer: json["offer"] == null ? null : Offers.fromJson(json["offer"]),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
    );
  }
}

class Offers {
  Offers({
    required this.heroImage,
    required this.categoty,
    required this.description,
    required this.terms,
    required this.activationDate,
    required this.redeemCounter,
    required this.id,
    required this.title,
    required this.tag,
    required this.name,
    required this.image,
    required this.expirationDate,
    required this.type,
    required this.isFavourite,
    required this.appObject,
  });

  final Image? heroImage;
  final String? categoty;
  final String? description;
  final String? terms;
  final DateTime? activationDate;
  final int? redeemCounter;
  final int? id;
  final String? title;
  final String? tag;
  final String? name;
  final Image? image;
  final DateTime? expirationDate;
  final Type? type;
  final bool? isFavourite;
  final AppObject? appObject;

  factory Offers.fromJson(Map<String, dynamic> json) {
    return Offers(
      heroImage:
          json["heroImage"] == null ? null : Image.fromJson(json["heroImage"]),
      categoty: json["categoty"],
      description: json["description"],
      terms: json["terms"],
      activationDate: DateTime.tryParse(json["activationDate"] ?? ""),
      redeemCounter: json["redeemCounter"],
      id: json["id"],
      title: json["title"],
      tag: json["tag"],
      name: json["name"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      expirationDate: DateTime.tryParse(json["expirationDate"] ?? ""),
      type: json["type"] == null ? null : Type.fromJson(json["type"]),
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

class Type {
  Type({
    required this.offerTypeId,
    required this.icon,
    required this.name,
    required this.translatedValue,
    required this.language,
  });

  final int? offerTypeId;
  final String? icon;
  final String? name;
  final String? translatedValue;
  final int? language;

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      offerTypeId: json["offerTypeId"],
      icon: json["icon"],
      name: json["name"],
      translatedValue: json["translatedValue"],
      language: json["language"],
    );
  }
}
