import 'home_feed_model.dart';

class OfferSearchModel {
  OfferSearchModel({this.offers, this.responseStatus, this.responseMessage});

  final List<Offer>? offers;
  final int? responseStatus;
  final String? responseMessage;

  factory OfferSearchModel.fromJson(Map<String, dynamic> json) {
    return OfferSearchModel(
        offers: json["offers"] == null
            ? []
            : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
        responseStatus: json["responseStatus"],
        responseMessage: json["responseMessage"]);
  }
}

class AppObject {
  AppObject({this.appObjectType, this.appObjectId});

  final int? appObjectType;
  final int? appObjectId;

  factory AppObject.fromJson(Map<String, dynamic> json) {
    return AppObject(
        appObjectType: json["appObjectType"], appObjectId: json["appObjectId"]);
  }
}

class Image {
  Image({this.mediaType, this.source, this.mediaStatus});

  final int? mediaType;
  final String? source;
  final int? mediaStatus;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
        mediaType: json["mediaType"],
        source: json["source"],
        mediaStatus: json["mediaStatus"]);
  }
}
