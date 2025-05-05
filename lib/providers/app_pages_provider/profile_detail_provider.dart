import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:goapp/widgets/alert_message_common.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

import '../../config.dart';
import '../../models/api_model/profile_detail_model.dart';
import '../../screens/app_pages_screen/profile_detail_screen/layouts/selection_option_layout.dart';
import '../../services/api_service.dart';

class ProfileDetailProvider with ChangeNotifier {
  TextEditingController txtFName = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController txtLName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  String? dialCode;
  final FocusNode nameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode birthdayFocus = FocusNode();
  XFile? imageFile;
  String? profileImageUrl;
  String? accountType;
  String? memberStatus;

  SharedPreferences? preferences;

  // DateTime? selectedBirthday;

  var selectList = [
    {"image": eSvgAssets.gallery, "title": appFonts.chooseFromGallery},
    {"image": eSvgAssets.camera, "title": appFonts.openCamera}
  ];

  void loadProfile(UserProfile userProfile) {
    dialCode = userProfile.phoneNumberPrefix ?? "";
    txtFName.text = userProfile.firstName ?? "";
    txtLName.text = userProfile.lastName ?? "";
    txtEmail.text = userProfile.email ?? "";
    txtPhone.text = userProfile.phoneNumber ?? "";
    profileImageUrl = userProfile.image?.source ?? "";
    accountType = userProfile.accountType?.accountTypeName ?? "";
    memberStatus = userProfile.accountRole?.accountRoleName ?? "";
    birthday.text = DateFormat('dd/MM/yyyy').format(userProfile.birthday!);

    notifyListeners();
  }

// GET IMAGE FROM GALLERY
  Future getImage(context, source) async {
    final ImagePicker picker = ImagePicker();
    imageFile = (await picker.pickImage(source: source))!;
    notifyListeners();
    if (imageFile != null) {
      // updateProfile(context);
      route.pop(context);
    }
  }

  onReady(context) {
    getProfileDetailDataAPI(context);
    notifyListeners();
  }

  Future<void> uploadImageUsingCommonApi(XFile file) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);

    final fileName = basename(file.path);
    log("file: ${file.path}");

    FormData formData = FormData.fromMap(
        {'image': await MultipartFile.fromFile(file.path, filename: fileName)});

    await apiServices
        .commonApi(
            "${api.profile}$userId/profile/image", formData, ApiType.post,
            isToken: true)
        .then((value) {
      if (value.isSuccess!) {
        log("Image uploaded successfully: ${value.data}");
      } else {
        log("Image upload failed: ${value.message}");
      }
    });
  }

  showLayout(context) async {
    showDialog(
        context: context,
        builder: (context1) {
          return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppRadius.r12))),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(language(context, "Select one"),
                          style: appCss.dmDenseMedium18
                              .textColor(appColor(context).darkText)),
                      Icon(CupertinoIcons.multiply,
                              color: appColor(context).darkText)
                          .inkWell(onTap: () {
                        route.pop(context);
                      })
                    ]),
                const VSpace(Sizes.s20),
                ...appArray.selectList
                    .asMap()
                    .entries
                    .map((e) => SelectOptionLayout(
                        data: e.value,
                        index: e.key,
                        list: appArray.selectList,
                        onTap: () {
                          if (e.key == 0) {
                            getImage(context, ImageSource.gallery);
                          } else {
                            getImage(context, ImageSource.camera);
                          }
                        }))
              ]));
        });
  }

  getProfileDetailDataAPI(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);

    try {
      apiServices
          .commonApi("${api.profile}$userId/profile", [], ApiType.get,
              isToken: true)
          .then((value) {
        if (value.isSuccess == true) {
          ProfileDetailModel profileDetail =
              ProfileDetailModel.fromJson(value.data);
          if (profileDetail.responseStatus == 1) {
            loadProfile(profileDetail.userProfile!);
          }
        } /*else {
          // Navigator.pushNamedAndRemoveUntil(
          //     context, routeName.login, (Route<dynamic> route) => false);
        }*/
      });
      notifyListeners();
    } catch (e, s) {
      log("EEEE getProfileDetailDataAPI:::: $e\n$s");
    }
  }

  changeDialCode(country) {
    dialCode = country.dialCode!;
    notifyListeners();
  }

  updateProfileDetailDataAPI(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);
    String inputDate = birthday.text;

    DateFormat inputFormat = DateFormat("dd/MM/yyyy");
    DateTime date = inputFormat.parse(inputDate);
    String output = date.toIso8601String().split('.').first;

    final body = {
      "firstName": txtFName.text,
      "lastName": txtLName.text,
      "email": txtEmail.text,
      "phoneNumberPrefix": dialCode,
      "phoneNumber": txtPhone.text,
      "birthday": output
    };
    log("BODY: $body");

    try {
      final value = await apiServices.commonApi(
          "${api.profile}$userId/profile", body, ApiType.patch,
          isToken: true);
      if (value.isSuccess == true) {
        getProfileDetailDataAPI(context);
        if (imageFile != null) {
          uploadImageUsingCommonApi(imageFile!);
        }
        snackBarMessengers(context,
            message: "Update Successful",
            color: appColor(context).primary,
            isDuration: true);
        log("Update Success: ${value.data}");
      } else {
        log("Update Failed: ${value.message}");
      }
    } catch (e, s) {
      log("Error updating profile: $e === $s");
    }
  }
}
