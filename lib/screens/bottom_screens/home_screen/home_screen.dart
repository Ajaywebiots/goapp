import 'package:goapp/screens/app_pages_screen/coupon_list_screen/layouts/coupon_layout.dart';

import '../../../config.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/heading_row_common.dart';
import 'layouts/banner_layout.dart';
import 'layouts/home_app_bar.dart';
import 'layouts/home_body.dart';
import 'layouts/home_coupon_layout.dart';
import 'layouts/latest_blog_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context3, dash, child) {
      return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
        return StatefulWrapper(
            onInit: () {
              final currentContext = context;
              Future.delayed(const Duration(milliseconds: 100), () {
                if (currentContext.mounted) {
                  value.onAnimate(this);
                  dash.onInit(currentContext);
                }
              });
            },
            child: DirectionalityRtl(
                child: Scaffold(
                    appBar: AppBar(
                        leadingWidth: MediaQuery.of(context).size.width,
                        toolbarHeight: Sizes.s75,
                        leading: HomeAppBar(location: currentAddress ?? "")),
                    body: ListView(children: [
                      BannerLayout(
                          bannerList: dash.bannerList,
                          onPageChanged: (index, reason) =>
                              value.onSlideBanner(index),
                          onTap: (type, id) {}),
                      if (dash.bannerList.length > 1) const VSpace(Sizes.s12),
                      if (dash.bannerList.length > 1)
                        DotIndicator(
                            list: dash.bannerList,
                            selectedIndex: value.selectIndex),
                      const VSpace(Sizes.s20),
                      HeadingRowCommon(
                              title: appFonts.promotions,
                              isTextSize: true,
                              onTap: () => route.pushNamed(
                                  context, routeName.couponListScreen,
                                  arg: true))
                          .paddingSymmetric(horizontal: Insets.i20),
                      const VSpace(Sizes.s15),
                      Column(
                              children: dash.couponOfferList
                                  .asMap()
                                  .entries
                                  .take(2)
                                  .map((e) => CouponLayout(
                                      data: e.value,
                                      onTap: () => route.pushNamed(context,
                                          routeName.offerDetailsScreen)))
                                  .toList())
                          .paddingSymmetric(horizontal: Insets.i20),
                      const VSpace(Sizes.s10),
                      const HomeBody(),
                      if (dash.firstTwoHighRateList.isNotEmpty ||
                          dash.highestRateList.isNotEmpty)
                        const VSpace(Sizes.s33),
                      HeadingRowCommon(
                              title: appFonts.latestArticles,
                              isTextSize: true,
                              onTap: () => route.pushNamed(
                                  context, routeName.latestBlogViewAll))
                          .paddingSymmetric(horizontal: Insets.i20),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: dash.firstTwoBlogList.isNotEmpty
                              ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: dash.firstTwoBlogList
                                          .asMap()
                                          .entries
                                          .map((e) => LatestBlogLayout(
                                              data: e.value, isHome: true))
                                          .toList())
                                  .paddingOnly(left: Insets.i20)
                              : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: dash.blogList
                                          .asMap()
                                          .entries
                                          .map((e) => LatestBlogLayout(
                                              data: e.value, isHome: true))
                                          .toList())
                                  .paddingOnly(left: Insets.i20)),
                      const VSpace(Sizes.s50)
                    ]))));
      });
    });
  }
}
