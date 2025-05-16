import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:goapp/screens/app_pages_screen/business_reviews/layout/business_review_layout.dart';

import '../../../config.dart';
import '../../../models/api_model/review_list_model.dart';
import '../../../providers/app_pages_provider/business_reviews_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../add_new_location/drop_down_layout.dart';
import '../review_screen/layouts/review_layout.dart';
import '../service_review_screen/layouts/progress_bar_layout.dart';

class BusinessReviewsScreen extends StatelessWidget {
  const BusinessReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessReviewsProvider>(builder: (context1, value, child) {
      return DirectionalityRtl(
          child: Scaffold(
              appBar: AppBar(
                  leadingWidth: 80,
                  title: Text(language(context, "Business Reviews"),
                      style: appCss.dmDenseBold18
                          .textColor(appColor(context).darkText)),
                  centerTitle: true,
                  leading: CommonArrow(
                      arrow: rtl(context)
                          ? eSvgAssets.arrowRight
                          : eSvgAssets.arrowLeft,
                      onTap: () => route.pop(context)).paddingAll(Insets.i8)),
              body: SafeArea(
                  child: ListView(children: [
                VSpace(Sizes.s20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(children: [
                        RatingBar(
                            glow: false,
                            initialRating:
                                double.parse((1.5).toStringAsFixed(1)),
                            minRating: 1,
                            ignoreGestures: true,
                            itemSize: 15,
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
                                    colorFilter: ColorFilter.mode(
                                        appColor(context).primary,
                                        BlendMode.srcIn),
                                    'assets/svg/starWithout.svg'))),
                        // RatingLayout(
                        //     initialRating: (review!.avarageRate)?.toDouble()),
                        const HSpace(Sizes.s15),
                        Row(children: [
                          Text(language(context, appFonts.averageRate),
                              style: appCss.dmDenseMedium12
                                  .textColor(appColor(context).primary)),
                          const HSpace(Sizes.s4),
                          Text("5/5",
                              style: appCss.dmDenseSemiBold12
                                  .textColor(appColor(context).primary))
                        ])
                      ]).paddingAll(Insets.i12).decorated(
                          color:
                              appColor(context).primary.withValues(alpha: 0.1),
                          border: Border.all(color: appColor(context).primary),
                          borderRadius: BorderRadius.circular(AppRadius.r20))
                    ]),
                const VSpace(Sizes.s15),
                Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(5, (i) {
                          int star = 5 - i;
                          var matchingStar = appArray.businessReviewRating
                              .firstWhere((element) => element["stars"] == star,
                                  orElse: () =>
                                      {"stars": star, "percentage": 0});
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: ProgressBarLayout(
                                  data: matchingStar["percentage"] ?? 0,
                                  index: i,
                                  list: []));
                        }))
                    .paddingSymmetric(
                        vertical: Insets.i15, horizontal: Insets.i20)
                    .boxBorderExtension(context, isShadow: true)
                    .paddingDirectional(horizontal: Sizes.s20),
                const VSpace(Sizes.s45),
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
                              val: value.exValue,
                              categoryList: appArray.reviewLowHighList,
                              onChanged: (val) => value.onReview(val)))
                    ]).paddingDirectional(horizontal: Sizes.s20),
                appArray.businessReviewList.isEmpty
                    ? Center(
                        child: Text(language(context, "No reviews available"),
                            style: appCss.dmDenseMedium16
                                .textColor(appColor(context).lightText)))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: appArray.businessReviewList.length,
                        itemBuilder: (context, index) {
                          final review = appArray.businessReviewList[index];
                          return BusinessReviewLayout(
                            index: index,
                            data: review,
                          ).paddingOnly(top: index == 0 ? 10 : 0);
                        })
              ]))));
    });
  }
}
