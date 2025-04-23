class AppPagesModel {
  AppPagesModel(
      {required this.page,
      required this.responseStatus,
      required this.responseMessage});

  final Page? page;
  final int? responseStatus;
  final String? responseMessage;

  factory AppPagesModel.fromJson(Map<String, dynamic> json) {
    return AppPagesModel(
        page: json["page"] == null ? null : Page.fromJson(json["page"]),
        responseStatus: json["responseStatus"],
        responseMessage: json["responseMessage"]);
  }

  @override
  String toString() {
    return "$page, $responseStatus, $responseMessage, ";
  }
}

class Page {
  Page(
      {required this.heroImage,
      required this.thumbnail,
      required this.video,
      required this.title,
      required this.subTitle,
      required this.summary,
      required this.sections});

  final dynamic heroImage;
  final dynamic thumbnail;
  final dynamic video;
  final String? title;
  final String? subTitle;
  final dynamic summary;
  final List<Section> sections;

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
        heroImage: json["heroImage"],
        thumbnail: json["thumbnail"],
        video: json["video"],
        title: json["title"],
        subTitle: json["subTitle"],
        summary: json["summary"],
        sections: json["sections"] == null
            ? []
            : List<Section>.from(
                json["sections"]!.map((x) => Section.fromJson(x))));
  }

  @override
  String toString() {
    return "$heroImage, $thumbnail, $video, $title, $subTitle, $summary, $sections, ";
  }
}

class Section {
  Section({required this.title, required this.text});

  final String? title;
  final String? text;

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(title: json["title"], text: json["text"]);
  }

  @override
  String toString() {
    return "$title, $text, ";
  }
}
