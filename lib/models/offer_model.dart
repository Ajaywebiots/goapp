import '../config.dart';
import 'media_model.dart';

class OfferModel {
  int? id;
  String? title;
  String? type;
  String? relatedId;
  List<Media>? media;

  OfferModel(
      {this.id,
        this.title,
        this.type,
        this.relatedId,
        this.media});

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    relatedId = json['related_id'];

    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;

    data['related_id'] = relatedId;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

