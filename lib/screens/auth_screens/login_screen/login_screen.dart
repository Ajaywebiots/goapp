import 'package:goapp/config.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (loginContext, value, child) {
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);

      return LoadingComponent(
          child: DirectionalityRtl(
              child: Scaffold(
                  body: SafeArea(
                      child: SingleChildScrollView(
                          child: Column(children: [
        const VSpace(Sizes.s20),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(eImageAssets.appLogo,
              height: Sizes.s75, width: Sizes.s75),
          const HSpace(Sizes.s5),
          Text(language(context, appFonts.goSalamina),
              style: appCss.outfitBold38.textColor(appColor(context).darkText))
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
                  const VSpace(Sizes.s55),
                  ButtonCommon(
                          title: language(context, appFonts.autoFetch),
                          color: Colors.white,
                          style: appCss.dmDenseSemiBold16
                              .textColor(appColor(context).primary),
                          borderColor: appColor(context).primary,
                          onTap: () => value.autoFetch())
                      .paddingSymmetric(horizontal: Insets.i20),
                  const VSpace(Sizes.s15),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const ContinueWithContainer(),
                    Text(language(context, appFonts.orContinue),
                            style: appCss.dmDenseMedium14
                                .textColor(appColor(context).lightText))
                        .paddingSymmetric(horizontal: Insets.i10),
                    const ContinueWithContainer()
                  ]),
                  const VSpace(Sizes.s35),
                  Row(
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
                          .toList()),
                  const VSpace(Sizes.s20),
                ]).alignment(Alignment.centerLeft))
      ]).paddingSymmetric(horizontal: Insets.i20))))));
    });
  }
}
