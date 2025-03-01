import 'dart:developer';

import '../../../config.dart';
import 'layouts/reset_password_layout.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordProvider>(
        builder: (context1, resetPass, child) {
      log("RESET : ${resetPass.resetFormKey}");
      return LoadingComponent(
        child: StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms150).then((value) =>
              resetPass.loadingImage ==
              resetPass.loadImage(eImageAssets.userSlider)),
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                leading: CommonArrow(
                    arrow: /*rtl(context)
                            ? eSvgAssets.arrowRight
                            : */
                        eSvgAssets.arrowLeft1,
                    onTap: () =>
                        route.pop(context)).paddingOnly(
                    left: /*rtl(context) ? 0 : */ Insets.i20,
                    right: /*rtl(context) ? Insets.i20 :*/ 0),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                Form(
                    key: resetPass.resetFormKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //     language(context, appFonts.resetPassword)
                          //         .toUpperCase(),
                          //     style: appCss.dmDenseBold20
                          //         .textColor(appColor(context).darkText)),
                          // const VSpace(Sizes.s5),
                          // Text(language(context, appFonts.resetPasswordDesc),
                          //     style: appCss.dmDenseLight14
                          //         .textColor(appColor(context).lightText)),
                          Align(
                              alignment: Alignment.center,
                              child: AuthTopLayout(
                                isResetPass: true,
                                image: eImageAssets.resetPassword,
                                title: appFonts.resetPassword,
                                subTitle: appFonts.resetPasswordDesc,
                                isNumber: true,
                              )),
                          const ResetPasswordLayout()
                        ]).alignment(Alignment.centerLeft))
              ]).paddingSymmetric(
                horizontal: Insets.i20,
              )))),
        ),
      );
    });
  }
}
