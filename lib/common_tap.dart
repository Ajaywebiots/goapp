import 'dart:io';

import 'package:goapp/widgets/alert_message_common.dart';
import 'package:url_launcher/url_launcher.dart';

import 'config.dart';
import 'models/service_model.dart';

//
const mail = 'mailto:';
const call = 'tel:';
const googleMapLink = 'https://www.google.com/maps/search/?api=1&query=';
const wpLink = 'whatsapp://send?phone=';
bool isOpen = false;

// onBook(context, Services service,
//     {GestureTapCallback? addTap,
//     minusTap,
//     isPackage = false,
//     packageServiceId}) async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   bool isGuest = preferences.getBool(session.isContinueAsGuest) ?? false;
//   if (isGuest == false) {
//   } else {
//     route.pushAndRemoveUntil(context);
//   }
// }

commonUrlTap(context, String address,
    {LaunchMode launchMode = LaunchMode.inAppWebView}) async {
  await launchUrl(Uri.parse(address), mode: launchMode).catchError((e) {
    snackBarMessengers(context);
  });
}

launchCall(context, String? url) {
  if (url != null) {
    if (Platform.isIOS) {
      commonUrlTap(context, '$call//$url',
          launchMode: LaunchMode.externalApplication);
    } else {
      commonUrlTap(context, '$call$url',
          launchMode: LaunchMode.externalApplication);
    }
  }
}

launchMap(context, String? url) {
  commonUrlTap(context, googleMapLink + url!,
      launchMode: LaunchMode.externalApplication);
}

wpTap(context, String? url) {
  commonUrlTap(context, wpLink + url!,
      launchMode: LaunchMode.externalApplication);
}
