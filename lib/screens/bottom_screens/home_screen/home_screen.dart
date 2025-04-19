import 'package:goapp/providers/app_pages_provider/latest_blog_details_provider.dart';
import 'package:goapp/providers/bottom_providers/offer_provider.dart';
import 'package:goapp/screens/app_pages_screen/coupon_list_screen/layouts/coupon_layout.dart';
import 'package:goapp/config.dart';
import '../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../providers/common_providers/common_api_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/heading_row_common.dart';
import 'layouts/banner_layout.dart';
import 'layouts/home_app_bar.dart';
import 'layouts/home_body.dart';
import 'layouts/latest_blog_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context1, dash, child) {
      return DirectionalityRtl(
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  leadingWidth: MediaQuery.of(context).size.width,
                  toolbarHeight: Sizes.s75,
                  leading: HomeAppBar(location: currentAddress ?? "")),
              body: Stack(children: [
                dash.isLoading
                    ? Container(
                        color:
                            appColor(context).darkText.withValues(alpha: 0.2),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                            child: Image.asset(eGifAssets.loader,
                                height: Sizes.s100)))
                    : ListView(children: [
                        dash.bannerList.isEmpty
                            ? SizedBox.shrink()
                            : BannerLayout(
                                bannerList: dash.bannerList,
                                onPageChanged: (index, reason) =>
                                    dash.onSlideBanner(index),
                                onTap: (type, id) {}),
                        if (dash.bannerList.length > 1) const VSpace(Sizes.s12),
                        if (dash.bannerList.length > 1)
                          dash.bannerList.isEmpty
                              ? SizedBox.shrink()
                              : DotIndicator(
                                  list: dash.bannerList,
                                  selectedIndex: dash.selectIndex),
                        dash.couponOfferList.isEmpty
                            ? SizedBox.shrink()
                            : const VSpace(Sizes.s20),
                        dash.couponOfferList.isEmpty
                            ? SizedBox.shrink()
                            : HeadingRowCommon(
                                title:
                                    language(context, appFonts.popularOffers),
                                isTextSize: true,
                                onTap: () => route.pushNamed(
                                    context, routeName.couponListScreen,
                                    arg: true)).paddingSymmetric(
                                horizontal: Insets.i20),
                        dash.couponOfferList.isEmpty
                            ? SizedBox.shrink()
                            : const VSpace(Sizes.s10),
                        dash.couponOfferList.isEmpty
                            ? SizedBox.shrink()
                            : Column(
                                    children: dash.couponOfferList
                                        .asMap()
                                        .entries
                                        .map((e) => CouponLayout(
                                            data: e.value,
                                            addOrRemoveTap: () {
                                              final common = Provider.of<
                                                      CommonApiProvider>(
                                                  context,
                                                  listen: false);
                                              common.toggleFavAPI(
                                                  onSuccess: () => Provider.of<
                                                              HomeScreenProvider>(
                                                          context,
                                                          listen: false)
                                                      .homeFeed(context),
                                                  context,
                                                  e.value.isFavourite,
                                                  e.value.appObject!
                                                      .appObjectType,
                                                  e.value.appObject!
                                                      .appObjectId);
                                            },
                                            onTap: () =>
                                                Provider.of<OfferProvider>(
                                                        context,
                                                        listen: false)
                                                    .offerDetailsAPI(
                                                  context,
                                                  e.value.id,
                                                )))
                                        .toList())
                                .paddingSymmetric(horizontal: Insets.i20),
                        dash.couponOfferList.isEmpty
                            ? SizedBox.shrink()
                            : const VSpace(Sizes.s10),
                        const HomeBody(),
                        // if (dash.firstTwoHighRateList.isNotEmpty ||
                        //     dash.highestRateList.isNotEmpty)
                        const VSpace(Sizes.s33),
                        dash.firstTwoBlogList.isEmpty
                            ? Container()
                            : HeadingRowCommon(
                                    title: language(
                                        context, appFonts.latestArticles),
                                    isTextSize: true,
                                    onTap: () => route.pushNamed(
                                        context, routeName.latestBlogViewAll))
                                .paddingSymmetric(horizontal: Insets.i20),
                        dash.firstTwoBlogList.isEmpty
                            ? Container()
                            : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: dash.firstTwoBlogList
                                            .asMap()
                                            .entries
                                            .map((e) => LatestBlogLayout(
                                                onTap: () {
                                                  final sss = Provider.of<
                                                          LatestBLogDetailsProvider>(
                                                      context,
                                                      listen: false);
                                                  sss.detailsDataAPI(
                                                      context, e.value.id);
                                                },
                                                data: e.value,
                                                addOrRemoveTap: () {
                                                  final common = Provider.of<
                                                          CommonApiProvider>(
                                                      context,
                                                      listen: false);
                                                  common.toggleFavAPI(
                                                      onSuccess: () => Provider
                                                              .of<HomeScreenProvider>(
                                                                  context,
                                                                  listen: false)
                                                          .homeFeed(context),
                                                      context,
                                                      e.value.isFavourite,
                                                      e.value.appObject!
                                                          .appObjectType,
                                                      e.value.appObject!
                                                          .appObjectId);
                                                }))
                                            .toList())
                                    .paddingOnly(left: Insets.i20)),
                        const VSpace(Sizes.s50)
                      ])
              ])));
    });
  }
}
