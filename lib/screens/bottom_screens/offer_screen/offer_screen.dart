import '../../../config.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context3, dash, child) {
      return Scaffold(
          appBar: AppBar(
              title: Text(language(context, appFonts.dealsZone),
                  style: appCss.dmDenseBold18
                      .textColor(appColor(context).darkText))),
          body: RefreshIndicator(
              onRefresh: () async {
                dash.getOffer();
              },
              child: ListView(children: [
                const VSpace(Sizes.s20),
                ...dash.offerList.asMap().entries.map((e) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.value.title!,
                            style: appCss.dmDenseBold16
                                .textColor(appColor(context).darkText)),
                        const VSpace(Sizes.s15),
                        ...e.value.media!.reversed.toList().asMap().entries.map(
                            (m) => Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: Sizes.s137,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppRadius.r12),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    m.value.originalUrl!))))
                                    .inkWell(onTap: () {
                                  if (e.value.type == "service") {
                                    // route.pushNamed(
                                    //     context, routeName.businessDetailsScreen,
                                    //     arg: e.value.relatedId);
                                  } else if (e.value.type == "category") {
                                    dash.onBannerTap(
                                        context, e.value.relatedId);
                                  } else {
                                    // route.pushNamed(
                                    //     context, routeName.providerDetailsScreen,
                                    //     arg: e.value.relatedId);
                                  }
                                }).marginOnly(
                                        bottom:
                                            m.key != e.value.media!.length - 1
                                                ? Insets.i15
                                                : Insets.i30))
                      ]);
                }),
                const VSpace(Sizes.s50)
              ]).paddingOnly(right: Insets.i20, left: Insets.i20)));
    });
  }
}
