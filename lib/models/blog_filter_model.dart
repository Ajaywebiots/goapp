// import 'dart:convert';
//
// class BlogFilterModel {
//   int id;
//   String title;
//   String? description;
//   int? parentId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   DateTime? deletedAt;
//   List<Media> media;
//
//   BlogFilterModel({
//     required this.id,
//     required this.title,
//     this.description,
//     this.parentId,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//     required this.media,
//   });
//
//   factory BlogFilterModel.fromJson(Map<String, dynamic> json) {
//     return BlogFilterModel(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       parentId: json['parent_id'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//       deletedAt: json['deleted_at'] != null
//           ? DateTime.parse(json['deleted_at'])
//           : null,
//       media: List<Media>.from(json['media'].map((x) => Media.fromJson(x))),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'description': description,
//       'parent_id': parentId,
//       'created_at': createdAt.toIso8601String(),
//       'updated_at': updatedAt.toIso8601String(),
//       'deleted_at': deletedAt?.toIso8601String(),
//       'media': media.map((x) => x.toJson()).toList(),
//     };
//   }
// }
//
// class Media {
//   int id;
//   String originalUrl;
//
//   Media({
//     required this.id,
//     required this.originalUrl,
//   });
//
//   factory Media.fromJson(Map<String, dynamic> json) {
//     return Media(
//       id: json['id'],
//       originalUrl: json['original_url'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'original_url': originalUrl,
//     };
//   }
// }
//
// List<BlogFilterModel> parseBlogFilterModel(String jsonString) {
//   final List<dynamic> jsonData = json.decode(jsonString);
//   return jsonData.map((item) => BlogFilterModel.fromJson(item)).toList();
// }
//
// String blogFilterModelToJson(List<BlogFilterModel> blogFilterModel) {
//   return json
//       .encode(blogFilterModel.map((service) => service.toJson()).toList());
// }
