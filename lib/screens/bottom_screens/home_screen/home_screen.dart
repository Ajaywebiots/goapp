import 'dart:developer';

import 'package:goapp/config.dart';
import 'package:goapp/screens/app_pages_screen/coupon_list_screen/layouts/coupon_layout.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/heading_row_common.dart';
import 'layouts/banner_layout.dart';
import 'layouts/guest_login_sheet.dart';
import 'layouts/home_app_bar.dart';
import 'layouts/home_body.dart';
import 'layouts/latest_blog_layout.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool isGuest = false;

  @override
  void initState() {
    super.initState();
    loadGuestStatus();
  }

  loadGuestStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(session.accessToken);
    setState(() {
      // If accessToken is null or empty, user is a guest
      isGuest = accessToken == null || accessToken.isEmpty;
      log("Guest status: $isGuest, AccessToken: ${accessToken != null ? 'exists' : 'null'}");
    });
  }


  void showGuestLoginSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => GuestLoginSheet(
        onLoginSuccess: () {
          Navigator.pop(context);
          route.pushNamed(
            context,
            routeName.login,
            arg: {"redirectTo": routeName.dashboard, "selectIndex": 0},
          );
          log("Redirecting to login from dashboard screen");
          log("Guest login ${routeName.dashboard} ----- 0");
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context1, dash, child) {
        return LoadingComponent(
          child: DirectionalityRtl(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leadingWidth: MediaQuery.of(context).size.width,
                toolbarHeight: Sizes.s75,
                leading: HomeAppBar(location: currentAddress ?? ""),
              ),
              body: Stack(
                children: [
                  ListView(
                    children: [
                      // Banner Section
                      Consumer<DashboardProvider>(
                        builder: (context, dashboard, child) {
                          return BannerLayout(
                            bannerList: dash.bannerList,
                            onPageChanged: (index, reason) =>
                                dash.onSlideBanner(index),
                            onTap: () =>
                                Provider.of<HomeScreenProvider>(
                                  context,
                                  listen: false,
                                ).handleBannerTap(
                                  dash.bannerList[dash.selectIndex].appObject,
                                  context,
                                ),
                          );
                        },
                      ),
                      if (dash.bannerList.length > 1) const VSpace(Sizes.s12),
                      if (dash.bannerList.length > 1)
                        DotIndicator(
                          list: dash.bannerList,
                          selectedIndex: dash.selectIndex,
                        ),

                      const VSpace(Sizes.s20),

                      // Coupon Offers Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<DashboardProvider>(
                            builder: (context, sss, child) {
                              return HeadingRowCommon(
                                title: language(
                                  context,
                                  appFonts.popularOffers,
                                ),
                                isTextSize: true,
                                onTap: () {
                                  sss.selectIndex = 2;
                                  sss.notifyListeners();
                                },
                              ).paddingSymmetric(horizontal: Insets.i20);
                            },
                          ),
                          const VSpace(Sizes.s10),
                          Column(
                            children: dash.couponOfferList
                                .asMap()
                                .entries
                                .map(
                                  (e) => CouponLayout(
                                    data: e.value,
                                    addOrRemoveTap: isGuest == true
                                        ? showGuestLoginSheet
                                        : () {
                                            final previousFavourite =
                                                e.value.isFavourite;
                                            e.value.isFavourite =
                                                !previousFavourite;
                                            dash.notifyListeners();

                                            final common =
                                                Provider.of<CommonApiProvider>(
                                                  context,
                                                  listen: false,
                                                );
                                            common.toggleFavAPI(
                                              onSuccess: () {
                                                Provider.of<HomeScreenProvider>(
                                                  context,
                                                  listen: false,
                                                ).homeFeed(context);
                                                Provider.of<OfferProvider>(
                                                  context,
                                                  listen: false,
                                                ).getViewAllOfferAPI();
                                                Provider.of<OfferProvider>(
                                                  context,
                                                  listen: false,
                                                ).offerDetailsAPI(
                                                  context,
                                                  e.value.id,
                                                  isNotRouting: true,
                                                );
                                              },
                                              context,
                                              previousFavourite,
                                              e.value.appObject!.appObjectType,
                                              e.value.appObject!.appObjectId,
                                            );
                                          },
                                    onTap: () => Provider.of<OfferProvider>(
                                      context,
                                      listen: false,
                                    ).offerDetailsAPI(context, e.value.id),
                                  ),
                                )
                                .toList(),
                          ).paddingSymmetric(horizontal: Insets.i20),
                        ],
                      ),

                      const VSpace(Sizes.s20),
                      HomeBody(isGuest: isGuest),
                      const VSpace(Sizes.s33),

                      // Blog Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadingRowCommon(
                            title: language(context, appFonts.latestArticles),
                            isTextSize: true,
                            onTap: () {
                              Provider.of<DashboardProvider>(
                                context,
                                listen: false,
                              ).isInCategoryListing = true;
                              route.pushNamed(
                                context,
                                routeName.latestBlogViewAll,
                              );
                            },
                          ).paddingSymmetric(horizontal: Insets.i20),
                          const VSpace(Sizes.s10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: dash.firstTwoBlogList
                                  .asMap()
                                  .entries
                                  .map(
                                    (e) => LatestBlogLayout(
                                      height: Insets.i160,
                                      onTap: () {
                                        Provider.of<LatestBLogDetailsProvider>(
                                          context,
                                          listen: false,
                                        ).detailsDataAPI(context, e.value.id);
                                      },
                                      data: e.value,
                                      addOrRemoveTap: isGuest == true
                                          ? showGuestLoginSheet
                                          :() {
                                        final previousFavourite =
                                            e.value.isFavourite;
                                        e.value.isFavourite =
                                            !previousFavourite;
                                        dash.notifyListeners();

                                        final common =
                                            Provider.of<CommonApiProvider>(
                                              context,
                                              listen: false,
                                            );
                                        common.toggleFavAPI(
                                          onSuccess: () {
                                            Provider.of<
                                                  LatestBLogDetailsProvider
                                                >(context, listen: false)
                                                .detailsDataAPI(
                                                  context,
                                                  e.value.id,
                                                  isNotRouting: true,
                                                );
                                            Provider.of<
                                                  LatestBLogDetailsProvider
                                                >(context, listen: false)
                                                .getArticlesSearchAPI(context);
                                            Provider.of<HomeScreenProvider>(
                                              context,
                                              listen: false,
                                            ).homeFeed(context);
                                          },
                                          context,
                                          previousFavourite,
                                          e.value.appObject!.appObjectType,
                                          e.value.appObject!.appObjectId,
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                            ).paddingOnly(left: Insets.i20),
                          ),
                        ],
                      ),

                      const VSpace(Sizes.s50),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
