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
    if (icon == null || icon.isEmpty) return const SizedBox();

    if (icon.startsWith('http')) {
      return CachedNetworkImage(
          imageUrl: icon,
          width: Insets.i24,
          height: Insets.i24,
          placeholder: (context, url) => const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 0.1)),
          errorWidget: (context, url, error) =>
              const Icon(Icons.image, size: 24, color: Colors.grey));
    } else {
      return icon.endsWith('.svg')
          ? SvgPicture.asset(icon,
              width: Insets.i24,
              height: Insets.i24,
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn))
          : Image.asset(icon, width: Insets.i24, height: Insets.i24);
    }
  }
}
