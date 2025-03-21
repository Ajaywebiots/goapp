import 'package:goapp/models/blog_model.dart';
import 'package:intl/intl.dart';
import '../../../../config.dart';

class LatestBlogLayout extends StatelessWidget {
  final BlogModel? data;
  final GestureTapCallback? onTap;
  final double? rPadding;
  final bool? isView;
  final bool? isHome;

  const LatestBlogLayout(
      {super.key,
      this.onTap,
      this.data,
      this.rPadding,
      this.isView = false,
      this.isHome = false});

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
                  child: Image.asset(data!.media![0].originalUrl!,
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
                      // Expanded(
                      //     child:
                      SizedBox(
                          width: Sizes.s210,
                          child: Text(language(context, data!.title!),
                              overflow: TextOverflow.ellipsis,
                              style: appCss.dmDenseMedium16
                                  .textColor(appColor(context).darkText))),
                      isHome == true
                          ? Container()
                          : SvgPicture.asset(data!.isFav == true
                              ? 'assets/svg/fav.svg'
                              : "assets/svg/dislike.svg")
                    ]),
                Row(children: [
                  Expanded(
                      child: Text(language(context, data!.categories![0].title),
                          overflow: TextOverflow.ellipsis,
                          style: appCss.dmDenseRegular12
                              .textColor(appColor(context).lightText)))
                ]),
                const VSpace(Sizes.s15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          DateFormat("dd MMM, yyyy")
                              .format(DateTime.parse(data!.createdAt!)),
                          style: appCss.dmDenseRegular12
                              .textColor(appColor(context).lightText)),
                      data!.isTopRated == true
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: Insets.i3, horizontal: Insets.i5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(AppRadius.r4)),
                                  color: appColor(context)
                                      .primary
                                      .withValues(alpha: 0.1)),
                              child: Text("Top Rated",
                                  style: appCss.dmDenseRegular12
                                      .textColor(appColor(context).primary)))
                          : Container()
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
