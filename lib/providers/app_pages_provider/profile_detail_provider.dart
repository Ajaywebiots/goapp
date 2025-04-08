import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../../config.dart';
import '../../screens/app_pages_screen/profile_detail_screen/layouts/selection_option_layout.dart';

class ProfileDetailProvider with ChangeNotifier {
  TextEditingController txtFName = TextEditingController();
  TextEditingController txtLName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  String dialCode = '+30';
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  XFile? imageFile;
  SharedPreferences? preferences;

  var selectList = [
    {"image": eSvgAssets.gallery, "title": appFonts.chooseFromGallery},
    {"image": eSvgAssets.camera, "title": appFonts.openCamera}
  ];

  // changeDialCode(CountryCode country) {
  //   dialCode = country.dialCode!;
  //   notifyListeners();
  // }

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
}
