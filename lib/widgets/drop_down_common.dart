import '../../../../config.dart';

class CommonDropDown extends StatelessWidget {
  final String? icon, hintText;
  final int? val;
  final List? categoryList;
  final ValueChanged? onChanged;
  final bool? isIcon, isField, isBig;

  const CommonDropDown(
      {super.key,
      this.icon,
      this.hintText,
      this.val,
      this.onChanged,
      this.isField = false,
      this.isIcon = false,
      this.isBig = false,
      this.categoryList});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
            child: ButtonTheme(
                child: DropdownButtonFormField(
                    hint: Text(language(context, hintText ?? ""),
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).lightText)),
                    decoration: InputDecoration(
                        prefixIcon: isIcon == true
                            ? SvgPicture.asset(icon!,
                                fit: BoxFit.scaleDown,
                                colorFilter: ColorFilter.mode(
                                    val == -1
                                        ? appColor(context).lightText
                                        : appColor(context).darkText,
                                    BlendMode.srcIn))
                            : null,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        disabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(AppRadius.r8)),
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(AppRadius.r8)),
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(AppRadius.r8)),
                            borderSide: BorderSide.none),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(AppRadius.r8)),
                            borderSide: BorderSide.none)),
                    padding: EdgeInsets.zero,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppRadius.r8)),
                    style: appCss.dmDenseMedium14.textColor(val == -1 ? appColor(context).lightText : appColor(context).darkText),
                    icon: SvgPicture.asset(eSvgAssets.dropDown, colorFilter: ColorFilter.mode(val == -1 ? appColor(context).lightText : appColor(context).darkText, BlendMode.srcIn)),
                    isDense: true,
                    isExpanded: true,
                    items: categoryList!.asMap().entries.map((e) {
                      return DropdownMenuItem(
                          value: e.value["id"],
                          child: Text(
                              language(context, e.value["title"].toString()),
                              style: appCss.dmDenseMedium12.textColor(val == -1
                                  ? appColor(context).lightText
                                  : appColor(context).darkText)));
                    }).toList(),
                    onChanged: onChanged)))
        .padding(
            vertical: isBig == true ? Insets.i14 : Insets.i6,
            left: isIcon == false
                ? rtl(context)
                    ? Insets.i15
                    : Insets.i10
                : rtl(context)
                    ? Insets.i15
                    : Insets.i2,
            right: rtl(context) ? 10 : Insets.i10)
        .decorated(color: isField == true ? appColor(context).fieldCardBg : appColor(context).whiteBg, borderRadius: BorderRadius.circular(AppRadius.r8));
  }
}
