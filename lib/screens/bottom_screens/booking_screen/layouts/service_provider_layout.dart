import 'dart:developer';

import '../../../../config.dart';
import '../../../../widgets/dotted_line.dart';

class ServiceProviderLayout extends StatelessWidget {
  final List? list;
  final int? index;
  final String? title, name, rate, image;
  final GestureTapCallback? onTap;
  final bool isProvider;

  const ServiceProviderLayout(
      {super.key,
      this.list,
      this.index,
      this.title,
      this.rate,
      this.name,
      this.image,
      this.onTap,
      this.isProvider = true});

  @override
  Widget build(BuildContext context) {
    log("IMAGE :$image");
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              image != null
                  ? Container(
                      height: Sizes.s40,
                      width: Sizes.s40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(image!))))
                  : Container(
                      height: Sizes.s40,
                      width: Sizes.s40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(eImageAssets.noImageFound3)))),
              const HSpace(Sizes.s8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(language(context, title!),
                      style: appCss.dmDenseMedium12
                          .textColor(appColor(context).lightText)),
                  const VSpace(Sizes.s2),
                  Text(language(context, name!),
                      style: appCss.dmDenseMedium14
                          .textColor(appColor(context).darkText))
                ],
              )
            ],
          ),
          Row(mainAxisSize: MainAxisSize.min, children: [
            SvgPicture.asset(eSvgAssets.star),
            const HSpace(Sizes.s4),
            Text(rate != null && rate != "null" ? rate! : "0",
                style: appCss.dmDenseMedium13
                    .textColor(appColor(context).darkText))
          ])
        ],
      ).marginSymmetric(vertical: Insets.i13),
      if (isProvider && list!.isNotEmpty)
        Divider(color: appColor(context).stroke, thickness: 1, height: 0),
      if (!isProvider && list!.isNotEmpty)
        if (list!.length == 1 || index != list!.length - 1)
          DottedLines(color: appColor(context).stroke)
    ]);
  }
}
