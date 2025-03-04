import 'package:goapp/providers/auth_providers/social_register_provider.dart';

import '../../../../config.dart';

class TermsLayout extends StatelessWidget {
  final bool? isSocial;

  const TermsLayout({super.key, this.isSocial});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SocialRegProvider, RegisterProvider>(
        builder: (context, sCtrl, register, child) {
      return Row(children: [
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
        Text(language(context, appFonts.agreeTerms),
            style:
                appCss.dmDenseMedium14.textColor(appColor(context).lightText))
      ]).paddingSymmetric(horizontal: Insets.i20);
    });
  }
}
