import 'package:goapp/models/api_model/business_list_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config.dart';
import '../../../../models/service_model.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../../widgets/dotted_line.dart';

class FeaturedBusinessLayout extends StatelessWidget {
  final data;
  final GestureTapCallback? onTap, addTap;
  final bool? isProvider, inCart;

  const FeaturedBusinessLayout(
      {super.key,
      this.data,
      this.onTap,
      this.isProvider = true,
      this.addTap,
      this.inCart = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
      return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        data?.image == ""
                            ? Container(
                                height: Sizes.s30,
                                width: Sizes.s30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            data!.image.toString()))))
                            : Container(
                                height: Sizes.s30,
                                width: Sizes.s30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            eImageAssets.noImageFound3)))),
                        const HSpace(Sizes.s10),
                        Text(language(context, data!.name ?? ""),
                            style: appCss.dmDenseMedium15
                                .textColor(appColor(context).darkText))
                      ])
                    ]).paddingAll(Insets.i15),
                Stack(alignment: Alignment.topRight, children: [
                  Container(
                      height: Sizes.s150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(data!.image.toString()),
                              fit: BoxFit.cover))),
                  // if (data!.discount != "")
                  SizedBox(
                          child: Text(value.formatDiscount("5"),
                                  style: appCss.dmDenseMedium12
                                      .textColor(appColor(context).whiteColor))
                              .padding(
                                  horizontal: Insets.i9,
                                  top: Insets.i3,
                                  bottom: Insets.i3))
                      .decorated(
                          color: appColor(context).red,
                          borderRadius: BorderRadius.circular(AppRadius.r30))
                      .paddingSymmetric(
                          horizontal: Insets.i10, vertical: Insets.i13)
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Row(
                              children: List.generate(
                                  (data?.rating ?? 0).toInt(),
                                  (index) =>
                                      SvgPicture.asset(eSvgAssets.star))),
                          const HSpace(Sizes.s3),
                          Text("(${data!.reviewCount} Reviews)",
                              style: appCss.dmDenseRegular12
                                  .textColor(appColor(context).darkText))
                        ]),
                        SvgPicture.asset(
                            /*
                                ? 'assets/svg/fav.svg'
                                :*/
                            "assets/svg/dislike.svg").inkWell(onTap: () {
                          value.setState();
                          // data!.isFav = !data!.isFav!;
                          value.setState();
                        })
                      ]),
                  const VSpace(Sizes.s8),
                  IntrinsicHeight(
                      child: Row(children: [
                    SvgPicture.asset(eSvgAssets.phone),
                    const HSpace(Sizes.s5),
                    Text("+111 222 333 44",
                        style: appCss.dmDenseRegular12
                            .textColor(appColor(context).darkText))
                  ])),
                  const VSpace(Sizes.s6),
                  IntrinsicHeight(
                      child: Row(children: [
                    SvgPicture.asset(eSvgAssets.locationOut),
                    const HSpace(Sizes.s5),
                    Text("View on map",
                        style: appCss.dmDenseRegular12
                            .textColor(appColor(context).darkText)),
                    const HSpace(Sizes.s5),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: Insets.i3, horizontal: Insets.i6),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(AppRadius.r4)),
                            color: appColor(context).greenColor),
                        child: Row(children: [
                          SvgPicture.asset('assets/svg/locator.svg'),
                          const HSpace(Sizes.s3),
                          Text(language(context, "2KM"),
                              style: appCss.dmDenseMedium10
                                  .textColor(appColor(context).whiteColor))
                        ]))
                  ])),
                  const HSpace(Sizes.s10),
                  Row(children: [
                    DottedLines(
                        color: Color(0xffE5E8EA),
                        width: MediaQuery.of(context).size.width - 73),
                    SvgPicture.asset(eSvgAssets.arrowRight1,
                        colorFilter: ColorFilter.mode(
                            appColor(context).stroke, BlendMode.srcIn))
                  ]).paddingSymmetric(vertical: 10),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color:
                              appColor(context).primary.withValues(alpha: 0.1)),
                      child: Text(language(context, "Restaurants"),
                          style: appCss.dmDenseMedium13
                              .textColor(appColor(context).primary)))
                ]).padding(horizontal: Insets.i14, vertical: Insets.i13)
              ]))
          .decorated(
              color: appColor(context).whiteBg,
              boxShadow: [
                BoxShadow(
                    blurRadius: 8,
                    spreadRadius: 2,
                    blurStyle: BlurStyle.outer,
                    color: appColor(context).darkText.withValues(alpha: 0.06))
              ],
              borderRadius: BorderRadius.circular(AppRadius.r8),
              border: Border.all(color: appColor(context).stroke))
          .inkWell(onTap: onTap)
          .paddingOnly(bottom: Insets.i15);
    });
  }
}
