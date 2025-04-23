import 'dart:developer';

import '../../../config.dart';
import '../../../providers/app_pages_provider/favourite_list_provider.dart';
import '../../../providers/app_pages_provider/latest_blog_details_provider.dart';
import '../../../providers/app_pages_provider/search_provider.dart';
import '../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../providers/bottom_providers/offer_provider.dart';
import '../../../providers/common_providers/common_api_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../bottom_screens/home_screen/layouts/expert_business_layout.dart';
import '../../bottom_screens/home_screen/layouts/featured_business_layout.dart';
import '../../bottom_screens/home_screen/layouts/latest_blog_layout.dart';
import '../coupon_list_screen/layouts/coupon_layout.dart';

class FavScreenList extends StatefulWidget {
  const FavScreenList({super.key});

  @override
  State<FavScreenList> createState() => _FavScreenListState();
}

class _FavScreenListState extends State<FavScreenList> {
  bool isExpanded = false;

  // String selectedOption = "Offer List";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final favPvr = Provider.of<FavouriteListProvider>(context, listen: false);
      favPvr.favOfferListDataAPI(context);
      favPvr.favBusinessListDataAPI(context);
      favPvr.favAttractionsListDataAPI(context);
      favPvr.favBlogListDataAPI(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteListProvider>(builder: (context, favPvr, child) {
      return DirectionalityRtl(
          child: Scaffold(
              appBar: AppBarCommon(title: "Favourite list"),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                    GestureDetector(
                        onTap: toggleDropdown,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius:
                                    BorderRadius.circular(Insets.i12)),
                            child: Row(children: [
                              Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.favorite,
                                      color: Colors.white, size: 18)),
                              SizedBox(width: 12),
                              Expanded(
                                  child: Text(favPvr.selectedOption,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500))),
                              Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Colors.black87,
                                  size: 20)
                            ]))).paddingSymmetric(horizontal: Insets.i20),
                    if (isExpanded)
                      Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                  children: favPvr.options.map((option) {
                                return ListTile(
                                    title: Text(option,
                                        style: appCss.dmDenseRegular14
                                            .textColor(
                                                appColor(context).darkText)),
                                    onTap: () {
                                      setState(() {
                                        favPvr.selectedOption = option;
                                      });
                                      toggleDropdown();
                                    });
                              }).toList()))
                          .paddingSymmetric(
                              horizontal: Insets.i20, vertical: Insets.i10),
                    VSpace(Insets.i20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              favPvr.selectedOption == "Offer List"
                                  ? "Offer list"
                                  : favPvr.selectedOption == "Business List"
                                      ? "Business list"
                                      : favPvr.selectedOption ==
                                              "Points of Interest List"
                                          ? "Attraction list"
                                          : "Blog list",
                              style: appCss.dmDenseRegular14
                                  .textColor(appColor(context).lightText)),
                          VSpace(Insets.i22),
                          // Offer List
                          if (favPvr.selectedOption == "Offer List")
                            ListView.builder(
                                itemCount: favPvr.offerList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final e = favPvr.offerList[index];
                                  return CouponLayout(
                                      data: e,
                                      onTap: () {
                                        Provider.of<OfferProvider>(context,
                                                listen: false)
                                            .offerDetailsAPI(context, e.id);
                                      },
                                      addOrRemoveTap: () {
                                        final common =
                                            Provider.of<CommonApiProvider>(
                                                context,
                                                listen: false);
                                        final home =
                                            Provider.of<HomeScreenProvider>(
                                                context,
                                                listen: false);
                                        final search =
                                            Provider.of<SearchProvider>(context,
                                                listen: false);

                                        common.toggleFavAPI(
                                            context,
                                            e.isFavourite,
                                            e.appObject!.appObjectType,
                                            e.appObject!.appObjectId,
                                            onSuccess: () {
                                          search.businessDetailsAPI(
                                              context, e.id,
                                              isNotRouting: true);
                                          search.getBusinessSearchAPI(context,
                                              id: e.id, isFilter: false);
                                          home.homeFeed(context);
                                          favPvr.favOfferListDataAPI(context);
                                        });
                                      });
                                })
                          else if (favPvr.selectedOption == "Business List")
                            Selector<FavouriteListProvider, List<dynamic>>(
                                builder: (BuildContext context,
                                    List<dynamic> value, Widget? child) {
                                  return ListView.builder(
                                    itemCount: favPvr.businessList.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      log("favPvr.businessList.length::${favPvr.businessList.length}");
                                      final e = favPvr.businessList[index];
                                      return FeaturedBusinessLayout(
                                        data: e,
                                        onTap: () {},
                                        addOrRemoveTap: () {
                                          final common =
                                              Provider.of<CommonApiProvider>(
                                                  context,
                                                  listen: false);
                                          final home =
                                              Provider.of<HomeScreenProvider>(
                                                  context,
                                                  listen: false);
                                          final search =
                                              Provider.of<SearchProvider>(
                                                  context,
                                                  listen: false);

                                          log("Toggling favorite for business ID: ${e.id}, isFavourite: ${e.isFavourite}");

                                          common.toggleFavAPI(
                                            context,
                                            e.isFavourite,
                                            e.appObject!.appObjectType,
                                            e.appObject!.appObjectId,
                                            onSuccess: () {
                                              log("toggleFavAPI success for business ID: ${e.id}");
                                              // Refresh data
                                              search.businessDetailsAPI(
                                                  context, e.id,
                                                  isNotRouting: true);
                                              search.getBusinessSearchAPI(
                                                  context,
                                                  id: e.id,
                                                  isFilter: false);
                                              home.homeFeed(context);
                                              favPvr.favBusinessListDataAPI(
                                                  context);
                                            },
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                selector: (context, favPvr) =>
                                    favPvr.selectedOption == "Offer List"
                                        ? favPvr.offerList
                                        : favPvr.selectedOption ==
                                                "Business List"
                                            ? favPvr.businessList
                                            : favPvr.selectedOption ==
                                                    "Points of Interest List"
                                                ? favPvr.attractionList
                                                : favPvr.blogList)
                          else if (favPvr.selectedOption ==
                              "Points of Interest List")
                            ListView.builder(
                                itemCount: favPvr.attractionList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final e = favPvr.attractionList[index];
                                  return FeatureAttractionLayout(
                                      bColor: appColor(context).borderStroke,
                                      isHome: true,
                                      data: e,
                                      onTap: () => route.pushNamed(context,
                                          routeName.attractionDetailScreen));
                                })
                          else
                            ListView.builder(
                                itemCount: favPvr.blogList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final e = favPvr.blogList[index];
                                  return LatestBlogLayout(
                                      onTap: () {},
                                      data: e,
                                      rPadding: 0,
                                      addOrRemoveTap: () {
                                        final common =
                                            Provider.of<CommonApiProvider>(
                                                context,
                                                listen: false);
                                        common.toggleFavAPI(onSuccess: () {
                                          Provider.of<LatestBLogDetailsProvider>(
                                                  context,
                                                  listen: false)
                                              .getArticlesSearchAPI(context);
                                        },
                                            context,
                                            e.isFavourite,
                                            e.appObject!.appObjectType,
                                            e.appObject!.appObjectId);
                                      },
                                      isView: true);
                                })
                        ]).marginSymmetric(horizontal: Insets.i20)
                  ])))));
    });
  }

  // Method to toggle the dropdown state
  void toggleDropdown() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
