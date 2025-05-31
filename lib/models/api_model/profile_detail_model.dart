class ProfileDetailModel {
  ProfileDetailModel({
    required this.userProfile,
    required this.responseStatus,
    required this.responseMessage,
  });

  final UserProfile? userProfile;
  final num? responseStatus;
  final String? responseMessage;

  factory ProfileDetailModel.fromJson(Map<String, dynamic> json) {
    return ProfileDetailModel(
      userProfile: json["userProfile"] == null
          ? null
          : UserProfile.fromJson(json["userProfile"]),
      responseStatus: json["responseStatus"],
      responseMessage: json["responseMessage"],
    );
  }

  @override
  String toString() {
    return "$userProfile, $responseStatus, $responseMessage, ";
  }
}

class UserProfile {
  UserProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumberPrefix,
    required this.phoneNumber,
    required this.image,
    required this.birthday,
    required this.accountRole,
    required this.accountType,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumberPrefix;
  final String? phoneNumber;
  final Image? image;
  final DateTime? birthday;
  final AccountRole? accountRole;
  final AccountType? accountType;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phoneNumberPrefix: json["phoneNumberPrefix"],
      phoneNumber: json["phoneNumber"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      birthday: DateTime.tryParse(json["birthday"] ?? ""),
      accountRole: json["accountRole"] == null
          ? null
          : AccountRole.fromJson(json["accountRole"]),
      accountType: json["accountType"] == null
          ? null
          : AccountType.fromJson(json["accountType"]),
    );
  }

  @override
  String toString() {
    return "$id, $firstName, $lastName, $email, $phoneNumberPrefix, $phoneNumber, $image, $birthday, $accountRole, $accountType, ";
  }
}

class AccountRole {
  AccountRole({
    required this.accountRoleId,
    required this.accountRoleName,
  });

  final num? accountRoleId;
  final String? accountRoleName;

  factory AccountRole.fromJson(Map<String, dynamic> json) {
    return AccountRole(
      accountRoleId: json["accountRoleId"],
      accountRoleName: json["accountRoleName"],
    );
  }

  @override
  String toString() {
    return "$accountRoleId, $accountRoleName, ";
  }
}

class AccountType {
  AccountType({
    required this.accountTypeId,
    required this.accountTypeName,
  });

  final num? accountTypeId;
  final String? accountTypeName;

  factory AccountType.fromJson(Map<String, dynamic> json) {
    return AccountType(
      accountTypeId: json["accountTypeId"],
      accountTypeName: json["accountTypeName"],
    );
  }

  @override
  String toString() {
    return "$accountTypeId, $accountTypeName, ";
  }
}

class Image {
  Image({
    required this.imageId,
    required this.mediaType,
    required this.source,
    required this.mediaStatus,
    required this.sortOrder,
  });

  final num? imageId;
  final num? mediaType;
  final String? source;
  final num? mediaStatus;
  final num? sortOrder;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
        imageId: json["imageId"],
        mediaType: json["mediaType"],
        source: json["source"],
        mediaStatus: json["mediaStatus"],
        sortOrder: json["sortOrder"]);
  }

  @override
  String toString() {
    return "$imageId, $mediaType, $source, $mediaStatus, $sortOrder, ";
  }
}
