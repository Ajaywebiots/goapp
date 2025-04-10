import 'dart:developer';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../config.dart';
import '../../../../models/api_model/home_feed_model.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../../widgets/dotted_line.dart';

class FeaturedBusinessLayout extends StatelessWidget {
  final Business data;
  final GestureTapCallback? onTap;
  final bool? isProvider, inCart;

  const FeaturedBusinessLayout(
      {super.key,
      required this.data,
      this.onTap,
      this.isProvider = true,
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
                        data.logo?.source != ""
                            ? Container(
                                height: Sizes.s30,
                                width: Sizes.s30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(data.logo!.source))))
                            : Container(
                                height: Sizes.s30,
                                width: Sizes.s30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            eImageAssets.noImageFound3)))),
                        const HSpace(Sizes.s10),
                        Text(language(context, data.name),
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
                              image: NetworkImage(data.image!.source),
                              fit: BoxFit.cover))),
                  // if (data!.discount != "")
                  data.topOffer == null
                      ? SizedBox.shrink()
                      : SizedBox(
                              child: Text(data.topOffer,
                                      style: appCss.dmDenseMedium12.textColor(
                                          appColor(context).whiteColor))
                                  .padding(
                                      horizontal: Insets.i9,
                                      top: Insets.i3,
                                      bottom: Insets.i3))
                          .decorated(
                              color: appColor(context).red,
                              borderRadius:
                                  BorderRadius.circular(AppRadius.r30))
                          .paddingSymmetric(
                              horizontal: Insets.i10, vertical: Insets.i13)
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          RatingBar.builder(
                              glow: false,
                              initialRating: (data.rating?.starts ?? 0.0),
                              minRating: 1,
                              ignoreGestures: true,
                              itemSize: 13,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, index) {
                                double rating = data.rating?.starts ?? 0.0;
                                return SvgPicture.asset(rating > index
                                    ? eSvgAssets.star
                                    : 'assets/svg/starWithout.svg');
                              },
                              updateOnDrag: true,
                              onRatingUpdate: (rating) {
                                log("rating $rating");
                              }),
                          const HSpace(Sizes.s3),
                          Text("(${data.rating?.reviewCount} Reviews)",
                              style: appCss.dmDenseRegular12
                                  .textColor(appColor(context).darkText))
                        ]),
                        SvgPicture.asset(data.isFavourite
                                ? 'assets/svg/fav.svg'
                                : "assets/svg/dislike.svg")
                            .inkWell(onTap: () {
                          value.setState();
                          // data!.isFav = !data!.isFav!;
                          value.setState();
                        })
                      ]),
                  const VSpace(Sizes.s8),
                  IntrinsicHeight(
                      child: Row(children: [
                    SvgPicture.asset(eSvgAssets.phone,
                        colorFilter: ColorFilter.mode(
                            appColor(context).darkText, BlendMode.srcIn)),
                    const HSpace(Sizes.s5),
                    Text(data.contact!.phoneNumber,
                        style: appCss.dmDenseRegular12
                            .textColor(appColor(context).darkText))
                  ])),
                  const VSpace(Sizes.s6),
                  IntrinsicHeight(
                      child: Row(children: [
                    SvgPicture.asset(eSvgAssets.locationOut,
                        colorFilter: ColorFilter.mode(
                            appColor(context).darkText, BlendMode.srcIn)),
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
                          Text(
                              "${(data.location?.selfLocationdistance as num).toStringAsFixed(2)} km",
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
                  Wrap(
                      children: data.businessCategories.map<Widget>((category) {
                    return Container(
                        margin: EdgeInsets.only(right: Insets.i8),
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: appColor(context)
                                .primary
                                .withValues(alpha: 0.1)),
                        child: Text(category.name,
                            style: appCss.dmDenseMedium13
                                .textColor(appColor(context).primary)));
                  }).toList())
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
