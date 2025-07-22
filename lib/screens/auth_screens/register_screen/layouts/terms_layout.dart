import 'package:flutter/gestures.dart';
import '../../../../config.dart';

class TermsLayout extends StatelessWidget {
  final bool? isSocial;

  const TermsLayout({super.key, this.isSocial});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SocialRegProvider, RegisterProvider>(
        builder: (context, sCtrl, register, child) {
      return Row(children: [
        const SmallContainer(),
        const HSpace(Sizes.s20),
        Container(
                height: Sizes.s20,
                width: Sizes.s20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:
                        register.isCheck || (isSocial == true && sCtrl.isCheck)
                            ? appColor(context).primary
                            : appColor(context).whiteBg,
                    borderRadius: BorderRadius.circular(AppRadius.r4),
                    border: Border.all(
                        color: register.isCheck
                            ? appColor(context).primary
                            : appColor(context).stroke)),
                child: (isSocial == true && sCtrl.isCheck)
                    ? Icon(Icons.check,
                        size: Sizes.s15, color: appColor(context).whiteBg)
                    : Icon(Icons.check,
                        size: Sizes.s15, color: appColor(context).whiteBg))
            .inkWell(
                onTap: () => isSocial == true
                    ? sCtrl.isCheckBoxCheck(!sCtrl.isCheck)
                    : register.isCheckBoxCheck(!register.isCheck)),
        const HSpace(Sizes.s10),
        RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 16),
                children: [
              TextSpan(
                  text: 'Agree with ',
                  style: appCss.dmDenseRegular14
                      .textColor(appColor(context).lightText)),
              TextSpan(
                  text: 'terms & conditions',
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).lightText),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      register.isCheckBoxCheck(!register.isCheck);
                    })
            ]))
      ]);
    });
  }
}
