import '../../../../config.dart';

class RegisterFieldLayout extends StatelessWidget {
  const RegisterFieldLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
        builder: (registerContext, register, child) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerWithTextLayout(
                title: language(context, appFonts.firstName)),
            const VSpace(Sizes.s8),
            TextFieldCommon(
                    controller: register.enterFName,
                    hintText: language(context, appFonts.enterFName),
                    focusNode: register.fNameFocus,
                    onFieldSubmitted: (value) => validation.fieldFocusChange(
                        context, register.fNameFocus, register.emailFocus),
                    prefixIcon: eSvgAssets.user,
                    validator: (value) =>
                        validation.nameValidation(context, value))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            ContainerWithTextLayout(
                title: language(context, appFonts.lastName)),
            const VSpace(Sizes.s8),
            TextFieldCommon(
                    controller: register.enterLName,
                    hintText: language(context, appFonts.enterLName),
                    focusNode: register.lNameFocus,
                    onFieldSubmitted: (value) => validation.fieldFocusChange(
                        context, register.lNameFocus, register.phoneFocus),
                    prefixIcon: eSvgAssets.user,
                    validator: (value) =>
                        validation.nameValidation(context, value))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            ContainerWithTextLayout(
                title: language(context, appFonts.phoneNumber)),
            const VSpace(Sizes.s10),
            RegisterWidgetClass().phoneTextBox(
                context, register.txtPhone, register.phoneFocus,
                dialCode: "+30",
                onChanged: (CountryCodeCustom? code) =>
                    register.changeDialCode(code!),
                onFieldSubmitted: (value) => validation.fieldFocusChange(
                    context, register.phoneFocus, register.emailFocus)),
            const VSpace(Sizes.s15),
            ContainerWithTextLayout(title: language(context, appFonts.email)),
            const VSpace(Sizes.s8),
            TextFieldCommon(
                    controller: register.txtEmail,
                    hintText: language(context, appFonts.enterEmail),
                    focusNode: register.emailFocus,
                    onFieldSubmitted: (value) => validation.fieldFocusChange(
                        context, register.emailFocus, register.emailFocus),
                    prefixIcon: eSvgAssets.email,
                    validator: (value) =>
                        validation.emailValidation(context, value))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            const TermsLayout(),
            const VSpace(Sizes.s35),
            ButtonCommon(
                    title: language(context, appFonts.signUp),
                    onTap: () => register.signUp(context))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            RegisterWidgetClass().notMember(context)
          ]).paddingSymmetric(vertical: Insets.i20);
    });
  }
}
