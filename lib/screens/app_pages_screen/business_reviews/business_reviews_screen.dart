import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:goapp/screens/app_pages_screen/business_reviews/layout/business_review_layout.dart';
import '../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../add_new_location/drop_down_layout.dart';

class BusinessReviewsScreen extends StatefulWidget {
  const BusinessReviewsScreen({super.key});

  @override
  State<BusinessReviewsScreen> createState() => _BusinessReviewsScreenState();
}

class _BusinessReviewsScreenState extends State<BusinessReviewsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BusinessReviewsProvider>(context, listen: false)
          .loadInitialReviews(List<Map<String, dynamic>>.from(
          appArray.businessReviewList ?? []));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessReviewsProvider>(
      builder: (context, value, child) {
        return DirectionalityRtl(
          child: Scaffold(
            appBar: AppBar(
              title: Text(language(context, "Business Reviews"),
                  style: appCss.dmDenseBold18
                      .textColor(appColor(context).darkText)),
              centerTitle: true,
              leading: CommonArrow(
                arrow: rtl(context)
                    ? eSvgAssets.arrowRight
                    : eSvgAssets.arrowLeft,
                onTap: () => route.pop(context),
              ).paddingAll(Insets.i8),
            ),
            body: SafeArea(
              child: ListView(
                children: [
                  const VSpace(Sizes.s20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(language(context, appFonts.review),
                          style: appCss.dmDenseMedium16
                              .textColor(appColor(context).darkText)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: DropDownLayout(
                          isIcon: false,
                          val: value.exValue,
                          categoryList: appArray.reviewLowHighList,
                          onChanged: (val) => value.onReview(val),
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: Insets.i20),
                  const VSpace(Sizes.s20),
                  value.filteredReviews.isEmpty
                      ? Center(
                    child: Text(language(context, "No reviews available"),
                        style: appCss.dmDenseMedium16
                            .textColor(appColor(context).lightText)),
                  )
                      : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.filteredReviews.length,
                    itemBuilder: (context, index) {
                      final review = value.filteredReviews[index];
                      return BusinessReviewLayout(
                        index: index,
                        data: review,
                      ).paddingOnly(top: index == 0 ? 10 : 0);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
