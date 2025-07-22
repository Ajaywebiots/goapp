import 'package:goapp/config.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (loginContext, value, child) {
      final sss = Provider.of<LoginWithPhoneProvider>(context, listen: false);
      return StatefulWrapper(
          onInit: () => Future.delayed(
              DurationClass.ms150, () => value.locationPermission()),
          child: DirectionalityRtl(
              child: Scaffold(
                  body: SafeArea(
                      child: SingleChildScrollView(
                          child: Column(children: [
            // const VSpace(Sizes.s20),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset(eImageAssets.appLogo,
                  height: Sizes.s75, width: Sizes.s75),
              const HSpace(Sizes.s5),
              Text(language(context, appFonts.goSalamina),
                  style:
                      appCss.outfitBold38.textColor(appColor(context).darkText))
            ]),
            const VSpace(Sizes.s20),
            Form(
                key: sss.globalKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(language(context, appFonts.login),
                          style: appCss.dmDenseBold20
                              .textColor(appColor(context).darkText)),
                      const VSpace(Sizes.s15),
                      const LoginLayout(),
                      const VSpace(Sizes.s26),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ContinueWithContainer(),
                            Text(language(context, appFonts.orContinue),
                                    style: appCss.dmDenseMedium14
                                        .textColor(appColor(context).lightText))
                                .paddingSymmetric(horizontal: Insets.i10),
                            const ContinueWithContainer()
                          ]),
                      const VSpace(Sizes.s35),
                      ButtonCommon(
                              mainAxisAlignment: MainAxisAlignment.start,
                              onTap: () {
                                value.signInWithFacebook(context);
                              },
                              isRightIcon: true,
                              rightIcon: Image.asset(eImageAssets.fbLogo,
                                  height: 30, fit: BoxFit.contain),
                              title: 'Login with Facebook',
                              color: Color(0xff4D66FF))
                          .paddingSymmetric(horizontal: Insets.i20),
                      const VSpace(Sizes.s15),
                      ButtonCommon(
                              mainAxisAlignment: MainAxisAlignment.start,
                              onTap: () {
                                value.signInWithGoogle(context);
                              },
                              isRightIcon: true,
                              rightIcon: Image.asset(eImageAssets.google,
                                  height: 25, fit: BoxFit.contain),
                              title: 'Login with Google',
                              color: appColor(context).darkText)
                          .paddingSymmetric(horizontal: Insets.i20),
                      /*  Row(
                      spacing: Insets.i15,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: appArray.loginOptions
                          .map((option) => Image.asset(option["image"],
                                  height: Sizes.s35, width: Sizes.s35)
                              .paddingAll(Insets.i15)
                              .decorated(
                                  shape: BoxShape.circle,
                                  color: appColor(context).fieldCardBg,
                                  border: Border.all(
                                      color: appColor(context).borderStroke))
                              .inkWell(
                                  onTap: () =>
                                      option["onTap"](context, loginProvider)))
                          .toList()),*/
                      const VSpace(Sizes.s20),
                    ]).alignment(Alignment.centerLeft))
          ]).paddingSymmetric(horizontal: Insets.i20))))));
    });
  }
}
