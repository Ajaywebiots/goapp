import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:goapp/models/api_model/review_list_model.dart';
import 'package:goapp/providers/app_pages_provider/search_provider.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/rate_app_provider.dart';
import '../../../providers/app_pages_provider/service_review_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/dotted_line.dart';
import '../../../widgets/edit_review_layout.dart';
import '../add_new_location/drop_down_layout.dart';
import '../services_details_screen/layouts/service_review_layout.dart';
import 'layouts/progress_bar_layout.dart';
import 'layouts/rating_layout.dart';

class ServiceReviewScreen extends StatelessWidget {
  const ServiceReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceReviewProvider>(
        builder: (context1, serviceCtrl, child) {
      final value = Provider.of<RateAppProvider>(context, listen: false);
      final review = serviceCtrl.reviewListData;
      return StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms50)
              .then((s) => serviceCtrl.onReady(context)),
          child: DirectionalityRtl(
              child: Scaffold(
                  appBar:
                      AppBarCommon(title: language(context, appFonts.review)),
                  body: SafeArea(
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RatingBar(
                                glow: false,
                                initialRating: double.parse((review?.avarageRate ?? 0.0)
                                    .toStringAsFixed(1)),
                                minRating: 1,
                                ignoreGestures: true,
                                itemSize: 15,
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
                                    full: SvgPicture.asset(eSvgAssets.star,
                                        colorFilter: ColorFilter.mode(
                                            appColor(context).primary,
                                            BlendMode.srcIn)),
                                    half: SvgPicture.asset(
                                        colorFilter: ColorFilter.mode(
                                            appColor(context).primary,
                                            BlendMode.srcIn),
                                        "assets/svg/halfStar.svg"),
                                    empty: SvgPicture.asset(
                                        colorFilter:
                                            ColorFilter.mode(appColor(context).primary, BlendMode.srcIn),
                                        'assets/svg/starWithout.svg'))),
                            // RatingLayout(
                            //     initialRating: (review!.avarageRate)?.toDouble()),
                            const HSpace(Sizes.s15),
                            Row(children: [
                              Text(language(context, appFonts.averageRate),
                                  style: appCss.dmDenseMedium12
                                      .textColor(appColor(context).primary)),
                              const HSpace(Sizes.s4),
                              Text("${review?.avarageRate}/5",
                                  style: appCss.dmDenseSemiBold12
                                      .textColor(appColor(context).primary))
                            ])
                          ]).paddingAll(Insets.i12).decorated(
                          color:
                              appColor(context).primary.withValues(alpha: 0.1),
                          border: Border.all(color: appColor(context).primary),
                          borderRadius: BorderRadius.circular(AppRadius.r20)),
                      const VSpace(Sizes.s15),
                      Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(5, (i) {
                                int star = 5 - i;
                                var matchingStar = review?.ratesSummary
                                    .firstWhere(
                                        (element) => element.stars == star,
                                        orElse: () => RatesSummary(
                                            stars: star, percentage: 0));

                                return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: ProgressBarLayout(
                                        data: matchingStar?.percentage ?? 0,
                                        index: i,
                                        list: []));
                              }))
                          .paddingSymmetric(
                              vertical: Insets.i15, horizontal: Insets.i20)
                          .boxBorderExtension(context, isShadow: true),
                      const VSpace(Sizes.s25),
                      ButtonCommon(
                          title: 'Add Review',
                          onTap: () {
                            Provider.of<SearchProvider>(context, listen: false)
                                .addReviewTap(context, value);
                          }).paddingOnly(bottom: 25),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(language(context, appFonts.review),
                                    style: appCss.dmDenseMedium16
                                        .textColor(appColor(context).darkText))
                                .paddingOnly(bottom: 40),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: DropDownLayout(
                                    isIcon: false,
                                    val: serviceCtrl.exValue,
                                    categoryList: appArray.reviewLowHighList,
                                    onChanged: (val) =>
                                        serviceCtrl.onReview(val)))
                          ]),
                      const VSpace(Sizes.s15),
                      ...?serviceCtrl.reviewListData?.reviews
                          .asMap()
                          .entries
                          .map((e) => ServiceReviewLayout(
                              data: e.value,
                              index: e.key,
                              list: serviceCtrl.reviewList))
                    ]).paddingSymmetric(horizontal: Insets.i20)),
                  ))));
    });
  }
}
