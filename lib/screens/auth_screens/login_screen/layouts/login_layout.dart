import 'package:flutter/gestures.dart';
import 'package:goapp/config.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

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
                Text(language(context, appFonts.phoneNumber),
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).darkText))
              ]),
              const VSpace(Sizes.s8),
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
                        hintText: language(context, appFonts.enterPhoneNumber)))
              ]).paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s15),
              const VSpace(Sizes.s26),
              ButtonCommon(
                  title: language(context, appFonts.loginNow),
                  onTap: () {
                    sss.onTapOtp(context);
                  }).paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s26),
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
              const VSpace(Sizes.s15)
            ]).paddingSymmetric(vertical: Insets.i20)
      ]);
    });
  }
}
