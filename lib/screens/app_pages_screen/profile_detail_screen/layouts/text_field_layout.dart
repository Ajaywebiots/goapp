import '../../../../config.dart';
import '../../../../providers/app_pages_provider/profile_detail_provider.dart';

class TextFieldLayout extends StatelessWidget {
  final ProfileDetailProvider? value;

  const TextFieldLayout({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ContainerWithTextLayout(title: language(context, appFonts.firstName)),
      const VSpace(Sizes.s8),
      TextFieldCommon(
              controller: value!.txtFName,
              hintText: language(context, appFonts.enterFName),
              focusNode: value!.nameFocus,
              onFieldSubmitted: (values) => validation.fieldFocusChange(
                  context, value!.nameFocus, value!.emailFocus),
              prefixIcon: eSvgAssets.user,
              validator: (value) => validation.nameValidation(context, value))
          .paddingSymmetric(horizontal: Insets.i20),
      const VSpace(Sizes.s15),
      ContainerWithTextLayout(title: language(context, appFonts.lastName)),
      const VSpace(Sizes.s8),
      TextFieldCommon(
              controller: value!.txtLName,
              hintText: language(context, appFonts.enterLName),
              focusNode: value!.emailFocus,
              onFieldSubmitted: (values) => validation.fieldFocusChange(
                  context, value!.emailFocus, value!.phoneFocus),
              prefixIcon: eSvgAssets.user,
              validator: (value) => validation.emailValidation(context, value))
          .paddingSymmetric(horizontal: Insets.i20),
      const VSpace(Sizes.s15),
      ContainerWithTextLayout(title: language(context, appFonts.email)),
      const VSpace(Sizes.s8),
      TextFieldCommon(
              controller: value!.txtEmail,
              hintText: language(context, appFonts.enterEmail),
              focusNode: value!.emailFocus,
              onFieldSubmitted: (values) => validation.fieldFocusChange(
                  context, value!.emailFocus, value!.phoneFocus),
              prefixIcon: eSvgAssets.email,
              validator: (value) => validation.emailValidation(context, value))
          .paddingSymmetric(horizontal: Insets.i20),
      const VSpace(Sizes.s15),
      ContainerWithTextLayout(title: language(context, appFonts.phoneNo)),
      const VSpace(Sizes.s10),
      RegisterWidgetClass().phoneTextBox(
          context, value!.txtPhone, value!.phoneFocus,
          // onChanged: (CountryCode? code) => value!.changeDialCode(code!),
          onFieldSubmitted: (values) => validation.fieldFocusChange(
              context, value!.phoneFocus, value!.phoneFocus))
    ]);
  }
}
