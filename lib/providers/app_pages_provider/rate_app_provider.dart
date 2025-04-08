import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:in_app_review/in_app_review.dart';

import '../../config.dart';
import '../../models/review_model.dart';

class RateAppProvider with ChangeNotifier {
  int selectedIndex = 3;
  bool isServiceRate = false, isServiceManRate = false;
  Reviews? review;
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
  onTapEmoji(index) {
    selectedIndex = index;
    notifyListeners();
  }

  onSubmit(context) {
    route.pop(context);
    // FocusScope.of(context).requestFocus(FocusNode());
    // // if (rateKey.currentState!.validate()) {
    //   if (isServiceRate) {
    //     rateService(context);
    //   } else {
    //     if (selectedIndex == 4) {
    //       //  rateBuilder(context);
    //       rateApp(context);
    //     } else {
    //       // route.pushNamed(context, routeName.contactUs,
    //       //     arg: {'rate': selectedIndex, "desc": rateController.text});
    //     }
    //   }
    // }
  }

  rateBuilder(context) async {
    /*  LaunchReview.launch(androidAppId: "com.webiots.chatzy",
        iOSAppId: "585027354");*/
    final InAppReview inAppReview = InAppReview.instance;

    inAppReview.openStoreListing(
      appStoreId: "com.webiots.chatzy",
      microsoftStoreId: 'com.webiots.chatzy',
    );
  }

  rateApp(context, {data}) async {
    showDialog(
        context: context,
        builder: (context1) {
          return AlertDialogCommon(
              title: "Successfully submit",
              image: eImageAssets.review,
              fit: BoxFit.contain,
              subtext: "Your contact message was sent successfully.",
              bText1: "Close",
              height: Sizes.s145,
              b1OnTap: () {
                rateController.text = "";
                notifyListeners();
                route.pop(context);
                // route.pop(context);
                // if (data != null) {
                //   route.pop(context);
                // }
                rateController.text = "";
                notifyListeners();
              });
        });
  }

  onReady(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    if (data != null) {
      if (data["review"] != null) {
        review = data["review"];
      }
      log("iSSS:$data");

      isServiceRate = data["isServiceRate"];
      serviceId = data["serviceId"];
      serviceManId = data["servicemanId"].toString();
    }
    log("EEEE :$isServiceRate");
    notifyListeners();
  }

  rateService(context) async {
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
