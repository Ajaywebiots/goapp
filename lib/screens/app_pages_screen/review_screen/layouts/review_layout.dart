import '../../../../config.dart';
import '../../../../models/api_model/my_review_model.dart';

class ReviewLayout extends StatefulWidget {
  final Review? data;
  final GestureTapCallback? editTap, deleteTap;
  final int? index;

  const ReviewLayout(
      {super.key, this.data, this.deleteTap, this.editTap, this.index});

  @override
  State<ReviewLayout> createState() => _ReviewLayoutState();
}

class _ReviewLayoutState extends State<ReviewLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //Image.asset(data["image"],height: Sizes.s38,width: Sizes.s38).decorated(shape: BoxShape.circle),
        Container(
            height: Sizes.s38,
            width: Sizes.s38,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(eImageAssets.noImageFound3)))),
        const HSpace(Sizes.s10),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.data!.name!,
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).darkText)),
                Row(children: [
                  SvgPicture.asset(eSvgAssets.star),
                  HSpace(Sizes.s2),
                  Text(widget.data!.rating.toString(),
                      style: appCss.dmDenseMedium13
                          .textColor(appColor(context).darkText))
                ])
              ]),
          VSpace(Sizes.s4),
          Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Insets.i7, vertical: Insets.i4),
              decoration: ShapeDecoration(
                  color: appColor(context).primary.withValues(alpha: 0.10),
                  shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                          cornerRadius: 6, cornerSmoothing: 1))),
              child: Text(
                  language(context, widget.data?.category).capitalizeFirst(),
                  style: appCss.dmDenseMedium11
                      .textColor(appColor(context).primary))),
          /* if (data!.service != null)
                Text(data!.service!.title!,
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).lightText))*/
        ]))
      ]),
      //]),
      const VSpace(Sizes.s15),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.data!.description!,
            style:
                appCss.dmDenseMedium12.textColor(appColor(context).darkText)),
        Divider(height: 1, color: appColor(context).fieldCardBg)
            .paddingSymmetric(vertical: Insets.i15),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
              getTime(DateTime.parse(widget.data!.createDate.toString())
                  .toString()),
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).lightText)),
          Row(children: [
            CommonArrow(
                onTap: widget.editTap,
                isThirteen: true,
                arrow: eSvgAssets.edit),
            const HSpace(Sizes.s12),
            CommonArrow(
                onTap: widget.deleteTap,
                isThirteen: true,
                arrow: eSvgAssets.delete,
                svgColor: appColor(context).red,
                color: appColor(context).red.withValues(alpha: 0.1))
          ])
        ])
      ])
    ])
        .width(MediaQuery.of(context).size.width)
        .paddingAll(Insets.i15)
        .boxBorderExtension(context,
            radius: AppRadius.r12, bColor: appColor(context).borderStroke)
        .paddingOnly(bottom: Insets.i20, left: Insets.i20, right: Insets.i20);
  }
}
