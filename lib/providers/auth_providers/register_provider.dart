import 'dart:convert';
import 'dart:developer';

import 'package:goapp/config.dart';
import 'package:goapp/widgets/alert_message_common.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterProvider extends ChangeNotifier {
  bool isNewPassword = true, isConfirmPassword = true, isCheck = false;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  String dialCode = "+91";
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtConfirmPass = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  //new password see tap
  newPasswordSeenTap() {
    isNewPassword = !isNewPassword;
    notifyListeners();
  }

  //confirm password see tap
  confirmPasswordSeenTap() {
    isConfirmPassword = !isConfirmPassword;
    notifyListeners();
  }

  signUp(context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (isCheck == false) {
      Fluttertoast.showToast(
          msg: language(context, appFonts.pleaseCheckTerms));
      /*snackBarMessengers(context, message: appFonts.pleaseCheckTerms);*/
    } else if (registerFormKey.currentState!.validate() && isCheck == true) {
      showLoading(context);
      notifyListeners();
      // String token = await getFcmToken();
      var body = {
        "name": txtName.text,
        "email": txtEmail.text,
        "phone": txtPhone.text,
        "code": dialCode,
        "password": txtPass.text,
        "password_confirmation": txtPass.text,
        // "fcm_token": token
      };

      log("body : $body");

    }
  }

  isCheckBoxCheck(value) {
    isCheck = value;
    notifyListeners();
  }

  onBack() {
    txtName.text = "";
    txtEmail.text = "";
    txtPhone.text = "";
    dialCode = "+91";
    txtPass.text = "";
    txtConfirmPass.text = "";
    notifyListeners();
  }

  changeDialCode(CountryCodeCustom country) {
    dialCode = country.dialCode!;
    notifyListeners();
  }
}
