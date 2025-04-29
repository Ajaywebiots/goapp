class ReviewListModel {
  ReviewListModel(
      {required this.avarageRate,
      required this.ratesSummary,
      required this.reviews,
      required this.responseStatus,
      required this.responseMessage});

  final int? avarageRate;
  final List<RatesSummary> ratesSummary;
  final List<Review> reviews;
  final int? responseStatus;
  final String? responseMessage;

  factory ReviewListModel.fromJson(Map<String, dynamic> json) {
    return ReviewListModel(
        avarageRate: json["avarageRate"],
        ratesSummary: json["ratesSummary"] == null
            ? []
            : List<RatesSummary>.from(
                json["ratesSummary"]!.map((x) => RatesSummary.fromJson(x))),
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        responseStatus: json["responseStatus"],
        responseMessage: json["responseMessage"]);
  }
}

class RatesSummary {
  RatesSummary({
    required this.stars,
    required this.percentage,
  });

  final int? stars;
  final int? percentage;

  factory RatesSummary.fromJson(Map<String, dynamic> json) {
    return RatesSummary(stars: json["stars"], percentage: json["percentage"]);
  }
}

class Review {
  Review(
      {required this.title,
      required this.description,
      required this.rating,
      required this.createdAt,
      required this.ownerName});

  final String? title;
  final String? description;
  final int? rating;
  final DateTime? createdAt;
  final String? ownerName;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        title: json["title"],
        description: json["description"],
        rating: json["rating"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
        ownerName: json["ownerName"]);
  }
}
