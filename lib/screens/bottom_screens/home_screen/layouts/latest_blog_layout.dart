import 'dart:developer';

import 'package:goapp/models/blog_model.dart';
import 'package:intl/intl.dart';
import '../../../../config.dart';

class LatestBlogLayout extends StatelessWidget {
  final BlogModel? data;
  final GestureTapCallback? onTap;
  final double? rPadding;
  final bool? isView;

  const LatestBlogLayout(
      {super.key, this.onTap, this.data, this.rPadding, this.isView = false});

  @override
  Widget build(BuildContext context) {
    log("shhh :${MediaQuery.of(context).size.width}");
    return SizedBox(
            width: isView!
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width > 500
                    ? Sizes.s155
                    : Sizes.s300,
            child: Column(children: [
              Image.asset(data!.media![0].originalUrl!,
                  width: isView!
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width > 500
                          ? Sizes.s155
                          : Sizes.s300,
                  fit: BoxFit.fill),
              //   Image.network(data!.media![0].originalUrl!),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                          width: Sizes.s190,
                          child: Text(language(context, data!.title!),
                              overflow: TextOverflow.ellipsis,
                              style: appCss.dmDenseMedium16
                                  .textColor(appColor(context).darkText))),
                    ),
                    if (isView == true)
                      SizedBox(
                        width: Sizes.s70,
                        child: Text(data!.tags![0].name!,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: appCss.dmDenseMedium11
                                    .textColor(appColor(context).primary))
                            .paddingSymmetric(
                                horizontal: Insets.i7, vertical: Insets.i5)
                            .decorated(
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r6),
                                color:
                                    appColor(context).primary.withOpacity(0.1)),
                      )
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: Text(language(context, data!.categories![0].title),
                        overflow: TextOverflow.ellipsis,
                        style: appCss.dmDenseRegular12
                            .textColor(appColor(context).lightText)),
                  ),
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
                      Text("- By ${language(context, data!.createdBy!.name!)}",
                          style: appCss.dmDenseRegular12
                              .textColor(appColor(context).lightText))
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
        .inkWell()
        .padding(right: rPadding ?? Insets.i15, vertical: Insets.i10);
  }
}
