import 'dart:developer';

import 'package:goapp/config.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SharedPreferences? pref;
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  bool isPassword = true;

  onLogin(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    /*  route.pushReplacementNamed(context, routeName.dashboard);*/
    if (formKey.currentState!.validate()) {
      login(context);
    }
  }

  demoCreds() {
    emailController.text = "user@example.com";
    passwordController.text = "123456789";
    notifyListeners();
  }

  // password see tap
  passwordSeenTap() {
    isPassword = !isPassword;
    notifyListeners();
  }

  //login
  login(context) async {
    log("aaa success login");
  }

  continueAsGuestTap(context) async {
    pref = await SharedPreferences.getInstance();

    pref!.setBool(session.isContinueAsGuest, true);
    log("CCC");
    // route.pushReplacementNamed(context, routeName.dashboard);
  }

  googleLogin() {
    /*apiServices.commonApi(api.googleLogin, [], ApiType.get).then((value) {
      if (value.isSuccess!) {
        log("ssss ${value.data}");
      }
    });*/
  }
}
