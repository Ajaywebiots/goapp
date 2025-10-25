class BlogCategoriesModel {
  List<BlogCategories>? blogCategories;
  int? responseStatus;
  String? responseMessage;

  BlogCategoriesModel(
      {this.blogCategories, this.responseStatus, this.responseMessage});

  BlogCategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['blogCategories'] != null) {
      blogCategories = <BlogCategories>[];
      json['blogCategories'].forEach((v) {
        blogCategories!.add(BlogCategories.fromJson(v));
      });
    }
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (blogCategories != null) {
      data['blogCategories'] =
          blogCategories!.map((v) => v.toJson()).toList();
    }
    data['responseStatus'] = responseStatus;
    data['responseMessage'] = responseMessage;
    return data;
  }
}

class BlogCategories {
  int? categoryId;
  String? icon;
  String? name;
  String? translatedValue;
  int? language;
  int? articleCategoryType;

  BlogCategories(
      {this.categoryId,
      this.icon,
      this.name,
      this.translatedValue,
      this.language,
      this.articleCategoryType});

  BlogCategories.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    icon = json['icon'];
    name = json['name'];
    translatedValue = json['translatedValue'];
    language = json['language'];
    articleCategoryType = json['articleCategoryType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['icon'] = icon;
    data['name'] = name;
    data['translatedValue'] = translatedValue;
    data['language'] = language;
    data['articleCategoryType'] = articleCategoryType;
    return data;
  }
}
