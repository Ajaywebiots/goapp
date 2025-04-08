// import 'dart:developer';
//
// import '../../../config.dart';
// import '../../../providers/app_pages_provider/categories_list_provider.dart';
// import '../../../providers/app_pages_provider/featured_service_provider.dart';
// import '../../../providers/app_pages_provider/search_provider.dart';
// import '../../../providers/bottom_providers/cart_provider.dart';
// import '../../../providers/bottom_providers/dashboard_provider.dart';
// import '../../../widgets/DirectionalityRtl.dart';
// import '../../../widgets/filter_icon_common.dart';
// import '../../../widgets/search_text_filed_common.dart';
// import '../../bottom_screens/home_screen/layouts/featured_business_layout.dart';
//
// class FeaturedBusinessScreen extends StatefulWidget {
//   const FeaturedBusinessScreen({super.key});
//
//   @override
//   State<FeaturedBusinessScreen> createState() => _FeaturedBusinessScreenState();
// }
//
// class _FeaturedBusinessScreenState extends State<FeaturedBusinessScreen>
//     with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     final dash = Provider.of<DashboardProvider>(context, listen: true);
//     final search = Provider.of<SearchProvider>(context, listen: true);
//     final value1 = Provider.of<CategoriesListProvider>(context, listen: true);
//
//     return Consumer<FeaturedBusinessProvider>(
//         builder: (context1, value, child) {
//       log("value.searchList::${value.searchList.length}");
//       return StatefulWrapper(
//         onInit: () => Future.delayed(DurationClass.ms50).then((vaj) {
//           value.getBusinessSearchAPI(context);
//         }),
//         child: DirectionalityRtl(
//           child: Scaffold(
//               appBar: AppBarCommon(
//                   title: appFonts.featuredService,
//                   onTap: () => value.onBack(dash, context)),
//               body: Consumer<CartProvider>(builder: (context2, cart, child) {
//                 return RefreshIndicator(
//                     onRefresh: () async {
//                       dash.getFeaturedPackage(1);
//                     },
//                     child: SingleChildScrollView(
//                         child: Column(children: [
//                       SearchTextFieldCommon(
//                           focusNode: value.searchFocus,
//                           controller: search.searchCtrl,
//                           onChanged: (v) {
//                             if (v.isEmpty) {
//                               search.searchList = [];
//                               value.notifyListeners();
//                             }
//                           },
//                           onFieldSubmitted: (v) =>
//                               search.searchService(context),
//                           suffixIcon: FilterIconCommon(
//                               selectedFilter:
//                                   search.totalCountFilter().toString(),
//                               onTap: () =>
//                                   search.onBottomSheet(context, value1))),
//                       const VSpace(Sizes.s20),
//                       /* value.txtFeaturedSearch.text.isEmpty
//                           ? Column(children: [
//                               ...value.featuredBusiness.asMap().entries.map(
//                                   (e) => FeaturedBusinessLayout(
//                                       data: e.value,
//                                       addTap: () => value.onFeatured(
//                                           context, e.value, e.key,
//                                           inCart:
//                                               isInCart(context, e.value.id)),
//                                       inCart: isInCart(context, e.value.id),
//                                       onTap: () {
//                                         route.pushNamed(context,
//                                             routeName.businessDetailsScreen,
//                                             arg: e.value.id);
//                                       }))
//                             ]),*/
//                       /*: value.searchList.isNotEmpty
//                               ?*/
//                       Column(children: [
//                         ...value.businessSearchList.asMap().entries.map((e) =>
//                             FeaturedBusinessLayout(
//                                 // index: e.key,
//                                 data: e.value,
//                                 addTap: () => value.onFeatured(
//                                     context, e.value, e.key,
//                                     inCart: isInCart(context, e.value.id),
//                                     isSearch: true),
//                                 inCart: isInCart(context, e.value.id),
//                                 onTap: () {
//                                   /*    route.pushNamed(
//                                                 context,
//                                                 routeName
//                                                     .businessDetailsScreen,
//                                                 arg: e.value.id)*/
//                                 }))
//                       ])
//                       /*: Column(children: [
//                                   Stack(children: [
//                                     Image.asset(eImageAssets.noSearch,
//                                             height: Sizes.s346)
//                                         .paddingOnly(top: Insets.i40),
//                                     if (value.animationController != null)
//                                       Positioned(
//                                           left: 40,
//                                           top: 0,
//                                           child: RotationTransition(
//                                               turns: Tween(
//                                                       begin: 0.01, end: -.01)
//                                                   .chain(CurveTween(
//                                                       curve: Curves.easeIn))
//                                                   .animate(value
//                                                       .animationController!),
//                                               child: Image.asset(
//                                                   eImageAssets.mGlass,
//                                                   height: Sizes.s190,
//                                                   width: Sizes.s178)))
//                                   ]),
//                                   const VSpace(Sizes.s25),
//                                   Text(language(context, appFonts.noMatching),
//                                       style: appCss.dmDenseBold18.textColor(
//                                           appColor(context).darkText)),
//                                   const VSpace(Sizes.s8),
//                                   Text(
//                                           language(context,
//                                               appFonts.attemptYourSearch),
//                                           textAlign: TextAlign.center,
//                                           style: appCss.dmDenseRegular14
//                                               .textColor(
//                                                   appColor(context).lightText))
//                                       .paddingSymmetric(horizontal: Insets.i10)
//                                 ])*/
//                     ]).paddingSymmetric(horizontal: Insets.i20)));
//               })),
//         ),
//       );
//     });
//   }
// }
