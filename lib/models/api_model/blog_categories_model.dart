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
        blogCategories!.add(new BlogCategories.fromJson(v));
      });
    }
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.blogCategories != null) {
      data['blogCategories'] =
          this.blogCategories!.map((v) => v.toJson()).toList();
    }
    data['responseStatus'] = this.responseStatus;
    data['responseMessage'] = this.responseMessage;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['translatedValue'] = this.translatedValue;
    data['language'] = this.language;
    data['articleCategoryType'] = this.articleCategoryType;
    return data;
  }
}
