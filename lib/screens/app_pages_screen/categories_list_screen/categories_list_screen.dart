import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/categories_list_provider.dart';
import '../../../providers/app_pages_provider/search_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../bottom_screens/home_screen/layouts/top_categories_layout.dart';
import '../search_screen/search_screen.dart';
import 'layouts/categories_list_layout.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({super.key});

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context, listen: true);

    return Consumer<CategoriesListProvider>(builder: (context1, value, child) {
      return DirectionalityRtl(
          child: Scaffold(
              appBar: AppBar(
                  leadingWidth: 80,
                  title: Text(language(context, appFonts.categories),
                      style: appCss.dmDenseBold18
                          .textColor(appColor(context).darkText)),
                  centerTitle: true,
                  leading: CommonArrow(
                      arrow: rtl(context)
                          ? eSvgAssets.arrowRight
                          : eSvgAssets.arrowLeft,
                      onTap: () => route.pop(context)).paddingAll(Insets.i8)),
              body: SingleChildScrollView(
                  child: Column(children: [
                const VSpace(Sizes.s10),
                Column(
                    children: value.categoryList
                        .asMap()
                        .entries
                        .map((e) => CategoriesListLayout(
                            data: e.value,
                            onTap: () {
                              route.pop(context);
                              setState(() {
                                dash.selectIndex = 1;
                                dash.notifyListeners();
                                log("dash.selectIndex::${dash.selectIndex}");
                              });
                              final selectedCategory = e.value;
                              final dashProvider =
                                  Provider.of<DashboardProvider>(context,
                                      listen: false);
                              final searchProvider =
                                  Provider.of<SearchProvider>(context,
                                      listen: false);
                              searchProvider.setPendingCategoryName(
                                  selectedCategory.translatedValue ?? '');
                              dash.notifyListeners();
                            }))
                        .toList())
              ]).paddingAll(Insets.i20)),
              bottomNavigationBar:
                  Consumer<ThemeService>(builder: (themeContext, theme, child) {
                return AnimatedBottomNavigationBar.builder(
                    elevation: 18,
                    activeIndex: dash.selectIndex,
                    height: 76,
                    gapLocation: GapLocation.none,
                    shadow: BoxShadow(
                        color: appColor(context).darkText.withOpacity(0.12),
                        blurRadius: 20,
                        spreadRadius: 25),
                    // notchSmoothness: NotchSmoothness.softEdge,
                    leftCornerRadius: AppRadius.r18,
                    rightCornerRadius: AppRadius.r18,
                    backgroundColor: appColor(context).whiteBg,
                    onTap: (index) => dash.onTap(index, context),
                    itemCount: appArray.dashboardList.length,
                    tabBuilder: (int index, bool isActive) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                dash.selectIndex == index
                                    ? appArray.dashboardList[index]["icon2"]!
                                    : appArray.dashboardList[index]["icon"]!,
                                height: Sizes.s24,
                                width: Sizes.s24,
                                fit: BoxFit.scaleDown),
                            const VSpace(Sizes.s5),
                            Text(
                                language(context,
                                    appArray.dashboardList[index]["title"]!),
                                overflow: TextOverflow.ellipsis,
                                style: dash.selectIndex == index
                                    ? appCss.dmDenseMedium14
                                        .textColor(appColor(context).primary)
                                    : appCss.dmDenseRegular14
                                        .textColor(appColor(context).darkText))
                          ]);
                    });
              })));
    });
  }
}
