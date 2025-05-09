// import 'dart:developer';
//
// import '../../../../config.dart';
// import '../../../../models/index.dart';
// import '../../../../providers/bottom_providers/home_screen_provider.dart';
//
// class ServicePackageList extends StatelessWidget {
//   final ServicePackageModel? data;
//   final GestureTapCallback? onTap;
//   final bool? isViewAll;
//   final Animation<double>? rotationAnimation;
//
//   const ServicePackageList(
//       {super.key,
//       this.data,
//       this.onTap,
//       this.isViewAll = false,
//       this.rotationAnimation});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeScreenProvider>(builder: (context, value, child) {
//       return Stack(children: [
//         Stack(children: [
//           Container(
//             padding: EdgeInsets.only(
//                 top: Insets.i15,
//                 left: AppLocalizations.of(context)?.locale.languageCode == "ar"
//                     ? 0
//                     : Insets.i15,
//                 right: AppLocalizations.of(context)?.locale.languageCode == "ar"
//                     ? Insets.i15
//                     : 0),
//             decoration: ShapeDecoration(
//                 shape: SmoothRectangleBorder(
//                     borderRadius: SmoothBorderRadius(
//                         cornerRadius: 10, cornerSmoothing: 1)),
//                 color: data!.hexaCode != null
//                     ? fromHex(data!.hexaCode!)
//                     : appColor(context).primary.withOpacity(0.8)),
//             height: isViewAll == true ? Sizes.s170 : Sizes.s142,
//             width: isViewAll == true ? Sizes.s158 : Sizes.s125,
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Container(
//                 height: isViewAll == true ? Sizes.s40 : Sizes.s32,
//                 width: isViewAll == true ? Sizes.s40 : Sizes.s32,
//                 padding: const EdgeInsets.all(3),
//                 decoration: ShapeDecoration(
//                   color: appColor(context).whiteBg,
//                   shape: SmoothRectangleBorder(
//                       borderRadius: SmoothBorderRadius(
//                           cornerRadius: 8, cornerSmoothing: 1)),
//                 ),
//                 child: Image.asset(
//                   data!.media![0].originalUrl!,
//                 ),
//               ),
//
//               //Image.network(data!.media![0].originalUrl!, height: Sizes.s32),
//               const VSpace(Sizes.s8),
//               Text(data!.title!,
//                   style: isViewAll == true
//                       ? appCss.dmDenseMedium14
//                           .textColor(appColor(context).whiteBg)
//                       : appCss.dmDenseMedium12
//                           .textColor(appColor(context).whiteBg)),
//               const VSpace(Sizes.s2),
//               Text("0.00",
//                   style: isViewAll == true
//                       ? appCss.dmDenseBold18
//                           .textColor(appColor(context).whiteBg)
//                       : appCss.dmDenseBold14
//                           .textColor(appColor(context).whiteBg)),
//               VSpace(isViewAll == true ? Sizes.s26 : Sizes.s18),
//               Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                     Text(language(context, appFonts.seeMore),
//                         style: appCss.dmDenseMedium12
//                             .textColor(appColor(context).whiteBg)),
//                     const HSpace(Sizes.s32),
//                     SvgPicture.asset(
//                       eSvgAssets.anchorArrowRight,
//                       colorFilter: ColorFilter.mode(
//                           appColor(context).whiteBg, BlendMode.srcIn),
//                     )
//                   ])
//                   .paddingOnly(right: Insets.i10)
//                   .width(MediaQuery.of(context).size.width)
//             ]),
//           ),
//           if (rotationAnimation != null)
//             Positioned(
//                 bottom: -50,
//                 child: RotationTransition(
//                     alignment: Alignment.topCenter,
//                     turns: rotationAnimation!,
//                     child: Container(
//                         alignment: Alignment.center,
//                         child: Image.asset(
//                             height: 118,
//                             width: 145,
//                             eImageAssets.p1,
//                             fit: BoxFit.cover))))
//         ]),
//       ]).inkWell(onTap: onTap).paddingOnly(
//           left: rtl(context) ? 0 : Insets.i15,
//           right: rtl(context) ? Insets.i15 : 0);
//     });
//   }
// }
