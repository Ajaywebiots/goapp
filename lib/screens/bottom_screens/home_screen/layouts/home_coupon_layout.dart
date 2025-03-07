import 'package:goapp/models/coupon_model.dart';

import '../../../../config.dart';

import '../../../../widgets/custom_painters.dart';

class HomeCouponLayout extends StatelessWidget {
  final CouponModel? data;

  const HomeCouponLayout({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomPaint(
          size: Size(Sizes.s250, (Sizes.s70).toDouble()),
          painter: CouponPainter()),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SvgPicture.asset(eSvgAssets.couponIcon).paddingAll(Insets.i9).decorated(
            color: appColor(context).primary, shape: BoxShape.circle),
        const HSpace(Sizes.s8),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              width: Sizes.s110,
              child: Text(language(context, "Sparrow Coffee & Sweets"),
                  overflow: TextOverflow.fade,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).darkText))),
          // SizedBox(
          //     width: Sizes.s110,
          //     child: RichText(
          //         overflow: TextOverflow.ellipsis,
          //         text: TextSpan(
          //             text: language(context, appFonts.useCode),
          //             style: appCss.dmDenseMedium12
          //                 .textColor(appColor(context).lightText),
          //             children: [
          //               TextSpan(
          //                   text: language(context, data!.code),
          //                   style: appCss.dmDenseBold12
          //                       .textColor(appColor(context).lightText))
          //             ])))
        ]),
        Image.asset(eImageAssets.dashLines, height: Sizes.s40)
            .paddingSymmetric(horizontal: Insets.i15),
        SizedBox(
            width: data!.type == "percentage" ? Sizes.s35 : Sizes.s38,
            child: Text(
                language(context,
                    '${data!.amount}${data!.type == "percentage" ? "%" : "0.00"} OFF'),
                overflow: TextOverflow.clip,
                style:
                    appCss.dmDenseBold14.textColor(appColor(context).primary)))
      ]).paddingSymmetric(horizontal: Insets.i10, vertical: Insets.i15)
    ]).paddingOnly(
        left: rtl(context) ? 0 : Insets.i20,
        right: rtl(context) ? Insets.i20 : 0);
  }
}
