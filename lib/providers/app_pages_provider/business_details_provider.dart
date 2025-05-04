import 'package:flutter/cupertino.dart';

import '../../config.dart';

class BusinessDetailsProvider extends ChangeNotifier {

  String? chosenValue;

  TextEditingController description = TextEditingController();
  TextEditingController transDescription = TextEditingController();
  TextEditingController startDateCtrl = TextEditingController();
  TextEditingController endDateCtrl = TextEditingController();
  TextEditingController tagCtrl = TextEditingController();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController transTitleCtrl = TextEditingController();
  TextEditingController remarksCtrl = TextEditingController();
  TextEditingController transRemarksCtrl = TextEditingController();
  TextEditingController transTag = TextEditingController();


  final FocusNode startDateFocus = FocusNode();
  final FocusNode endDateFocus = FocusNode();
  final FocusNode descriptionFocus = FocusNode();
  final FocusNode transDescriptionFocus = FocusNode();
  final FocusNode remarksFocus = FocusNode();
  final FocusNode transRemarksFocus = FocusNode();
  final FocusNode tagFocus = FocusNode();
  final FocusNode titleFocus = FocusNode();
  final FocusNode transTitleFocus = FocusNode();
  final FocusNode transTagFocus = FocusNode();



  //Business Categories select
  onDropDownChange(choseVal) {
    chosenValue = choseVal;
    notifyListeners();
  }


  translateTap(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Consumer<LanguageProvider>(
              builder: (context, languages, child) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(language(context, "Translations"),
                                style: appCss.dmDenseMedium18
                                    .textColor(appColor(context).darkText)),
                            const Icon(CupertinoIcons.multiply)
                                .inkWell(onTap: () => route.pop(context))
                          ],
                        ),
                        Stack(
                          children: [
                            const FieldsBackground(),
                            Column(children: [
                              ContainerWithTextLayout(title: "Language"),
                              DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                      child: DropdownButton(
                                          value: languages.currentLanguage
                                              .toString(),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(AppRadius.r10)),
                                          style: appCss.dmDenseMedium16.textColor(
                                              appColor(context).lightText),
                                          icon: SvgPicture.asset(eSvgAssets.dropDown,
                                              colorFilter: ColorFilter.mode(
                                                  appColor(context).darkText,
                                                  BlendMode.srcIn)),
                                          isExpanded: true,
                                          hint: Text(languages.currentLanguage
                                              .substring(0, 2)
                                              .toString()),
                                          selectedItemBuilder: (context) {
                                            int index = appArray.languageList
                                                .indexWhere((element) =>
                                            element['title'] ==
                                                languages.currentLanguage);
                                            return LanguageList()
                                                .langList(index, context);
                                          },
                                          items: appArray.languageList
                                              .asMap()
                                              .entries
                                              .map((e) {
                                            return LanguageList().dropDown(
                                                e.value, context,
                                                onTap: () => languages
                                                    .changeLocale(e.value["title"]
                                                    .toString()));
                                          }).toList(),
                                          onChanged: (val) async {
                                            languages.currentLanguage =
                                                val.toString();
                                            languages.changeLocale(
                                                languages.currentLanguage);
                                          })))
                                  .paddingDirectional(horizontal: Insets.i8)
                                  .decorated(
                                  color: appColor(context).whiteBg,
                                  borderRadius:
                                  BorderRadius.circular(AppRadius.r6),
                                  boxShadow: isDark(context)
                                      ? []
                                      : [
                                    BoxShadow(
                                        color:
                                        appColor(context).fieldCardBg,
                                        blurRadius: AppRadius.r10,
                                        spreadRadius: AppRadius.r5)
                                  ],
                                  border:
                                  Border.all(color: appColor(context).fieldCardBg))
                                  .padding(all: Sizes.s20),
                              ContainerWithTextLayout(title: "Tag")
                                  .paddingOnly(bottom: Insets.i8),
                              TextFieldCommon(
                                  controller: transTag,
                                  validator: (v) =>
                                      validation.nameValidation(context, v),
                                  focusNode: transTagFocus,
                                  hintText: "Enter the tag for this offer",
                                  prefixIcon: "assets/svg/myAccount.svg")
                                  .paddingSymmetric(horizontal: Insets.i20),
                              ContainerWithTextLayout(title: "Title").paddingOnly(
                                  top: Insets.i24, bottom: Insets.i8),
                              TextFieldCommon(
                                // validator: (v) => validation.emailValidation(context, v),
                                  controller: transTitleCtrl,
                                  focusNode: transTitleFocus,
                                  // keyboardType: TextInputType.emailAddress,
                                  hintText: "Enter title",
                                  prefixIcon: eSvgAssets.details)
                                  .paddingSymmetric(horizontal: Insets.i20),
                              ContainerWithTextLayout(title: "description")
                                  .paddingOnly(
                                  top: Insets.i24, bottom: Insets.i8),
                              Stack(children: [
                                TextFieldCommon(
                                    focusNode: transDescriptionFocus,
                                    isNumber: true,
                                    // validator: (v) => validation.dynamicTextValidation(
                                    //     context, v, "Please Enter Description"),

                                    controller: transDescription,
                                    hintText: "Enter Details",
                                    maxLines: 4,
                                    isMaxLine: true)
                                    .paddingSymmetric(horizontal: Insets.i20),
                                SvgPicture.asset(eSvgAssets.details,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                        !transDescriptionFocus.hasFocus
                                            ? transDescription.text
                                            .isNotEmpty
                                            ? appColor(context).darkText
                                            : appColor(context).lightText
                                            : appColor(context).darkText,
                                        BlendMode.srcIn))
                                    .paddingOnly(
                                    left: rtl(context) ? 0 : Insets.i35,
                                    right: rtl(context) ? Insets.i35 : 0,
                                    top: Insets.i13)
                              ]),
                              ContainerWithTextLayout(title: "Remarks")
                                  .paddingOnly(
                                  top: Insets.i24, bottom: Insets.i8),
                              Stack(children: [
                                TextFieldCommon(
                                    focusNode: transRemarksFocus,
                                    isNumber: true,
                                    // validator: (v) => validation.dynamicTextValidation(
                                    //     context, v, "Please Enter Description"),
                                    controller: transRemarksCtrl,
                                    hintText: "Enter remarks",
                                    maxLines: 4,

                                    isMaxLine: true)
                                    .paddingSymmetric(horizontal: Insets.i20),
                                SvgPicture.asset(eSvgAssets.details,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                        !transRemarksFocus.hasFocus
                                            ? transRemarksCtrl.text
                                            .isNotEmpty
                                            ? appColor(context).darkText
                                            : appColor(context).lightText
                                            : appColor(context).darkText,
                                        BlendMode.srcIn))
                                    .paddingOnly(
                                    left: rtl(context) ? 0 : Insets.i35,
                                    right: rtl(context) ? Insets.i35 : 0,
                                    top: Insets.i13)
                              ])
                            ]).padding(vertical: Sizes.s20),
                          ],
                        ).padding(vertical: Sizes.s20),
                        Row(children: [
                          Expanded(
                              child: ButtonCommon(
                                  onTap: () => route.pop(context),
                                  title: appFonts.cancel,
                                  borderColor: appColor(context).primary,
                                  color: appColor(context).whiteBg,
                                  style: appCss.dmDenseSemiBold16
                                      .textColor(appColor(context).primary))),
                          const HSpace(Sizes.s15),
                          Expanded(
                              child: ButtonCommon(
                                  color: appColor(context).primary,
                                  onTap: () {},
                                  style: appCss.dmDenseSemiBold16
                                      .textColor(appColor(context).whiteColor),
                                  title: appFonts.submit))
                        ])
                      ],
                    ).padding(vertical: Sizes.s20, horizontal: Sizes.s20),
                  ),
                );
              });
        });
  }
}
