import 'package:goapp/config.dart';
import 'package:intl/intl.dart';

import '../../../../providers/app_pages_provider/business_details_provider.dart';
import '../../../../widgets/dark_drop_down_layout.dart';
import '../../../../widgets/dotted_line.dart';
import '../../business_register/layouts/company_logo_layout.dart';

class BusinessOfferDetails extends StatelessWidget {
  const BusinessOfferDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<BusinessDetailsProvider,LanguageProvider>(
      builder: (context, value,languages, child)  {
        return Scaffold(
            appBar: AppBar(
                leadingWidth: 60,
                title: Text(language(context, "Offer Details"),
                    style:
                    appCss.dmDenseMedium18.textColor(appColor(context).darkText)),
                centerTitle: true,
                actions: [  SvgPicture.asset(eSvgAssets.translate)
                    .inkWell(onTap: () => value.translateTap(context))
                    .padding(horizontal: Sizes.s20)],
                leading: CommonArrow(
                    arrow: languages.isUserRTl
                        ? eSvgAssets.arrowRight
                        : eSvgAssets.arrowLeft,
                    onTap: () => route.pop(context))
                    .padding(vertical: Insets.i8, left: 20)),
            body: Consumer<BusinessDetailsProvider>(
                builder: (context1, value, child) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          const FieldsBackground(),
                          Form(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                ContainerWithTextLayout(title: "Offer Type")
                                    .paddingOnly(bottom: Insets.i8),
                                DarkDropDownLayout(
                                        svgColor: value.chosenValue != ''
                                            ? appColor(context).lightText
                                            : appColor(context).darkText,
                                        isIcon: true,
                                        icon: eSvgAssets.categorySmall,
                                        isBig: false,
                                        val: value.chosenValue,
                                        hintText: "Offer Type",
                                        categoryList: appArray.offerType,
                                        onChanged: (val) =>
                                            value.onDropDownChange(val))
                                    .paddingSymmetric(horizontal: Insets.i20),
                                ContainerWithTextLayout(title: "Active From")
                                    .paddingOnly(
                                        top: Insets.i24, bottom: Insets.i8),
                                TextFieldCommon(
                                        controller: value.startDateCtrl,
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime initialDate = DateTime.now();

                                          if (value.startDateCtrl.text.isNotEmpty) {
                                            try {
                                              initialDate = DateFormat('dd/MM/yyyy')
                                                  .parse(value.startDateCtrl.text);
                                            } catch (e) {
                                              initialDate = DateTime.now();
                                            }
                                          }

                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: initialDate,
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime.utc(2026),
                                                  builder: (context, child) {
                                                    return Theme(
                                                        data: Theme.of(context).copyWith(
                                                            colorScheme: ColorScheme.light(
                                                                primary: appColor(
                                                                        context)
                                                                    .primary,
                                                                onPrimary:
                                                                    Colors.white,
                                                                onSurface: appColor(
                                                                        context)
                                                                    .darkText),
                                                            textButtonTheme: TextButtonThemeData(
                                                                style: TextButton.styleFrom(
                                                                    foregroundColor:
                                                                        appColor(context)
                                                                            .primary))),
                                                        child: child!);
                                                  });

                                          if (pickedDate != null) {
                                            // value?.selectedBirthday = pickedDate;

                                            // log("gghghghgh ${value?.selectedBirthday}");

                                            String formattedDate =
                                                DateFormat('dd/MM/yyyy')
                                                    .format(pickedDate);
                                            value.startDateCtrl.text =
                                                formattedDate;
                                          }
                                        },
                                        // validator: (v) => validation.nameValidation(context, v),
                                        focusNode: value.startDateFocus,
                                        hintText: "Select the start date",
                                        prefixIcon: eSvgAssets.calendar)
                                    .paddingSymmetric(horizontal: Insets.i20),
                                const VSpace(Sizes.s12),
                                ContainerWithTextLayout(title: "Expire On")
                                    .paddingOnly(
                                        top: Insets.i24, bottom: Insets.i8),
                                TextFieldCommon(
                                        controller: value.endDateCtrl,
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime initialDate = DateTime.now();

                                          if (value.endDateCtrl.text.isNotEmpty) {
                                            try {
                                              initialDate = DateFormat('dd/MM/yyyy')
                                                  .parse(value.endDateCtrl.text);
                                            } catch (e) {
                                              initialDate = DateTime.now();
                                            }
                                          }

                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: initialDate,
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime.utc(2026),
                                                  builder: (context, child) {
                                                    return Theme(
                                                        data: Theme.of(context).copyWith(
                                                            colorScheme: ColorScheme.light(
                                                                primary: appColor(
                                                                        context)
                                                                    .primary,
                                                                onPrimary:
                                                                    Colors.white,
                                                                onSurface: appColor(
                                                                        context)
                                                                    .darkText),
                                                            textButtonTheme: TextButtonThemeData(
                                                                style: TextButton.styleFrom(
                                                                    foregroundColor:
                                                                        appColor(context)
                                                                            .primary))),
                                                        child: child!);
                                                  });

                                          if (pickedDate != null) {
                                            // value?.selectedBirthday = pickedDate;

                                            // log("gghghghgh ${value?.selectedBirthday}");

                                            String formattedDate =
                                                DateFormat('dd/MM/yyyy')
                                                    .format(pickedDate);
                                            value.endDateCtrl.text = formattedDate;
                                          }
                                        },
                                        // validator: (v) => validation.nameValidation(context, v),
                                        focusNode: value.endDateFocus,
                                        hintText: "Select the expiration date",
                                        prefixIcon: eSvgAssets.calendar)
                                    .paddingSymmetric(horizontal: Insets.i20),
                                const DottedLines()
                                    .paddingSymmetric(vertical: Insets.i40),
                                ContainerWithTextLayout(title: " Tag")
                                    .paddingOnly(bottom: Insets.i8),
                                TextFieldCommon(
                                        // validator: (v) => validation.emailValidation(context, v),
                                        controller: value.tagCtrl,
                                        focusNode: value.tagFocus,
                                        hintText: "Enter the tag for this offer",
                                        prefixIcon: eSvgAssets.details)
                                    .paddingSymmetric(horizontal: Insets.i20),
                                ContainerWithTextLayout(title: "Title").paddingOnly(
                                    top: Insets.i24, bottom: Insets.i8),
                                TextFieldCommon(
                                        // validator: (v) => validation.emailValidation(context, v),
                                        controller: value.titleCtrl,
                                        focusNode: value.titleFocus,
                                        keyboardType: TextInputType.emailAddress,
                                        hintText: "Enter title",
                                        prefixIcon: eSvgAssets.details)
                                    .paddingSymmetric(horizontal: Insets.i20),
                                ContainerWithTextLayout(title: "description")
                                    .paddingOnly(
                                        top: Insets.i24, bottom: Insets.i8),
                                Stack(children: [
                                  TextFieldCommon(
                                          focusNode: value.descriptionFocus,
                                          isNumber: true,
                                          // validator: (v) => validation.dynamicTextValidation(
                                          //     context, v, "Please Enter Description"),

                                          controller: value.description,
                                          hintText: "Enter Details",
                                          maxLines: 7,
                                          isMaxLine: true)
                                      .paddingSymmetric(horizontal: Insets.i20),
                                  SvgPicture.asset(eSvgAssets.details,
                                          fit: BoxFit.scaleDown,
                                          colorFilter: ColorFilter.mode(
                                              !value.descriptionFocus.hasFocus
                                                  ? value.description.text
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
                                          focusNode: value.remarksFocus,
                                          isNumber: true,
                                          // validator: (v) => validation.dynamicTextValidation(
                                          //     context, v, "Please Enter Description"),
                                          controller: value.remarksCtrl,
                                          hintText: "Enter remarks",
                                          maxLines: 7,
                                          // minLines: 5,
                                          isMaxLine: true)
                                      .paddingSymmetric(horizontal: Insets.i20),
                                  SvgPicture.asset(eSvgAssets.details,
                                          fit: BoxFit.scaleDown,
                                          colorFilter: ColorFilter.mode(
                                              !value.remarksFocus.hasFocus
                                                  ? value.remarksCtrl.text
                                                          .isNotEmpty
                                                      ? appColor(context).darkText
                                                      : appColor(context).lightText
                                                  : appColor(context).darkText,
                                              BlendMode.srcIn))
                                      .paddingOnly(
                                          left: rtl(context) ? 0 : Insets.i35,
                                          right: rtl(context) ? Insets.i35 : 0,
                                          top: Insets.i13)
                                ]).paddingDirectional(bottom: Sizes.s40)
                              ])).paddingDirectional(vertical: Sizes.s30),
                        ],
                      ).paddingDirectional(all: Sizes.s20),
                      ButtonCommon(title: appFonts.save).paddingDirectional(
                          horizontal: Sizes.s20, bottom: Sizes.s40, top: Sizes.s10)
                    ],
                  ),
                ),
              );
            }));
      }
    );
  }
}
