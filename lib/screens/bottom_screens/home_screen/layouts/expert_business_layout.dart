import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:goapp/models/api_model/home_feed_model.dart';

import '../../../../config.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../../widgets/dotted_line.dart';

class FeatureAttractionLayout extends StatelessWidget {
  final Attraction data;
  final GestureTapCallback? onTap, addOrRemoveTap;
  final bool isHome;
  final Color? bColor;

  const FeatureAttractionLayout(
      {super.key,
      required this.data,
      this.onTap,
      this.isHome = false,
      this.bColor,
      this.addOrRemoveTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                data.image!.source.isNotEmpty
                    ? Container(
                            height: Sizes.s72,
                            width: Sizes.s72,
                            decoration: BoxDecoration(
                                color: appColor(context).skeletonColor,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(data.image!.source))))
                        .boxShapeExtension()
                    : Container(
                        height: Sizes.s72,
                        width: Sizes.s72,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image:
                                    AssetImage(eImageAssets.noImageFound4)))),
                const HSpace(Sizes.s10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                      width: 176,
                      child: Text(language(context, data.name),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          style: appCss.dmDenseMedium14
                              .textColor(appColor(context).darkText))),
                  Row(children: [
                    RatingBar(
                      glow: false,
                      initialRating: double.parse(
                          (data.rating?.starts ?? 0.0).toStringAsFixed(1)),
                      minRating: 1,
                      ignoreGestures: true,
                      itemSize: 13,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      unratedColor: appColor(context).whiteBg,
                      updateOnDrag: true,
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                      ratingWidget: RatingWidget(
                          full: SvgPicture.asset(eSvgAssets.star),
                          half: SvgPicture.asset("assets/svg/halfStar.svg"),
                          empty:
                              SvgPicture.asset('assets/svg/starWithout.svg')),
                    ),
                    Text(
                        " (${data.rating?.reviewCount ?? 0} ${language(context, appFonts.reviews)})",
                        style: appCss.dmDenseRegular12
                            .textColor(appColor(context).darkText))
                  ]),
                  const VSpace(Sizes.s8),
                  Row(children: [
                    SvgPicture.asset(eSvgAssets.locationOut,
                        height: Sizes.s20,
                        colorFilter: ColorFilter.mode(
                            appColor(context).darkText, BlendMode.srcIn)),
                    const HSpace(Sizes.s5),
                    Text(language(context, appFonts.viewOnMap),
                        overflow: TextOverflow.ellipsis,
                        style: appCss.dmDenseRegular12
                            .textColor(appColor(context).darkText)),
                    const HSpace(Sizes.s5),
                    (data.location?.selfLocationdistance ?? 0) <= 0
                        ? Container()
                        : Container(
                            padding: EdgeInsets.symmetric(
                                vertical: Insets.i3, horizontal: Insets.i5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.r4)),
                                color: appColor(context).greenColor),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              SvgPicture.asset('assets/svg/locator.svg'),
                              const HSpace(Sizes.s3),
                              Text(
                                  "${data.location!.selfLocationdistance!.toInt()} ${language(context, appFonts.km)}",
                                  style: appCss.dmDenseMedium10
                                      .textColor(appColor(context).whiteColor))
                            ]))
                  ])
                ]),

                /* Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 176,
                                  child: Text(language(context, data!.name!),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: appCss.dmDenseMedium14
                                          .textColor(appColor(context).darkText))),
                              SvgPicture.asset(data!.isFav == true
                                      ? 'assets/svg/fav.svg'
                                      : "assets/svg/dislike.svg")
                                  .inkWell(onTap: () {
                                value.setState();
                                data!.isFav = !data!.isFav!;
                                value.setState();
                              })
                            ]),
                        const VSpace(Sizes.s5),

                        // Ratings
                        Row(children: [
                          Row(
                              children: List.generate(
                                  (data?.reviewRatings ?? 0).toInt(),
                                  (index) => SvgPicture.asset(eSvgAssets.star))),
                          const HSpace(Sizes.s3),
                          Text("(${data!.totalReviewRating} Reviews)",
                              style: appCss.dmDenseRegular12
                                  .textColor(appColor(context).darkText))
                        ]),
                        const VSpace(Sizes.s8),

                        Row(children: [
                          SvgPicture.asset(eSvgAssets.locationOut,
                              height: Sizes.s20),
                          const HSpace(Sizes.s5),
                          Text(language(context, appFonts.viewOnMap),
                              overflow: TextOverflow.ellipsis,
                              style: appCss.dmDenseRegular12
                                  .textColor(appColor(context).darkText)),
                          const HSpace(Sizes.s5),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: Insets.i3, horizontal: Insets.i5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(AppRadius.r4)),
                                  color: appColor(context).greenColor),
                              child: Row(mainAxisSize: MainAxisSize.min, children: [
                                SvgPicture.asset('assets/svg/locator.svg'),
                                const HSpace(Sizes.s3),
                                Text(language(context, data!.distance),
                                    style: appCss.dmDenseMedium10
                                        .textColor(appColor(context).whiteColor))
                              ]))
                        ])
                      ]).paddingOnly(left: Insets.i10)*/
              ]),
              SvgPicture.asset(data.isFavourite == true
                      ? 'assets/svg/fav.svg'
                      : "assets/svg/dislike.svg")
                  .inkWell(onTap: addOrRemoveTap)
            ]),
        Row(children: [
          DottedLines(
              color: Color(0xffE5E8EA),
              width: MediaQuery.of(context).size.width - 73),
          SvgPicture.asset(eSvgAssets.arrowRight1,
              colorFilter:
                  ColorFilter.mode(appColor(context).stroke, BlendMode.srcIn))
        ]).paddingSymmetric(vertical: 10),
        Wrap(
            children: data.attractionCategories.map<Widget>((category) {
          return Container(
              margin: EdgeInsets.only(right: Insets.i8),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: appColor(context).primary.withValues(alpha: 0.1)),
              child: Text(category.name,
                  style: appCss.dmDenseMedium13
                      .textColor(appColor(context).primary)));
        }).toList())
      ])
          .paddingAll(Insets.i10)
          .boxBorderExtension(context,
              isShadow: isHome, bColor: bColor ?? appColor(context).trans)
          .inkWell(onTap: onTap)
          .paddingOnly(bottom: Insets.i15);
    });
  }
}
