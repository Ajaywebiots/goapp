import 'package:flutter_html/flutter_html.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';
import 'package:intl/intl.dart';
import '../../../../config.dart';
import '../../../../providers/app_pages_provider/latest_blog_details_provider.dart';
import '../../../../providers/common_providers/common_api_provider.dart';
import '../../../../widgets/dotted_line.dart';

class BlogDetailsLayout extends StatelessWidget {
  const BlogDetailsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LatestBLogDetailsProvider>(
        builder: (context, latestBlogPvr, child) {
      final article = latestBlogPvr.articleDetail?.article;
      if (article == null) {
        return Container(
            color: appColor(context).darkText.withValues(alpha: 0.2),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: Image.asset(eGifAssets.loader, height: Sizes.s100)));
      }
      return Column(children: [
        if (article.media?.source != null)
          ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(article.media!.source!,
                  width: MediaQuery.of(context).size.width, fit: BoxFit.fill)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(language(context, article.title),
                overflow: TextOverflow.clip,
                style: appCss.dmDenseMedium16
                    .textColor(appColor(context).darkText)),
            SvgPicture.asset(article.isFavourite!
                    ? "assets/svg/fav.svg"
                    : "assets/svg/dislike.svg")
                .inkWell(onTap: () {
              Provider.of<CommonApiProvider>(context, listen: false)
                  .toggleFavAPI(
                      context,
                      article.isFavourite,
                      article.appObject!.appObjectType,
                      article.appObject!.appObjectId, onSuccess: () {
                Provider.of<LatestBLogDetailsProvider>(context, listen: false)
                    .detailsDataAPI(context, article.id, isNotRouting: true);
                Provider.of<LatestBLogDetailsProvider>(context, listen: false)
                    .getArticlesSearchAPI(context);
                Provider.of<HomeScreenProvider>(context, listen: false)
                    .homeFeed(context);
              });
            })
          ]),
          // Row(children: [
          //   Expanded(
          //       child: Text(language(context, value.data!.title),
          //           overflow: TextOverflow.ellipsis,
          //           style: appCss.dmDenseRegular12
          //               .textColor(appColor(context).lightText)))
          // ]),
          const VSpace(Sizes.s25),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
                DateFormat("dd MMM, yyyy")
                    .format(DateTime.parse(article.createdDate.toString())),
                style: appCss.dmDenseRegular12
                    .textColor(appColor(context).lightText)),
            SizedBox(
                width: Sizes.s70,
                child: Text(article.category!,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: appCss.dmDenseMedium11
                            .textColor(appColor(context).primary))
                    .paddingSymmetric(
                        horizontal: Insets.i7, vertical: Insets.i5)
                    .decorated(
                        borderRadius: BorderRadius.circular(AppRadius.r6),
                        color: appColor(context).primary.withOpacity(0.1)))
          ]),
          const DottedLines().paddingSymmetric(vertical: Insets.i15),
          Text(language(context, appFonts.description),
                  style: appCss.dmDenseMedium12
                      .textColor(appColor(context).lightText)
                      .textHeight(0))
              .padding(horizontal: Insets.i10),
          const VSpace(Sizes.s10),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: article.sections.map((section) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Html(data: section.title, style: {
                        "body": Style(
                            fontFamily: GoogleFonts.dmSans().fontFamily,
                            fontSize: FontSize(14),
                            color: appColor(context).darkText,
                            fontWeight: FontWeight.w700)
                      }),
                      const VSpace(Sizes.s5),
                      Html(data: section.text, style: {
                        "body": Style(
                            fontFamily: GoogleFonts.dmSans().fontFamily,
                            fontSize: FontSize(14),
                            color: appColor(context).darkText,
                            fontWeight: FontWeight.w400)
                      }),
                      const VSpace(Sizes.s10)
                    ]);
              }).toList())

          // Html(data: "" /*"value.data!.title"*/, style: {
          //   "body": Style(
          //       fontFamily: GoogleFonts.dmSans().fontFamily,
          //       fontSize: FontSize(12),
          //       fontWeight: FontWeight.w400)
          // })
        ]).paddingAll(Insets.i15)
      ]);
    });
  }
}
