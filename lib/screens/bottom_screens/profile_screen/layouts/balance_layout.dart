import '../../../../config.dart';
import 'dart:math' as math;

class BalanceLayout extends StatelessWidget {
  final Animation<Offset>? offsetAnimation;
  final String? totalBalance;
  const BalanceLayout({super.key, this.offsetAnimation, this.totalBalance});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Image.asset(eImageAssets.balanceContainer,
          height: Sizes.s65,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(language(context, appFonts.totalAvailable),
              style: appCss.dmDenseSemiBold12
                  .textColor(appColor(context).whiteColor)),
          const VSpace(Sizes.s3),
          //if (value.offsetAnimation != null)
          Row(children: [
            Text("0",
                style: appCss.dmDenseBold18
                    .textColor(appColor(context).whiteColor)),
            const HSpace(Sizes.s8),
            SlideTransition(
                position: offsetAnimation!,
                child: SvgPicture.asset(eSvgAssets.anchorArrowRight))
          ])
        ]).paddingSymmetric(horizontal: Insets.i12),
        rtl(context)
            ? Image.asset(eGifAssets.wallet, height: Sizes.s60)
            : Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Image.asset(eGifAssets.wallet, height: Sizes.s60))
      ])
    ]).inkWell(onTap: () {});
  }
}
