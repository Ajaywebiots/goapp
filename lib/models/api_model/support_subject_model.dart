class SupportSubjectModel {
  SupportSubjectModel({
    required this.supportSubjects,
    required this.responseStatus,
    required this.responseMessage,
  });

  final List<SupportSubject> supportSubjects;
  final int? responseStatus;
  final String? responseMessage;

  factory SupportSubjectModel.fromJson(Map<String, dynamic> json) {
    return SupportSubjectModel(
        supportSubjects: json["supportSubjects"] == null
            ? []
            : List<SupportSubject>.from(json["supportSubjects"]!
                .map((x) => SupportSubject.fromJson(x))),
        responseStatus: json["responseStatus"],
        responseMessage: json["responseMessage"]);
  }
}

class SupportSubject {
  SupportSubject({
    required this.id,
    required this.subject,
  });

  final int? id;
  final String? subject;

  factory SupportSubject.fromJson(Map<String, dynamic> json) {
    return SupportSubject(id: json["id"], subject: json["subject"]);
  }
}
