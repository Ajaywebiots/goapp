import 'package:intl/intl.dart';

import '../../../../config.dart';
import '../../../../providers/app_pages_provider/profile_detail_provider.dart';

class TextFieldLayout extends StatelessWidget {
  final ProfileDetailProvider? value;

  const TextFieldLayout({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ContainerWithTextLayout(title: language(context, appFonts.firstName)),
      const VSpace(Sizes.s8),
      TextFieldCommon(
              controller: value!.txtFName,
              hintText: language(context, appFonts.enterFName),
              focusNode: value!.nameFocus,
              onFieldSubmitted: (values) => validation.fieldFocusChange(
                  context, value!.nameFocus, value!.emailFocus),
              prefixIcon: eSvgAssets.user,
              validator: (value) => validation.nameValidation(context, value))
          .paddingSymmetric(horizontal: Insets.i20),
      const VSpace(Sizes.s15),
      ContainerWithTextLayout(title: language(context, appFonts.lastName)),
      const VSpace(Sizes.s8),
      TextFieldCommon(
              controller: value!.txtLName,
              hintText: language(context, appFonts.enterLName),
              focusNode: value!.emailFocus,
              onFieldSubmitted: (values) => validation.fieldFocusChange(
                  context, value!.emailFocus, value!.phoneFocus),
              prefixIcon: eSvgAssets.user,
              validator: (value) => validation.emailValidation(context, value))
          .paddingSymmetric(horizontal: Insets.i20),
      const VSpace(Sizes.s15),
      ContainerWithTextLayout(title: language(context, appFonts.birthday)),
      const VSpace(Sizes.s8),
      TextFieldCommon(
              controller: value!.birthday,
              readOnly: true,
              onTap: () async {
                DateTime initialDate = DateTime.now();

                if (value!.birthday.text.isNotEmpty) {
                  try {
                    initialDate =
                        DateFormat('dd/MM/yyyy').parse(value!.birthday.text);
                  } catch (e) {
                    initialDate = DateTime.now();
                  }
                }

                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                          data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                  primary: appColor(context).primary,
                                  onPrimary: Colors.white,
                                  onSurface: appColor(context).darkText),
                              textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                      foregroundColor:
                                          appColor(context).primary))),
                          child: child!);
                    });

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                  value?.birthday.text = formattedDate;
                }
              },
              hintText: language(context, appFonts.birthDate),
              focusNode: value!.nameFocus,
              onFieldSubmitted: (values) => validation.fieldFocusChange(
                  context, value!.nameFocus, value!.emailFocus),
              prefixIcon: eSvgAssets.user,
              validator: (value) => validation.nameValidation(context, value))
          .paddingSymmetric(horizontal: Insets.i20),
      const VSpace(Sizes.s15),
      ContainerWithTextLayout(title: language(context, appFonts.email)),
      const VSpace(Sizes.s8),
      TextFieldCommon(
              controller: value!.txtEmail,
              hintText: language(context, appFonts.enterEmail),
              focusNode: value!.emailFocus,
              onFieldSubmitted: (values) => validation.fieldFocusChange(
                  context, value!.emailFocus, value!.phoneFocus),
              prefixIcon: eSvgAssets.email,
              validator: (value) => validation.emailValidation(context, value))
          .paddingSymmetric(horizontal: Insets.i20),
      const VSpace(Sizes.s15),
      ContainerWithTextLayout(title: language(context, appFonts.phoneNo)),
      const VSpace(Sizes.s10),
      RegisterWidgetClass().phoneTextBox(
          context, value!.txtPhone, value!.phoneFocus,
          // onChanged: (CountryCode? code) => value!.changeDialCode(code!),
          onFieldSubmitted: (values) => validation.fieldFocusChange(
              context, value!.phoneFocus, value!.phoneFocus))
    ]);
  }
}
