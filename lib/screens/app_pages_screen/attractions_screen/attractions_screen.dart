import 'dart:developer';

import '../../../config.dart';
import '../../../providers/app_pages_provider/attractions_provider.dart';
import '../../../providers/app_pages_provider/search_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../../bottom_screens/home_screen/layouts/expert_business_layout.dart';

///featured attractions
class AttractionScreen extends StatefulWidget {
  const AttractionScreen({super.key});

  @override
  State<AttractionScreen> createState() => _AttractionScreenState();
}

class _AttractionScreenState extends State<AttractionScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context, listen: true);
    final search = Provider.of<SearchProvider>(context, listen: true);
    // final value1 = Provider.of<CategoriesListProvider>(context, listen: true);

    return Consumer<AttractionProvider>(builder: (context1, attraction, child) {
      log("ajay haaaa ${attraction.attractionsSearchList}");
      return StatefulWrapper(
          onInit: () => Future.delayed(
                Duration(milliseconds: 150),
                () => attraction.onReady(context),
              ),
          child: DirectionalityRtl(
              child: Scaffold(
                  appBar: AppBarCommon(
                      title: appFonts.featuredAttractions,
                      onTap: () => attraction.onBack(dash, context)),
                  body: ListView(children: [
                    SearchTextFieldCommon(
                        focusNode: attraction.searchFocus,
                        controller: search.searchCtrl,
                        onChanged: (v) {
                          if (v.isEmpty) {
                            attraction.searchList = [];
                            attraction.notifyListeners();
                          }
                        },
                        onFieldSubmitted: (v) => search.searchService(context),
                        suffixIcon: FilterIconCommon(
                            selectedFilter:
                                search.totalCountFilter().toString(),
                            onTap: () =>
                                attraction.onBottomSheet(context, attraction))),
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
                    Column(children: [
                      ...attraction.attractionsSearchList.asMap().entries.map(
                          (e) => FeatureAttractionLayout(
                              data: e.value,
                              isHome: true,
                              onTap: () => route.pushNamed(
                                  context, routeName.attractionDetailScreen,
                                  arg: e.value.id)))
                    ])
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
                  ]).paddingSymmetric(horizontal: Insets.i20))));
    });
  }
}
