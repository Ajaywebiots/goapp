import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:goapp/providers/app_pages_provider/search_provider.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/rate_app_provider.dart';
import '../../../providers/app_pages_provider/services_details_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/dotted_line.dart';
import '../../../widgets/edit_review_layout.dart';
import '../../../widgets/heading_row_common.dart';
import '../coupon_list_screen/layouts/coupon_layout.dart' show CouponLayout;
import 'layouts/service_description.dart';
import 'layouts/service_image_layout.dart';
import 'layouts/service_review_layout.dart';

class BusinessDetailsScreen extends StatelessWidget {
  const BusinessDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesDetailsProvider>(
        builder: (context1, serviceCtrl, child) {
      final dash = Provider.of<DashboardProvider>(context, listen: false);
      final value = Provider.of<RateAppProvider>(context, listen: false);
      final searchPvr = Provider.of<SearchProvider>(context, listen: false);
      final business = searchPvr.businessDetail?.business;

      return StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms50)
              .then((val) => serviceCtrl.onReady(context)),
          child: LoadingComponent(
              child: SafeArea(
            child: Scaffold(
                body: serviceCtrl.service == null
                    ? Container()
                    : Stack(alignment: Alignment.bottomCenter, children: [
                        SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              ServiceImageLayout(
                                  image: business?.image?.source,
                                  logo: business?.logo?.source),
                              VSpace(Insets.i12),
                              Text(business?.name.toString() ?? "",
                                  style: appCss.dmDenseBold14),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RatingBar.builder(
                                        glow: false,
                                        initialRating:
                                            (business?.rating?.starts ?? 0.0),
                                        minRating: 1,
                                        ignoreGestures: true,
                                        itemSize: 13,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        itemBuilder: (context, index) {
                                          double rating =
                                              business?.rating?.starts ?? 0.0;
                                          return SvgPicture.asset(rating > index
                                              ? eSvgAssets.star
                                              : 'assets/svg/starWithout.svg');
                                        },
                                        updateOnDrag: true,
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        }),
                                    Text(" ${business?.rating!.starts}",
                                        style: appCss.dmDenseRegular13),
                                    Text(
                                        "  (${business?.rating!.reviewCount} reviews)",
                                        style: appCss.dmDenseRegular11)
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        business?.businessCategories[0].name
                                                .toString() ??
                                            "",
                                        style: appCss.dmDenseRegular13),
                                    SvgPicture.asset('assets/svg/divider.svg')
                                        .paddingSymmetric(horizontal: 10),
                                    Text("€ ${business?.priceRange}",
                                        style: appCss.dmDenseMedium12)
                                  ]),
                              VSpace(Insets.i15),
                              Column(children: [
                                ServiceDescription(businessData: business)
                              ]).paddingSymmetric(horizontal: Insets.i20),
                              // if (services!.reviews!.isNotEmpty)
                              (business?.offers.isEmpty ?? true)
                                  ? Container()
                                  : Column(children: [
                                      HeadingRowCommon(
                                              isNotStatic: true,
                                              style: appCss.dmDenseMedium16
                                                  .textColor(appColor(context)
                                                      .darkText),
                                              title: appFonts.activeOffers,
                                              onTap: () => route.pushNamed(
                                                  context,
                                                  routeName.couponListScreen),
                                              subTitle: appFonts.viewHistory)
                                          .paddingOnly(
                                              top: Insets.i20,
                                              bottom: Insets.i12),
                                      ...business!.offers
                                          .asMap()
                                          .entries
                                          .map((e) => CouponLayout(
                                              data: e.value,
                                              onTap: () {
                                                route.pushNamed(
                                                    context,
                                                    routeName
                                                        .offerDetailsScreen);
                                              }))
                                    ]).paddingSymmetric(horizontal: 20),
                              HeadingRowCommon(
                                  isNotStatic: true,
                                  style: appCss.dmDenseMedium16
                                      .textColor(appColor(context).darkText),
                                  title: language(context, appFonts.reviews),
                                  onTap: () => route.pushNamed(context,
                                      routeName.serviceReviewScreen)).padding(
                                  horizontal: Insets.i20,
                                  top: Insets.i20,
                                  bottom: Insets.i12),

                              // if (services!.reviews!.isNotEmpty)
                              Column(
                                      children: (business?.reviews ?? [])
                                          .asMap()
                                          .entries
                                          .map((e) => ServiceReviewLayout(
                                              data: e.value,
                                              index: e.key,
                                              list: business?.reviews))
                                          .toList())
                                  .paddingSymmetric(horizontal: 20),
                              ButtonCommon(
                                  margin: Insets.i20,
                                  title: appFonts.addReview,
                                  onTap: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.4,
                                              child: Stack(children: [
                                                SingleChildScrollView(
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                language(
                                                                    context,
                                                                    appFonts
                                                                        .addReview),
                                                                style: appCss
                                                                    .dmDenseMedium18
                                                                    .textColor(appColor(
                                                                            context)
                                                                        .darkText)),
                                                            const Icon(
                                                                    CupertinoIcons
                                                                        .multiply)
                                                                .inkWell(
                                                                    onTap: () =>
                                                                        route.pop(
                                                                            context))
                                                          ]).paddingSymmetric(
                                                          vertical: 20,
                                                          horizontal:
                                                              Insets.i20),
                                                      Column(children: [
                                                        Text(
                                                                language(
                                                                    context,
                                                                    appFonts
                                                                        .whatDoYouThink),
                                                                style: appCss
                                                                    .dmDenseMedium14
                                                                    .textColor(appColor(
                                                                            context)
                                                                        .lightText))
                                                            .paddingAll(
                                                                Insets.i20),
                                                        const DottedLines(),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  language(
                                                                      context,
                                                                      appFonts
                                                                          .rateUs),
                                                                  style: appCss
                                                                      .dmDenseMedium14
                                                                      .textColor(
                                                                          appColor(context)
                                                                              .darkText)),
                                                              const VSpace(
                                                                  Sizes.s12),
                                                              Consumer<
                                                                      RateAppProvider>(
                                                                  builder:
                                                                      (context,
                                                                          rate,
                                                                          child) {
                                                                return SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis
                                                                            .horizontal,
                                                                    child: Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: appArray.editReviewList
                                                                                .asMap()
                                                                                .entries
                                                                                .map((e) => EditReviewLayout(
                                                                                    data: e.value,
                                                                                    index: e.key,
                                                                                    selectIndex: rate.selectedIndex,
                                                                                    onTap: () {
                                                                                      rate.onTapEmoji(e.key);
                                                                                    }))
                                                                                .toList())
                                                                        .width(MediaQuery.of(context).size.width / 1.3));
                                                              }),
                                                              const VSpace(
                                                                  Sizes.s25),
                                                              Text(
                                                                  language(
                                                                      context,
                                                                      appFonts
                                                                          .writeYourReview),
                                                                  style: appCss
                                                                      .dmDenseMedium14
                                                                      .textColor(
                                                                          appColor(context)
                                                                              .darkText)),
                                                              const VSpace(
                                                                  Sizes.s12),
                                                              TextFieldCommon(
                                                                  hintText: appFonts
                                                                      .writeHere,
                                                                  minLines: 8,
                                                                  maxLines: 8,
                                                                  controller: value
                                                                      .rateController,
                                                                  focusNode: value
                                                                      .rateFocus,
                                                                  isNumber:
                                                                      true,
                                                                  validator: (val) =>
                                                                      validation.commonValidation(
                                                                          context,
                                                                          val))
                                                            ]).paddingAll(
                                                            Insets.i20)
                                                      ])
                                                          .boxShapeExtension(
                                                              color: appColor(
                                                                      context)
                                                                  .fieldCardBg,
                                                              radius:
                                                                  AppRadius.r12)
                                                          .paddingDirectional(
                                                              horizontal: 20),
                                                      VSpace(Insets.i20),
                                                      BottomSheetButtonCommon(
                                                              textOne: appFonts
                                                                  .cancel,
                                                              textTwo: appFonts
                                                                  .submit,
                                                              applyTap: () =>
                                                                  value.onSubmit(
                                                                      context),
                                                              clearTap: () =>
                                                                  value.onSubmit(
                                                                      context))
                                                          .backgroundColor(
                                                              appColor(context)
                                                                  .whiteColor)
                                                          .alignment(Alignment
                                                              .bottomCenter)
                                                    ]))
                                              ])).bottomSheetExtension(context);
                                        });
                                  }).decorated(color: appColor(context).whiteBg)
                            ]).marginOnly(bottom: Insets.i20))
                      ])),
          )));
    });
  }
}
