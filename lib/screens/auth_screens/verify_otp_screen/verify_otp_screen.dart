import 'dart:developer';

import '../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';
import 'layouts/common_otp_layout.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {





  @override
  Widget build(BuildContext context) {
    return Consumer<VerifyResetPasswordProvider>(
        builder: (context1, verifyResetPvr, child) {
      return LoadingComponent(
          child: StatefulWrapper(
              onInit: () => Future.delayed(DurationClass.ms50)
                  .then((value) => verifyResetPvr.getArgument(context)),
              child: DirectionalityRtl(
                  child: Scaffold(
                      body: SafeArea(
                          child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                    Stack(children: [
                      Align(
                          alignment: rtl(context)
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          child: CommonArrow(
                                  arrow: rtl(context)
                                      ? eSvgAssets.arrowRight
                                      : eSvgAssets.arrowLeft1,
                                  onTap: () => route.pop(context))
                              .paddingAll(Insets.i20)),
                      Align(
                          alignment: Alignment.center,
                          child: AuthTopLayout(
                              image: eImageAssets.verifyOtp,
                              title: language(context, appFonts.verifyOtp),
                              subTitle:
                                  language(context, appFonts.enterTheCode),
                              isNumber: true,
                              number: "\"${verifyResetPvr.phoneNum}\""))
                    ]),
                    Stack(children: [
                      const FieldsBackground(),
                      Form(
                          key: verifyResetPvr.otpKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ContainerWithTextLayout(
                                    title:
                                        language(context, appFonts.enterOtp)),
                                const VSpace(Sizes.s8),
                                const CommonOtpLayout(),
                                const VSpace(Sizes.s20),
                                ButtonCommon(
                                    title: language(
                                        context, appFonts.verifyProceed),
                                    margin: Insets.i20,
                                    onTap: () =>
                                        verifyResetPvr.onTapVerify(context)),
                                const VSpace(Sizes.s15),
                                verifyResetPvr.isCountDown
                                    ? Text("${verifyResetPvr.min} : ${verifyResetPvr.sec}",
                                            style: appCss.dmDenseMedium14
                                                .textColor(
                                                    appColor(context).primary))
                                        .alignment(Alignment.center)
                                    : Text(
                                            language(
                                                context, appFonts.resendCode),
                                            style: appCss.dmDenseMedium14
                                                .textColor(
                                                    appColor(context).primary))
                                        .inkWell(
                                            onTap: () => verifyResetPvr
                                                .resendOtp(context))
                                        .alignment(Alignment.center)
                              ]).paddingSymmetric(vertical: Insets.i20))
                    ]).paddingSymmetric(horizontal: Insets.i20)
                  ])))))));
    });
  }
}
