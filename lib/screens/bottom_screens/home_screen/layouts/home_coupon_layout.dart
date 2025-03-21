import 'package:goapp/models/coupon_model.dart';

import '../../../../config.dart';

import '../../../../widgets/custom_painters.dart';

class HomeCouponLayout extends StatelessWidget {
  final CouponModel? data;
  final GestureTapCallback? onTap;

  const HomeCouponLayout({super.key, this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 245,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/couponHome.png"))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CircleAvatar(backgroundImage: AssetImage(data!.icon!))
              .paddingSymmetric(horizontal: Insets.i8),
          SizedBox(
              width: Sizes.s110,
              child: Text(language(context, data!.title),
                  overflow: TextOverflow.fade,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).darkText))),
          const HSpace(Sizes.s25),
          SizedBox(
              width: Insets.i50,
              child: Text(language(context, '${data!.amount}'),
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                  style: appCss.dmDenseExtraBold15
                      .textColor(appColor(context).primary)
                      .textHeight(0)))
        ])).inkWell(onTap: onTap).paddingOnly(right: Insets.i15);
  }
}
