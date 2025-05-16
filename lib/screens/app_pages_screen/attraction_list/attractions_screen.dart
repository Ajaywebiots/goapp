import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/attractions_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../providers/common_providers/common_api_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../../bottom_screens/home_screen/layouts/expert_business_layout.dart';

///featured attractions
class AttractionScreen extends StatefulWidget {
  final bool isHomeScreen;

  const AttractionScreen({super.key, this.isHomeScreen = false});

  @override
  State<AttractionScreen> createState() => _AttractionScreenState();
}

class _AttractionScreenState extends State<AttractionScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Use Future.microtask to ensure the context is fully built
    Future.microtask(() {
      final attractionProvider =
          Provider.of<AttractionProvider>(context, listen: false);
      attractionProvider.initSearchListener(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context, listen: true);
    // final search = Provider.of<SearchProvider>(context, listen: true);
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: true);
    // final value1 = Provider.of<CategoriesListProvider>(context, listen: true);

    return Consumer<AttractionProvider>(builder: (context1, attraction, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(
              Duration(milliseconds: 150), () => attraction.onReady(context)),
          child: DirectionalityRtl(
              child: Scaffold(
                  appBar: AppBarCommon(
                      title: language(context, appFonts.exploreAttractions),
                      onTap: () {
                        if (widget.isHomeScreen) {
                          final dash = Provider.of<DashboardProvider>(context,
                              listen: false);
                          dash.selectIndex = 0;
                          dash.notifyListeners();
                          homePvr.notifyListeners();
                        } else {
                          attraction.searchCtrl.text = "";
                          attraction.slider = 0.0;
                          attraction.selectedCategory.clear();
                          attraction.selectedRates.clear();
                          attraction.getAttractionSearchAPI(context);
                          route.pop(context);
                          // attraction.onBack(homePvr, context);
                        }
                      }),
                  body: attraction.isLoading
                      ? Container(
                          color: isDark(context)
                              ? Colors.black.withValues(alpha: .3)
                              : appColor(context)
                                  .darkText
                                  .withValues(alpha: 0.2),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                              child: Image.asset(eGifAssets.loader,
                                  height: Sizes.s100)))
                      : SafeArea(
                          child: ListView(children: [
                          SearchTextFieldCommon(
                              hintText: "Search for things to do",
                              focusNode: attraction.searchFocus,
                              controller: attraction.searchCtrl,
                              onChanged: (v) {
                                if (v.isEmpty) {
                                  attraction.searchList = [];
                                  attraction.notifyListeners();
                                }
                              },
                              // onFieldSubmitted: (v) =>
                              //     attraction.searchService(context),
                              suffixIcon: FilterIconCommon(
                                  selectedFilter:
                                      attraction.totalCountFilter().toString(),
                                  onTap: () => attraction.onBottomSheet(
                                      context, attraction))),
                          const VSpace(Sizes.s20),
                          /* */ /* attraction.txtFeaturedSearch.text.isEmpty
                          ? */ /*Column(children: [
                              ...dash.firstTwoBlogList.asMap().entries.map((e) =>
                                  FeatureAttractionLayout(
                                      // data: e.value,
                                      isHome: true,
                                      onTap: () => route.pushNamed(context,
                                          routeName.attractionDetailScreen,
                                          arg: e.value.id)))
                            ])
                          : attraction.searchList.isNotEmpty
                          ?*/
                          if (attraction.attractionsSearchList.isEmpty)
                            EmptyLayout(
                                topHeight:
                                    MediaQuery.of(context).size.height * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                isButtonShow: false,
                                title: language(
                                    context, appFonts.noResultsWereFound),
                                subtitle: language(context, appFonts.sorry),
                                widget: Image.asset(eImageAssets.noNoti,
                                    height: Sizes.s200)),
                          Consumer<AttractionProvider>(
                              builder: (context, value, child) {
                            return Column(children: [
                              ...attraction.attractionsSearchList
                                  .asMap()
                                  .entries
                                  .map((e) => FeatureAttractionLayout(
                                      bColor: appColor(context).borderStroke,
                                      data: e.value,
                                      isHome: true,
                                      addOrRemoveTap: () {
                                        final previousFavourite =
                                            e.value.isFavourite;
                                        e.value.isFavourite =
                                            !previousFavourite;
                                        Provider.of<CommonApiProvider>(context,
                                                listen: false)
                                            .toggleFavAPI(
                                                context,
                                                previousFavourite,
                                                e.value.appObject!
                                                    .appObjectType,
                                                e.value.appObject!.appObjectId,
                                                onSuccess: () {
                                          Provider.of<AttractionProvider>(
                                                  context,
                                                  listen: false)
                                              .getAttractionSearchAPI(context);
                                          Provider.of<HomeScreenProvider>(
                                                  context,
                                                  listen: false)
                                              .homeFeed(context);
                                        });

                                        value.notifyListeners();
                                      },
                                      onTap: () {
                                        attraction.attractionsDetailsAPI(
                                            context, e.value.id);
                                      }))
                            ]);
                          })
                          /* : Column(children: [
                                  Stack(children: [
                                    Image.asset(eImageAssets.noSearch,
                                            height: Sizes.s346)
                                        .paddingOnly(top: Insets.i40),
                                    if (attraction.animationController != null)
                                      Positioned(
                                          left: 40,
                                          top: 0,
                                          child: RotationTransition(
                                              turns: Tween(begin: 0.01, end: -.01)
                                                  .chain(CurveTween(
                                                      curve: Curves.easeIn))
                                                  .animate(attraction
                                                      .animationController!),
                                              child: Image.asset(
                                                  eImageAssets.mGlass,
                                                  height: Sizes.s190,
                                                  width: Sizes.s178)))
                                  ]),
                                  const VSpace(Sizes.s25),
                                  Text(language(context, appFonts.noMatching),
                                      style: appCss.dmDenseBold18
                                          .textColor(appColor(context).darkText)),
                                  const VSpace(Sizes.s8),
                                  Text(
                                          language(context,
                                              appFonts.attemptYourSearch),
                                          textAlign: TextAlign.center,
                                          style: appCss.dmDenseRegular14
                                              .textColor(
                                                  appColor(context).lightText))
                                      .paddingSymmetric(horizontal: Insets.i10)
                                ])*/
                        ]).paddingSymmetric(horizontal: Insets.i20)))));
    });
  }
}
