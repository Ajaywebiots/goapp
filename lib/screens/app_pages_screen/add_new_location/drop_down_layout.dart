import 'dart:developer';

import '../../../../config.dart';

class DropDownLayout extends StatelessWidget {
  final String? icon;
  final int? val;
  final List<CountryStateModel>? list;
  final List<StateModel>? stateList;
  final List? categoryList;
  final ValueChanged? onChanged;
  final bool? isIcon, isServiceManList,isWallet;

  const DropDownLayout(
      {super.key,
      this.icon,
      this.val,
      this.list,
      this.onChanged,
      this.isIcon = false,
      this.isServiceManList = false,
      this.isWallet = false,
      this.stateList,
      this.categoryList});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
            child: ButtonTheme(
                child: DropdownButtonFormField(selectedItemBuilder: (context) =>  list != null && list!.isNotEmpty
                    ? list!.asMap().entries.map((e) {
                  return DropdownMenuItem(
                      value: e.value.id,
                      child: Text(e.value.name.toString()));
                }).toList()
                    : stateList != null && stateList!.isNotEmpty
                    ? stateList!.asMap().entries.map((e) {
                  return DropdownMenuItem(
                      value: e.value.id,
                      child: Text(e.value.name.toString()));
                }).toList()
                    : categoryList!.asMap().entries.map((e) {
                  return DropdownMenuItem(
                      value: e.value["id"],
                      child: Text(
                        language(
                            context, e.value["title"].toString()),
                        style: appCss.dmDenseMedium14.textColor(
                            appColor(context).appTheme.darkText),
                      ));
                }).toList(),
                    decoration: InputDecoration(
                        prefixIcon: isIcon == true
                            ? SvgPicture.asset(icon!,
                                fit: BoxFit.scaleDown,
                                colorFilter: ColorFilter.mode(
                                    isServiceManList!
                                        ? appColor(context).appTheme.darkText
                                        : appColor(context).appTheme.lightText,
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
                    padding: EdgeInsets.only(

                        left: rtl(context)
                            ? 0
                            : isIcon == true
                                ? 0
                                : 15,
                        right: rtl(context)
                            ? isIcon == true
                                ? 0
                                : 15
                            : 0),
                    value: val!,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppRadius.r8)),
                    style: isIcon == false
                        ? appCss.dmDenseMedium12
                            .textColor(appColor(context).appTheme.darkText)
                        : appCss.dmDenseMedium14
                            .textColor(appColor(context).appTheme.lightText),
                    icon: SvgPicture.asset(eSvgAssets.dropDown,
                        colorFilter: ColorFilter.mode(
                            isIcon == false
                                ? appColor(context).appTheme.darkText
                                : appColor(context).appTheme.lightText,
                            BlendMode.srcIn)),
                    isDense: true,
                    isExpanded: true,
                    items: list != null && list!.isNotEmpty
                        ? list!.asMap().entries.map((e) {
                            return DropdownMenuItem(
                                value: e.value.id,
                                child: Text(e.value.name.toString()));
                          }).toList()
                        : stateList != null && stateList!.isNotEmpty
                            ? stateList!.asMap().entries.map((e) {
                                return DropdownMenuItem(
                                    value: e.value.id,
                                    child: Text(e.value.name.toString()));
                              }).toList()
                            : categoryList!.asMap().entries.map((e) {
                                return DropdownMenuItem(
                                    value: e.value["id"],
                                    alignment: Alignment.center,
                                    child: Column( mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if(isWallet!)
                                              Row(
                                                children: [
                                                  SvgPicture.asset(e.value['icon']),
                                                  const HSpace(Sizes.s12)
                                                ],
                                              ),
                                            Text(
                                              language(
                                                  context, e.value["title"].toString()),
                                              textAlign: TextAlign.center,
                                              style: appCss.dmDenseMedium14.textColor(
                                                  appColor(context).appTheme.darkText),
                                            ).marginOnly(bottom: Insets.i15),
                                          ],
                                        ),
                                        if(e.key != categoryList!.length -1)
                                        Divider(color: appColor(context).appTheme.stroke,height: 0,)
                                      ],
                                    ));
                              }).toList(),
                    onChanged: onChanged)))
        .padding(vertical: isIcon == false ? Insets.i12 : Insets.i2, left: rtl(context) ? Insets.i15 : 0, right: rtl(context) ? 0 : Insets.i15)
        .decorated(color: isIcon == false ? appColor(context).appTheme.fieldCardBg : appColor(context).appTheme.whiteBg, borderRadius: BorderRadius.circular(AppRadius.r8));
  }
}
