import 'dart:developer';

import 'package:goapp/providers/app_pages_provider/search_provider.dart';

import '../../../config.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../search_screen/layouts/filter_layout.dart';
import 'layouts/coupon_layout.dart';

class CouponListScreen extends StatefulWidget {
  const CouponListScreen({super.key});

  @override
  State<CouponListScreen> createState() => _CouponListScreenState();
}

class _CouponListScreenState extends State<CouponListScreen> {
  // bool isArg = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context3, dash, child) {
      return DirectionalityRtl(
          child: Scaffold(
              appBar: AppBarCommon(title: appFonts.offers),
              body: SingleChildScrollView(
                  child: Column(children: [
                SearchTextFieldCommon(
                    controller: dash.searchCtrl,
                    focusNode: dash.searchFocus,
                    suffixIcon: FilterIconCommon(
                        selectedFilter: "",
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return const FilterLayout2();
                              }).then((value) {
                            log("DDDD");
                            final dash = Provider.of<SearchProvider>(context,
                                listen: false);
                            dash.getCategory();
                            dash.notifyListeners();
                            dash.filterSearchCtrl.text = "";
                          });
                        })),
                VSpace(Insets.i22),
                ...dash.couponOfferList.asMap().entries.map((e) => CouponLayout(
                    data: e.value,
                    onTap: () {
                      route.pushNamed(context, routeName.offerDetailsScreen);
                      // route.pop(context, arg: e.value);
                    }))
              ]).paddingSymmetric(horizontal: Insets.i20))));
    });
  }
}
