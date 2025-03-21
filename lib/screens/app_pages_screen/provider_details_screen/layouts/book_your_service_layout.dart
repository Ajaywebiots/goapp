// import 'dart:developer';
//
// import 'package:goapp/screens/app_pages_screen/provider_details_screen/layouts/person_required_animation.dart';
// import 'package:goapp/screens/app_pages_screen/provider_details_screen/layouts/service_layout.dart';
//
// import '../../../../config.dart';
// import '../../../../models/provider_model.dart';
// import '../../../../models/service_model.dart';
// import '../../../../providers/app_pages_provider/provider_details_provider.dart';
// import 'choose_serviceman_layout.dart';
//
// class BookYourServiceLayout extends StatelessWidget {
//   final String? price;
//   final TextStyle? style;
//   final ProviderModel? providerModel;
//   final Services? services;
//   final int? requiredServiceMan, packageServiceId;
//   final GestureTapCallback? minusTap, addTap, onTap;
//   final bool isPackage;
//
//   const BookYourServiceLayout(
//       {super.key,
//       this.price,
//       this.style,
//       this.providerModel,
//       this.requiredServiceMan,
//       this.addTap,
//       this.minusTap,
//       this.services,
//       this.onTap,
//       this.packageServiceId,
//       this.isPackage = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProviderDetailsProvider>(builder: (context2, value, child) {
//       return StatefulBuilder(builder: (context1, setState) {
//         return SizedBox(
//                 height: MediaQuery.of(context).size.height / 1.4,
//                 child: SingleChildScrollView(
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                       // const BottomSheetTopLayout(),
//                       const VSpace(Sizes.s25),
//                       Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ServiceLayout(
//                                 title: language(context, services!.title!),
//                                 isPackage: isPackage,
//                                 image: services!.media != null &&
//                                         services!.media!.isNotEmpty
//                                     ? services!.media![0].originalUrl!
//                                     : null,
//                                 price:
//                                     (int.parse(requiredServiceMan.toString()) *
//                                             double.parse(price!))
//                                         .toString(),
//                                 style: style),
//                             Text(language(context, appFonts.addRequiredPerson),
//                                     style: appCss.dmDenseMedium14
//                                         .textColor(appColor(context).darkText))
//                                 .paddingOnly(
//                               top: Insets.i25,
//                             ),
//                             PersonRequiredAnimation(
//                                 addTap: addTap,
//                                 requiredMan: requiredServiceMan,
//                                 minusTap: minusTap),
//                             if (requiredServiceMan! >
//                                 int.parse(services!.requiredServicemen ?? "1"))
//                               Text(language(context, appFonts.youWillOnly),
//                                       style: appCss.dmDenseMedium12
//                                           .textColor(appColor(context).red))
//                                   .paddingOnly(bottom: Insets.i25),
//                             Text(language(context, appFonts.chooseOneOf),
//                                 style: appCss.dmDenseMedium14
//                                     .textColor(appColor(context).darkText)),
//                             const VSpace(Sizes.s10),
//                             Column(
//                                     children: appArray.servicemanChooseList
//                                         .asMap()
//                                         .entries
//                                         .map((e) => ChooseServicemanLayout(
//                                             title: e.value,
//                                             index: e.key,
//                                             selectIndex:
//                                                 value.selectProviderIndex,
//                                             list: appArray.servicemanChooseList,
//                                             onTap: () =>
//                                                 value.onChooseService(e.key)))
//                                         .toList())
//                                 .paddingSymmetric(
//                                     horizontal: Insets.i15,
//                                     vertical: Insets.i20)
//                                 .boxBorderExtension(context, isShadow: true)
//                           ]).paddingSymmetric(horizontal: Insets.i20),
//                       const VSpace(Sizes.s30),
//                       ButtonCommon(title: appFonts.bookNow, onTap: () {})
//                           .paddingSymmetric(horizontal: Insets.i20)
//                     ]).paddingSymmetric(vertical: Insets.i20)))
//             .bottomSheetExtension(context);
//       });
//     });
//   }
// }
