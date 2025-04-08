// import 'dart:developer';
//
// import 'package:goapp/common_tap.dart';
// import 'package:goapp/models/blog_model.dart';
// import 'package:goapp/models/booking_status_model.dart';
// import 'package:goapp/models/coupon_model.dart';
// import 'package:goapp/models/currency_model.dart';
// import 'package:goapp/services/api_methods.dart';
// import 'package:goapp/services/api_service.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import '../../config.dart';
// import '../../models/api_model/business_list_model.dart';
// import '../../models/api_model/business_search_model.dart';
// import '../../models/service_model.dart';
// import '../bottom_providers/dashboard_provider.dart';
//
// class FeaturedBusinessProvider with ChangeNotifier {
//   List<Services> featuredServiceList = [];
//   List<Services> searchList = [];
//   List<Businesses> featuredBusiness = [];
//   final FocusNode searchFocus = FocusNode();
//   TextEditingController txtFeaturedSearch = TextEditingController();
//   final PagingController<int, Services> pagingController =
//       PagingController(firstPageKey: 1);
//   AnimationController? animationController;
//
//   //featured package list
//   getFeaturedPackage(DashboardProvider dash, context) async {
//     searchList = [];
//     if (txtFeaturedSearch.text.isNotEmpty) {
//       for (var data in dash.featuredServiceList) {
//         if (data.title!.toLowerCase().contains(
//             txtFeaturedSearch.text.replaceAll(" ", "").toLowerCase())) {
//           if (!searchList.contains(data)) {
//             searchList.add(data);
//           }
//           notifyListeners();
//         }
//       }
//     } else {
//       notifyListeners();
//     }
//     route.pop(context);
//   }
//
//   List businessSearchList = [];
//
//   getBusinessSearchAPI(context) async {
//     final dashboard = Provider.of<DashboardProvider>(context, listen: false);
//     Position position = await dashboard.getCurrentLocation();
//     double lat = position.latitude;
//     double lon = position.longitude;
//     try {
//       log("hello  kjhdfjkdfjsd  sssss ");
//       apiServices
//           .commonApi(
//               '${api.businessSearch}?currentLongitude=$lon&currentLatitude=$lat',
//               [],
//               ApiType.get,
//               isToken: true)
//           .then((value) {
//         log("value.data ${value.data}");
//         if (value.data['responseStatus'] == 1) {
//           hideLoading(context);
//           businessSearchList.clear();
//           BusinessSearchModel businessSearchModel =
//               BusinessSearchModel.fromJson(value.data);
//
//           businessSearchList.addAll(businessSearchModel.businesses);
//
//           log("businessSearchList $businessSearchList");
//         }
//       });
//     } catch (e) {
//       hideLoading(context);
//       log("getBusinessSearchAPI :::");
//     }
//   }
//
//   // getBusinessList() {
//   //   notifyListeners();
//   //   apiServices.commonApi(api.businessList, [], ApiType.get).then((value) {
//   //     log("business list -- ${value.data}");
//   //     featuredBusiness = [];
//   //     if (value.isSuccess!) {
//   //       final dataList = BusinessList.fromJson(value.data);
//   //
//   //       featuredBusiness.clear();
//   //       if (dataList.businesses != null) {
//   //         featuredBusiness.addAll(dataList.businesses!);
//   //       }
//   //       notifyListeners();
//   //     }
//   //   });
//   //   notifyListeners();
//   // }
//
//   /*onReady(context, TickerProvider sync) async {
//     animationController = AnimationController(
//         vsync: sync, duration: const Duration(milliseconds: 1200));
//     _runAnimation();
//     notifyListeners();
//   }*/
//
//   void _runAnimation() async {
//     for (int i = 0; i < 300; i++) {
//       await animationController!.forward();
//       await animationController!.reverse();
//     }
//   }
//
//   onBack(DashboardProvider dash, context) {
//     txtFeaturedSearch.text = "";
//     searchList = [];
//     notifyListeners();
//     getFeaturedPackage(dash, context);
//   }
//
//   onFeatured(context, services, id, {inCart, isSearch = false}) async {
//     if (inCart) {
//       route.pop(context);
//       // route.pushNamed(context, routeName.cartScreen);
//     } else {
//       onBook(context, services!,
//               addTap: () => onAdd(context, id, isSearch: isSearch),
//               minusTap: () => onRemoveService(context, id, isSearch: isSearch))!
//           .then((e) {
//         searchList[id].selectedRequiredServiceMan =
//             searchList[id].requiredServicemen;
//         notifyListeners();
//       });
//     }
//   }
//
//   onRemoveService(context, index, {isSearch = false}) {
//     if (isSearch) {
//       if (int.parse(searchList[index].selectedRequiredServiceMan!) == 1) {
//         route.pop(context);
//       } else {
//         searchList[index].selectedRequiredServiceMan =
//             (int.parse(searchList[index].selectedRequiredServiceMan!) - 1)
//                 .toString();
//       }
//     } else {
//       final dash = Provider.of<DashboardProvider>(context, listen: false);
//       // dash.onRemoveService(context, index);
//       dash.notifyListeners();
//     }
//     notifyListeners();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     animationController!.dispose();
//     super.dispose();
//   }
//
//   onAdd(context, index, {isSearch = false}) {
//     if (isSearch) {
//       int count = int.parse(searchList[index].selectedRequiredServiceMan!);
//       count++;
//       searchList[index].selectedRequiredServiceMan = count.toString();
//     } else {
//       final dash = Provider.of<DashboardProvider>(context, listen: false);
//       dash.onAdd(index);
//       dash.notifyListeners();
//     }
//     notifyListeners();
//   }
// }
