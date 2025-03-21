import 'dart:developer';
import '../../config.dart';
import '../../models/provider_model.dart';
import '../bottom_providers/dashboard_provider.dart';

class ExpertServiceProvider with ChangeNotifier {
  final FocusNode searchFocus = FocusNode();

  List<ProviderModel> searchList = [];
  AnimationController? animationController;
  TextEditingController txtFeaturedSearch = TextEditingController();

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

  //featured package list
  getFeaturedPackage(DashboardProvider dash) async {
    searchList = [];
    if (txtFeaturedSearch.text.isNotEmpty) {
      for (var data in dash.highestRateList) {
        if (data.name!
            .toLowerCase()
            .contains(txtFeaturedSearch.text.toLowerCase())) {
          if (!searchList.contains(data)) {
            searchList.add(data);
          }
          notifyListeners();
        }
      }
    } else {
      notifyListeners();
    }
  }

  onBack(DashboardProvider dash, context) {
    txtFeaturedSearch.text = "";
    searchList = [];
    notifyListeners();
    getFeaturedPackage(dash);
    route.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }
}
