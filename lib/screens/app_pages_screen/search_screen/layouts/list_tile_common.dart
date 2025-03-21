import '../../../../config.dart';
import '../../../../widgets/checkbox_common.dart';

class ListTileLayout extends StatelessWidget {
  final data;
  final bool? isBooking;
  final int? index;
  final GestureTapCallback? onTap;
  final List? selectedCategory;
  final bool isCheckBox, isHavingIcon;
  final String? icon, title;

  const ListTileLayout(
      {super.key,
      this.data,
      this.onTap,
      this.selectedCategory,
      this.isBooking = false,
      this.index,
      this.isCheckBox = true,
      this.isHavingIcon = false,
      this.icon,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IntrinsicHeight(
          child: Row(children: [
        isHavingIcon
            ? getImageWidget(icon)
            : data!.media != null && data!.media!.isNotEmpty
                ? SvgPicture.asset(data!.media![0].originalUrl!,
                    height: Sizes.s20, width: Sizes.s20)
                : Image.asset(eImageAssets.noImageFound1,
                    height: Sizes.s20, width: Sizes.s20),
        VerticalDivider(
                indent: 1,
                endIndent: 1,
                width: 1,
                color: appColor(context).stroke)
            .paddingSymmetric(horizontal: Insets.i12),
        isHavingIcon
            ? Text(language(context, title),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).darkText))
            : Text(language(context, data!.title),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).darkText))
      ])),
      isCheckBox
          ? CheckBoxCommon(
              isCheck: selectedCategory!.contains(data!.id), onTap: onTap)
          : SvgPicture.asset(
              eSvgAssets.arrowRight,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
            )
    ])
        .paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15)
        .boxBorderExtension(context, isShadow: true, bColor: Color(0xFFF5F6F7))
        .padding(horizontal: Insets.i20, bottom: Insets.i12);
  }

  Widget getImageWidget(String? icon) {
    if (icon == null) return SizedBox();

    return icon.endsWith('.svg')
        ? SvgPicture.asset(icon,
            width: Insets.i24,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn))
        : Image.asset(icon, width: Insets.i24);
  }
}
