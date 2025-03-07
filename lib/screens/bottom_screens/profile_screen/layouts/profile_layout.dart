import 'dart:developer';

import '../../../../config.dart';
import 'balance_layout.dart';

class ProfileLayout extends StatelessWidget {
  final Animation<Offset>? offsetAnimation;
  final GestureTapCallback? onTap;

  const ProfileLayout({super.key, this.offsetAnimation, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                // ProfilePicCommon(imageUrl: eImageAssets.profile),
                const VSpace(Sizes.s5),
                Text(language(context, appFonts.zainDorwart),
                    style: appCss.dmDenseSemiBold14
                        .textColor(appColor(context).darkText)),
                const VSpace(Sizes.s3),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(eSvgAssets.mail),
                  const HSpace(Sizes.s5),
                  Text(language(context, appFonts.zainDorwartMail),
                      style: appCss.dmDenseMedium12
                          .textColor(appColor(context).lightText))
                ]),
                const VSpace(Sizes.s16),
                BalanceLayout(
                    offsetAnimation: offsetAnimation, totalBalance: "152.23")
              ]).paddingSymmetric(vertical: Insets.i15, horizontal: Insets.i13))
          .boxShapeExtension(
              color: appColor(context).fieldCardBg, radius: AppRadius.r12),
      SvgPicture.asset(
        eSvgAssets.edit,
        height: Sizes.s24,
        width: Sizes.s24,
      ).paddingAll(Insets.i15).inkWell(onTap: onTap)
    ]);
  }
}
