import '../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';
import 'layouts/phone_otp_.dart';

class LoginPhoneOtpVerifyScreen extends StatelessWidget {
  const LoginPhoneOtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VerifyOtpProvider>(builder: (context1, otpCtrl, child) {
      return LoadingComponent(
          child: StatefulWrapper(
              onInit: () {
                final args = ModalRoute.of(context)?.settings.arguments;
                otpCtrl.getArgument(args);
              },
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
                              number:
                                  "\"${otpCtrl.dialCode} ${otpCtrl.phone}\""))
                    ]),
                    SizedBox(
                        child: Stack(children: [
                      const FieldsBackground(),
                      Form(
                          key: otpCtrl.otpKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ContainerWithTextLayout(
                                    title:
                                        language(context, appFonts.enterOtp)),
                                const VSpace(Sizes.s8),
                                const CommonOtpLayout1(),
                                const VSpace(Sizes.s20),
                                ButtonCommon(
                                    title: appFonts.verifyProceed,
                                    margin: Insets.i20,
                                    onTap: () =>
                                        otpCtrl.onTapVerification(context)),
                                const VSpace(Sizes.s15),
                                otpCtrl.isCountDown
                                    ? Text("${otpCtrl.min} : ${otpCtrl.sec}",
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
                                            onTap: () =>
                                                otpCtrl.resendOtp(context))
                                        .alignment(Alignment.center)
                              ]).paddingSymmetric(vertical: Insets.i20))
                    ]).paddingSymmetric(horizontal: Insets.i20))
                  ])))))));
    });
  }
}
