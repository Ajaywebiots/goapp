import 'dart:developer';

import '../../../common_tap.dart';
import '../../../config.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context1, value, child) {
      return Consumer<DashboardProvider>(builder: (context3, dash, child) {
        return StatefulWrapper(
            onInit: () => Future.delayed(const Duration(milliseconds: 100),
                () => value.onAnimate(context, this)),
            child: PopScope(
              canPop: true,
              onPopInvoked: (didPop) => value.onBack(),
              child: Scaffold(
                  appBar: AppBarCommon(
                    title: appFonts.search,
                    onTap: () {
                      value.onBack();
                      route.pop(context);
                    },
                  ),
                  body: value.isSearch == true
                      ? SingleChildScrollView(
                          child: EmptyLayout(
                              title: appFonts.noMatching,
                              subtitle: appFonts.attemptYourSearch,
                              buttonText: appFonts.searchAgain,
                              bTap: () => value.searchClear(),
                              widget: Stack(children: [
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
                              ])),
                        )
                      : SingleChildScrollView(
                          child: Consumer<CartProvider>(
                              builder: (context2, cart, child) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SearchTextFieldCommon(
                                      focusNode: value.searchFocus,
                                      controller: value.searchCtrl,
                                      onChanged: (v) {
                                        if(v.isEmpty){
                                          value.searchList = [];
                                          value.notifyListeners();
                                        }
                                      },
                                      onFieldSubmitted: (v) =>
                                          value.searchService(context),
                                      suffixIcon: FilterIconCommon(
                                          selectedFilter: value
                                              .totalCountFilter()
                                              .toString(),
                                          onTap: () =>
                                              value.onBottomSheet(context))),
                                  const VSpace(Sizes.s25),
                                  Text(language(context, appFonts.recentSearch),
                                      style: appCss.dmDenseMedium14.textColor(
                                          appColor(context)
                                              .appTheme
                                              .lightText)),
                                  const VSpace(Sizes.s15),
                                  value.searchList.isNotEmpty ?
                                  Column(
                                      children: value.searchList
                                          .asMap()
                                          .entries
                                          .map((e) => FeaturedServicesLayout(
                                              data: e.value,
                                              inCart:isInCart(context, e.value.id),
                                              onTap: () => value.onTapFeatures(
                                                  context, e.value, e.key),
                                              addTap: () => value.onFeatured(
                                                  context, e.value, e.key,inCart: isInCart(context, e.value.id))))
                                          .toList()) :  Column(
                                      children: value.recentSearchList
                                          .asMap()
                                          .entries
                                          .map((e) => FeaturedServicesLayout(
                                          data: e.value,
                                          inCart: isInCart(context, e.value.id),
                                          onTap: () => value.onTapFeatures(
                                              context, e.value, e.key),
                                          addTap: () => value.onFeatured(
                                              context, e.value, e.key,inCart: isInCart(context, e.value.id))))
                                          .toList())
                                ]).paddingSymmetric(horizontal: Insets.i20);
                          }),
                        )),
            ));
      });
    });
  }
}
