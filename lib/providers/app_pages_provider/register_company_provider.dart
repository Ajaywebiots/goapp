import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:goapp/services/api_service.dart';
import 'package:image_picker/image_picker.dart';

import '../../config.dart';
import '../../widgets/image_picker_layout.dart';

class SignUpCompanyProvider with ChangeNotifier {
  GlobalKey<FormState> signupFormKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey3 = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey4 = GlobalKey<FormState>();
  GlobalKey<FormState> signupFreelanceFormKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> signupFreelanceFormKey2 = GlobalKey<FormState>();
  double slider = 0.0;
  String dialCode = "+30";
  String providerDialCode = "+30";

  String? chosenValue;
  String? chosenRange;

  int countryValue = -1, stateValue = -1;
  bool isNewPassword = true, isConfirmPassword = true;
  bool isPassword = true;
  bool isConfirmPasswordobscure = true;

  List<XFile> uploadedImages = [];

  String? embedCode;
  String? videoThumbnailUrl;

  //String? identityValue;
  int pageIndex = 0;
  int fPageIndex = 0;

  TextEditingController contactFirstName = TextEditingController();
  TextEditingController contactLastName = TextEditingController();
  TextEditingController transcontactFirstName = TextEditingController();
  TextEditingController transcontactLastName = TextEditingController();
  TextEditingController companyPhone = TextEditingController();
  TextEditingController businessName = TextEditingController();
  TextEditingController transbusinessName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController providerEmail = TextEditingController();
  TextEditingController providerNumber = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController fbCtrl = TextEditingController();
  TextEditingController instagramCtrl = TextEditingController();
  TextEditingController ytCtrl = TextEditingController();
  TextEditingController tiktokCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  ScrollController controller = ScrollController();

  final FocusNode contactFirstNameFocus = FocusNode();
  final FocusNode contactLastNameFocus = FocusNode();
  final FocusNode transcontactFirstNameFocus = FocusNode();
  final FocusNode transcontactLastNameFocus = FocusNode();
  final FocusNode businessNameFocus = FocusNode();
  final FocusNode transbusinessNameFocus = FocusNode();
  final FocusNode latitudeFocus = FocusNode();
  final FocusNode longitudeFocus = FocusNode();
  final FocusNode companyNameFocus = FocusNode();
  final FocusNode phoneNameFocus = FocusNode();
  final FocusNode companyMailFocus = FocusNode();
  final FocusNode descriptionFocus = FocusNode();
  final FocusNode providerNumberFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();

  FocusNode countryFocus = FocusNode();
  FocusNode streetFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode zipcodeFocus = FocusNode();

  dynamic areaData;

  FocusNode ownerNameFocus = FocusNode();
  FocusNode providerPhoneNumberFocus = FocusNode();
  FocusNode providerEmailFocus = FocusNode();
  FocusNode websiteFocus = FocusNode();
  FocusNode fbFocus = FocusNode();
  FocusNode instagramFocus = FocusNode();
  FocusNode tiktokFocus = FocusNode();
  FocusNode ytFocus = FocusNode();
  FocusNode videoFocus = FocusNode();
  bool isBusiness = false;
  String documentModel = '';
  XFile? imageFile, docFile;

  Future<void> loadAccountType() async {
    final pref = await SharedPreferences.getInstance();
    final accountType = pref.getString(session.accountType);
    isBusiness = accountType?.toLowerCase() == "business";
    notifyListeners();
  }

  TextEditingController companyName = TextEditingController();

  Future<void> getLocation(BuildContext context) async {
    try {
      // Check and request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permission denied')),
          );
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Location permission permanently denied')),
        );
        return;
      }

      // Fetch current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Convert coordinates to address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark placemark = placemarks.first;
      String address = [
        placemark.street,
        placemark.subLocality,
      ].where((e) => e != null && e.isNotEmpty).join(', ');

      // Update provider fields
      street.text = address; // Street (areaData)
      city.text = placemark.locality ?? ''; // City
      zipCode.text = placemark.postalCode ?? ''; // ZipCode
      countryController.text = placemark.country ?? ''; // Country
      latitude.text = position.latitude.toString(); // Latitude
      longitude.text = position.longitude.toString(); // Longitude
      notifyListeners(); // Notify UI
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching location: $e')),
      );
    }
  }

  void showEmbedVideoDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r12)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        // screen padding

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(language(context, "Embed Video Code"),
                  style: appCss.dmDenseSemiBold14
                      .textColor(appColor(context).darkText)),
              const Icon(CupertinoIcons.multiply)
                  .inkWell(onTap: () => route.pop(context))
            ]),
            TextFieldCommon(
              isNumber: true,
              focusNode: videoFocus,
              controller: controller,
              maxLines: 5,
              hintText: 'Enter video embed code here',
            )
                .padding(all: Sizes.s15)
                .decorated(
                    color: appColor(context).fieldCardBg,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.r8)))
                .padding(top: Sizes.s11, bottom: Sizes.s24),
            Row(children: [
              Expanded(
                  child: ButtonCommon(
                      onTap: () => route.pop(context),
                      title: appFonts.cancel,
                      borderColor: appColor(context).primary,
                      color: appColor(context).whiteBg,
                      style: appCss.dmDenseSemiBold16
                          .textColor(appColor(context).primary))),
              const HSpace(Sizes.s15),
              Expanded(
                  child: ButtonCommon(
                      color: appColor(context).primary,
                      onTap: () {
                        final input = controller.text.trim();
                        Navigator.pop(context);

                        embedCode = input;
                        videoThumbnailUrl = getThumbnailFromEmbedCode(input);
                        notifyListeners();
                      },
                      style: appCss.dmDenseSemiBold16
                          .textColor(appColor(context).whiteColor),
                      title: appFonts.submit))
            ])
          ],
        ),
      ),
    );
  }

  String? getThumbnailFromEmbedCode(String code) {
    final regex = RegExp(r'src="https:\/\/www\.youtube\.com\/embed\/(.*?)"');
    final match = regex.firstMatch(code);
    if (match != null && match.groupCount > 0) {
      var videoId = match.group(1);
      if (videoId != null && videoId.contains("?")) {
        videoId = videoId.split("?").first; // remove query string
      }
      return "https://img.youtube.com/vi/$videoId/0.jpg";
    }
    return null;
  }

  void onBusinessImagePick(
      BuildContext context, Function(List<XFile>) onPicked) {
    showLayout(context, onTap: (index) {
      final source = index == 0 ? ImageSource.gallery : ImageSource.camera;
      getBusinessImage(context, source, onPicked);
    });
  }

  Future<void> getBusinessImage(
    BuildContext context,
    ImageSource source,
    Function(List<XFile>) onPicked,
  ) async {
    final ImagePicker picker = ImagePicker();
    List<XFile> images = [];

    if (source == ImageSource.gallery) {
      final List<XFile>? picked = await picker.pickMultiImage(imageQuality: 70);
      if (picked != null && picked.isNotEmpty) {
        images = picked;
      }
    } else {
      final XFile? image =
          await picker.pickImage(source: source, imageQuality: 70);
      if (image != null) {
        images = [image];
      }
    }

    route.pop(context);

    if (images.isNotEmpty) {
      onPicked(images);
    }

    notifyListeners(); // Optional: update UI
  }

  //image picker option
  onImagePick(context, {isLogo = true}) {
    showLayout(context, onTap: (index) {
      if (index == 0) {
        getImage(context, ImageSource.gallery, isLogo: isLogo);
      } else {
        getImage(context, ImageSource.camera, isLogo: isLogo);
      }
      notifyListeners();
    });
  }

  void goBack(BuildContext context) {
    if (pageIndex > 0) {
      pageIndex--;
      notifyListeners();
    } else {
      Navigator.pop(context); // exit flow
    }
  }

  translateTap(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Consumer<LanguageProvider>(
              builder: (context, languages, child) {
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(language(context, "Translations"),
                            style: appCss.dmDenseMedium18
                                .textColor(appColor(context).darkText)),
                        const Icon(CupertinoIcons.multiply)
                            .inkWell(onTap: () => route.pop(context))
                      ],
                    ),
                    Stack(children: [
                      const FieldsBackground(),
                      Column(children: [
                        ContainerWithTextLayout(title: "Language"),
                        DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                    child: DropdownButton(
                                        value: languages.currentLanguage
                                            .toString(),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(AppRadius.r10)),
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context).lightText),
                                        icon: SvgPicture.asset(eSvgAssets.dropDown,
                                            colorFilter: ColorFilter.mode(
                                                appColor(context).darkText,
                                                BlendMode.srcIn)),
                                        isExpanded: true,
                                        hint: Text(languages.currentLanguage
                                            .substring(0, 2)
                                            .toString()),
                                        selectedItemBuilder: (context) {
                                          int index = appArray.languageList
                                              .indexWhere((element) =>
                                                  element['title'] ==
                                                  languages.currentLanguage);
                                          return LanguageList()
                                              .langList(index, context);
                                        },
                                        items: appArray.languageList
                                            .asMap()
                                            .entries
                                            .map((e) {
                                          return LanguageList().dropDown(
                                              e.value, context,
                                              onTap: () => languages
                                                  .changeLocale(e.value["title"]
                                                      .toString()));
                                        }).toList(),
                                        onChanged: (val) async {
                                          languages.currentLanguage =
                                              val.toString();
                                          languages.changeLocale(
                                              languages.currentLanguage);
                                        })))
                            .paddingDirectional(horizontal: Insets.i8)
                            .decorated(
                                color: appColor(context).whiteBg,
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r6),
                                boxShadow: isDark(context)
                                    ? []
                                    : [
                                        BoxShadow(
                                            color:
                                                appColor(context).fieldCardBg,
                                            blurRadius: AppRadius.r10,
                                            spreadRadius: AppRadius.r5)
                                      ],
                                border:
                                    Border.all(color: appColor(context).fieldCardBg))
                            .padding(all: Sizes.s20),
                        ContainerWithTextLayout(title: "Contact First Name")
                            .paddingOnly(bottom: Insets.i8),
                        TextFieldCommon(
                                controller: transcontactFirstName,
                                validator: (v) =>
                                    validation.nameValidation(context, v),
                                focusNode: transcontactFirstNameFocus,
                                hintText: "Enter contact first name",
                                prefixIcon: "assets/svg/myAccount.svg")
                            .paddingSymmetric(horizontal: Insets.i20),
                        ContainerWithTextLayout(title: "Contact Last Name")
                            .paddingOnly(top: Insets.i24, bottom: Insets.i8),
                        TextFieldCommon(
                                controller: transcontactLastName,
                                validator: (v) =>
                                    validation.nameValidation(context, v),
                                focusNode: transcontactLastNameFocus,
                                hintText: "Enter contact last name",
                                prefixIcon: "assets/svg/myAccount.svg")
                            .paddingSymmetric(horizontal: Insets.i20),
                        ContainerWithTextLayout(title: "Business name")
                            .paddingOnly(top: Insets.i24, bottom: Insets.i8),
                        TextFieldCommon(
                                validator: (v) =>
                                    validation.emailValidation(context, v),
                                controller: transbusinessName,
                                focusNode: transbusinessNameFocus,
                                keyboardType: TextInputType.emailAddress,
                                hintText: "Enter business name",
                                prefixIcon: eSvgAssets.companyName)
                            .paddingSymmetric(horizontal: Insets.i20),
                        ContainerWithTextLayout(title: "description")
                            .paddingOnly(top: Insets.i24, bottom: Insets.i8),
                        Stack(children: [
                          TextFieldCommon(
                                  focusNode: descriptionFocus,
                                  isNumber: true,
                                  validator: (v) =>
                                      validation.dynamicTextValidation(
                                          context, v, "pleaseEnterDesc"),
                                  controller: description,
                                  hintText: "Enter Details",
                                  maxLines: 3,
                                  minLines: 3,
                                  isMaxLine: true)
                              .paddingSymmetric(horizontal: Insets.i20),
                          SvgPicture.asset(eSvgAssets.details,
                                  fit: BoxFit.scaleDown,
                                  colorFilter: ColorFilter.mode(
                                      !descriptionFocus.hasFocus
                                          ? description.text.isNotEmpty
                                              ? appColor(context).darkText
                                              : appColor(context).lightText
                                          : appColor(context).darkText,
                                      BlendMode.srcIn))
                              .paddingOnly(
                                  left: rtl(context) ? 0 : Insets.i35,
                                  right: rtl(context) ? Insets.i35 : 0,
                                  top: Insets.i13)
                        ])
                      ]).padding(vertical: Sizes.s20)
                    ]).padding(vertical: Sizes.s20),
                    Row(children: [
                      Expanded(
                          child: ButtonCommon(
                              onTap: () => route.pop(context),
                              title: appFonts.cancel,
                              borderColor: appColor(context).primary,
                              color: appColor(context).whiteBg,
                              style: appCss.dmDenseSemiBold16
                                  .textColor(appColor(context).primary))),
                      const HSpace(Sizes.s15),
                      Expanded(
                          child: ButtonCommon(
                              color: appColor(context).primary,
                              onTap: () {},
                              style: appCss.dmDenseSemiBold16
                                  .textColor(appColor(context).whiteColor),
                              title: appFonts.submit))
                    ])
                  ]).padding(vertical: Sizes.s20, horizontal: Sizes.s20),
            );
          });
        });
  }

  // GET IMAGE FROM GALLERY
  Future getImage(context, source, {isLogo = true}) async {
    final ImagePicker picker = ImagePicker();
    XFile image = (await picker.pickImage(source: source, imageQuality: 70))!;
    route.pop(context);
    if (isLogo) {
      imageFile = image;
    } else {
      docFile = image;
    }
    notifyListeners();
  }

  getAddressFromLatLng(context) async {
    await placemarkFromCoordinates(position!.latitude, position!.longitude)
        .then((List<Placemark> placeMarks) async {
      Placemark? place = placeMarks[0];

      String data =
          '${place.name}, ${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      areaData = data;
      latitude.text = position!.latitude.toString();
      longitude.text = position!.longitude.toString();
      city.text = place.postalCode!;
      zipCode.text = place.street!;

      await Future.delayed(Durations.short4);
      hideLoading(context);
      notifyListeners();
    }).catchError((e) {
      hideLoading(context);
      notifyListeners();
      debugPrint("ee getAddressFromLatLng : $e");
    });
  }

  //on page initialize
  void onReady(context) {
    pageIndex = 0;
    fPageIndex = 0;
    notifyListeners();

    descriptionFocus.addListener(() {
      notifyListeners();
    });

    notifyListeners();
  }

  //phone dial code selection
  changeDialCode(CountryCodeCustom country) {
    dialCode = country.dialCode!;
    notifyListeners();
  }

  //provider phone dial code selection

  changeProviderDialCode(CountryCodeCustom country) {
    providerDialCode = country.dialCode!;
    notifyListeners();
  }

  //Business Categories select
  onDropDownChange(choseVal) {
    chosenValue = choseVal;
    notifyListeners();
  }

  onRangeDropDownChange(choseVal) {
    chosenRange = choseVal;
    notifyListeners();
  }

  int? businessId;

  onNext(BuildContext context) async {
    log("INDEX :$pageIndex");

    if (pageIndex == 0) {
      final id = await signUpBusinessAPI();
      if (id != null) {
        businessId = id;
        pageIndex++;
      } else {
        log("Business signup failed, cannot proceed.");
        return;
      }
    } else if (pageIndex == 1) {
      // Step 2: Business location
      final success = await businessLocationAPI(businessId!);
      log("Business Location API success: $success");

      if (success ?? false) {
        pageIndex++;
      } else {
        return;
      }
    } else if (pageIndex == 2) {
      // Step 2: Business location
      final success = await businessContactAPI(businessId!);
      log("Business Location API success: $success");

      if (success == true) {
        pageIndex++;
      } else {
        return;
      }
    } else if (pageIndex == 3) {
      pageIndex++;
    } else if (pageIndex == 4) {
      pageIndex++;
    }

    log("INDEXEPAGE $pageIndex");

    if (pageIndex == 5) {
      isBusiness = true;
      pageIndex = 0;
      notifyListeners();

      // ✅ Use Future.micro task to allow state changes before navigation
      Future.microtask(() {
        route.pushNamedAndRemoveUntil(context, routeName.dashboard);
      });
    } else {
      notifyListeners();
    }
  }

  void onBusinessOnTap(context, data, index) {
    log("data.title::${data.title}///}");
    switch (data.title) {
      // case "My Business":
      //   route.pushNamed(context, routeName.myBusinessScreen);
      //   break;
      // case "Business Users":
      //   route.pushNamed(context, routeName.businessUserScreen);
      //   break;
      case "Business Reviews":
        route.pushNamed(context, routeName.businessReviewsScreen);
        break;
      case "My Offers":
        route.pushNamed(context, routeName.businessOfferScreen);
        break;
      case "Offer Bookings":
        route.pushNamed(context, routeName.offerBookings);
        break;
      case "Dashboard":
        route.pushNamed(context, routeName.businessDashBoardScreen);
        break;
      default:
        throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  businessLocationAPI(businessID) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final int? userId = pref.getInt(session.id);

      if (userId == null) {
        log("User ID is null. Cannot proceed with location API.");
        return;
      }

      final body = {
        "addressId": 1,
        "street": street.text,
        "countryId": 91,
        "cityId": 1101,
        "zipCode": zipCode.text,
        "longitude": longitude.text,
        "latitude": latitude.text
      };

      final String url =
          "${api.registerBusiness}$userId/business/$businessID/location";

      log("🌐 Location API URL: $url");
      log("📨 Location API Body: ${jsonEncode(body)}");

      final value =
          await apiServices.commonApi(url, body, ApiType.post, isToken: true);

      if (value.isSuccess == true) {
        final businessID = value.data?["businessId"];
        if (businessID != null) {
          log("✅ Business location with ID: $businessID");
          return businessID;
        } else {
          log("❗ businessID is null in API response.");
          return null;
        }
      } else {
        log("❌ Location API failed: ${value.message}");
        return false;
      }
    } catch (e) {
      log("🚨 Exception in businessLocationAPI: $e");
      return false;
    }
  }

  businessContactAPI(businessID) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final int? userId = pref.getInt(session.id);

      if (userId == null) {
        log("User ID is null. Cannot proceed with location API.");
        return;
      }

      final body = {
        "phoneNumber": "+91-8041234567",
        "facebook": "https://www.facebook.com/timesofindia",
        "instagram": "https://www.instagram.com/indiatimes/",
        "tikTok": "https://www.tiktok.com/@indiacomedy",
        "youTube": "https://www.youtube.com/@TimesofIndia",
        "website": "https://timesofindia.indiatimes.com",
        "email": "toieditorial@timesgroup.com"
      };

      final String url =
          "${api.registerBusiness}$userId/business/$businessID/channels";

      log("🌐 Location API URL: $url");
      log("📨 Location API Body: ${jsonEncode(body)}");

      final value =
          await apiServices.commonApi(url, body, ApiType.post, isToken: true);

      if (value.isSuccess == true) {
        final businessID = value.data?["businessId"];
        if (businessID != null) {
          log("✅ Business channels with ID: $businessID");
          return businessID;
        } else {
          log("❗ businessID is null in API response.");
          return null;
        }
      } else {
        log("❌ API call failed: ${value.message}");
        return null;
      }
    } catch (error) {
      log("🚨 API Exception: $error");
      return null;
    }
  }

  signUpBusinessAPI() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final int? userId = pref.getInt(session.id);

      if (userId == null) {
        log("User ID is null. Cannot proceed with registration.");
        return;
      }

      final body = {
        "language": 1,
        "name": businessName.text.trim(),
        "categoryId": 1,
        "priceRangeId": 2,
        "phoneNumber": companyPhone.text.trim(),
        "firstName": contactFirstName.text.trim(),
        "lastName": contactLastName.text.trim(),
        "email": emailCtrl.text.trim(),
        "description": description.text.trim()
      };

      final String url = "${api.registerBusiness}$userId/business";

      log("📤 API URL: $url");
      log("📦 API Request Body: ${jsonEncode(body)}");

      final value =
          await apiServices.commonApi(url, body, ApiType.post, isToken: true);

      if (value.isSuccess == true) {
        final businessID = value.data?["businessId"];
        if (businessID != null) {
          log("✅ Business registered with ID: $businessID");
          return businessID;
        } else {
          log("❗ businessID is null in API response.");
          return null;
        }
      } else {
        log("❌ API call failed: ${value.message}");
        return null;
      }
    } catch (error) {
      log("🚨 API Exception: $error");
      return null;
    }
  }
}
