import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:goapp/models/api_model/home_feed_model.dart';
import '../../../../config.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';

class FeatureAttractionLayout extends StatelessWidget {
  final Attraction data;
  final GestureTapCallback? onTap;
  final bool isHome;

  const FeatureAttractionLayout(
      {super.key, required this.data, this.onTap, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
      return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Row(children: [
              data.image!.source.isNotEmpty
                  ? Container(
                          height: Sizes.s75,
                          width: Sizes.s75,
                          decoration: BoxDecoration(
                              color: appColor(context).skeletonColor,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(data.image!.source))))
                      .boxShapeExtension()
                  : Container(
                      height: Sizes.s75,
                      width: Sizes.s75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage(eImageAssets.noImageFound4)))),
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
                  RatingBar.builder(
                      glow: false,
                      initialRating: (data.rating?.starts ?? 0.0),
                      minRating: 0,
                      ignoreGestures: true,
                      itemSize: 13,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, index) {
                        double rating = data?.rating?.starts ?? 0.0;
                        return SvgPicture.asset(rating > index
                            ? eSvgAssets.star
                            : 'assets/svg/starWithout.svg');
                      },
                      updateOnDrag: true,
                      onRatingUpdate: (rating) {
                        print(rating);
                      }),
                  Text(" (${data?.rating?.reviewCount ?? 0} Reviews)",
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
                  Text("View on map",
                      overflow: TextOverflow.ellipsis,
                      style: appCss.dmDenseRegular12
                          .textColor(appColor(context).darkText)),
                  const HSpace(Sizes.s5),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Insets.i3, horizontal: Insets.i5),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(AppRadius.r4)),
                          color: appColor(context).greenColor),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        SvgPicture.asset('assets/svg/locator.svg'),
                        const HSpace(Sizes.s3),
                        Text(
                            "${(data?.location?.selfLocationdistance ?? 0).toStringAsFixed(2)} km",
                            /*language(context,
                                "${(data?.location.selfLocationDistance as num?)?.toStringAsFixed(2)} km"),*/
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
                      Text("View on map",
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
                .inkWell(onTap: () {
              // value.setState();
              // data!.isFavourite = !data!.isFavourite;
              // value.setState();
            })
          ])
          .paddingAll(Insets.i15)
          .boxBorderExtension(context,
              isShadow: isHome, bColor: appColor(context).trans)
          .inkWell(onTap: onTap)
          .paddingOnly(bottom: Insets.i15);
    });
  }
}
