import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:goapp/providers/app_pages_provider/attractions_provider.dart';
import 'package:goapp/providers/app_pages_provider/rate_app_provider.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config.dart';
import '../../../../providers/app_pages_provider/favourite_list_provider.dart';
import '../../../../providers/app_pages_provider/service_review_provider.dart';
import '../../../../providers/app_pages_provider/services_details_provider.dart';
import '../../../../widgets/DirectionalityRtl.dart';
import '../../../../widgets/dotted_line.dart';
import '../../../../widgets/edit_review_layout.dart';
import '../../../../widgets/heading_row_common.dart';
import '../../services_details_screen/layouts/service_review_layout.dart';
import 'layouts/attractions_service_desc.dart';
import 'layouts/service_image_layout.dart';

class AttractionDetailScreen extends StatelessWidget {
  const AttractionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteListProvider>(builder: (context2, favCtrl, child) {
      return Consumer<ServicesDetailsProvider>(
          builder: (context1, serviceCtrl, child) {
        final value = Provider.of<RateAppProvider>(context, listen: false);
        final attract = Provider.of<AttractionProvider>(context);
        final attractions = attract.attractionsDetail?.attraction;
        return DirectionalityRtl(
            child: Scaffold(
                body: SafeArea(
                    child: Stack(alignment: Alignment.bottomCenter, children: [
          SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                ServiceImageLayout(
                    isAttraction: true, image: attractions?.image?.source),
                VSpace(Insets.i12),
                Text(attractions?.name ?? "",
                    style: appCss.dmDenseBold14
                        .textColor(appColor(context).darkText)),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  RatingBar(
                      glow: false,
                      initialRating: double.parse(
                          (attractions?.rating?.starts ?? 0.0)
                              .toStringAsFixed(1)),
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
                              SvgPicture.asset('assets/svg/starWithout.svg'))),
                  Text(" ${attractions?.rating?.starts}",
                      style: appCss.dmDenseRegular13
                          .textColor(appColor(context).darkText)),
                  Text(
                      "  (${attractions?.rating?.reviewCount} ${language(context, appFonts.reviews)})",
                      style: appCss.dmDenseRegular11
                          .textColor(appColor(context).darkText))
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(attractions?.attractionCategories[0].name ?? "",
                      style: appCss.dmDenseRegular13
                          .textColor(appColor(context).darkText))
                ]),
                VSpace(Insets.i15),
                Column(children: [
                  ServiceDescriptions(attractionData: attractions)
                ]).paddingSymmetric(horizontal: Insets.i20),
                // if (services!.reviews!.isNotEmpty)

                HeadingRowCommon(
                    isTextSize: true,
                    isNotStatic: true,
                    style: appCss.dmDenseMedium16
                        .textColor(appColor(context).darkText),
                    title: language(context, appFonts.reviews),
                    onTap: () => {
                          route.pushNamed(
                              context, routeName.serviceReviewScreen,
                              arg: {"type": "Attraction"}),
                          Provider.of<ServiceReviewProvider>(context,
                                  listen: false)
                              .attractionsReviewListAPI(id: attractions?.id)
                        }).padding(
                    horizontal: Insets.i20,
                    top: Insets.i20,
                    bottom: Insets.i12),

                if (attractions?.reviews != null &&
                    attractions!.reviews.isNotEmpty)
                  Column(
                          children: attractions.reviews
                              .asMap()
                              .entries
                              .map((e) => ServiceReviewLayout(
                                  data: e.value,
                                  index: e.key,
                                  list: attractions.reviews))
                              .toList())
                      .paddingSymmetric(horizontal: 20),
                ButtonCommon(
                    margin: Insets.i20,
                    title: language(context, appFonts.addReview),
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return AnimatedPadding(
                              duration: const Duration(milliseconds: 300),
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: SafeArea(
                                  child: SingleChildScrollView(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                language(context,
                                                    appFonts.addReview),
                                                style: appCss.dmDenseMedium18
                                                    .textColor(appColor(context)
                                                        .darkText)),
                                            Icon(CupertinoIcons.multiply,
                                                    color: appColor(context)
                                                        .darkText)
                                                .inkWell(
                                                    onTap: () =>
                                                        route.pop(context))
                                          ]).paddingSymmetric(
                                          vertical: 20, horizontal: Insets.i20),
                                      Column(children: [
                                        Text(
                                                language(context,
                                                    appFonts.whatDoYouThink),
                                                style: appCss.dmDenseMedium14
                                                    .textColor(appColor(context)
                                                        .lightText))
                                            .paddingAll(Insets.i20),
                                        const DottedLines(),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  language(
                                                      context, appFonts.rateUs),
                                                  style: appCss.dmDenseMedium14
                                                      .textColor(
                                                          appColor(context)
                                                              .darkText)),
                                              const VSpace(Sizes.s12),
                                              Consumer<RateAppProvider>(builder:
                                                  (context, value, child) {
                                                return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: appArray
                                                                .editReviewList
                                                                .asMap()
                                                                .entries
                                                                .map((e) =>
                                                                    EditReviewLayout(
                                                                        data: e
                                                                            .value,
                                                                        index: e
                                                                            .key,
                                                                        selectIndex:
                                                                            value
                                                                                .selectedIndex,
                                                                        onTap:
                                                                            () {
                                                                          value.onTapEmoji(
                                                                              e.key);
                                                                        }))
                                                                .toList())
                                                        .width(MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.3));
                                              }),
                                              const VSpace(Sizes.s25),
                                              Text(
                                                  language(context,
                                                      appFonts.writeYourReview),
                                                  style: appCss.dmDenseMedium14
                                                      .textColor(
                                                          appColor(context)
                                                              .darkText)),
                                              const VSpace(Sizes.s12),
                                              TextFieldCommon(
                                                  hintText: appFonts.writeHere,
                                                  minLines: 8,
                                                  maxLines: 8,
                                                  controller:
                                                      value.rateController,
                                                  focusNode: value.rateFocus,
                                                  isNumber: true,
                                                  validator: (val) => validation
                                                      .commonValidation(
                                                          context, val))
                                            ]).paddingAll(Insets.i20)
                                      ])
                                          .boxShapeExtension(
                                              color:
                                                  appColor(context).fieldCardBg,
                                              radius: AppRadius.r12)
                                          .paddingDirectional(horizontal: 20),
                                      VSpace(Insets.i20),
                                      BottomSheetButtonCommon(
                                              textOne: appFonts.cancel,
                                              textTwo: appFonts.submit,
                                              applyTap: () => value.onSubmit(
                                                  context,
                                                  isBusiness: false,
                                                  id: attractions?.id,
                                                  appObjectId: attractions
                                                      ?.appObject?.appObjectId,
                                                  appObjectType:
                                                      attractions?.appObject
                                                          ?.appObjectType),
                                              clearTap: () =>
                                                  route.pop(context))
                                          .backgroundColor(
                                              appColor(context).whiteColor)
                                          .alignment(Alignment.bottomCenter)
                                    ]).bottomSheetExtension(context),
                              )),
                            );
                          });
                    }).decorated(color: appColor(context).whiteBg)
              ]).marginOnly(bottom: Insets.i20))
        ]))));
      });
    });
  }
}
