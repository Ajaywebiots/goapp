import 'dart:developer';

import 'package:goapp/providers/app_pages_provider/attractions_provider.dart';
import 'package:goapp/providers/app_pages_provider/search_provider.dart';
import 'package:goapp/services/api_service.dart';
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
  onTapEmoji(index) async {
    selectedIndex = index;

    notifyListeners();
  }

  onSubmit(context,
      {appObjectId, appObjectType, int? id, bool? isBusiness = false}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final body = {
      "rate": selectedIndex,
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
        if (value.data['responseStatus'] == 1) {
          route.pop(context);
          isBusiness == true
              ? Provider.of<SearchProvider>(context, listen: false)
                  .businessDetailsAPI(context, id, isNotRouting: true)
              : Provider.of<AttractionProvider>(context, listen: false)
                  .attractionsDetailsAPI(context, id, isNotRoute: true);
        }
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, routeName.login, (Route<dynamic> route) => false);
      }
    });
  }

  clearAll(context) {
    route.pop(context);
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
