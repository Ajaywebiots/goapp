import '../config.dart';

class EditReviewLayout extends StatelessWidget {
  final dynamic data;
  final int? selectIndex, index;
  final GestureTapCallback? onTap;

  const EditReviewLayout(
      {super.key, this.data, this.index, this.selectIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(data["icon"],
              height: Sizes.s24,
              width: Sizes.s24,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                  selectIndex == index
                      ? appColor(context).primary
                      : appColor(context).lightText,
                  BlendMode.srcIn))
          .paddingAll(Insets.i14)
          .boxBorderExtension(context,
              isShadow: false,
              bColor: selectIndex == index
                  ? appColor(context).primary
                  : appColor(context).stroke),
      const VSpace(Sizes.s6),
      SizedBox(
          child: Text(language(context, data["title"]),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: appCss.dmDenseMedium12.textColor(selectIndex == index
                  ? appColor(context).primary
                  : appColor(context).lightText)))
    ]).inkWell(onTap: onTap);
  }
}
