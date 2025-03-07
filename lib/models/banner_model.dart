import '../config.dart';
import 'media_model.dart';

class BannerModel {
  int? id;
  String? type;
  String? relatedId;
  List<Media>? media;

  BannerModel({this.id, this.type, this.relatedId, this.media});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    data['type'] = type;
    data['related_id'] = relatedId;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
