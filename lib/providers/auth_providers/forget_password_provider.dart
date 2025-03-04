import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:goapp/config.dart';
import '../../services/api_service.dart';

class ForgetPasswordProvider with ChangeNotifier {
  TextEditingController forgetController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final GlobalKey<FormState> forgetKey = GlobalKey<FormState>();

  onTapSendOtp(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    /*if (forgetKey.currentState!.validate()) {
      apiServices
          .commonApi(api.forgotPassword, [], ApiType.post, isToken: false)
          .then((value) {
        if (value.isSuccess!) {
          log("Response: ${value.data}");
        }
      });
    } else {

    }*/
    route.pushNamed(context, routeName.verifyOtp,
        arg: {"email": forgetController.text});
  }

  @override
  void dispose() {
    forgetController.dispose();
    emailFocus.dispose();
    super.dispose();
  }
}
