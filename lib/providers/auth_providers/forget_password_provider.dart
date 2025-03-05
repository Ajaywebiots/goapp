import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:goapp/config.dart';
import '../../services/api_service.dart';

class ForgetPasswordProvider with ChangeNotifier {
  TextEditingController forgetController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final GlobalKey<FormState> forgetKey = GlobalKey<FormState>();

  onTapSendOtp(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    var body = {"phoneNumber": forgetController.text};
    if (forgetKey.currentState!.validate()) {
      try {
        apiServices
            .commonApi(api.forgotPassword, body, ApiType.post, isToken: false)
            .then((value) {
          if (value.isSuccess!) {
            log("Response: ${value.data}");
            route.pushNamed(context, routeName.verifyOtp, arg: {
              "phoneNumber": forgetController.text,
              "code": value.data["code"]
            });
          }
        });
      } on Exception catch (e) {
        log("EEEE : onTapSendOtp  $e");
        // TODO
      }
    } else {
      log("Validation Error");
    }
  }

  @override
  void dispose() {
    forgetController.dispose();
    emailFocus.dispose();
    super.dispose();
  }
}
