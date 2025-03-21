import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import '../../../../config.dart';
import '../../../../providers/app_pages_provider/latest_blog_details_provider.dart';
import '../../../../widgets/dotted_line.dart';

class BlogDetailsLayout extends StatelessWidget {
  const BlogDetailsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<LatestBLogDetailsProvider>(context, listen: true);
    return Column(children: [
      ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          child: Image.asset(value.data!.media![0].originalUrl!,
              width: MediaQuery.of(context).size.width, fit: BoxFit.fill)),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(language(context, value.data!.title!),
              overflow: TextOverflow.clip,
              style:
                  appCss.dmDenseMedium16.textColor(appColor(context).darkText)),
          SvgPicture.asset(value.isLike
                  ? "assets/svg/dislike.svg"
                  : "assets/svg/fav.svg")
              .inkWell(onTap: () => value.likeDislike())
        ]),
        Row(children: [
          Expanded(
              child: Text(language(context, value.data!.categories![0].title!),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmDenseRegular12
                      .textColor(appColor(context).lightText)))
        ]),
        const VSpace(Sizes.s15),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
              DateFormat("dd MMM, yyyy")
                  .format(DateTime.parse(value.data!.createdAt!)),
              style: appCss.dmDenseRegular12
                  .textColor(appColor(context).lightText)),
          SizedBox(
              width: Sizes.s70,
              child: Text(value.data!.tags![0].name!,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: appCss.dmDenseMedium11
                          .textColor(appColor(context).primary))
                  .paddingSymmetric(horizontal: Insets.i7, vertical: Insets.i5)
                  .decorated(
                      borderRadius: BorderRadius.circular(AppRadius.r6),
                      color: appColor(context).primary.withOpacity(0.1)))
        ]),
        const DottedLines().paddingSymmetric(vertical: Insets.i15),
        Text(language(context, appFonts.description),
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).lightText)
                    .textHeight(0))
            .padding(horizontal: 10),
        // const VSpace(Sizes.s10),
        Html(data: value.data!.content!, style: {
          "body": Style(
              fontFamily: GoogleFonts.dmSans().fontFamily,
              fontSize: FontSize(12),
              fontWeight: FontWeight.w400)
        })
      ]).paddingAll(Insets.i15)
    ]);
  }
}
