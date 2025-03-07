class NotificationModel {
  String? id;
  NotificationData? data;
  String? readAt;
  String? createdAt;

  NotificationModel(
      {this.id,
        this.data,
        this.readAt,
        this.createdAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'] != null ? NotificationData.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = readAt;
    data['created_at'] = createdAt;
    return data;
  }
}

class NotificationData {
  String? title;
  String? message;
  String? providerId;
  String? type;
  String? thumbnail;
  String? image;

  NotificationData({this.title, this.message, this.providerId, this.type,this.image,this.thumbnail});

  NotificationData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    providerId = json['provider_id'];
    type = json['type'];
    thumbnail = json['thumbnail'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    data['provider_id'] = providerId;
    data['type'] = type;
    data['thumbnail'] = thumbnail;
    data['image'] = image;

    return data;
  }
}