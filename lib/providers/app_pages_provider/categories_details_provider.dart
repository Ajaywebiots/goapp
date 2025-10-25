import 'dart:developer';
import 'dart:ui' as ui;
import '../../config.dart';

class CategoriesDetailsProvider with ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();
  TextEditingController filterSearchCtrl = TextEditingController();
  int selectedIndex = 0;
  Future<ui.Image>? loadingImage;
  final FocusNode searchFocus = FocusNode();
  final FocusNode filterSearchFocus = FocusNode();
  int? exValue = appArray.experienceList[0]["id"];
  String selectedExp = appArray.experienceList[0]["title"];
  List selectedRates = [];
  // List<Services> serviceList = [];
  // CategoryModel? categoryModel;
  bool val = true;
  double maxPrice = 100.0, minPrice = 0.0, lowerVal = 00.0, upperVal = 90.0;
  // Services? services;
  // List<ProviderModel> providerList = [];
  List selectedProvider = [];

  void onSwitch(value) {
    val = value;
    notifyListeners();
  }

  // onExperience(val) {
  //   exValue = val;
  //   selectedExp = appArray.experienceList[val]['title'];
  //   notifyListeners();
  //
  //   if (selectedExp.toString().contains("highestExperience") ||
  //       selectedExp.toString().contains("lowestExperience")) {
  //     if (selectedExp.contains("highestExperience")) {
  //       providerList.sort(
  //           (a, b) => b.experienceDuration!.compareTo(a.experienceDuration!));
  //     } else {
  //       log("GPO");
  //
  //       providerList.sort(
  //           (a, b) => a.experienceDuration!.compareTo(b.experienceDuration!));
  //       notifyListeners();
  //     }
  //   } else {
  //     if (selectedExp.contains("highestServed")) {
  //       providerList.sort((a, b) => a.served!.compareTo(b.served!));
  //       notifyListeners();
  //     } else {
  //       providerList.sort((a, b) => b.served!.compareTo(a.served!));
  //
  //       notifyListeners();
  //     }
  //   }
  //
  //   notifyListeners();
  //   //fetchProviderByFilter();
  // }

  // String totalCountFilter() {
  //   log("maxPrice :: $maxPrice");
  //   int count = 0;
  //
  //   if (selectedProvider.isNotEmpty) {
  //     count++;
  //   }
  //   if (lowerVal != 00.0 || upperVal != (maxPrice != 0.0 ? maxPrice : 100.0)) {
  //     count++;
  //   }
  //   if (selectedRates.isNotEmpty) {
  //     count++;
  //   }
  //   if (slider != 0.0) {
  //     count++;
  //   }
  //
  //   if (isSelect != null) {
  //     count++;
  //   }
  //
  //   return count.toString();
  // }

  // fetchProviderByFilter() async {
  //   providerList = [];
  //   try {
  //     List<ProviderModel> newLList = appArray.providerExpList
  //         .map((e) => ProviderModel.fromJson(e))
  //         .toList();
  //     notifyListeners();
  //     if (filterSearchCtrl.text.isNotEmpty) {
  //       newLList.asMap().entries.forEach((element) {
  //         log("dsd :${element.value.name!.toString().toLowerCase().replaceAll(" ", "")}");
  //         if (element.value.name!
  //             .toString()
  //             .toLowerCase()
  //             .replaceAll(" ", "")
  //             .contains(filterSearchCtrl.text)) {
  //           providerList.add(element.value);
  //         }
  //       });
  //       notifyListeners();
  //     } else {
  //       providerList = appArray.providerExpList
  //           .map((e) => ProviderModel.fromJson(e))
  //           .toList();
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     log("EEE :$e");
  //   }
  // }

  void onCategoryChange(index) {
    if (!selectedProvider.contains(index)) {
      selectedProvider.add(index);
    } else {
      selectedProvider.remove(index);
    }
    notifyListeners();
  }

  void onSubCategories(context, index, id) {
    selectedIndex = index;
    notifyListeners();
    log("idid:$id");
    // getServiceByCategoryId(context, id);
  }

  int selectIndex = 0;

  void onFilter(index) {
    selectIndex = index;
    notifyListeners();
  }

  double slider = 0;
  bool? isSelect;
  int ratingIndex = 0;

  void onSliderChange(handlerIndex, lowerValue, upperValue) {
    lowerVal = lowerValue;
    upperVal = upperValue;
    notifyListeners();
  }

  void onTapRating(id) {
    if (!selectedRates.contains(id)) {
      selectedRates.add(id);
    } else {
      selectedRates.remove(id);
    }

    notifyListeners();
  }

  void onChange() {
    isSelect = false;
    notifyListeners();
  }

  void onChange1() {
    isSelect = true;
    notifyListeners();
  }

  double sliderValue = 0.0;

  void onChangeSlider(sVal) {
    notifyListeners();
    sliderValue = sVal;
    notifyListeners();
  }

  // Future<ui.FrameInfo> loadImage(String assetPath) async {
  //   ByteData data = await rootBundle.load(assetPath);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetHeight: 30, targetWidth: 30);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   notifyListeners();
  //   return fi;
  // }
  //
  // ui.Image? customImage;

  // slidingValue(newValue) {
  //   slider = newValue;
  //   notifyListeners();
  // }

  // onBottomSheet(context) {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (context) {
  //         return const CategoriesFilterLayout();
  //       });
  // }

  void onReady(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    // categoryModel = data;
    notifyListeners();

    // getServiceByCategoryId(context, categoryModel?.id);

    // fetchProviderByFilter();
    notifyListeners();
  }

  // getServiceByCategoryId(context, id) async {
  //   serviceList =
  //       appArray.featuredList.map((e) => Services.fromJson(e)).toList();
  //   notifyListeners();
  // }

  // getServiceById(context, serviceId) async {
  //   // route.pushNamed(context, routeName.businessDetailsScreen);
  // }

  // getProviderById(context, id, index, Services service) async {
  //   final cartCtrl = Provider.of<CartProvider>(context, listen: false);
  //   if (cartCtrl.cartList
  //       .where((element) =>
  //           element.serviceList != null &&
  //           element.serviceList!.id == service.id)
  //       .isNotEmpty) {
  //     // route.pushNamed(context, routeName.cartScreen);
  //   } else {
  //     // onBook(context, service,
  //     //     addTap: () => onAdd(index),
  //     //     minusTap: () => onRemoveService(context, index)).then((e) {
  //     //   serviceList[index].selectedRequiredServiceMan =
  //     //       serviceList[index].requiredServicemen;
  //     //   notifyListeners();
  //     // });
  //   }
  // }

  // onRemoveService(context, index) {
  //   if (int.parse(serviceList[index].selectedRequiredServiceMan!) == 1) {
  //     route.pop(context);
  //   } else {
  //     serviceList[index].selectedRequiredServiceMan =
  //         (int.parse(serviceList[index].selectedRequiredServiceMan!) - 1)
  //             .toString();
  //   }
  //   notifyListeners();
  // }

  // onAdd(index) {
  //   int count = int.parse(serviceList[index].selectedRequiredServiceMan!);
  //   count++;
  //   serviceList[index].selectedRequiredServiceMan = count.toString();
  //
  //   notifyListeners();
  // }

  //clear filter
  void clearFilter(context) {
    selectedProvider = [];
    selectedRates = [];
    lowerVal = 00.0;
    upperVal = 100.0;
    slider = 0;
    // serviceList =
    //     appArray.servicesList.map((e) => Services.fromJson(e)).toList();
    notifyListeners();
    route.pop(context);
    notifyListeners();
  }
}
