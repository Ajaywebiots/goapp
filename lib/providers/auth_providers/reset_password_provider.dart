import 'dart:developer';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:goapp/config.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';

import '../../services/api_service.dart';

class ResetPasswordProvider extends ChangeNotifier {
  TextEditingController txtNewPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();
  bool isNewPassword = true, isConfirmPassword = true;
  String? email, otp;
  Future<ui.Image>? loadingImage;

  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  double slider = 4.0;

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

  reset(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (resetFormKey.currentState!.validate()) {
      showLoading(context);

      var body = {
        "password": txtNewPassword.text,
        "retypedPassword": txtConfirmPassword.text
      };

      try {
        apiServices
            .commonApi(api.resetPassword, body, ApiType.patch, isToken: true)
            .then((value) {
          if (value.data['responseStatus'] == 1) {
            hideLoading(context);
            showCupertinoDialog(
                context: context,
                builder: (context1) {
                  return DirectionalityRtl(
                      child: AlertDialogCommon(
                          title:
                              language(context, appFonts.successfullyChanged),
                          height: Sizes.s120,
                          image: eImageAssets.successReset,
                          subtext: language(context, appFonts.thankYou),
                          bText1: language(context, appFonts.loginAgain),
                          b1OnTap: () {
                            txtNewPassword.text = "";
                            txtConfirmPassword.text = "";
                            notifyListeners();
                            Navigator.pop(context1);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MultiProvider(
                                            providers: [
                                              ChangeNotifierProvider(
                                                  create: (_) =>
                                                      LoginProvider()),
                                              ChangeNotifierProvider(
                                                  create: (_) =>
                                                      ForgetPasswordProvider()),
                                              ChangeNotifierProvider(
                                                  create: (_) =>
                                                      VerifyOtpProvider()),
                                            ],
                                            child: const LoginScreen(),
                                            builder: (context, child) {
                                              return child!;
                                            })));
                          }));
                });
            notifyListeners();
          } else {
            hideLoading(context);
            showMessage(context, value.data['responseMessage']);
          }
        });
      } catch (e) {
        hideLoading(context);
        log("CATCH resetPassword: $e");
      }
    }
  }

  static getDisposableProviders(BuildContext context) {
    return [Provider.of<LoginProvider>(context, listen: false)];
  }

  static void disposeAllDisposableProviders(BuildContext context) {
    getDisposableProviders(context).forEach((disposableProvider) {
      disposableProvider.dispose();
    });
  }

  getArg(context) {
    notifyListeners();
  }

  Future<ui.Image> loadImage(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
}
