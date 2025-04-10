import 'package:intl/intl.dart';
import '../../../../config.dart';
import '../../../../models/api_model/home_feed_model.dart';
import '../../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../../widgets/DirectionalityRtl.dart';

class CouponLayout extends StatelessWidget {
  final Offer? data;
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
                      data!.image == null
                          ? CircleAvatar(
                                  backgroundImage:
                                      AssetImage(eImageAssets.img3))
                              .padding(right: Insets.i10)
                          : CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(data!.image!.source))
                              .padding(right: Insets.i10),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(language(context, data!.name),
                                    style: appCss.dmDenseMedium14
                                        .textColor(appColor(context).darkText)),
                                VSpace(Insets.i3),
                                Text(language(context, data!.title),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: appCss.dmDenseRegular12
                                            .textColor(
                                                appColor(context).lightText)
                                            .textHeight(1.2))
                                    .paddingOnly(bottom: 10)
                              ]).padding(top: Insets.i10))
                    ]).paddingOnly(top: Insets.i8),
                Text(language(context, data?.tag),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        style: appCss.dmDenseBold14
                            .textColor(appColor(context).darkText)
                            .textHeight(1.2))
                    .width(Insets.i50)
              ]).inkWell(onTap: onTap).padding(horizontal: 10),
              VSpace(Insets.i12),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                    "Valid until ${data?.expirationDate != null ? DateFormat('dd/MM/yyyy').format(data!.expirationDate!) : ''}",
                    style: appCss.dmDenseRegular12
                        .textColor(appColor(context).darkText)),
                SvgPicture.asset(data?.isFavourite == true
                        ? "assets/svg/fav.svg"
                        : "assets/svg/dislike.svg")
                    .inkWell(onTap: () {
                  dash.notifyListeners();
                  isFav = !isFav;
                  dash.notifyListeners();
                })
              ]).padding(horizontal: 15, top: 5)
            ])).paddingOnly(bottom: Insets.i20));
  }
}
