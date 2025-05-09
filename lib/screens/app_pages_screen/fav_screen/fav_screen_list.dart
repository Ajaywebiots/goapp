import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/attractions_provider.dart';
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
                    DropdownButtonFormField2<String>(
                            isExpanded: true,
                            value: favPvr.selectedOption,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  favPvr.selectedOption = newValue;
                                });
                              }
                            },
                            decoration: InputDecoration(
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 8.0),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide:
                                        BorderSide(color: Color(0xffB9B9B9))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide:
                                        BorderSide(color: Color(0xffB9B9B9))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: Color(0xffB9B9B9)))),
                            iconStyleData: IconStyleData(
                                icon: SvgPicture.asset(eSvgAssets.arrowDown,
                                    height: Insets.i18,
                                    colorFilter: ColorFilter.mode(
                                        appColor(context).darkText,
                                        BlendMode.srcIn))),
                            selectedItemBuilder: (BuildContext context) {
                              return favPvr.options.map<Widget>((option) {
                                return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              shape: BoxShape.circle),
                                          child: Icon(Icons.favorite,
                                              color: Colors.white,
                                              size: Insets.i12)),
                                      SizedBox(width: 10),
                                      Text(option,
                                          style: appCss.dmDenseRegular14
                                              .textColor(
                                                  appColor(context).darkText))
                                    ]);
                              }).toList();
                            },
                            dropdownStyleData:
                                DropdownStyleData(padding: EdgeInsets.zero),
                            items: favPvr.options
                                .map<DropdownMenuItem<String>>((option) {
                              return DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(option,
                                      style: appCss.dmDenseRegular14.textColor(
                                          appColor(context).darkText)));
                            }).toList())
                        .marginSymmetric(horizontal: Insets.i20),
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
                            favPvr.offerList.isEmpty
                                ? EmptyLayout(
                                    isButtonShow: false,
                                    title: language(
                                        context, appFonts.noResultsWereFound),
                                    subtitle: language(context, appFonts.sorry),
                                    widget: Image.asset(eImageAssets.noNoti,
                                        height: Sizes.s200))
                                : ListView.builder(
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
                                            final previousFavourite =
                                                e.isFavourite;

                                            e.isFavourite = !previousFavourite;

                                            if (!e.isFavourite) {
                                              favPvr.offerList.removeAt(index);
                                            }

                                            favPvr.notifyListeners();
                                            setState(() {
                                              final common = Provider.of<
                                                      CommonApiProvider>(
                                                  context,
                                                  listen: false);
                                              final home = Provider.of<
                                                      HomeScreenProvider>(
                                                  context,
                                                  listen: false);
                                              final search =
                                                  Provider.of<SearchProvider>(
                                                      context,
                                                      listen: false);

                                              common.toggleFavAPI(
                                                  context,
                                                  previousFavourite,
                                                  e.appObject!.appObjectType,
                                                  e.appObject!.appObjectId,
                                                  onSuccess: () {
                                                search.businessDetailsAPI(
                                                    context, e.id,
                                                    isNotRouting: true);
                                                search.getBusinessSearchAPI(
                                                    context,
                                                    id: e.id,
                                                    isFilter: false);
                                                home.homeFeed(context);
                                                favPvr.favOfferListDataAPI(
                                                    context);
                                              });
                                            });
                                          });
                                    })
                          else if (favPvr.selectedOption == "Business List")
                            favPvr.businessList.isEmpty
                                ? EmptyLayout(
                                    isButtonShow: false,
                                    title: language(
                                        context, appFonts.noResultsWereFound),
                                    subtitle: language(context, appFonts.sorry),
                                    widget: Image.asset(eImageAssets.noNoti,
                                        height: Sizes.s200))
                                : Selector<FavouriteListProvider,
                                        List<dynamic>>(
                                    builder: (BuildContext context,
                                        List<dynamic> value, Widget? child) {
                                      return ListView.builder(
                                          itemCount: favPvr.businessList.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            log("favPvr.businessList.length::${favPvr.businessList.length}");
                                            final e =
                                                favPvr.businessList[index];
                                            return FeaturedBusinessLayout(
                                                data: e,
                                                onTap: () {
                                                  final searchPvr = Provider.of<
                                                          SearchProvider>(
                                                      context,
                                                      listen: false);
                                                  searchPvr.notifyListeners();
                                                  searchPvr.businessDetailsAPI(
                                                      context, e.id);
                                                },
                                                addOrRemoveTap: () {
                                                  final previousFavourite =
                                                      e.isFavourite;

                                                  e.isFavourite =
                                                      !previousFavourite;

                                                  if (!e.isFavourite) {
                                                    favPvr.businessList
                                                        .removeAt(index);
                                                  }

                                                  favPvr.notifyListeners();
                                                  final common = Provider.of<
                                                          CommonApiProvider>(
                                                      context,
                                                      listen: false);
                                                  final home = Provider.of<
                                                          HomeScreenProvider>(
                                                      context,
                                                      listen: false);
                                                  final search = Provider.of<
                                                          SearchProvider>(
                                                      context,
                                                      listen: false);

                                                  log("Toggling favorite for business ID: ${e.id}, isFavourite: ${e.isFavourite}");

                                                  common.toggleFavAPI(
                                                      context,
                                                      previousFavourite,
                                                      e.appObject!
                                                          .appObjectType,
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
                                                    favPvr
                                                        .favBusinessListDataAPI(
                                                            context);
                                                  });
                                                });
                                          });
                                    },
                                    selector: (context, favPvr) => favPvr
                                                .selectedOption ==
                                            "Offer List"
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
                            favPvr.attractionList.isEmpty
                                ? EmptyLayout(
                                    isButtonShow: false,
                                    title: language(
                                        context, appFonts.noResultsWereFound),
                                    subtitle: language(context, appFonts.sorry),
                                    widget: Image.asset(eImageAssets.noNoti,
                                        height: Sizes.s200))
                                : Selector<FavouriteListProvider,
                                    List<dynamic>>(selector: (context, favPvr) {
                                    switch (favPvr.selectedOption) {
                                      case "Offer List":
                                        return favPvr.offerList;
                                      case "Business List":
                                        return favPvr.businessList;
                                      case "Points of Interest List":
                                        return favPvr.attractionList;
                                      default:
                                        return favPvr.blogList;
                                    }
                                  }, builder: (BuildContext context,
                                    List<dynamic> selectedList, Widget? child) {
                                    return ListView.builder(
                                        itemCount: selectedList.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          final e = selectedList[index];

                                          return FeatureAttractionLayout(
                                              bColor: appColor(context)
                                                  .borderStroke,
                                              isHome: true,
                                              data: e,
                                              onTap: () {
                                                Provider.of<AttractionProvider>(
                                                        context,
                                                        listen: false)
                                                    .attractionsDetailsAPI(
                                                        context, e.id);
                                              },
                                              addOrRemoveTap: () {
                                                final previousFavourite =
                                                    e.isFavourite;

                                                e.isFavourite =
                                                    !previousFavourite;

                                                if (!e.isFavourite) {
                                                  selectedList.removeAt(index);
                                                }

                                                favPvr.notifyListeners();
                                                setState(() {
                                                  favPvr
                                                      .favAttractionsListDataAPI(
                                                          context);
                                                  Provider.of<CommonApiProvider>(
                                                          context,
                                                          listen: false)
                                                      .toggleFavAPI(
                                                          context,
                                                          previousFavourite,
                                                          e.appObject!
                                                              .appObjectType,
                                                          e.appObject!
                                                              .appObjectId,
                                                          onSuccess: () {
                                                    Provider.of<AttractionProvider>(
                                                            context,
                                                            listen: false)
                                                        .getAttractionSearchAPI(
                                                            context);
                                                    Provider.of<HomeScreenProvider>(
                                                            context,
                                                            listen: false)
                                                        .homeFeed(context);
                                                  });
                                                });
                                              });
                                        });
                                  })
                          else
                            favPvr.blogList.isEmpty
                                ? EmptyLayout(
                                    isButtonShow: false,
                                    title: language(
                                        context, appFonts.noResultsWereFound),
                                    subtitle: language(context, appFonts.sorry),
                                    widget: Image.asset(eImageAssets.noNoti,
                                        height: Sizes.s200))
                                : Selector<FavouriteListProvider,
                                        List<dynamic>>(
                                    selector: (context, favPvr) =>
                                        favPvr.blogList,
                                    builder: (context, blogList, _) {
                                      return ListView.builder(
                                          itemCount: blogList.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            final e = blogList[index];

                                            return LatestBlogLayout(
                                                rPadding: 0,
                                                onTap: () {
                                                  final blogProvider = Provider
                                                      .of<LatestBLogDetailsProvider>(
                                                          context,
                                                          listen: false);
                                                  blogProvider.detailsDataAPI(
                                                      context, e.id);
                                                },
                                                data: e,
                                                addOrRemoveTap: () {
                                                  final previousFavourite =
                                                      e.isFavourite;

                                                  e.isFavourite =
                                                      !previousFavourite;

                                                  if (!e.isFavourite) {
                                                    blogList.removeAt(index);
                                                  }

                                                  favPvr.notifyListeners();
                                                  final common = Provider.of<
                                                          CommonApiProvider>(
                                                      context,
                                                      listen: false);
                                                  final blogDetails = Provider
                                                      .of<LatestBLogDetailsProvider>(
                                                          context,
                                                          listen: false);
                                                  final home = Provider.of<
                                                          HomeScreenProvider>(
                                                      context,
                                                      listen: false);

                                                  common.toggleFavAPI(
                                                    onSuccess: () {
                                                      blogDetails
                                                          .detailsDataAPI(
                                                              context, e.id,
                                                              isNotRouting:
                                                                  true);
                                                      blogDetails
                                                          .getArticlesSearchAPI(
                                                              context);
                                                      home.homeFeed(context);

                                                      // Refresh the blog list
                                                      Provider.of<FavouriteListProvider>(
                                                              context,
                                                              listen: false)
                                                          .favBlogListDataAPI(
                                                              context);
                                                    },
                                                    context,
                                                    previousFavourite,
                                                    e.appObject!.appObjectType,
                                                    e.appObject!.appObjectId,
                                                  );
                                                },
                                                isView: true);
                                          });
                                    })
                        ]).marginSymmetric(horizontal: Insets.i20)
                  ])))));
    });
  }
}
