import '../../../../config.dart';
import '../../../../models/api_model/home_feed_model.dart';
import '../../../../models/coupon_model.dart';
import '../../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../../widgets/DirectionalityRtl.dart';

class CouponLayout extends StatelessWidget {
  final Coupon? data;
  final GestureTapCallback? onTap;

  const CouponLayout({super.key, this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context, listen: false);
    bool isFav = false;
    return DirectionalityRtl(
        child: Container(
            padding: EdgeInsets.only(bottom: Insets.i12),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(eImageAssets.coupon))),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(backgroundImage: AssetImage(data!.image!))
                          .padding(right: Insets.i10),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(language(context, "${data!.name}"),
                                    style: appCss.dmDenseMedium14
                                        .textColor(appColor(context).darkText)),
                                VSpace(Insets.i3),
                                Text(language(context, data!.name),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: appCss.dmDenseRegular12
                                            .textColor(
                                                appColor(context).lightText)
                                            .textHeight(1.2))
                                    .paddingOnly(bottom: 10)
                              ]).padding(top: Insets.i10))
                    ]).paddingOnly(top: Insets.i8),
                Text(language(context, '5% OFF'),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        style: appCss.dmDenseBold14
                            .textColor(appColor(context).darkText)
                            .textHeight(1.2))
                    .width(Insets.i50)
              ]).inkWell(onTap: onTap).padding(horizontal: 10),
              VSpace(Insets.i12),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Valid on Mon-Fri only",
                    style: appCss.dmDenseRegular12
                        .textColor(appColor(context).darkText)),
                SvgPicture.asset(isFav == true
                        ? "assets/svg/dislike.svg"
                        : "assets/svg/fav.svg")
                    .inkWell(onTap: () {
                  dash.notifyListeners();
                  isFav = !isFav;
                  dash.notifyListeners();
                })
              ]).padding(horizontal: 15, top: 5)
            ])).paddingOnly(bottom: Insets.i20));
  }
}
