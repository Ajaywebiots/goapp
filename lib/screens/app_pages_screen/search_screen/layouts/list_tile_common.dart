import '../../../../config.dart';
import '../../../../widgets/checkbox_common.dart';

class ListTileLayout extends StatelessWidget {
  final data;
  final bool? isBooking;
  final int? index;
  final GestureTapCallback? onTap, onClick;
  final List? selectedCategory;
  final bool isCheckBox, isHavingIcon, iconHave;
  final String? icon, title;
  final Color? color;

  const ListTileLayout(
      {super.key,
      this.data,
      this.onTap,
      this.onClick,
      this.selectedCategory,
      this.isBooking = false,
      this.index,
      this.isCheckBox = true,
      this.isHavingIcon = false,
      this.icon,
      this.iconHave = true,
      this.title,
      this.color});

  @override
  Widget build(BuildContext context) {
    // log("data!.categoryId::${selectedCategory!.contains(data!.categoryId)}");
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IntrinsicHeight(
          child: Row(children: [
        iconHave
            ? getImageWidget(isHavingIcon ? icon : data?.icon)
            : Container(),
        VerticalDivider(
                indent: 1,
                endIndent: 1,
                width: 1,
                color: appColor(context).stroke)
            .paddingSymmetric(horizontal: Insets.i12),
        SizedBox(
            width: Insets.i150,
            child: Text(
                isHavingIcon
                    ? language(context, title)
                    : language(context, data?.translatedValue ?? ''),
                overflow: TextOverflow.ellipsis,
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).darkText)))
      ])),
      isCheckBox
          ? CheckBoxCommon(
              isCheck: selectedCategory!.contains(data!.categoryId),
              onTap: onTap)
          : SvgPicture.asset(eSvgAssets.arrowRight,
              colorFilter:
                  ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn))
    ])
        .inkWell(onTap: onClick)
        .paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15)
        .boxBorderExtension(context, isShadow: true, bColor: Color(0xFFF5F6F7))
        .padding(horizontal: Insets.i20, bottom: Insets.i12);
  }

  Widget getImageWidget(String? icon) {
    if (icon == null) return SizedBox();

    if (icon.startsWith('http')) {
      // Network image
      return Image.network(icon, width: Insets.i24, height: Insets.i24);
    } else {
      // Asset image
      return icon.endsWith('.svg')
          ? SvgPicture.asset(icon,
              width: Insets.i24,
              height: Insets.i24,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn))
          : Image.asset(icon, width: Insets.i24, height: Insets.i24);
    }
  }
}
