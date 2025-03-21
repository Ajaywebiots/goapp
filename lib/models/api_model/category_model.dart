class CategoryModelAPI {
  List<Categories>? categories;
  int? responseStatus;
  String? responseMessage;

  CategoryModelAPI(
      {this.categories, this.responseStatus, this.responseMessage});

  CategoryModelAPI.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? translatedValue;
  int? language;

  Categories({this.categoryId, this.name, this.translatedValue, this.language});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    name = json['name'];
    translatedValue = json['translatedValue'];
    language = json['language'];
  }

  Map toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['name'] = name;
    data['translatedValue'] = translatedValue;
    data['language'] = language;
    return data;
  }
}
