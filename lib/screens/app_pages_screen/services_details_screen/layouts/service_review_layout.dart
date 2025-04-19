import '../../../../config.dart';

class ServiceReviewLayout extends StatelessWidget {
  final data;
  final List? list;
  final int? index;

  const ServiceReviewLayout({super.key, this.data, this.index, this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: Container(
              height: Sizes.s40,
              width: Sizes.s40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(eImageAssets.noImageFound3)))),
          title: Text(data!.ownerName! ?? "title",
              style:
                  appCss.dmDenseMedium14.textColor(appColor(context).darkText)),
          subtitle: data!.createdAt != null
              ? Text(getTime(DateTime.parse(data!.createdAt!.toString())),
                  style: appCss.dmDenseMedium12
                      .textColor(appColor(context).lightText))
              : Container(),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            SvgPicture.asset(eSvgAssets.star),
            const HSpace(Sizes.s4),
            Text(data!.rating.toString(),
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).darkText))
          ])),
      const VSpace(Sizes.s5),
      Text(data!.description ?? "",
              style:
                  appCss.dmDenseMedium12.textColor(appColor(context).darkText))
          .paddingOnly(bottom: Insets.i15)
    ]))
        .paddingSymmetric(horizontal: Insets.i15)
        .boxBorderExtension(context)
        .paddingOnly(bottom: Insets.i10);
  }
}
