import '../../../../config.dart';
import '../../../../models/provider_model.dart';

class ExpertServiceLayout extends StatelessWidget {
  final ProviderModel? data;
  final GestureTapCallback? onTap;
  final bool isHome;

  const ExpertServiceLayout(
      {super.key, this.data, this.onTap, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Row(children: [
            data != null && data!.media!.isNotEmpty
                ? Container(
                    height: Sizes.s72,
                    width: Sizes.s72,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage(data!.media![0].originalUrl!))),
                  ).boxShapeExtension()
                : Container(
                    height: Sizes.s72,
                    width: Sizes.s72,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage(eImageAssets.noImageFound4))),
                  ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  language(
                      context, data != null ? data!.name! : appFonts.provider),
                  style: appCss.dmDenseSemiBold15
                      .textColor(appColor(context).darkText)),
              SizedBox(
                  width: Sizes.s160,
                  child: Text(language(context, data!.expertise![0].title!),
                      overflow: TextOverflow.ellipsis,
                      style: appCss.dmDenseSemiBold12
                          .textColor(appColor(context).darkText))),
              const VSpace(Sizes.s15),
              Row(children: [
                SvgPicture.asset(eSvgAssets.locationOut, height: Sizes.s20),
                const HSpace(Sizes.s5),
                SizedBox(
                    width: Sizes.s140,
                    child: Text(
                        data != null && data!.primaryAddress != null
                            ? "${data!.primaryAddress!.address!}${data!.primaryAddress!.area != null ? ", ${data!.primaryAddress!.area}" : ""}, ${data!.primaryAddress!.city}"
                            : "Address Not Provided",
                        overflow: TextOverflow.ellipsis,
                        style: appCss.dmDenseRegular12
                            .textColor(appColor(context).lightText)))
              ])
            ]).paddingOnly(left: Insets.i10)
          ]),
          Row(children: [
            SvgPicture.asset(eSvgAssets.star),
            const HSpace(Sizes.s3),
            Text(
                data!.reviewRatings != null
                    ? data!.reviewRatings.toString()
                    : "0",
                style: appCss.dmDenseSemiBold13
                    .textColor(appColor(context).darkText))
          ])
        ])
        .paddingAll(Insets.i15)
        .boxBorderExtension(context, isShadow: isHome)
        .inkWell(onTap: onTap)
        .paddingOnly(bottom: Insets.i15);
  }
}
