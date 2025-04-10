import 'dart:developer';
import '../../common_tap.dart';
import '../../config.dart';
import '../../models/favourite_model.dart';
import '../../models/service_model.dart';

class FavouriteListProvider with ChangeNotifier {
  int selectIndex = 0;

  onFilter(index) {
    selectIndex = index;
    notifyListeners();
  }

  List<FavouriteModel> favoriteList = [];
  List<FavouriteModel> providerFavList = [];
  List<FavouriteModel> serviceFavList = [];
  TextEditingController providerCtrl = TextEditingController();
  TextEditingController serviceCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final FocusNode serviceSearchFocus = FocusNode();
  int selectedIndex = 0;

  onChangeList(index) {
    selectedIndex = index;
    notifyListeners();
  }

  //favorite list
  getFavourite() async {
    favoriteList = [];
    log("DDD:$favoriteList");
    notifyListeners();

    String apiUrlName = "";
    if (providerCtrl.text.isNotEmpty || serviceCtrl.text.isNotEmpty) {
      log("favoriteList :${favoriteList.length}");
      if (selectedIndex == 0) {
        List<FavouriteModel> searchList = providerFavList;
        providerFavList = [];
        notifyListeners();
        for (var data in searchList) {
          if (data.provider!.name!
              .toLowerCase()
              .contains(providerCtrl.text.toLowerCase())) {
            if (!providerFavList.contains(data)) {
              providerFavList.add(data);
            }
            notifyListeners();
          }
        }
      } else {
        List<FavouriteModel> searchList = serviceFavList;
        serviceFavList = [];
        log("searchList :$searchList");
        notifyListeners();
        for (var data in searchList) {
          if (data.service!.title!
              .replaceAll(" ", "")
              .toLowerCase()
              .contains(serviceCtrl.text.toLowerCase())) {
            if (!serviceFavList.contains(data)) {
              serviceFavList.add(data);
            }
            notifyListeners();
          }
        }
        log("searchList :${serviceFavList.length}");
      }
    } else {
      providerFavList = [];
      serviceFavList = [];
      try {
        favoriteList = appArray.favouriteProviderList
            .map((e) => FavouriteModel.fromJson(e))
            .toList();
        log("favoriteList :${favoriteList.length}");
        for (var favouriteModel in favoriteList) {
          if (favouriteModel.serviceId != null) {
            log("SER : ${favouriteModel.serviceId}");
            if (!serviceFavList.contains(favouriteModel)) {
              serviceFavList.add(favouriteModel);
            } else {
              serviceFavList.remove(favouriteModel);
            }
            notifyListeners();
          } else {
            if (!providerFavList.contains(favouriteModel)) {
              providerFavList.add(favouriteModel);
            } else {
              providerFavList.remove(favouriteModel);
            }
            notifyListeners();
          }
        }
      } catch (e) {
        log("ERRor getFavourite: E4$e");
      }
    }
  }

  // add to favourite api
  addToFav(context, id, type, data) async {
    if (type == "service") {
      FavouriteModel fav = FavouriteModel();
      fav.serviceId = id.toString();
      fav.service = data;
      int index = favoriteList.indexWhere(
          (element) => element.serviceId.toString() == id.toString());

      log("INDEX :$index");
      if (index == -1) {
        favoriteList.add(fav);
        serviceFavList.add(fav);
      } else {
        favoriteList.removeWhere(
            (element) => element.serviceId.toString() == id.toString());
        serviceFavList.removeWhere(
            (element) => element.serviceId.toString() == id.toString());
      }
      notifyListeners();
      notifyListeners();
    } else {
      FavouriteModel fav = FavouriteModel();
      fav.providerId = id.toString();
      fav.provider = data;
      int index = favoriteList.indexWhere(
          (element) => element.providerId.toString() == id.toString());

      log("INDEX :$index");
      if (index == -1) {
        favoriteList.add(fav);
        providerFavList.add(fav);
      } else {
        favoriteList.removeWhere(
            (element) => element.providerId.toString() == id.toString());
        providerFavList.removeWhere(
            (element) => element.providerId.toString() == id.toString());
      }
      notifyListeners();
    }
    // route.pushNamed(context, routeName.favoriteList);
  }

  //remove from favourite api
  deleteToFav(context, id, type) async {
    int index = 0;

    if (type == "service") {
      /*providerFavList.removeWhere(
              (element) => element.serviceId.toString() == id.toString());
      notifyListeners();
      index = favoriteList
          .indexWhere((element) =>
      element.serviceId.toString() == id.toString());
      log("OD :$index");
      favoriteList.removeAt(index);
      notifyListeners();*/
      log("serviceId :$id");
      favoriteList.removeWhere(
          (element) => element.serviceId.toString() == id.toString());
      serviceFavList.removeWhere(
          (element) => element.serviceId.toString() == id.toString());
      log("favoriteList :${favoriteList.length}");
      notifyListeners();
    } else {
      providerFavList.removeWhere(
          (element) => element.providerId.toString() == id.toString());
      notifyListeners();
      index = favoriteList.indexWhere(
          (element) => element.providerId.toString() == id.toString());
    }

    notifyListeners();
  }

  onFeatured(context, Services? services, id) async {
    onBook(context, services!,
            addTap: () => onAdd(id: id),
            minusTap: () => onRemoveService(context, id: id))!
        .then((e) {
      serviceFavList[id].service!.selectedRequiredServiceMan =
          serviceFavList[id].service!.requiredServicemen;
      notifyListeners();
    });
  }

  onRemoveService(context, {id}) {
    if (int.parse(serviceFavList[id].service!.selectedRequiredServiceMan!) ==
        1) {
      route.pop(context);
    } else {
      serviceFavList[id].service!.selectedRequiredServiceMan =
          (int.parse(serviceFavList[id].service!.selectedRequiredServiceMan!) -
                  1)
              .toString();
    }
    notifyListeners();
  }

  onAdd({id}) {
    int count =
        int.parse(serviceFavList[id].service!.selectedRequiredServiceMan!);
    count++;
    serviceFavList[id].service!.selectedRequiredServiceMan = count.toString();
    notifyListeners();
  }
}
