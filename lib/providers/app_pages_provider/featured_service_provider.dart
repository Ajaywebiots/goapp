import 'dart:developer';

import 'package:fixit_user_uikit/common_tap.dart';
import 'package:fixit_user_uikit/models/blog_model.dart';
import 'package:fixit_user_uikit/models/booking_status_model.dart';
import 'package:fixit_user_uikit/models/coupon_model.dart';
import 'package:fixit_user_uikit/models/currency_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../config.dart';

class FeaturedServiceProvider with ChangeNotifier {
  List<Services> featuredServiceList = [];
  List<Services> searchList = [];
  final FocusNode searchFocus = FocusNode();
  TextEditingController txtFeaturedSearch = TextEditingController();
  final PagingController<int, Services> pagingController =
      PagingController(firstPageKey: 1);
  AnimationController? animationController;

  //featured package list
  getFeaturedPackage(DashboardProvider dash,context) async {
    searchList = [];
    if(txtFeaturedSearch.text.isNotEmpty){
      for(var data in dash.featuredServiceList){

        if(data.title!.toLowerCase().contains(txtFeaturedSearch.text.replaceAll(" ", "").toLowerCase())){
          if(!searchList.contains(data)){
            searchList.add(data);
          }
          notifyListeners();
        }
      }
    }else{
      notifyListeners();
    }
    route.pop(context);
  }

  onReady(context, TickerProvider sync) async {

    animationController = AnimationController(
        vsync: sync, duration: const Duration(milliseconds: 1200));
    _runAnimation();
    notifyListeners();

  }


  void _runAnimation() async {
    for (int i = 0; i < 300; i++) {
      await animationController!.forward();
      await animationController!.reverse();
    }
  }

  onBack(DashboardProvider dash,context) {
    txtFeaturedSearch.text = "";
    searchList = [];
    notifyListeners();
    getFeaturedPackage(dash,context);
  }

  onFeatured(context, Services? services, id,
      {inCart, isSearch = false}) async {
    if (inCart) {
      route.pop(context);
      route.pushNamed(context, routeName.cartScreen);
    } else {

      onBook(context, services!,

              addTap: () => onAdd(context, id, isSearch: isSearch),
              minusTap: () => onRemoveService(context, id, isSearch: isSearch))!
          .then((e) {
        searchList[id].selectedRequiredServiceMan =
            searchList[id].requiredServicemen;
        notifyListeners();
      });
    }
  }

  onRemoveService(context, index, {isSearch = false}) {
    if (isSearch) {
      if (int.parse(searchList[index].selectedRequiredServiceMan!) == 1) {
        route.pop(context);
      } else {
        searchList[index].selectedRequiredServiceMan =
            (int.parse(searchList[index].selectedRequiredServiceMan!) - 1)
                .toString();
      }
    } else {
      final dash = Provider.of<DashboardProvider>(context, listen: false);
      dash.onRemoveService(context, index);
      dash.notifyListeners();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }

  onAdd(context, index, {isSearch = false}) {
    if (isSearch) {
      int count = int.parse(searchList[index].selectedRequiredServiceMan!);
      count++;
      searchList[index].selectedRequiredServiceMan = count.toString();
    } else {
      final dash = Provider.of<DashboardProvider>(context, listen: false);
      dash.onAdd(index);
      dash.notifyListeners();
    }
    notifyListeners();
  }


}
