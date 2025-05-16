import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart'
    show AnimatedBottomNavigationBar, GapLocation;
import 'package:goapp/providers/bottom_providers/dashboard_provider.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/latest_blog_details_provider.dart';
import '../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../providers/common_providers/common_api_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../../bottom_screens/home_screen/layouts/latest_blog_layout.dart';

class LatestBlogViewAll extends StatelessWidget {
  const LatestBlogViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<LatestBLogDetailsProvider, DashboardProvider>(
        builder: (context, value, dash, child) {
      return DirectionalityRtl(
          child: Scaffold(
              appBar: AppBarCommon(
                  title: language(context, appFonts.articles),
                  onTap: () {
                    route.pop(context);
                    value.searchCtrl.text = "";
                    value.selectedCategory = [];
                  }),
              body: SafeArea(
                  child: Column(children: [
                SearchTextFieldCommon(
                    hintText: "Search for articles",
                    controller: value.searchCtrl,
                    focusNode: value.searchFocus,
                    suffixIcon: FilterIconCommon(
                        selectedFilter:
                            value.selectedCategory.length.toString(),
                        onTap: () => value.showBottomBlogFilter(context))),
                VSpace(Insets.i15),
                Expanded(
                    child: value.articlesSearchList.isEmpty
                        ? SingleChildScrollView(
                            child: EmptyLayout(
                                topHeight:
                                    MediaQuery.of(context).size.height * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                isButtonShow: false,
                                title: language(
                                    context, appFonts.noResultsWereFound),
                                subtitle: language(context, appFonts.sorry),
                                widget: Image.asset(eImageAssets.noNoti,
                                    height: Sizes.s200)))
                        : ListView.builder(
                            itemCount: value.articlesSearchList.length,
                            itemBuilder: (context, index) {
                              final article = value.articlesSearchList[index];
                              return LatestBlogLayout(
                                  onTap: () =>
                                      value.detailsDataAPI(context, article.id),
                                  data: article,
                                  rPadding: 0,
                                  isView: true,
                                  addOrRemoveTap: () {
                                    final previousFavourite =
                                        article.isFavourite;
                                    article.isFavourite = !previousFavourite;
                                    value.notifyListeners();
                                    final common =
                                        Provider.of<CommonApiProvider>(context,
                                            listen: false);
                                    common.toggleFavAPI(
                                        onSuccess: () => Provider.of<
                                                    LatestBLogDetailsProvider>(
                                                context,
                                                listen: false)
                                            .getArticlesSearchAPI(context),
                                        context,
                                        previousFavourite,
                                        article.appObject!.appObjectType,
                                        article.appObject!.appObjectId);
                                  }).width(MediaQuery.of(context).size.width);
                            })),
                VSpace(Insets.i15)
              ]).paddingSymmetric(horizontal: Insets.i20)),
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
