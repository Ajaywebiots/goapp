// import 'package:goapp/screens/bottom_screens/home_screen/layouts/featured_business_layout.dart';
//
// import '../../../common_tap.dart';
// import '../../../config.dart';
// import '../../../providers/app_pages_provider/favourite_list_provider.dart';
// import '../../../providers/app_pages_provider/provider_details_provider.dart';
// import '../../../providers/bottom_providers/cart_provider.dart';
// import '../../../providers/bottom_providers/dashboard_provider.dart';
// import '../../../widgets/DirectionalityRtl.dart';
// import '../../bottom_screens/home_screen/layouts/top_categories_layout.dart';
// import 'layouts/provider_top_layout.dart';
//
// class ProviderDetailsScreen extends StatelessWidget {
//   final String? id;
//
//   const ProviderDetailsScreen({super.key, this.id});
//
//   @override
//   Widget build(BuildContext context) {
//     final dash = Provider.of<DashboardProvider>(context, listen: true);
//
//     return Consumer<FavouriteListProvider>(builder: (context1, favCtrl, child) {
//       return Consumer<ProviderDetailsProvider>(
//           builder: (context, value, child) {
//         return StatefulWrapper(
//           onInit: () => Future.delayed(DurationClass.ms50)
//               .then((s) => value.onReady(context, id: id)),
//           child: DirectionalityRtl(
//             child: Scaffold(
//                 appBar: AppBar(
//                     leadingWidth: 80,
//                     title: Text(language(context, appFonts.providerDetails),
//                         style: appCss.dmDenseBold18
//                             .textColor(appColor(context).darkText)),
//                     centerTitle: true,
//                     leading: CommonArrow(
//                         arrow: eSvgAssets.arrowLeft,
//                         onTap: () => route.pop(context)).paddingAll(Insets.i8),
//                     actions: [
//                       value.provider != null
//                           ? favCtrl.providerFavList
//                                   .where((element) =>
//                                       element.providerId ==
//                                       value.provider!.id.toString())
//                                   .isNotEmpty
//                               ? CommonArrow(
//                                       arrow: eSvgAssets.redHeart,
//                                       svgColor: appColor(context).red,
//                                       color: appColor(context).red.withOpacity(0.1),
//                                       onTap: () => favCtrl.deleteToFav(
//                                           context, value.provider!.id, "provider"))
//                                   .paddingOnly(right: Insets.i20)
//                               : CommonArrow(
//                                       arrow: eSvgAssets.like,
//                                       svgColor: appColor(context).darkText,
//                                       color: appColor(context).fieldCardBg,
//                                       onTap: () => favCtrl.addToFav(
//                                           context,
//                                           value.provider!.id,
//                                           "provider",
//                                           value.provider))
//                                   .paddingOnly(right: Insets.i20)
//                           : Container()
//                     ]),
//                 body: value.provider == null
//                     ? Container()
//                     : Consumer<CartProvider>(builder: (context2, cart, child) {
//                         return ListView(children: [
//                           const ProviderTopLayout(),
//                           if (value.categoryList.isNotEmpty)
//                             Text(language(context, appFonts.provideServiceIn),
//                                     style: appCss.dmDenseSemiBold16
//                                         .textColor(appColor(context).darkText))
//                                 .paddingOnly(top: Insets.i25),
//                           SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                       children: value.categoryList
//                                           .asMap()
//                                           .entries
//                                           .map((e) => TopCategoriesLayout(
//                                               index: e.key,
//                                               // data: e.value,
//                                               selectedIndex: value.selectIndex,
//                                               rPadding: Insets.i20,
//                                               onTap: () =>
//                                                   value.onSelectService(
//                                                       context, e.key)))
//                                           .toList())
//                                   .padding(vertical: Insets.i15)),
//                           ...value.serviceList.asMap().entries.map((e) =>
//                               FeaturedBusinessLayout(
//                                   data: e.value,
//                                   isProvider: true,
//                                   inCart: isInCart(context, e.value.id),
//                                   addTap: () => onBook(context, e.value,
//                                           addTap: () => value.onAdd(e.key),
//                                           minusTap: () => value.onRemoveService(
//                                               context, e.key)).then((e) {
//                                         value.serviceList[e.key]
//                                                 .selectedRequiredServiceMan =
//                                             value.serviceList[e.key]
//                                                 .requiredServicemen;
//                                         value.notifyListeners();
//                                       })))
//                         ]).paddingAll(Insets.i20);
//                       })),
//           ),
//         );
//       });
//     });
//   }
// }
