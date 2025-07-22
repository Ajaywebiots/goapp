import '../../../../config.dart';

class ProfileOptionLayout extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  final List? list;
  final int? index, indexMain;

  const ProfileOptionLayout(
      {super.key,
      this.data,
      this.onTap,
      this.list,
      this.index,
      this.indexMain});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                CommonArrow(
                    arrow: data.icon,
                    color: data.title == "Logout"
                        ? appColor(context).whiteBg
                        : Color(0xffF0F0F0),
                    svgColor: appColor(context).darkText),
                const HSpace(Sizes.s15),
                Text(language(context, data.title),
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).darkText))
              ]),
              if (data.isArrow == true)
                SvgPicture.asset(
                    rtl(context) ? eSvgAssets.arrowLeft : eSvgAssets.arrowRight,
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
