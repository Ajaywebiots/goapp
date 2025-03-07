class CountryStateModel {
  int? id;
  String? name;
  List<StateModel>? state;

  CountryStateModel(
      {this.id,
        this.name,
        this.state});

  CountryStateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['state'] != null) {
      state = <StateModel>[];
      json['state'].forEach((v) {
        state!.add(StateModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (state != null) {
      data['state'] = state!.map((v) => v.toJson()).toList();
    }
    return data;
  }



  ///this method will prevent the override of toString
  String userAsString() {
    return '#${id} ${name}';
  }

  ///this method will prevent the override of toString
   userAsStringById() {
    return id.toString();
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return name.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(CountryStateModel model) {
    return id == model.id;
  }
}

class StateModel {
  int? id;
  String? name;
  String? countryId;
  String? createdAt;
  String? updatedAt;

  StateModel({this.id, this.name, this.countryId, this.createdAt, this.updatedAt});

  StateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}