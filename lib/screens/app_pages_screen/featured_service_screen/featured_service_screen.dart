import 'dart:developer';

import '../../../config.dart';

class FeaturedServiceScreen extends StatefulWidget {
  const FeaturedServiceScreen({super.key});

  @override
  State<FeaturedServiceScreen> createState() => _FeaturedServiceScreenState();
}

class _FeaturedServiceScreenState extends State<FeaturedServiceScreen>  with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context, listen: true);
    return Consumer<FeaturedServiceProvider>(builder: (context1, value, child) {
      log("value.searchList::${value.searchList.length}");
      return PopScope(
        canPop: true,
        onPopInvoked: (pop) {
          if (pop) {
            return;
          }
          value.txtFeaturedSearch.text = "";
          value.notifyListeners();
        },
        child: StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms50)
              .then((_) => value.onReady(context, this)),
          child: Scaffold(
              appBar: AppBarCommon(
                title: appFonts.featuredService,
                onTap: ()=> value.onBack(dash,context),
              ),
              body: Consumer<CartProvider>(builder: (context2, cart, child) {
                return RefreshIndicator(
                  onRefresh: () async {
                    dash.getFeaturedPackage(1);
                  },
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SearchTextFieldCommon(
                          focusNode: value.searchFocus,
                          controller: value.txtFeaturedSearch,
                          onChanged: (v) {
                            if (v.isEmpty) {
                              value.getFeaturedPackage(dash,context);
                            }
                          },
                          onFieldSubmitted: (v) => value.getFeaturedPackage(dash,context)),
                      const VSpace(Sizes.s20),
                      value.txtFeaturedSearch.text.isEmpty
                          ? Column(
                              children: [
                                ...dash.featuredServiceList.asMap().entries.map(
                                    (e) => FeaturedServicesLayout(
                                        data: e.value,
                                        addTap: () => value.onFeatured(
                                            context, e.value, e.key,
                                            inCart:
                                                isInCart(context, e.value.id)),
                                        inCart: isInCart(context, e.value.id),
                                        onTap: () => route.pushNamed(context,
                                            routeName.servicesDetailsScreen,
                                            arg: e.value.id)))
                              ],
                            )
                          : value.searchList.isNotEmpty ?  Column(
                              children: [
                                ...value.searchList.asMap().entries.map((e) =>
                                    FeaturedServicesLayout(
                                        data: e.value,
                                        addTap: () => value.onFeatured(
                                            context, e.value, e.key,
                                            inCart: isInCart(context, e.value.id),
                                            isSearch: true),
                                        inCart: isInCart(context, e.value.id),
                                        onTap: () => route.pushNamed(context,
                                            routeName.servicesDetailsScreen,
                                            arg: e.value.id)))
                              ],
                            ) :Column(
                        children: [
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
                          Text(language(context, appFonts.noMatching!),
                              style: appCss.dmDenseBold18
                                  .textColor(appColor(context).appTheme.darkText)),
                          const VSpace(Sizes.s8),
                          Text(language(context, appFonts.attemptYourSearch),
                              textAlign: TextAlign.center,
                              style: appCss.dmDenseRegular14
                                  .textColor(appColor(context).appTheme.lightText)).paddingSymmetric(horizontal: Insets.i10)
                        ],
                      )
                    ]).paddingSymmetric(horizontal: Insets.i20),
                  ),
                );
              })),
        ),
      );
    });
  }
}
