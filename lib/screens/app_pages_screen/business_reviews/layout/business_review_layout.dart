import 'dart:developer';

import 'package:goapp/widgets/flutter_switch_common.dart';

import '../../../../config.dart';

class BusinessReviewLayout extends StatefulWidget {
  final  data;
  final int? index;

  const BusinessReviewLayout(
      {super.key, this.data, this.index});

  @override
  State<BusinessReviewLayout> createState() => _BusinessReviewLayoutState();
}

class _BusinessReviewLayoutState extends State<BusinessReviewLayout> {
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
                    Text(widget.data['name'],
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).darkText)),
                    Row(children: [
                      SvgPicture.asset(eSvgAssets.star),
                      HSpace(Sizes.s2),
                      Text(widget.data['rating'].toString(),
                          style: appCss.dmDenseMedium13
                              .textColor(appColor(context).darkText))
                    ])
                  ]),
              VSpace(Sizes.s4),
              Text(
                  language(context, widget.data["time"]),
                  style: appCss.dmDenseMedium11
                      .textColor(appColor(context).primary)),
              /* if (data!.service != null)
                Text(data!.service!.title!,
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).lightText))*/
            ]))
      ]),
      //]),
      const VSpace(Sizes.s20),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.data["description"]!,
            style:
            appCss.dmDenseMedium12.textColor(appColor(context).darkText)),
        Divider(height: 1, color: appColor(context).fieldCardBg)
            .paddingSymmetric(vertical: Insets.i15),
        Row(mainAxisAlignment: MainAxisAlignment.end,children: [
          Text("Show Review",
              style:
              appCss.dmDenseMedium12.textColor(appColor(context).darkText)),
          const HSpace(Sizes.s12),
          FlutterSwitchCommon(value: widget.data['showReview'],onToggle: (value) {
log("widget.data['showReview']::${widget.data['showReview']}");


          },),
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
