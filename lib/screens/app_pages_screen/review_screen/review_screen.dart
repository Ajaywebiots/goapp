import '../../../config.dart';
import '../../../providers/app_pages_provider/my_review_provider.dart';
import 'layouts/review_layout.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyReviewProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms50)
              .then((_) => value.getMyReview(context)),
          child: Scaffold(
              appBar: AppBar(
                  leadingWidth: 80,
                  title: Text(language(context, "My Reviews"),
                      style: appCss.dmDenseBold18
                          .textColor(appColor(context).darkText)),
                  centerTitle: true,
                  leading: CommonArrow(
                      arrow: rtl(context)
                          ? eSvgAssets.arrowRight
                          : eSvgAssets.arrowLeft,
                      onTap: () => route.pop(context)).paddingAll(Insets.i8)),
              body: ListView(
                children: value.reviews
                    .asMap()
                    .entries
                    .map((e) => ReviewLayout(
                            index: e.key,
                            data: e.value,
                            deleteTap: () {},
                            editTap: () {})
                        .paddingOnly(top: e.key == 0 ? 10 : 0))
                    .toList(),
              )));
    });
  }
}
