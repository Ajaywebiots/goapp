import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:goapp/providers/app_pages_provider/search_provider.dart';
import 'package:goapp/providers/app_pages_provider/service_review_provider.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/rate_app_provider.dart';
import '../../../providers/app_pages_provider/services_details_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
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
      final searchPvr = Provider.of<SearchProvider>(context);
      final business = searchPvr.businessDetail?.business;

      return StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms50)
              .then((val) => serviceCtrl.onReady(context)),
          child: DirectionalityRtl(
              child: Scaffold(
                  body: SafeArea(
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
            SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  ServiceImageLayout(
                      image: business?.image?.source,
                      logo: business?.logo?.source),
                  VSpace(Insets.i12),
                  Text(business?.name.toString() ?? "",
                      style: appCss.dmDenseBold14
                          .textColor(appColor(context).darkText)),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    RatingBar(
                        glow: false,
                        initialRating: double.parse(
                            (business?.rating?.starts ?? 0.0)
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
                            empty: SvgPicture.asset(
                                'assets/svg/starWithout.svg'))),
                    Text(" ${business?.rating?.starts ?? 0}",
                        style: appCss.dmDenseRegular13
                            .textColor(appColor(context).darkText)),
                    (business?.rating?.reviewCount ?? 0) > 0
                        ? Text(
                            "  (${business!.rating!.reviewCount} ${language(context, appFonts.reviews)})",
                            style: appCss.dmDenseRegular11
                                .textColor(appColor(context).darkText))
                        : SizedBox.shrink()
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(business?.businessCategories[0].name.toString() ?? "",
                        style: appCss.dmDenseRegular13
                            .textColor(appColor(context).darkText)),
                    SvgPicture.asset('assets/svg/divider.svg')
                        .paddingSymmetric(horizontal: 10),
                    Row(
                        children: List.generate(5, (index) {
                      final priceRange = business?.priceRange ?? 0;
                      return Text("€",
                          style: appCss.dmDenseMedium12.textColor(
                              index < priceRange
                                  ? appColor(context).darkText
                                  : appColor(context).lightText));
                    }))
                  ]),
                  VSpace(Insets.i15),
                  Column(children: [ServiceDescription(businessData: business)])
                      .paddingSymmetric(horizontal: Insets.i20),
                  // if (services!.reviews!.isNotEmpty)
                  (business?.offers.isEmpty ?? true)
                      ? Container()
                      : Column(children: [
                          HeadingRowCommon(
                                  isNotStatic: true,
                                  style: appCss.dmDenseMedium16
                                      .textColor(appColor(context).darkText),
                                  title: appFonts.activeOffers,
                                  onTap: () => route.pushNamed(
                                      context, routeName.couponListScreen),
                                  subTitle: appFonts.viewHistory)
                              .paddingOnly(top: Insets.i20, bottom: Insets.i12),
                          ...business!.offers
                              .asMap()
                              .entries
                              .map((e) => CouponLayout(
                                  data: e.value,
                                  onTap: () {
                                    route.pushNamed(
                                        context, routeName.offerDetailsScreen);
                                  }))
                        ]).paddingSymmetric(horizontal: 20),
                  HeadingRowCommon(
                      isNotStatic: true,
                      style: appCss.dmDenseMedium16
                          .textColor(appColor(context).darkText),
                      title: language(context, appFonts.reviews),
                      onTap: () => {
                            route.pushNamed(
                                context, routeName.serviceReviewScreen),
                            Provider.of<ServiceReviewProvider>(context,
                                    listen: false)
                                .businessReviewListAPI(id: business?.id)
                          }).padding(
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
                          onTap: () => searchPvr.addReviewTap(context, value))
                      .decorated(color: appColor(context).whiteBg)
                ]).marginOnly(bottom: Insets.i20))
          ])))));
    });
  }
}
