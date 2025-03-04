import '../../../config.dart';
import '../../../providers/auth_providers/social_register_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';

class SocialRegScreen extends StatelessWidget {
  const SocialRegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SocialRegProvider>(builder: (context, socialRegPvr, child) {
      return DirectionalityRtl(
          child: Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(eImageAssets.appLogo, height: Sizes.s75),
          const HSpace(Sizes.s5),
          Text(language(context, appFonts.goSalamina),
              style: appCss.outfitBold38.textColor(appColor(context).darkText)),
          const VSpace(Sizes.s30)
        ]),
        Form(
            key: socialRegPvr.socialFormKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpace(Sizes.s35),
                  Text(
                      language(context, appFonts.signUpWithGoogle)
                          .toUpperCase(),
                      style: appCss.dmDenseBold20
                          .textColor(appColor(context).darkText)),
                  const VSpace(Sizes.s15),
                  Stack(clipBehavior: Clip.none, children: [
                    const FieldsBackground(),
                    Column(children: [
                      ContainerWithTextLayout(
                          title: language(context, appFonts.firstName)),
                      const VSpace(Sizes.s8),
                      TextFieldCommon(
                              controller: socialRegPvr.enterFName,
                              hintText: language(context, appFonts.enterFName),
                              focusNode: socialRegPvr.fNameFocus,
                              onFieldSubmitted: (value) =>
                                  validation.fieldFocusChange(
                                      context,
                                      socialRegPvr.fNameFocus,
                                      socialRegPvr.emailFocus),
                              prefixIcon: eSvgAssets.user,
                              validator: (value) =>
                                  validation.nameValidation(context, value))
                          .paddingSymmetric(horizontal: Insets.i20),
                      const VSpace(Sizes.s15),
                      ContainerWithTextLayout(
                          title: language(context, appFonts.lastName)),
                      const VSpace(Sizes.s8),
                      TextFieldCommon(
                              controller: socialRegPvr.enterLName,
                              hintText: language(context, appFonts.enterLName),
                              focusNode: socialRegPvr.lNameFocus,
                              onFieldSubmitted: (value) =>
                                  validation.fieldFocusChange(
                                      context,
                                      socialRegPvr.lNameFocus,
                                      socialRegPvr.emailFocus),
                              prefixIcon: eSvgAssets.user,
                              validator: (value) =>
                                  validation.nameValidation(context, value))
                          .paddingSymmetric(horizontal: Insets.i20),
                      const VSpace(Sizes.s15),
                      ContainerWithTextLayout(
                          title: language(context, appFonts.email)),
                      const VSpace(Sizes.s8),
                      TextFieldCommon(
                          controller: socialRegPvr.txtEmail,
                          hintText: language(context, appFonts.enterUsername),
                          focusNode: socialRegPvr.emailFocus,
                          onFieldSubmitted: (value) =>
                              validation.fieldFocusChange(
                                  context,
                                  socialRegPvr.emailFocus,
                                  socialRegPvr.phoneFocus),
                          prefixIcon: eSvgAssets.email,
                          validator: (value) => validation.emailValidation(
                              context, value)).paddingSymmetric(
                          horizontal: Insets.i20),
                      const VSpace(Sizes.s15),
                      ContainerWithTextLayout(
                          title: language(context, appFonts.phoneNo)),
                      const VSpace(Sizes.s10),
                      RegisterWidgetClass().phoneTextBox(context,
                          socialRegPvr.txtPhone, socialRegPvr.phoneFocus,
                          dialCode: "+91",
                          onChanged: (CountryCodeCustom? code) =>
                              socialRegPvr.changeDialCode(code!),
                          onFieldSubmitted: (value) =>
                              validation.fieldFocusChange(
                                  context,
                                  socialRegPvr.phoneFocus,
                                  socialRegPvr.passwordFocus)),
                      const TermsLayout().paddingDirectional(
                          top: Sizes.s30, bottom: Sizes.s35),
                      ButtonCommon(
                          title: language(context, appFonts.signUp),
                          onTap: () {
                            route.pushReplacementNamed(
                                context, routeName.homeScreen);
                          }).paddingSymmetric(horizontal: Insets.i20),
                      const VSpace(Sizes.s15),
                      RegisterWidgetClass().notMember(context)
                    ]).paddingSymmetric(vertical: Insets.i20)
                  ]),
                  const VSpace(Sizes.s25)
                ]).alignment(Alignment.centerLeft))
      ]).paddingSymmetric(horizontal: Insets.i20)))));
    });
  }
}
