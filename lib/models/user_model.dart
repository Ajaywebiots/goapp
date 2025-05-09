// import '../config.dart';
// import 'index.dart';
//
// class UserModel {
//   int? id;
//   String? name;
//   String? email;
//   String? systemReserve;
//   String? served;
//   String? phone;
//   String? code;
//   int? providerId;
//   String? status;
//   String? isFeatured;
//   String? isVerified;
//   String? type;
//   String? emailVerifiedAt;
//   String? fcmToken;
//   String? experienceInterval;
//   String? experienceDuration;
//   String? createdBy;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;
//   String? companyName;
//   String? companyEmail;
//   String? companyPhone;
//   String? companyCode;
//   String? description;
//   PrimaryAddress? primaryAddress;
//   List<Media>? media;
//   WalletModel? wallet;
//   List<KnownLanguageModel>? knownLanguages;
//   List<ExpertiseModel>? expertise;
//
//   UserModel(
//       {this.id,
//       this.name,
//       this.email,
//       this.systemReserve,
//       this.served,
//       this.phone,
//       this.code,
//       this.providerId,
//       this.status,
//       this.isFeatured,
//       this.isVerified,
//       this.type,
//       this.emailVerifiedAt,
//       this.fcmToken,
//       this.experienceInterval,
//       this.experienceDuration,
//       this.createdBy,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt,
//       this.companyName,
//       this.companyEmail,
//       this.companyPhone,
//       this.companyCode,
//       this.description,
//       this.primaryAddress,
//       this.media,
//       this.wallet,
//       this.knownLanguages,
//       this.expertise});
//
//   UserModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     systemReserve = json['system_reserve'];
//     served = json['served'];
//     phone = json['phone'];
//     code = json['code'];
//     providerId = json['provider_id'];
//     status = json['status'];
//     isFeatured = json['is_featured'];
//     isVerified = json['is_verified'];
//     type = json['type'];
//     emailVerifiedAt = json['email_verified_at'];
//     fcmToken = json['fcm_token'];
//     experienceInterval = json['experience_interval'];
//     experienceDuration = json['experience_duration'];
//     createdBy = json['created_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     companyName = json['company_name'];
//     companyEmail = json['company_email'];
//     companyPhone = json['company_phone'];
//     companyCode = json['company_code'];
//     description = json['description'];
//
//     primaryAddress = json['primary_address'] != null
//         ? PrimaryAddress.fromJson(json['primary_address'])
//         : null;
//     if (json['media'] != null) {
//       media = <Media>[];
//       json['media'].forEach((v) {
//         media!.add(Media.fromJson(v));
//       });
//     }
//     wallet =
//         json['wallet'] != null ? WalletModel.fromJson(json['wallet']) : null;
//     if (json['known_languages'] != null) {
//       knownLanguages = <KnownLanguageModel>[];
//       json['known_languages'].forEach((v) {
//         knownLanguages!.add(KnownLanguageModel.fromJson(v));
//       });
//     }
//     if (json['expertise'] != null) {
//       expertise = <ExpertiseModel>[];
//       json['expertise'].forEach((v) {
//         expertise!.add(ExpertiseModel.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['email'] = email;
//     data['system_reserve'] = systemReserve;
//     data['served'] = served;
//     data['phone'] = phone;
//     data['code'] = code;
//     data['provider_id'] = providerId;
//     data['status'] = status;
//     data['is_featured'] = isFeatured;
//     data['is_verified'] = isVerified;
//     data['type'] = type;
//     data['email_verified_at'] = emailVerifiedAt;
//     data['fcm_token'] = fcmToken;
//     data['experience_interval'] = experienceInterval;
//     data['experience_duration'] = experienceDuration;
//     data['created_by'] = createdBy;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     data['company_name'] = companyName;
//     data['company_email'] = companyEmail;
//     data['company_phone'] = companyPhone;
//     data['company_code'] = companyCode;
//     data['description'] = description;
//
//     if (primaryAddress != null) {
//       data['primary_address'] = primaryAddress!.toJson();
//     }
//     if (media != null) {
//       data['media'] = media!.map((v) => v.toJson()).toList();
//     }
//     if (wallet != null) {
//       data['wallet'] = wallet!.toJson();
//     }
//     if (knownLanguages != null) {
//       data['known_languages'] = knownLanguages!.map((v) => v.toJson()).toList();
//     }
//     if (expertise != null) {
//       data['expertise'] = expertise!.map((v) => v.toJson()).toList();
//     }
//
//     return data;
//   }
// }
