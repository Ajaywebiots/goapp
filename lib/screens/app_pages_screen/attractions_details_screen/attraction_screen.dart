// import '../../../common_tap.dart';
// import '../../../config.dart';
// import '../../../providers/app_pages_provider/favourite_list_provider.dart';
// import '../../../providers/app_pages_provider/services_details_provider.dart';
// import '../../../providers/bottom_providers/dashboard_provider.dart';
// import '../../../widgets/heading_row_common.dart';
// import '../coupon_list_screen/layouts/coupon_layout.dart' show CouponLayout;
// import 'layouts/service_description.dart';
// import 'layouts/service_image_layout.dart';
// import 'layouts/service_review_layout.dart';
//
// class AttractionOfferScreen extends StatelessWidget {
//   const AttractionOfferScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FavouriteListProvider>(builder: (context2, favCtrl, child) {
//       return Consumer<ServicesDetailsProvider>(
//           builder: (context1, serviceCtrl, child) {
//         bool isArg = false;
//         final dash = Provider.of<DashboardProvider>(context, listen: false);
//
//         return StatefulWrapper(
//             onInit: () => Future.delayed(DurationClass.ms50)
//                 .then((val) => serviceCtrl.onReady(context)),
//             child: LoadingComponent(
//                 child: Scaffold(
//                     body: serviceCtrl.service == null
//                         ? Container()
//                         : Stack(alignment: Alignment.bottomCenter, children: [
//                             SingleChildScrollView(
//                                 child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                   ServiceImageLayout(
//                                       image: serviceCtrl
//                                               .service!.media!.isNotEmpty
//                                           ? serviceCtrl
//                                               .service!
//                                               .media![serviceCtrl.selectedIndex]
//                                               .originalUrl!
//                                           : ""),
//                                   VSpace(Insets.i12),
//                                   Text("SPARROW COFFEE & SWEETS",
//                                       style: appCss.dmDenseBold14),
//                                   Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         SvgPicture.asset(
//                                             "assets/svg/stars.svg"),
//                                         Text(" 3.8",
//                                             style: appCss.dmDenseRegular13),
//                                         Text("  (100 reviews)",
//                                             style: appCss.dmDenseRegular11)
//                                       ]),
//                                   Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text("Restaurant",
//                                             style: appCss.dmDenseRegular13),
//                                         SvgPicture.asset(
//                                                 'assets/svg/divider.svg')
//                                             .paddingSymmetric(horizontal: 10),
//                                         Text("€€€€€",
//                                             style: appCss.dmDenseMedium12),
//                                       ]),
//                                   VSpace(Insets.i15),
//                                   Column(children: [
//                                     ServiceDescription(
//                                         services: serviceCtrl.service)
//                                   ]).paddingSymmetric(horizontal: Insets.i20),
//                                   // if (services!.reviews!.isNotEmpty)
//                                   Column(children: [
//                                     HeadingRowCommon(
//                                             title: appFonts.activeOffers,
//                                             onTap: () {},
//                                             subTitle: appFonts.viewHistory)
//                                         .paddingOnly(
//                                             top: Insets.i20,
//                                             bottom: Insets.i12),
//                                     ...dash.couponList
//                                         .asMap()
//                                         .entries
//                                         .take(2)
//                                         .map((e) => CouponLayout(
//                                             data: e.value,
//                                             onTap: () {
//                                               if (!isArg) {
//                                                 route.pop(context,
//                                                     arg: e.value);
//                                               } else {
//                                                 route.pop(context);
//                                               }
//                                             })),
//                                   ]).paddingSymmetric(horizontal: 20),
//
//                                   HeadingRowCommon(
//                                           title: language(
//                                               context, appFonts.reviews),
//                                           onTap: () {})
//                                       .padding(
//                                           horizontal: Insets.i20,
//                                           top: Insets.i20,
//                                           bottom: Insets.i12),
//
//                                   // if (services!.reviews!.isNotEmpty)
//                                   Column(
//                                           children: serviceCtrl
//                                               .service!.reviews!
//                                               .asMap()
//                                               .entries
//                                               .map((e) => ServiceReviewLayout(
//                                                   data: e.value,
//                                                   index: e.key,
//                                                   list: appArray.reviewList))
//                                               .toList())
//                                       .paddingSymmetric(horizontal: 20)
//                                 ]).marginOnly(bottom: Insets.i100)),
//                             ButtonCommon(
//                                     margin: Insets.i20,
//                                     title: appFonts.addReview,
//                                     onTap: () => onBook(
//                                             context, serviceCtrl.service!,
//                                             addTap: () => serviceCtrl.onAdd(),
//                                             minusTap: () => serviceCtrl
//                                                 .onRemoveService(context)).then(
//                                             (e) {
//                                           serviceCtrl.service!
//                                                   .selectedRequiredServiceMan =
//                                               serviceCtrl
//                                                   .service!.requiredServicemen;
//                                           serviceCtrl.notifyListeners();
//                                         }))
//                                 .paddingOnly(bottom: Insets.i20)
//                                 .decorated(color: appColor(context).whiteBg)
//                           ]))));
//       });
//     });
//   }
// }
