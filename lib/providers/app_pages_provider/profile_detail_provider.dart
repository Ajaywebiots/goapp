import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../config.dart';
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
  XFile? imageFile;
  SharedPreferences? preferences;

  var selectList = [
    {"image": eSvgAssets.gallery, "title": appFonts.chooseFromGallery},
    {"image": eSvgAssets.camera, "title": appFonts.openCamera}
  ];

  changeDialCode(country) {
    dialCode = country.dialCode!;
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
          log("dialCode sss$dialCode");
          if (value.data['responseStatus'] == 1) {
            txtFName.text = value.data['userProfile']['firstName'];
            txtLName.text = value.data['userProfile']['lastName'];
            txtEmail.text = value.data['userProfile']['email'] ?? "";
            txtPhone.text = value.data['userProfile']['phoneNumber'];
            birthday.text = value.data['userProfile']['birthday'] ?? "";
            dialCode = value.data['userProfile']['phoneNumberPrefix'] ?? "";
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      log("EEEE getProfileDetailDataAPI:::: $e");
    }
  }

  updateProfileDetailDataAPI(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);

    final body = {
      "firstName": txtFName.text,
      "lastName": txtLName.text,
      "email": txtEmail.text,
      "phoneNumberPrefix": dialCode,
      "phoneNumber": txtPhone.text,
      "birthday": birthday.text
    };
    log("898989898 $body");
    try {
      apiServices
          .commonApi("${api.profile}$userId/profile", body, ApiType.patch,
              isToken: true)
          .then((value) {
        if (value.isSuccess == true) {
          log("hjhjhjhjh ${value.data}");
        }
      });
    } catch (e) {
      log("EEEE getProfileDetailDataAPI:::: $e");
    }
  }
}
