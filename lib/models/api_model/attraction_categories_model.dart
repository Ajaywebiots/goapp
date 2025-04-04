class AttractionsCategoriesModel {
  List<Categories>? categories;
  int? responseStatus;
  String? responseMessage;

  AttractionsCategoriesModel(
      {this.categories, this.responseStatus, this.responseMessage});

  AttractionsCategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['responseStatus'] = this.responseStatus;
    data['responseMessage'] = this.responseMessage;
    return data;
  }
}

class Categories {
  int? categoryId;
  String? icon;
  String? name;
  String? translatedValue;
  int? language;
  int? attractionCategoryType;

  Categories(
      {this.categoryId,
      this.icon,
      this.name,
      this.translatedValue,
      this.language,
      this.attractionCategoryType});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    icon = json['icon'];
    name = json['name'];
    translatedValue = json['translatedValue'];
    language = json['language'];
    attractionCategoryType = json['attractionCategoryType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['translatedValue'] = this.translatedValue;
    data['language'] = this.language;
    data['attractionCategoryType'] = this.attractionCategoryType;
    return data;
  }
}
