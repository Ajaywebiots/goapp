// import '../../../config.dart';
// import '../../../widgets/DirectionalityRtl.dart';
//
// class ChangePassInApp extends StatelessWidget {
//   const ChangePassInApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController forgetController = TextEditingController();
//     final FocusNode emailFocus = FocusNode();
//     final GlobalKey<FormState> forgetKey = GlobalKey<FormState>();
//     return Scaffold(
//         body: DirectionalityRtl(
//             child: Scaffold(
//                 body: SafeArea(
//                     child: SingleChildScrollView(
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//           Stack(children: [
//             Align(
//                 alignment:
//                     rtl(context) ? Alignment.topRight : Alignment.topLeft,
//                 child: CommonArrow(
//                     arrow: rtl(context)
//                         ? eSvgAssets.arrowRight
//                         : eSvgAssets.arrowLeft1,
//                     onTap: () => route.pop(context)).paddingAll(Insets.i20)),
//             Align(
//                 alignment: Alignment.center,
//                 child: AuthTopLayout(
//                     image: eImageAssets.forgetPass,
//                     title: language(context, appFonts.changePassword)
//                         .toUpperCase(),
//                     subTitle: language(context, appFonts.enterYourRegister),
//                     isNumber: false))
//           ]),
//           Stack(children: [
//             const FieldsBackground(),
//             Form(
//                 // key: value.forgetKey,
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                   Row(children: [
//                     const SmallContainer(),
//                     const HSpace(Sizes.s20),
//                     Text(language(context, appFonts.phoneNumber),
//                         style: appCss.dmDenseSemiBold14
//                             .textColor(appColor(context).darkText))
//                   ]),
//                   const VSpace(Sizes.s8),
//                   TextFieldCommon(
//                           validator: (phone) =>
//                               Validation().phoneValidation(context, phone),
//                           controller: forgetController,
//                           keyboardType: TextInputType.phone,
//                           focusNode: emailFocus,
//                           hintText:
//                               language(context, appFonts.enterPhoneNumber),
//                           prefixIcon: eSvgAssets.lock)
//                       .paddingSymmetric(horizontal: Insets.i20),
//                   const VSpace(Sizes.s40),
//                   ButtonCommon(
//                       title: language(context, appFonts.sendOtp),
//                       margin: Insets.i20,
//                       onTap: () =>
//                           route.pushNamed(context, routeName.signUpVerifyOtp))
//                 ]).paddingSymmetric(vertical: Insets.i20))
//           ]).paddingSymmetric(horizontal: Insets.i20)
//         ]))))));
//   }
// }
