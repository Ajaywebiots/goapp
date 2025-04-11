import 'package:flutter/material.dart';

import '../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../auth_screens/verify_otp_screen/layouts/common_otp_layout.dart';

class VerifyOtpInApp extends StatelessWidget {
  const VerifyOtpInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DirectionalityRtl(
            child: Scaffold(
                body: SafeArea(
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
          Stack(children: [
            Align(
                alignment:
                    rtl(context) ? Alignment.topRight : Alignment.topLeft,
                child: CommonArrow(
                    arrow: rtl(context)
                        ? eSvgAssets.arrowRight
                        : eSvgAssets.arrowLeft1,
                    onTap: () => route.pop(context)).paddingAll(Insets.i20)),
            Align(
                alignment: Alignment.center,
                child: AuthTopLayout(
                    image: eImageAssets.verifyOtp,
                    title: language(context, appFonts.verifyOtp),
                    subTitle: language(context, appFonts.enterTheCode),
                    isNumber: true,
                    number: "9900990099"))
          ]),
          Stack(children: [
            const FieldsBackground(),
            Form(
                // key: verifyResetPvr.otpKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  ContainerWithTextLayout(
                      title: language(context, appFonts.enterOtp)),
                  const VSpace(Sizes.s8),
                  const CommonOtpLayout(),
                  const VSpace(Sizes.s20),
                  ButtonCommon(
                      title: language(context, appFonts.verifyProceed),
                      margin: Insets.i20,
                      onTap: () => route.pushNamed(
                          context, routeName.resetPasswordScreenInApp)),
                  const VSpace(Sizes.s15),
                  // verifyResetPvr.isCountDown
                  //     ? Text("1:00",
                  //             style: appCss.dmDenseMedium14
                  //                 .textColor(appColor(context).primary))
                  //         .alignment(Alignment.center)
                  //     : Text(language(context, appFonts.resendCode),
                  //             style: appCss.dmDenseMedium14
                  //                 .textColor(appColor(context).primary))
                  //         .inkWell(onTap: () {})
                  //         .alignment(Alignment.center)
                ]).paddingSymmetric(vertical: Insets.i20))
          ]).paddingSymmetric(horizontal: Insets.i20)
        ]))))));
  }
}
