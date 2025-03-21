import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:goapp/config.dart';

import '../../services/api_service.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController userName = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SharedPreferences? pref;
  final FocusNode userNameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  bool isPassword = true;

  onLogin(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      login(context);
    }
  }

  autoFetch() {
    userName.text = "ajay2404";
    passwordController.text = "123456";
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
        "username": userName.text,
        "password": passwordController.text
      };
      apiServices
          .commonApi(api.authenticate, body, ApiType.post)
          .then((value) async {
        if (value.data['responseStatus'] == 1) {
          hideLoading(context);
          log("login data ${value.data}");
          log("token  ${value.data['token']}");
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString(session.accessToken, value.data['token']);
          log("accessToken ${pref.getString(session.accessToken)}");

          route.pushNamed(context, routeName.dashboard);
        } else {
          hideLoading(context);
          showMessage(context, value.data['responseMessage']);
        }
      });
    } catch (e) {
      hideLoading(context);
      log("EEEE : login $e");
    }
  }

  googleLogin(context) {
    route.pushNamed(context, routeName.socialRegister);
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
        log("API Error: $e");
      }
    } else {
      print("Facebook Login Failed: ${result.status}");
    }
  }
}
