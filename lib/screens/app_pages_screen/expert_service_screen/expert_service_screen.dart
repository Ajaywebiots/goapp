import '../../../config.dart';
import '../../../providers/app_pages_provider/expert_service_provider.dart';
import '../../../providers/app_pages_provider/search_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../../bottom_screens/home_screen/layouts/expert_business_layout.dart';

class ExpertServiceScreen extends StatefulWidget {
  const ExpertServiceScreen({super.key});

  @override
  State<ExpertServiceScreen> createState() => _ExpertServiceScreenState();
}

class _ExpertServiceScreenState extends State<ExpertServiceScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context, listen: true);
    final search = Provider.of<SearchProvider>(context, listen: true);
    return Consumer<ExpertServiceProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms50).then((_) {
                search.onAnimate(context, this);
                value.onReady(context, this);
              }),
          child: DirectionalityRtl(
              child: Scaffold(
                  appBar: AppBarCommon(
                      title: appFonts.featuredAttractions,
                      onTap: () => value.onBack(dash, context)),
                  body: ListView(children: [
                    SearchTextFieldCommon(
                        focusNode: value.searchFocus,
                        controller: search.searchCtrl,
                        onChanged: (v) {
                          if (v.isEmpty) {
                            value.searchList = [];
                            value.notifyListeners();
                          }
                        },
                        onFieldSubmitted: (v) => search.searchService(context),
                        suffixIcon: FilterIconCommon(
                            selectedFilter:
                                search.totalCountFilter().toString(),
                            onTap: () => search.onBottomSheet(context))),
                    const VSpace(Sizes.s20),
                    value.txtFeaturedSearch.text.isEmpty
                        ? Column(children: [
                            ...dash.highestRateList.asMap().entries.map((e) =>
                                FeatureAttractionLayout(
                                    data: e.value,
                                    isHome: true,
                                    onTap: () => route.pushNamed(context,
                                        routeName.attractionDetailScreen,
                                        arg: e.value.id)))
                          ])
                        : value.searchList.isNotEmpty
                            ? Column(children: [
                                ...value.searchList.asMap().entries.map((e) =>
                                    FeatureAttractionLayout(
                                        data: e.value,
                                        isHome: true,
                                        onTap: () => route.pushNamed(context,
                                            routeName.attractionDetailScreen,
                                            arg: e.value.id)))
                              ])
                            : Column(children: [
                                Stack(children: [
                                  Image.asset(eImageAssets.noSearch,
                                          height: Sizes.s346)
                                      .paddingOnly(top: Insets.i40),
                                  if (value.animationController != null)
                                    Positioned(
                                        left: 40,
                                        top: 0,
                                        child: RotationTransition(
                                            turns: Tween(begin: 0.01, end: -.01)
                                                .chain(CurveTween(
                                                    curve: Curves.easeIn))
                                                .animate(
                                                    value.animationController!),
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
                              ])
                  ]).paddingSymmetric(horizontal: Insets.i20))));
    });
  }
}
