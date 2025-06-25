import '../../config.dart';
import '../../models/api_model/my_business_model.dart';
import '../../services/api_service.dart';

class MyBusinessProvider extends ChangeNotifier {
  List<Business> businesses = [];

  Future<void> fetchBusinesses() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);

    final response = await apiServices.commonApi(
        "${api.myBusinessList}$userId/businesses", [], ApiType.get,
        isToken: true);

    MyBusinessModel model = MyBusinessModel.fromJson(response.data);
    businesses.addAll(model.businesses);
    notifyListeners();
  }
}
