import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:goapp/config.dart';

import '../../services/api_service.dart';

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
    showLoading(context);
    try {
      var body = {
        "username": emailController.text,
        "password": passwordController.text
      };
      apiServices.commonApi(api.authenticate, body, ApiType.post).then((value) {
        if (value.isSuccess!) {
          hideLoading(context);
          route.pushNamed(context, routeName.homeScreen);
        }
      });
    } catch (e) {
      hideLoading(context);
      log("EEEE : login $e");
    }
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

  final Dio dio = Dio();
  Map<String, dynamic>? userData;

  Future<void> loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile']);

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;

      try {
        Response response = await dio.post(
          "https://go-1-api.azurewebsites.net/api/authentication/facebook",
          data: jsonEncode({"access_token": accessToken.tokenString}),
          options: Options(headers: {"Content-Type": "application/json"}),
        );

        if (response.statusCode == 200) {
          notifyListeners();
          userData = response.data;
          notifyListeners();
        } else {
          log("Backend authentication failed: ${response.data}");
        }
      } catch (e) {
        print("API Error: $e");
      }
    } else {
      print("Facebook Login Failed: ${result.status}");
    }
  }
}
