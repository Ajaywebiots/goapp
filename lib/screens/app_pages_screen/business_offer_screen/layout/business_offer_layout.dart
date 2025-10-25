import 'package:intl/intl.dart';

import '../../../../config.dart';
import '../../../../widgets/DirectionalityRtl.dart';

class BusinessOfferLayout extends StatelessWidget {
  final  data;
  final GestureTapCallback? onTap, addOrRemoveTap;

  const BusinessOfferLayout({super.key, this.data, this.onTap, this.addOrRemoveTap});

  @override
  Widget build(BuildContext context) {


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
                      data['image'] == null
                          ? CircleAvatar(
                                  backgroundImage:
                                      AssetImage(eImageAssets.noImageFound2))
                              .padding(right: Insets.i10)
                          : CircleAvatar(
                                  backgroundImage:
                                  data['image']?['source'] != null
                                      ? AssetImage(data['image']['source'])
                                      : AssetImage(eImageAssets.noImageFound2) as ImageProvider,
                      )
                              .padding(right: Insets.i10),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(language(context, data['name']),
                                    style: appCss.dmDenseMedium14
                                        .textColor(appColor(context).darkText)),
                                VSpace(Insets.i3),
                                Text(language(context, data['title']),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: appCss.dmDenseRegular12
                                            .textColor(
                                                appColor(context).lightText)
                                            .textHeight(1.2))
                                    .paddingOnly(bottom: 10)
                              ]).padding(top: Insets.i10))
                    ]).paddingOnly(top: Insets.i8),
                Text(language(context, data['tag']),
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
                    "${language(context, appFonts.validUntil)} ${data['expirationDate'] != null ? DateFormat('dd/MM/yyyy').format(data['expirationDate']!) : ''}",
                    style: appCss.dmDenseRegular12
                        .textColor(appColor(context).darkText)),
                Text(
                    "${data['bookingsCount']} ${language(context, "Bookings")}",
                    style: appCss.dmDenseRegular12
                        .textColor(appColor(context).darkText)),
              ]).padding(horizontal: Insets.i15, top: Insets.i5)
            ])).paddingOnly(bottom: Insets.i20));
  }
}
