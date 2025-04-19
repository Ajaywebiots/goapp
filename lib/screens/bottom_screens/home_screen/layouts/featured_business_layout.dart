import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config.dart';
import '../../../../models/api_model/home_feed_model.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../../widgets/dotted_line.dart';

class FeaturedBusinessLayout extends StatelessWidget {
  final Business data;
  final GestureTapCallback? onTap, addOrRemoveTap;

  const FeaturedBusinessLayout(
      {super.key, required this.data, this.onTap, this.addOrRemoveTap});

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
                          RatingBar(
                              glow: false,
                              initialRating: double.parse(
                                  (data.rating?.starts ?? 0.0)
                                      .toStringAsFixed(1)),
                              minRating: 1,
                              ignoreGestures: true,
                              itemSize: 13,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                              unratedColor: appColor(context).whiteBg,
                              updateOnDrag: true,
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                              ratingWidget: RatingWidget(
                                  full: SvgPicture.asset(eSvgAssets.star),
                                  half: SvgPicture.asset(
                                      "assets/svg/halfStar.svg"),
                                  empty: SvgPicture.asset(
                                      'assets/svg/starWithout.svg'))),
                          const HSpace(Sizes.s3),
                          data.rating == null ||
                                  data.rating?.reviewCount == null
                              ? Container()
                              : Text(
                                  "(${data.rating?.reviewCount} ${language(context, appFonts.reviews)})",
                                  style: appCss.dmDenseRegular12
                                      .textColor(appColor(context).darkText))
                        ]),
                        SvgPicture.asset(data.isFavourite == true
                                ? 'assets/svg/fav.svg'
                                : "assets/svg/dislike.svg")
                            .inkWell(onTap: addOrRemoveTap)
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
                    Text(language(context, appFonts.viewOnMap),
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
                              "${(data.location?.selfLocationdistance).toInt()} ${language(context, appFonts.km)}",
                              style: appCss.dmDenseMedium10
                                  .textColor(appColor(context).whiteColor))
                        ])).inkWell(onTap: () async {
                      final lat = data.location?.latitude;
                      final lng = data.location?.longitude;

                      if (lat != null && lng != null) {
                        final url = Uri.parse(
                            "https://www.google.com/maps/search/?api=1&query=$lat,$lng");
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Could not open Maps')),
                          );
                        }
                      }
                    })
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
                        child: Text(category.name!,
                            style: appCss.dmDenseMedium13
                                .textColor(appColor(context).primary)));
                  }).toList())
                ]).padding(horizontal: Insets.i14, vertical: Insets.i13)
              ]))
          .inkWell(onTap: onTap)
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
          .paddingOnly(bottom: Insets.i15);
    });
  }
}
