import 'package:goapp/widgets/DirectionalityRtl.dart';

import '../../../config.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context1, register, child) {
      return LoadingComponent(
          child: DirectionalityRtl(
        child: Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(eImageAssets.appLogo, height: Sizes.s75),
            const HSpace(Sizes.s5),
            Text(language(context, appFonts.goSalamina),
                style:
                    appCss.outfitBold38.textColor(appColor(context).darkText)),
            const VSpace(Sizes.s30)
          ]),
          Form(
              key: register.registerFormKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VSpace(Sizes.s15),
                    Text(language(context, appFonts.signup).toUpperCase(),
                        style: appCss.dmDenseBold20
                            .textColor(appColor(context).darkText)),
                    const VSpace(Sizes.s15),
                    Stack(clipBehavior: Clip.none, children: [
                      const FieldsBackground(),
                      RegisterFieldLayout()
                    ]),
                    const VSpace(Sizes.s25),
                  ]).alignment(Alignment.centerLeft))
        ]).paddingSymmetric(horizontal: Insets.i20)))),
      ));
    });
  }
}
