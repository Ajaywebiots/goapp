import '../../../../config.dart';
import '../../../providers/app_pages_provider/register_company_provider.dart';
import '../../../widgets/dark_drop_down_layout.dart';
import '../../../widgets/dotted_line.dart';
import 'layouts/company_logo_layout.dart';

class BusinessSignUpOne extends StatelessWidget {
  const BusinessSignUpOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpCompanyProvider>(builder: (context1, value, child) {
      return Form(
          key: value.signupFormKey1,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ContainerWithTextLayout(title: "Contact First Name")
                .paddingOnly(bottom: Insets.i8),
            TextFieldCommon(
                    controller: value.contactFirstName,
                    // validator: (v) => validation.nameValidation(context, v),
                    focusNode: value.contactFirstNameFocus,
                    hintText: "Enter contact first name",
                    prefixIcon: "assets/svg/myAccount.svg")
                .paddingSymmetric(horizontal: Insets.i20),
            ContainerWithTextLayout(title: "Contact Last Name")
                .paddingOnly(top: Insets.i24, bottom: Insets.i8),
            TextFieldCommon(
                    controller: value.contactLastName,
                    // validator: (v) => validation.nameValidation(context, v),
                    focusNode: value.companyNameFocus,
                    hintText: "Enter contact last name",
                    prefixIcon: "assets/svg/myAccount.svg")
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s12),

            ContainerWithTextLayout(title: "Contact Phone Number")
                .paddingOnly(top: Insets.i24, bottom: Insets.i8),
            RegisterWidgetClass().phoneTextBox(

                dialCode: value.dialCode,
                context,
                value.companyPhone,
                value.phoneNameFocus,
                onChanged: (CountryCodeCustom? code) =>
                    value.changeDialCode(code!),
                onFieldSubmitted: (values) => validation.fieldFocusChange(
                    context, value.phoneNameFocus, value.companyMailFocus)),
                ContainerWithTextLayout(title: "Contact Email")
                    .paddingOnly(top: Insets.i24, bottom: Insets.i8),
                TextFieldCommon(
                    controller: value.emailCtrl,
                    // validator: (v) => validation.emailValidation(context, v),
                    focusNode: value.emailFocus,
                    hintText: "Enter contact email",
                    prefixIcon: "assets/svg/myAccount.svg")
                    .paddingSymmetric(horizontal: Insets.i20),
                const VSpace(Sizes.s12),
            const DottedLines().paddingSymmetric(vertical: Insets.i40),
            ContainerWithTextLayout(title: "Logo"),
            VSpace(Sizes.s12),
            CompanyLogoLayout(imageFile: value.imageFile)
                .inkWell(onTap: () => value.onImagePick(context))
                .paddingSymmetric(horizontal: Insets.i20),
            ContainerWithTextLayout(title: "Business category")
                .paddingOnly(top: Insets.i24, bottom: Insets.i8),
            DarkDropDownLayout(
                    svgColor: value.chosenValue != ''
                        ? appColor(context).lightText
                        : appColor(context).darkText,
                    isIcon: true,
                    icon: eSvgAssets.categorySmall,
                    isBig: false,
                    val: value.chosenValue,
                    hintText: "Business category",
                    categoryList: appArray.businessCategory,
                    onChanged: (val) => value.onDropDownChange(val))
                .paddingSymmetric(horizontal: Insets.i20),
            ContainerWithTextLayout(title: "Price range")
                .paddingOnly(top: Insets.i24, bottom: Insets.i8),
            DarkDropDownLayout(
                    svgColor: value.chosenRange != ''
                        ? appColor(context).lightText
                        : appColor(context).darkText,
                    isIcon: true,
                    icon: eSvgAssets.dollar,
                    isBig: false,
                    val: value.chosenRange,
                    hintText: "Enter Price range",
                    categoryList: appArray.priceRange,
                    onChanged: (val) => value.onRangeDropDownChange(val))
                .paddingSymmetric(horizontal: Insets.i20),
            ContainerWithTextLayout(title: "Business name")
                .paddingOnly(top: Insets.i24, bottom: Insets.i8),
            TextFieldCommon(
                    // validator: (v) => validation.emailValidation(context, v),
                    controller: value.businessName,
                    focusNode: value.businessNameFocus,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Enter business name",
                    prefixIcon: eSvgAssets.companyName)
                .paddingSymmetric(horizontal: Insets.i20),
            ContainerWithTextLayout(title: "description")
                .paddingOnly(top: Insets.i24, bottom: Insets.i8),
            Stack(children: [
              TextFieldCommon(
                      focusNode: value.descriptionFocus,
                      isNumber: true,
                      // validator: (v) => validation.dynamicTextValidation(
                      //     context, v, "Please Enter Description"),
                      controller: value.description,
                      hintText: "Enter Details",
                      maxLines: 5,
                      minLines: 5,
                      isMaxLine: true)
                  .paddingSymmetric(horizontal: Insets.i20),
              SvgPicture.asset(eSvgAssets.details,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                          !value.descriptionFocus.hasFocus
                              ? value.description.text.isNotEmpty
                                  ? appColor(context).darkText
                                  : appColor(context).lightText
                              : appColor(context).darkText,
                          BlendMode.srcIn))
                  .paddingOnly(
                      left: rtl(context) ? 0 : Insets.i35,
                      right: rtl(context) ? Insets.i35 : 0,
                      top: Insets.i13)
            ])
          ]));
    });
  }
}
