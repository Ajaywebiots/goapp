import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user_uikit/common_tap.dart';
import 'package:fixit_user_uikit/config.dart';
import 'package:fixit_user_uikit/models/selected_service_cart.dart';

class ProviderDetailsProvider with ChangeNotifier {
  int selectIndex = 0;
  int selectProviderIndex = 0;
  List<CategoryModel> categoryList = [];
  List<Services> serviceList = [];
  bool visible = true;
  int val = 1;
  double loginWidth = 100.0;
  int providerId = 0;
  ProviderModel? provider;

  onSelectService(context, index) {
    selectIndex = index;
    notifyListeners();

    getServiceByCategoryId(context, categoryList[index].id);
  }

  onChooseService(index) {
    selectProviderIndex = index;
    notifyListeners();
  }


  onAddService() {
    if (!visible) {
      visible = !visible;
      loginWidth = 100.0;
    } else {
      val = ++val;
    }
    notifyListeners();
  }



  onReady(context,{id}) async {
    dynamic data;
    if(id != null){
      data = id;
    }else {
      data = ModalRoute
          .of(context)!
          .settings
          .arguments;
      notifyListeners();
      log("idid : $data");
    }
    getProviderById(context, id);
    getCategory(context, id);
  }


  onRemoveService(context, index) {
    if (int.parse(serviceList[index].selectedRequiredServiceMan!) == 1) {
      route.pop(context);
    } else {
      serviceList[index].selectedRequiredServiceMan =
          (int.parse(serviceList[index].selectedRequiredServiceMan!) - 1)
              .toString();
    }
    notifyListeners();
  }

  onAdd(index) {
    int count = int.parse(serviceList[index].selectedRequiredServiceMan!);
    count++;
    serviceList[index].selectedRequiredServiceMan = count.toString();
log("CCCC");
    notifyListeners();
  }

  getProviderById(context, id) async {
   provider = ProviderModel.fromJson(appArray.providerDetail);
    notifyListeners();
  }

  getCategory(context, id) async {
  categoryList = appArray.categoryList.map((e) => CategoryModel.fromJson(e)).toList();
  notifyListeners();
  getServiceByCategoryId(context,id);
  }

  getServiceByCategoryId(context, id) async {
    serviceList = appArray.servicesList.map((e) => Services.fromJson(e)).toList();
    notifyListeners();
  }


}