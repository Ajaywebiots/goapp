import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:goapp/config.dart';
import 'package:goapp/services/api_service.dart';

import '../../widgets/alert_message_common.dart';

class RegisterProvider extends ChangeNotifier {
  bool isNewPassword = true, isConfirmPassword = true, isCheck = false;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  String dialCode = "+30";

  TextEditingController enterFName = TextEditingController();
  TextEditingController enterLName = TextEditingController();
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtConfirmPass = TextEditingController();

  final FocusNode usernameFocus = FocusNode();
  final FocusNode fNameFocus = FocusNode();
  final FocusNode lNameFocus = FocusNode();
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
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      if (isCheck == false) {
        Fluttertoast.showToast(
            msg: language(context, appFonts.pleaseCheckTerms));
      } else if (registerFormKey.currentState!.validate() && isCheck == true) {
        showLoading(context);
        notifyListeners();
        var body = {
          "username": userNameCtrl.text,
          "firstName": enterFName.text,
          "lastName": enterLName.text,
          "email": txtEmail.text,
          "phoneNumber": txtPhone.text,
          "code": dialCode,
          "password": txtPass.text,
          "confirmPassword": txtConfirmPass.text
        };
        log("body : $body");
        apiServices
            .commonApi(api.register, body, ApiType.post, isToken: false)
            .then((value) {
          if (value.isSuccess == true) {
            if (value.data['responseStatus'] == 1) {
              log("ssss ${value.data}");
              hideLoading(context);
              userNameCtrl.text = "";
              enterFName.text = "";
              enterLName.text = "";
              txtEmail.text = "";
              txtPhone.text = "";
              dialCode = "+30";
              txtPass.text = "";
              txtConfirmPass.text = "";

              route.pushReplacementNamed(context, routeName.login);
            } else {
              hideLoading(context);
              showMessage(context, value.data['responseMessage']);
            }
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, routeName.login, (Route<dynamic> route) => false);
          }
        });
      }
    } catch (e) {
      log("EEEE : signUp $e");
    }
  }

  isCheckBoxCheck(value) {
    isCheck = value;
    notifyListeners();
  }

  onBack() {
    enterFName.text = "";
    enterLName.text = "";
    userNameCtrl.text = "";
    txtEmail.text = "";
    txtPhone.text = "";
    dialCode = "+30";
    txtPass.text = "";
    txtConfirmPass.text = "";
    notifyListeners();
  }

  changeDialCode(CountryCodeCustom country) {
    dialCode = country.dialCode!;
    notifyListeners();
  }
}
