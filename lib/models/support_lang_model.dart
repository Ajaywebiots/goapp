class SupportedLangModel {
  List<String>? supportedLanguages;

  SupportedLangModel({this.supportedLanguages});

  SupportedLangModel.fromJson(Map<String, dynamic> json) {
    supportedLanguages = json['supportedLanguages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['supportedLanguages'] = supportedLanguages;
    return data;
  }
}
