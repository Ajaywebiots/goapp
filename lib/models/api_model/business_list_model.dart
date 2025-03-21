class BusinessList {
  List<Businesses>? businesses;
  int? responseStatus;
  String? responseMessage;

  BusinessList({this.businesses, this.responseStatus, this.responseMessage});

  BusinessList.fromJson(Map<String, dynamic> json) {
    if (json['businesses'] != null) {
      businesses = <Businesses>[];
      json['businesses'].forEach((v) {
        businesses!.add(Businesses.fromJson(v));
      });
    }
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (businesses != null) {
      data['businesses'] = businesses!.map((v) => v.toJson()).toList();
    }
    data['responseStatus'] = responseStatus;
    data['responseMessage'] = responseMessage;
    return data;
  }
}

class Businesses {
  int? id;
  String? name;
  int? businessCategory;
  int? reviewCount;
  int? rating;
  Null? image;

  Businesses(
      {this.id,
      this.name,
      this.businessCategory,
      this.reviewCount,
      this.rating,
      this.image});

  Businesses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    businessCategory = json['businessCategory'];
    reviewCount = json['reviewCount'];
    rating = json['rating'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['businessCategory'] = businessCategory;
    data['reviewCount'] = reviewCount;
    data['rating'] = rating;
    data['image'] = image;
    return data;
  }
}
