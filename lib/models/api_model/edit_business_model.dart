class EditBusinessModel {
  EditBusinessModel({
    required this.business,
    required this.contact,
    required this.responseStatus,
    required this.responseMessage,
  });

  final Business? business;
  final Contact? contact;
  final int? responseStatus;
  final String? responseMessage;

  factory EditBusinessModel.fromJson(Map<String, dynamic> json) {
    return EditBusinessModel(
      business:
          json["business"] == null ? null : Business.fromJson(json["business"]),
      contact:
          json["contact"] == null ? null : Contact.fromJson(json["contact"]),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
    );
  }
}

class Business {
  Business({
    required this.id,
    required this.name,
    required this.logo,
    required this.businessCategory,
    required this.priceRange,
    required this.description,
  });

  final int? id;
  final String? name;
  final dynamic logo;
  final dynamic businessCategory;
  final int? priceRange;
  final String? description;

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json["id"],
      name: json["name"],
      logo: json["logo"],
      businessCategory: json["businessCategory"],
      priceRange: json["priceRange"],
      description: json["description"],
    );
  }
}

class Contact {
  Contact({
    required this.firstName,
    required this.lastName,
    required this.phoneNumberPrefix,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.website,
    required this.facebookPage,
    required this.instagramPage,
    required this.tiktokPage,
    required this.youtubePage,
  });

  final String? firstName;
  final String? lastName;
  final String? phoneNumberPrefix;
  final String? phoneNumber;
  final String? email;
  final String? address;
  final String? website;
  final String? facebookPage;
  final String? instagramPage;
  final String? tiktokPage;
  final String? youtubePage;

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      firstName: json["firstName"],
      lastName: json["lastName"],
      phoneNumberPrefix: json["phoneNumberPrefix"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      address: json["address"],
      website: json["website"],
      facebookPage: json["facebookPage"],
      instagramPage: json["instagramPage"],
      tiktokPage: json["tiktokPage"],
      youtubePage: json["youtubePage"],
    );
  }
}
