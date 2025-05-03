import 'package:flutter/gestures.dart';
import 'package:goapp/config.dart';

class RegisterWidgetClass {
  //not member
  Widget notMember(context) => RichText(
          text: TextSpan(
              text: language(context, appFonts.alreadyMember),
              style:
                  appCss.dmDenseMedium14.textColor(appColor(context).lightText),
              children: <TextSpan>[
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => route.pop(context),
                text: " ${language(context, appFonts.loginUp)}",
                style: appCss.dmDenseSemiBold16
                    .textColor(appColor(context).primary))
          ])).alignment(Alignment.center);

  //phone textBox
  Widget phoneTextBox(context, controller, focus,
          {Function(CountryCodeCustom?)? onChanged,
          ValueChanged<String>? onFieldSubmitted,
          double? hPadding,
          dialCode}) =>
      IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CountryListLayout(onChanged: onChanged, dialCode: dialCode),
          const HSpace(Sizes.s4),
          Expanded(
              child: TextFieldCommon(
                  keyboardType: TextInputType.number,
                  // validator: (phone) =>
                  //     Validation().phoneValidation(context, phone),
                  controller: controller,
                  onFieldSubmitted: onFieldSubmitted,
                  focusNode: focus,
                  isNumber: true,
                  hintText: language(context, appFonts.enterPhoneNumber)))
        ]).paddingSymmetric(horizontal: hPadding ?? Insets.i20),
      );
}
