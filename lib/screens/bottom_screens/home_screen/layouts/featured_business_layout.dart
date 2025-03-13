import '../../../../config.dart';
import '../../../../models/service_model.dart';
import '../../../../widgets/add_button_common.dart';
import '../../../../widgets/dotted_line.dart';

class FeaturedServicesLayout extends StatelessWidget {
  final Services? data;
  final GestureTapCallback? onTap, addTap;
  final bool? isProvider, inCart;

  const FeaturedServicesLayout(
      {super.key,
      this.data,
      this.onTap,
      this.isProvider = true,
      this.addTap,
      this.inCart = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  data!.user != null && data!.user!.media!.isNotEmpty
                      ? Container(
                          height: Sizes.s30,
                          width: Sizes.s30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      data!.user!.media![0].originalUrl!))))
                      : Container(
                          height: Sizes.s30,
                          width: Sizes.s30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage(eImageAssets.noImageFound3)))),
                  const HSpace(Sizes.s10),
                  if (data!.user != null)
                    Text(language(context, data!.user!.name ?? ""),
                        style: appCss.dmDenseSemiBold13
                            .textColor(appColor(context).darkText))
                ]),
                Row(children: [
                  SvgPicture.asset(eSvgAssets.star),
                  const HSpace(Sizes.s3),
                  Text(
                      data!.user!.reviewRatings != null
                          ? data!.user!.reviewRatings.toString()
                          : "0.0",
                      style: appCss.dmDenseMedium13
                          .textColor(appColor(context).darkText))
                ])
              ]).paddingAll(Insets.i15),
              Stack(alignment: Alignment.topRight, children: [
                Container(
                    height: Sizes.s150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(data!.media![0].originalUrl!),
                            fit: BoxFit.cover))),
                /* Image.network(data!.media![0].originalUrl!),*/

                if (data!.discount != "")
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isProvider == false
                            ? Row(children: [
                                SvgPicture.asset(
                                  eSvgAssets.zipcode,
                                  height: Sizes.s14,
                                  colorFilter: ColorFilter.mode(
                                      appColor(context).whiteColor,
                                      BlendMode.srcIn),
                                ),
                                const HSpace(Sizes.s4),
                                Text("${data!.duration}",
                                    style: appCss.dmDenseMedium12.textColor(
                                        appColor(context).whiteColor))
                              ]).paddingAll(Insets.i5).decorated(
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r4),
                                color: appColor(context).online)
                            : Container(),
                        SizedBox(
                                child: Text(
                                        "${double.parse(data!.discount!).round()}%",
                                        style: appCss.dmDenseMedium12.textColor(
                                            appColor(context).whiteColor))
                                    .padding(
                                        horizontal: Insets.i9,
                                        top: Insets.i3,
                                        bottom: Insets.i3))
                            .decorated(
                                color: appColor(context).red,
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r30))
                      ]).paddingSymmetric(
                      horizontal: Insets.i20, vertical: Insets.i10)
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text(language(context, data!.title!),
                            style: appCss.dmDenseSemiBold15
                                .textColor(appColor(context).darkText)),
                      ]),
                      /*  SizedBox(
                        width: Sizes.s180,
                        child: Text( language(context, data["work"]),
                            style: appCss.dmDenseSemiBold15
                                .textColor(appColor(context)darkText)),
                      ),*/
                      Row(children: [
                        Text("0.00",
                            style: appCss.dmDenseRegular12
                                .textColor(appColor(context).lightText)
                                .lineThrough),
                        const HSpace(Sizes.s8),
                        Text("0.00",
                            style: appCss.dmDenseBold16
                                .textColor(appColor(context).darkText))
                      ])
                    ]),
                const VSpace(Sizes.s8),
                IntrinsicHeight(
                  child: Row(children: [
                    SvgPicture.asset(eSvgAssets.clock),
                    const HSpace(Sizes.s5),
                    Text("${data!.duration} ${data!.durationUnit}",
                        style: appCss.dmDenseSemiBold12
                            .textColor(appColor(context).online)),
                    VerticalDivider(
                            indent: 1,
                            endIndent: 1,
                            width: 1,
                            color: appColor(context).stroke)
                        .paddingSymmetric(horizontal: Insets.i5),
                    Text(
                        "${language(context, appFonts.min)} ${data!.requiredServicemen} ${language(context, appFonts.servicemenRequired)}",
                        style: appCss.dmDenseRegular12
                            .textColor(appColor(context).darkText)),
                  ]),
                ),
                const HSpace(Sizes.s10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        DottedLines(
                            width: MediaQuery.of(context).size.width - 155),
                        SvgPicture.asset(eSvgAssets.arrowRight1,
                            colorFilter: ColorFilter.mode(
                                appColor(context).stroke, BlendMode.srcIn))
                      ]),
                      const HSpace(Sizes.s10),
                      (inCart!)
                          ? AddedButtonCommon(
                              onTap: addTap,
                            )
                          : AddButtonCommon(onTap: addTap)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\u2022 ",
                          style: appCss.dmDenseRegular13
                              .textColor(appColor(context).lightText)),
                      Expanded(
                          child: Text(language(context, data!.description!),
                                  style: appCss.dmDenseMedium13
                                      .textColor(appColor(context).lightText))
                              .paddingOnly(right: Insets.i70))
                    ])
              ]).padding(horizontal: Insets.i14, vertical: Insets.i13)
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
        .inkWell(onTap: onTap)
        .paddingOnly(bottom: Insets.i15);
  }
}
