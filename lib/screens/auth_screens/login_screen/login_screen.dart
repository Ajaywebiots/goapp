import '../../../config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (loginContext, value, child) {
      return LoadingComponent(
          child: Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
        const VSpace(Sizes.s20),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(eImageAssets.appLogo,
              height: Sizes.s75, width: Sizes.s75),
          const HSpace(Sizes.s5),
          Text(appFonts.goSalamina,
              style: appCss.outfitBold38.textColor(appColor(context).darkText)),
        ]),
        const VSpace(Sizes.s20),
        Form(
            key: value.formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(language(context, appFonts.login),
                      style: appCss.dmDenseBold20
                          .textColor(appColor(context).darkText)),
                  const VSpace(Sizes.s15),
                  const LoginLayout(),
                  const VSpace(Sizes.s35),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const ContinueWithContainer(),
                    Text(language(context, appFonts.orContinue),
                            style: appCss.dmDenseMedium14
                                .textColor(appColor(context).lightText))
                        .paddingSymmetric(horizontal: Insets.i10),
                    const ContinueWithContainer()
                  ]),
                  const VSpace(Sizes.s35),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset(eImageAssets.google,
                            height: Sizes.s35, width: Sizes.s35)
                        .paddingAll(Insets.i15)
                        .decorated(
                            shape: BoxShape.circle,
                            color: appColor(context).fieldCardBg,
                            border: Border.all(color: Color(0xffE5E8EA)))
                        .inkWell(onTap: () => value.googleLogin()),
                    const HSpace(Sizes.s15),
                    Image.asset(eImageAssets.fbLogo,
                            height: Sizes.s35, width: Sizes.s35)
                        .paddingAll(Insets.i15)
                        .decorated(
                            shape: BoxShape.circle,
                            color: appColor(context).fieldCardBg,
                            border: Border.all(color: Color(0xffE5E8EA)))
                        .inkWell(onTap: () => value.loginWithFacebook()),
                    const HSpace(Sizes.s15),
                    Image.asset(eImageAssets.mobile,
                            height: Sizes.s35, width: Sizes.s35)
                        .paddingAll(Insets.i15)
                        .decorated(
                            shape: BoxShape.circle,
                            color: appColor(context).fieldCardBg,
                            border: Border.all(color: Color(0xffE5E8EA)))
                        .inkWell(
                            onTap: () => route.pushNamed(
                                context, routeName.loginWithPhone))
                  ])
                ]).alignment(Alignment.centerLeft))
      ]).paddingSymmetric(horizontal: Insets.i20)))));
    });
  }
}
