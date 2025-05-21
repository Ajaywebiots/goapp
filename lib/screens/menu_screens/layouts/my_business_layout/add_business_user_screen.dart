import 'package:goapp/widgets/flutter_switch_common.dart';

import '../../../../config.dart';

class AddBusinessUserScreen extends StatefulWidget {
  const AddBusinessUserScreen({super.key});

  @override
  State<AddBusinessUserScreen> createState() => _AddBusinessUserScreenState();
}

class _AddBusinessUserScreenState extends State<AddBusinessUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context, languages, child) {
      TextEditingController enterFName = TextEditingController();
      TextEditingController enterLName = TextEditingController();
      final FocusNode fNameFocus = FocusNode();
      final FocusNode lNameFocus = FocusNode();
      final FocusNode emailFocus = FocusNode();
      final sss = Provider.of<LoginWithPhoneProvider>(context, listen: false);
      String selectedRole = 'Manager';
      final List<String> roles = ['Manager', 'Admin', 'User'];
      return Scaffold(
          appBar: AppBar(
              leadingWidth: 60,
              title: Text(language(context, "Business User"),
                  style: appCss.dmDenseMedium18
                      .textColor(appColor(context).darkText)),
              centerTitle: true,
              actions: [
                SizedBox(
                        height: Sizes.s40,
                        width: Sizes.s40,
                        child: SvgPicture.asset(eSvgAssets.delete,
                                colorFilter: ColorFilter.mode(
                                    appColor(context).red, BlendMode.srcIn))
                            .marginAll(Insets.i10)
                            .decorated(
                                shape: BoxShape.circle,
                                color: appColor(context)
                                    .red
                                    .withValues(alpha: 0.1)))
                    .inkWell(
                        onTap: () => route.pushNamed(
                            context, routeName.addBusinessUserScreen))
                    .paddingOnly(right: Insets.i20)
              ],
              leading: CommonArrow(
                      arrow: languages.isUserRTl
                          ? eSvgAssets.arrowRight
                          : eSvgAssets.arrowLeft,
                      onTap: () => route.pop(context))
                  .padding(vertical: Insets.i8, left: Insets.i20)),
          body: Column(children: [
            VSpace(Insets.i20),
            Stack(children: [
              const FieldsBackground(),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContainerWithTextLayout(
                        title: language(context, appFonts.firstName)),
                    const VSpace(Sizes.s8),
                    TextFieldCommon(
                            controller: enterFName,
                            hintText: language(context, appFonts.enterFName),
                            focusNode: fNameFocus,
                            onFieldSubmitted: (value) =>
                                validation.fieldFocusChange(
                                    context, fNameFocus, emailFocus),
                            prefixIcon: eSvgAssets.user,
                            validator: (value) =>
                                validation.nameValidation(context, value))
                        .paddingSymmetric(horizontal: Insets.i20),
                    const VSpace(Sizes.s15),
                    ContainerWithTextLayout(
                        title: language(context, appFonts.lastName)),
                    const VSpace(Sizes.s8),
                    TextFieldCommon(
                            controller: enterLName,
                            hintText: language(context, appFonts.enterLName),
                            focusNode: lNameFocus,
                            onFieldSubmitted: (value) =>
                                validation.fieldFocusChange(
                                    context, lNameFocus, emailFocus),
                            prefixIcon: eSvgAssets.user,
                            validator: (value) =>
                                validation.nameValidation(context, value))
                        .paddingSymmetric(horizontal: Insets.i20),
                    const VSpace(Sizes.s15),
                    ContainerWithTextLayout(
                        title: language(context, appFonts.phoneNumber)),
                    const VSpace(Sizes.s8),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CountryListLayout(
                              dialCode: sss.dialCode,
                              onChanged: (country) =>
                                  {sss.changeDialCode(country!)}),
                          const HSpace(Sizes.s4),
                          Expanded(
                              child: TextFieldCommon(
                                  keyboardType: TextInputType.number,
                                  validator: (phone) => Validation()
                                      .phoneValidation(context, phone),
                                  controller: sss.numberController,
                                  isNumber: true,
                                  focusNode: sss.phoneFocus,
                                  hintText: language(
                                      context, appFonts.enterPhoneNumber)))
                        ]).paddingSymmetric(horizontal: Insets.i20),
                    const VSpace(Sizes.s15),
                    ContainerWithTextLayout(title: language(context, "Role")),
                    const VSpace(Sizes.s8),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: Insets.i20),
                        padding:
                            const EdgeInsets.symmetric(horizontal: Insets.i12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Insets.i8),
                            border: Border.all(
                                color: appColor(context).whiteColor)),
                        child: DropdownButtonFormField<String>(
                            value: selectedRole,
                            icon: SvgPicture.asset(eSvgAssets.arrowDown,
                                width: Insets.i18,
                                height: Insets.i18,
                                colorFilter: ColorFilter.mode(
                                    appColor(context).darkText,
                                    BlendMode.srcIn)),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            items: roles
                                .map((role) => DropdownMenuItem<String>(
                                    value: role,
                                    child: Row(children: [
                                      SvgPicture.asset(eSvgAssets.mail,
                                          colorFilter: ColorFilter.mode(
                                              appColor(context).darkText,
                                              BlendMode.srcIn)),
                                      HSpace(Insets.i15),
                                      Text(role, style: appCss.dmDenseRegular14)
                                    ])))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedRole = value!;
                              });
                            })),
                    const VSpace(Sizes.s15),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SmallContainer(),
                          const HSpace(Sizes.s20),
                          Text(language(context, "Active status"),
                              style: appCss.dmDenseMedium14
                                  .textColor(appColor(context).darkText)),
                          const HSpace(Sizes.s15),
                          FlutterSwitchCommon(onToggle: (value) {}, value: true)
                        ]).marginOnly(bottom: Insets.i25),
                  ]).paddingSymmetric(vertical: Insets.i20)
            ]).marginSymmetric(horizontal: Insets.i20),
          ]));
    });
  }
}
