class MyReviewModel {
  MyReviewModel(
      {required this.reviews,
      required this.responseStatus,
      required this.responseMessage});

  final List<Review> reviews;
  final int? responseStatus;
  final String? responseMessage;

  factory MyReviewModel.fromJson(Map<String, dynamic> json) {
    return MyReviewModel(
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        responseStatus: json["responseStatus"],
        responseMessage: json["responseMessage"]);
  }

  @override
  String toString() {
    return "$reviews, $responseStatus, $responseMessage, ";
  }
}

class Review {
  Review(
      {required this.reviewId,
      required this.description,
      required this.createDate,
      required this.rating,
      required this.name,
      required this.category});

  final int? reviewId;
  final String? description;
  final DateTime? createDate;
  final int? rating;
  final String? name;
  final String? category;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        reviewId: json["reviewId"],
        description: json["description"],
        createDate: DateTime.tryParse(json["createDate"] ?? ""),
        rating: json["rating"],
        name: json["name"],
        category: json["category"]);
  }

  @override
  String toString() {
    return "$reviewId, $description, $createDate, $rating, $name, $category, ";
  }
}
