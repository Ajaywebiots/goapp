import '../../../../config.dart';

class RegisterFieldLayout extends StatelessWidget {
  final BuildContext? buildContext;

  const RegisterFieldLayout({super.key, this.buildContext});

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
                        context, register.lNameFocus, register.emailFocus),
                    prefixIcon: eSvgAssets.user,
                    validator: (value) =>
                        validation.nameValidation(context, value))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            ContainerWithTextLayout(title: appFonts.username),
            const VSpace(Sizes.s8),
            TextFieldCommon(
                    controller: register.userNameCtrl,
                    hintText: language(context, appFonts.chooseUsername),
                    focusNode: register.usernameFocus,
                    onFieldSubmitted: (value) => validation.fieldFocusChange(
                        context, register.usernameFocus, register.emailFocus),
                    prefixIcon: eSvgAssets.user,
                    validator: (value) =>
                        validation.nameValidation(context, value))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            ContainerWithTextLayout(title: language(context, appFonts.email)),
            const VSpace(Sizes.s8),
            TextFieldCommon(
                    controller: register.txtEmail,
                    hintText: language(context, appFonts.enterEmail),
                    focusNode: register.emailFocus,
                    onFieldSubmitted: (value) => validation.fieldFocusChange(
                        context, register.emailFocus, register.phoneFocus),
                    prefixIcon: eSvgAssets.email,
                    validator: (value) =>
                        validation.emailValidation(context, value))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            ContainerWithTextLayout(title: language(context, appFonts.phoneNo)),
            const VSpace(Sizes.s10),
            RegisterWidgetClass().phoneTextBox(
                context, register.txtPhone, register.phoneFocus,
                dialCode: "+30",
                onChanged: (CountryCodeCustom? code) =>
                    register.changeDialCode(code!),
                onFieldSubmitted: (value) => validation.fieldFocusChange(
                    context, register.phoneFocus, register.passwordFocus)),
            const VSpace(Sizes.s15),
            ContainerWithTextLayout(
                title: language(context, appFonts.password)),
            const VSpace(Sizes.s8),
            TextFieldCommon(
                    obscureText: register.isNewPassword,
                    controller: register.txtPass,
                    hintText: language(context, appFonts.enterPassword),
                    focusNode: register.passwordFocus,
                    prefixIcon: eSvgAssets.lock,
                    suffixIcon: SvgPicture.asset(
                            register.isNewPassword
                                ? eSvgAssets.hide
                                : eSvgAssets.eye,
                            fit: BoxFit.scaleDown)
                        .inkWell(onTap: () => register.newPasswordSeenTap()),
                    validator: (value) =>
                        validation.passValidation(context, value))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            ContainerWithTextLayout(
                title: language(context, appFonts.confirmPassword)),
            const VSpace(Sizes.s8),
            TextFieldCommon(
                hintText: language(context, appFonts.enterConfirmPassword),
                obscureText: register.isConfirmPassword,
                controller: register.txtConfirmPass,
                focusNode: register.confirmPasswordFocus,
                suffixIcon: SvgPicture.asset(
                        register.isConfirmPassword
                            ? eSvgAssets.hide
                            : eSvgAssets.eye,
                        fit: BoxFit.scaleDown)
                    .inkWell(onTap: () => register.confirmPasswordSeenTap()),
                prefixIcon: eSvgAssets.lock,
                validator: (value) => validation.confirmPassValidation(
                    context, value, register.txtPass.text)).paddingSymmetric(
                horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            const TermsLayout(),
            const VSpace(Sizes.s35),
            ButtonCommon(
                    title: language(context, appFonts.signUp),
                    onTap: () => register.signUp(buildContext!))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            RegisterWidgetClass().notMember(context)
          ]).paddingSymmetric(vertical: Insets.i20);
    });
  }
}
