// import 'package:flutter/cupertino.dart';
//
// import '../../../config.dart';
// import '../../../widgets/DirectionalityRtl.dart';
//
// class ResetPasswordScreenInApp extends StatelessWidget {
//   const ResetPasswordScreenInApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController txtNewPassword = TextEditingController();
//     TextEditingController txtConfirmPassword = TextEditingController();
//
//     final FocusNode confirmPasswordFocus = FocusNode();
//     final FocusNode passwordFocus = FocusNode();
//     return Scaffold(
//         body: LoadingComponent(
//             child: DirectionalityRtl(
//                 child: Scaffold(
//                     appBar: AppBar(
//                         elevation: 0,
//                         leading: CommonArrow(
//                                 arrow: rtl(context)
//                                     ? eSvgAssets.arrowRight
//                                     : eSvgAssets.arrowLeft1,
//                                 onTap: () => route.pop(context))
//                             .paddingOnly(
//                                 left: rtl(context) ? 0 : Insets.i20,
//                                 right: rtl(context) ? Insets.i20 : 0)),
//                     body: SafeArea(
//                         child: SingleChildScrollView(
//                             child: Column(children: [
//                       Form(
//                           // key: resetPass.resetFormKey,
//                           child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                             Align(
//                                 alignment: Alignment.center,
//                                 child: AuthTopLayout(
//                                     isResetPass: true,
//                                     image: eImageAssets.resetPassword,
//                                     title: language(
//                                             context, appFonts.changePassword)
//                                         .toUpperCase(),
//                                     subTitle: language(
//                                         context, appFonts.resetPasswordDesc),
//                                     isNumber: true)),
//                             Stack(clipBehavior: Clip.none, children: [
//                               const FieldsBackground(),
//                               Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ContainerWithTextLayout(
//                                         title: language(
//                                             context, appFonts.newPassword)),
//                                     const VSpace(Sizes.s8),
//                                     TextFieldCommon(
//                                             hintText: language(context,
//                                                 appFonts.enterNewPassword),
//                                             // obscureText: isNewPassword,
//                                             controller: txtNewPassword,
//                                             focusNode: passwordFocus,
//                                             prefixIcon: eSvgAssets.lock,
//                                             validator: (value) {},
//                                             onFieldSubmitted: (value) {},
//                                             suffixIcon: SvgPicture.asset(
//                                                     eSvgAssets.eye,
//                                                     fit: BoxFit.scaleDown)
//                                                 .inkWell(onTap: () {}))
//                                         .paddingSymmetric(
//                                             horizontal: Insets.i20),
//                                     const VSpace(Sizes.s15),
//                                     ContainerWithTextLayout(
//                                         title: language(
//                                             context, appFonts.confirmPassword)),
//                                     const VSpace(Sizes.s8),
//                                     TextFieldCommon(
//                                             hintText: language(context,
//                                                 appFonts.enterConfirmPassword),
//                                             controller: txtConfirmPassword,
//                                             focusNode: confirmPasswordFocus,
//                                             // obscureText: resetPass.isConfirmPassword,
//                                             validator: (value) {},
//                                             suffixIcon: SvgPicture.asset(
//                                                     eSvgAssets.eye,
//                                                     fit: BoxFit.scaleDown)
//                                                 .inkWell(onTap: () {}),
//                                             prefixIcon: eSvgAssets.lock)
//                                         .paddingSymmetric(
//                                             horizontal: Insets.i20),
//                                     const VSpace(Sizes.s40),
//                                     ButtonCommon(
//                                             title: language(context,
//                                                 appFonts.resetPassword),
//                                             onTap: () {
//                                               showCupertinoDialog(
//                                                   context: context,
//                                                   builder: (context1) {
//                                                     return DirectionalityRtl(
//                                                         child:
//                                                             AlertDialogCommon(
//                                                                 title: language(
//                                                                     context,
//                                                                     appFonts
//                                                                         .successfullyChanged),
//                                                                 height:
//                                                                     Sizes.s120,
//                                                                 image: eImageAssets
//                                                                     .successReset,
//                                                                 subtext: language(
//                                                                     context,
//                                                                     appFonts
//                                                                         .thankYou),
//                                                                 bText1: language(
//                                                                     context,
//                                                                     appFonts
//                                                                         .loginAgain),
//                                                                 b1OnTap: () {
//                                                                   txtNewPassword
//                                                                       .text = "";
//                                                                   txtConfirmPassword
//                                                                       .text = "";
//                                                                   Navigator.pop(
//                                                                       context1);
//
//                                                                   Navigator.pushReplacement(
//                                                                       context,
//                                                                       MaterialPageRoute(
//                                                                           builder: (_) => MultiProvider(
//                                                                                   providers: [
//                                                                                     ChangeNotifierProvider(create: (_) => LoginProvider()),
//                                                                                     ChangeNotifierProvider(create: (_) => ForgetPasswordProvider()),
//                                                                                     ChangeNotifierProvider(create: (_) => VerifyOtpProvider()),
//                                                                                   ],
//                                                                                   child: const LoginScreen(),
//                                                                                   builder: (context, child) {
//                                                                                     return child!;
//                                                                                   })));
//                                                                 }));
//                                                   });
//                                             })
//                                         .paddingSymmetric(
//                                             horizontal: Insets.i20)
//                                   ]).paddingSymmetric(vertical: Insets.i20)
//                             ])
//                           ]).alignment(Alignment.centerLeft))
//                     ]).paddingSymmetric(horizontal: Insets.i20)))))));
//   }
// }
