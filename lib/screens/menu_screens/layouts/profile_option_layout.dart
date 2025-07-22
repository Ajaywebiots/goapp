import '../../../../config.dart';

class ProfileOptionLayout extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  final List? list;
  final int? index, indexMain;
  final IconData? icon;

  const ProfileOptionLayout({
    super.key,
    this.data,
    this.onTap,
    this.list,
    this.index,
    this.indexMain,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                // Icon rendering (Material Icon style)
                CommonArrow(
                    arrow: data.icon,
                    color:  Color(0xffF0F0F0),
                    svgColor: appColor(context).darkText),
                const HSpace(Sizes.s15),
                Text(language(context, data.title),
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).darkText)),
              ]),
              if (data.isArrow == true)
                SvgPicture.asset(
                    rtl(context)
                        ? eSvgAssets.arrowLeft
                        : eSvgAssets.arrowRight,
                    colorFilter: ColorFilter.mode(
                        appColor(context).lightText, BlendMode.srcIn))
            ]),
            if (index != list!.length - 1)
              Divider(
                  height: 0,
                  color: appColor(context).fieldCardBg,
                  thickness: 1)
                  .paddingSymmetric(vertical: Insets.i12)
          ])
        ]).inkWell(onTap: onTap);
  }
}
