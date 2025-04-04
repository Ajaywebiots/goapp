import 'package:goapp/models/blog_model.dart';
import 'package:intl/intl.dart';
import '../../../../config.dart';
import '../../../../models/api_model/home_feed_model.dart';

class LatestBlogLayout extends StatelessWidget {
  final Article? data;
  final GestureTapCallback? onTap;
  final double? rPadding;
  final bool? isView;

  const LatestBlogLayout({
    super.key,
    this.onTap,
    this.data,
    this.rPadding,
    this.isView = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: isView!
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width > 500
                    ? Sizes.s155
                    : Sizes.s257,
            child: Column(children: [
              ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.network(data!.media.source,
                      width: isView!
                          ? MediaQuery.of(context).size.width
                          : MediaQuery.of(context).size.width > 500
                              ? Sizes.s155
                              : Sizes.s255,
                      fit: BoxFit.fill)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: Sizes.s180,
                          child: Text(language(context, data!.title),
                              overflow: TextOverflow.ellipsis,
                              style: appCss.dmDenseMedium15
                                  .textColor(appColor(context).darkText))),
                      SvgPicture.asset(data!.isFavourite == true
                          ? 'assets/svg/fav.svg'
                          : "assets/svg/dislike.svg")
                    ]),
                Text(
                    DateFormat("dd MMM, yyyy")
                        .format(DateTime.parse(data!.createdDate.toString())),
                    style: appCss.dmDenseRegular12
                        .textColor(appColor(context).lightText)),
                const VSpace(Sizes.s8),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Insets.i3, horizontal: Insets.i5),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(AppRadius.r4)),
                          color:
                              appColor(context).primary.withValues(alpha: 0.1)),
                      child: Text(data!.category,
                          style: appCss.dmDenseRegular12
                              .textColor(appColor(context).primary)))
                ])
              ]).paddingAll(Insets.i12)
            ]))
        .decorated(
            color: appColor(context).whiteBg,
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 2,
                  color: appColor(context).darkText.withOpacity(0.06))
            ],
            borderRadius: BorderRadius.circular(AppRadius.r8),
            border: Border.all(color: appColor(context).stroke))
        .inkWell(
            onTap: () => route.pushNamed(context, routeName.latestBlogDetails,
                arg: data))
        .padding(right: rPadding ?? Insets.i15, vertical: Insets.i10);
  }
}
