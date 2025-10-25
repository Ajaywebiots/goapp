class BusinessCategoriesModel {
  List<Categories>? categories;
  int? responseStatus;
  String? responseMessage;

  BusinessCategoriesModel(
      {this.categories, this.responseStatus, this.responseMessage});

  BusinessCategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['responseStatus'] = responseStatus;
    data['responseMessage'] = responseMessage;
    return data;
  }
}

class Categories {
  int? categoryId;
  String? icon;
  String? name;
  String? translatedValue;
  int? language;
  int? businessCategoryType;

  Categories(
      {this.categoryId,
      this.icon,
      this.name,
      this.translatedValue,
      this.language,
      this.businessCategoryType});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    icon = json['icon'];
    name = json['name'];
    translatedValue = json['translatedValue'];
    language = json['language'];
    businessCategoryType = json['businessCategoryType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['icon'] = icon;
    data['name'] = name;
    data['translatedValue'] = translatedValue;
    data['language'] = language;
    data['businessCategoryType'] = businessCategoryType;
    return data;
  }
}
