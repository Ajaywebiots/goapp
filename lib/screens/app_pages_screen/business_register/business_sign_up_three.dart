import '../../../../config.dart';
import '../../../providers/app_pages_provider/register_company_provider.dart';
import '../../../providers/common_providers/common_api_provider.dart';

class BusinessSignUpThree extends StatelessWidget {
  const BusinessSignUpThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SignUpCompanyProvider, CommonApiProvider>(
        builder: (context1, value, api, child) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: value.signupFormKey3,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ContainerWithTextLayout(title: "Phone Number")
                .paddingOnly(bottom: Insets.i8, top: Insets.i20),
            RegisterWidgetClass().phoneTextBox(
                dialCode: value.providerDialCode,
                context,
                value.providerNumber,
                value.providerNumberFocus,
                onChanged: (CountryCodeCustom? code) =>
                    value.changeProviderDialCode(code!),
                onFieldSubmitted: (values) => validation.fieldFocusChange(
                    context, value.providerNumberFocus, value.emailFocus)),
            ContainerWithTextLayout(title: "email")
                .paddingOnly(bottom: Insets.i8, top: Insets.i20),
            TextFieldCommon(
                    focusNode: value.websiteFocus,
                    // validator: (v) => validation.emailValidation(context, v),
                    controller: value.website,
                    hintText: "Enter contact email",
                    prefixIcon: eSvgAssets.email)
                .paddingSymmetric(horizontal: Insets.i20),
            ContainerWithTextLayout(title: "Website")
                .paddingOnly(bottom: Insets.i8, top: Insets.i20),
            TextFieldCommon(
                    focusNode: value.fbFocus,
                    // validator: (v) => validation.emailValidation(context, v),
                    controller: value.fbCtrl,
                    hintText: "Enter website address",
                    prefixIcon: eSvgAssets.global)
                .paddingSymmetric(horizontal: Insets.i20),
            ContainerWithTextLayout(title: "Facebook")
                .paddingOnly(bottom: Insets.i8, top: Insets.i20),
            TextFieldCommon(
                    focusNode: value.instagramFocus,
                    // validator: (v) => validation.emailValidation(context, v),
                    controller: value.instagramCtrl,
                    hintText: "Enter name",
                    isPrefImage: true,
                    isNumber: false,
                    prefixImage: eImageAssets.fbIcon)
                .paddingSymmetric(horizontal: Insets.i20),
            ContainerWithTextLayout(title: "Instagram")
                .paddingOnly(bottom: Insets.i8, top: Insets.i20),
            TextFieldCommon(
                    focusNode: value.instagramFocus,
                    // validator: (v) => validation.emailValidation(context, v),
                    controller: value.instagramCtrl,
                    hintText: "Enter name",
                    isPrefImage: true,
                    prefixImage: eImageAssets.insta)
                .paddingSymmetric(horizontal: Insets.i20),
            ContainerWithTextLayout(title: "TikTok")
                .paddingOnly(bottom: Insets.i8, top: Insets.i20),
            TextFieldCommon(
                    focusNode: value.tiktokFocus,
                    // validator: (v) => validation.emailValidation(context, v),
                    controller: value.tiktokCtrl,
                    hintText: "Enter name",
                    isPrefImage: true,
                    prefixImage: eImageAssets.tiktok)
                .paddingSymmetric(horizontal: Insets.i20),
            ContainerWithTextLayout(title: "YouTube")
                .paddingOnly(bottom: Insets.i8, top: Insets.i20),
            TextFieldCommon(
                    focusNode: value.ytFocus,
                    // validator: (v) => validation.emailValidation(context, v),
                    controller: value.ytCtrl,
                    hintText: "Enter name",
                    isPrefImage: true,
                    prefixImage: eImageAssets.ytIcon)
                .paddingSymmetric(horizontal: Insets.i20),
          ]),
        ),
      );
    });
  }
}
