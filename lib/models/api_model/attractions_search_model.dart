class AttractionsSearchModel {
  AttractionsSearchModel({
    required this.attractions,
    required this.responseStatus,
    required this.responseMessage,
  });

  final List<Attraction> attractions;
  final int? responseStatus;
  final String? responseMessage;

  factory AttractionsSearchModel.fromJson(Map<String, dynamic> json) {
    return AttractionsSearchModel(
      attractions: json["attractions"] == null
          ? []
          : List<Attraction>.from(
              json["attractions"]!.map((x) => Attraction.fromJson(x))),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
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

  final int? id;
  final String? name;
  final dynamic rating;
  final Image? image;
  final Location? location;
  final dynamic attractionCategories;
  final bool? isFavourite;
  final AppObject? appObject;

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      id: json["id"],
      name: json["name"],
      rating: json["rating"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      attractionCategories: json["attractionCategories"],
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
