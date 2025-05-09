import 'dart:developer';

import '../../common_tap.dart';
import '../../config.dart';
import '../../models/service_model.dart';

class ServicesDetailsProvider with ChangeNotifier {
  int selectedIndex = 0;
  int? serviceId;

  // Services? service;

  onImageChange(index) {
    selectedIndex = index;
    notifyListeners();
  }

  // onReady(context) async {
  //   // getServiceById(context);
  //   notifyListeners();
  // }

  // getServiceById(context) async {
  //   service = Services.fromJson(appArray.serviceDetail);
  //   notifyListeners();
  // }

  // onFeatured(context, Services? services, id) async {
  //   onBook(context, services!,
  //       addTap: () => onAdd(id: id),
  //       minusTap: () => onRemoveService(context, id: id)).then((e) {
  //     service!.relatedServices![id].selectedRequiredServiceMan =
  //         service!.relatedServices![id].requiredServicemen;
  //     notifyListeners();
  //   });
  // }

  // onRemoveService(context, {id}) {
  //   if (id != null) {
  //     if (int.parse(
  //             service!.relatedServices![id].selectedRequiredServiceMan!) ==
  //         1) {
  //       route.pop(context);
  //     } else {
  //       service!.relatedServices![id].selectedRequiredServiceMan = (int.parse(
  //                   service!.relatedServices![id].selectedRequiredServiceMan!) -
  //               1)
  //           .toString();
  //     }
  //   } else {
  //     if (int.parse(service!.selectedRequiredServiceMan!) == 1) {
  //       route.pop(context);
  //     } else {
  //       service!.selectedRequiredServiceMan =
  //           (int.parse(service!.selectedRequiredServiceMan!) - 1).toString();
  //     }
  //   }
  //   notifyListeners();
  // }

  // onAdd({id}) {
  //   if (id != null) {
  //     int count =
  //         int.parse(service!.relatedServices![id].selectedRequiredServiceMan!);
  //     count++;
  //     service!.relatedServices![id].selectedRequiredServiceMan =
  //         count.toString();
  //   } else {
  //     int count = int.parse(service!.selectedRequiredServiceMan!);
  //     count++;
  //     service!.selectedRequiredServiceMan = count.toString();
  //   }
  //   notifyListeners();
  // }
}
