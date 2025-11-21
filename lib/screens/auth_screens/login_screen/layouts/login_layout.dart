import 'package:flutter/gestures.dart';
import 'package:goapp/config.dart';

enum ContactMethod { email, phone }

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context1, value, child) {
      final sss = Provider.of<LoginWithPhoneProvider>(context, listen: false);
      return Stack(children: [
        const FieldsBackground(),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const SmallContainer(),
                const HSpace(Sizes.s20),
                Text(language(context, "Login with:"),
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).darkText))
              ]),
              const VSpace(Sizes.s8),
              Row(mainAxisSize: MainAxisSize.min, children: [
                CustomRadioButton(
                    text: "Email Address",
                    isSelected: sss.selectedMethod == ContactMethod.email,
                    onTap: () => setState(
                        () => sss.selectedMethod = ContactMethod.email)),
                const SizedBox(width: 16),
                CustomRadioButton(
                    text: "Phone Number",
                    isSelected: sss.selectedMethod == ContactMethod.phone,
                    onTap: () => setState(
                        () => sss.selectedMethod = ContactMethod.phone))
              ]).marginOnly(left: Insets.i20, bottom: Insets.i15),
              if (sss.selectedMethod == ContactMethod.email)
                TextFieldCommon(
                        validator: (userName) =>
                            Validation().emailValidation(context, userName),
                        controller: sss.email,
                        hintText: language(context, appFonts.enterEmail),
                        focusNode: sss.userNameFocus,
                        prefixIcon: eSvgAssets.email)
                    .paddingSymmetric(horizontal: Insets.i20)
              else
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CountryListLayout(
                      dialCode: sss.dialCode,
                      onChanged: (country) => {sss.changeDialCode(country!)}),
                  const HSpace(Sizes.s4),
                  Expanded(
                      child: TextFieldCommon(
                          keyboardType: TextInputType.number,
                          validator: (phone) =>
                              Validation().phoneValidation(context, phone),
                          controller: sss.numberController,
                          isNumber: true,
                          focusNode: sss.phoneFocus,
                          hintText:
                              language(context, appFonts.enterPhoneNumber)))
                ]).paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s20),
              ButtonCommon(
                  title: language(context, appFonts.loginNow),
                  onTap: () {
                    if (sss.selectedMethod == ContactMethod.email) {
                      sss.onTapEmailOtp(context);
                    } else {
                      sss.onTapOtp(context);
                    }
                  }).paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s25),
              RichText(
                  text: TextSpan(
                      text: language(context, appFonts.notMember),
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).lightText),
                      children: <TextSpan>[
                    TextSpan(
                        text: language(context, appFonts.signUp),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              route.pushNamed(context, routeName.registerUser),
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).primary))
                  ])).alignment(Alignment.center),
            ]).paddingSymmetric(vertical: Insets.i20),
      ]);
    });
  }
}

class CustomRadioButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioButton(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final borderColor =
        isSelected ? appColor(context).second : appColor(context).borderStroke;
    final borderWidth = isSelected ? 1.0 : 1.0;
    final fillColor =
        isSelected ? appColor(context).second : Colors.transparent;

    return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Row(children: [
          AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor, width: borderWidth)),
              child: Center(
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: fillColor)))),
          const SizedBox(width: 8),
          Text(text,
              style:
                  appCss.dmDenseRegular12.textColor(appColor(context).darkText))
        ]));
  }
}
