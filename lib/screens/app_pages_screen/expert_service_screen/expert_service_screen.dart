import '../../../config.dart';

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
    return Consumer<ExpertServiceProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
        onInit: () => Future.delayed(DurationClass.ms50)
            .then((_) => value.onReady(context, this)),
        child: Scaffold(
            appBar: AppBarCommon(title: appFonts.expertService,onTap: ()=>value.onBack(dash,context),),
            body: ListView(children: [
              SearchTextFieldCommon(
                  controller: value.txtFeaturedSearch,
                  focusNode: value.searchFocus,
                  onChanged: (v) {
                    if (v.isEmpty) {
                      value.getFeaturedPackage(dash);
                    }
                  },
                  onFieldSubmitted: (v) => value.getFeaturedPackage(dash)),
              const VSpace(Sizes.s20),
              value.txtFeaturedSearch.text.isEmpty
                  ? Column(
                      children: [
                        ...dash.highestRateList.asMap().entries.map((e) =>
                            ExpertServiceLayout(
                                data: e.value,
                                isHome: true,
                                onTap: () => route.pushNamed(
                                    context, routeName.providerDetailsScreen,
                                    arg: e.value.id)))
                      ],
                    )
                  : value.searchList.isNotEmpty
                      ? Column(
                          children: [
                            ...value.searchList.asMap().entries.map((e) =>
                                ExpertServiceLayout(
                                    data: e.value,
                                    isHome: true,
                                    onTap: () => route.pushNamed(context,
                                        routeName.providerDetailsScreen,
                                        arg: e.value.id)))
                          ],
                        )
                      : Column(
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
                                        child: Image.asset(eImageAssets.mGlass,
                                            height: Sizes.s190,
                                            width: Sizes.s178)))
                            ]),
                            const VSpace(Sizes.s25),
                            Text(language(context, appFonts.noMatching!),
                                style: appCss.dmDenseBold18.textColor(
                                    appColor(context).appTheme.darkText)),
                            const VSpace(Sizes.s8),
                            Text(language(context, appFonts.attemptYourSearch),
                                    textAlign: TextAlign.center,
                                    style: appCss.dmDenseRegular14.textColor(
                                        appColor(context).appTheme.lightText))
                                .paddingSymmetric(horizontal: Insets.i10)
                          ],
                        )
            ]).paddingSymmetric(horizontal: Insets.i20)),
      );
    });
  }
}
