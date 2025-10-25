import 'dart:developer';

import 'package:goapp/services/api_service.dart';
// import 'package:in_app_review/in_app_review.dart';

import '../../config.dart';

class RateAppProvider with ChangeNotifier {
  int selectedIndex = 3;
  bool isServiceRate = false, isServiceManRate = false;

  // Reviews? review;
  String? serviceId, serviceManId;
  TextEditingController rateController = TextEditingController();
  final FocusNode rateFocus = FocusNode();

  GlobalKey<FormState> rateKey = GlobalKey<FormState>();

  /*RateMyApp _rateMyApp = RateMyApp (
      preferencesPrefix: 'com.flutterTheme.flutterTheme',
      minDays: 3,
      minLaunches: 7,
      remindDays: 2,
      remindLaunches: 5
  );
*/
  Future<void> onTapEmoji(index) async {
    selectedIndex = index;
    notifyListeners();
  }

  Future<void> onSubmit(BuildContext context,
      {required bool isBusiness,
      int? id,
      int? appObjectId,
      int? appObjectType}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final body = {
      "rate": selectedIndex + 1,
      "title": "",
      "content": rateController.text
    };
    log("body $body");
    apiServices
        .commonApi(
            "${api.addReview}${pref.getInt(session.id)}/review/$appObjectType/$appObjectId",
            body,
            ApiType.post,
            isToken: true)
        .then((value) {
      log("value.data ${value.data}");
      if (value.isSuccess == true) {
        route.pop(context);

        isBusiness == true
            ? Provider.of<SearchProvider>(context, listen: false)
                .businessDetailsAPI(context, id, isNotRouting: true)
            : Provider.of<AttractionProvider>(context, listen: false)
                .attractionsDetailsAPI(context, id, isNotRoute: true);
        log("---- ==== $id");
        isBusiness == true
            ? Provider.of<ServiceReviewProvider>(context, listen: false)
                .businessReviewListAPI(id: id)
            : Provider.of<ServiceReviewProvider>(context, listen: false)
                .attractionsReviewListAPI(id: id);
        rateController.text = "";
        selectedIndex = 3;
      }
    });
  }

  void clearAll(context) {
    route.pop(context);
  }

  // rateBuilder(context) async {
  //   /*  LaunchReview.launch(androidAppId: "com.webiots.chatzy",
  //       iOSAppId: "585027354");*/
  //   final InAppReview inAppReview = InAppReview.instance;
  //
  //   inAppReview.openStoreListing(
  //     appStoreId: "com.webiots.chatzy",
  //     microsoftStoreId: 'com.webiots.chatzy',
  //   );
  // }

  Future<void> rateApp(context, {data}) async {}

  // onReady(context) {
  //   dynamic data = ModalRoute.of(context)!.settings.arguments;
  //
  //   if (data != null) {
  //     if (data["review"] != null) {
  //       review = data["review"];
  //     }
  //     log("iSSS:$data");
  //
  //     isServiceRate = data["isServiceRate"];
  //     serviceId = data["serviceId"];
  //     serviceManId = data["servicemanId"].toString();
  //   }
  //   log("EEEE :$isServiceRate");
  //   notifyListeners();
  // }

  Future<void> rateService(context) async {
    showDialog(
        context: context,
        builder: (context1) {
          return AlertDialogCommon(
            title: appFonts.successfullyChanged,
            image: eImageAssets.review,
            subtext: appFonts.yourReview,
            bText1: appFonts.okay,
            height: Sizes.s145,
            b1OnTap: () {
              route.pop(context);
              route.pop(context);
              route.pop(context);
            },
          );
        });
  }
}
