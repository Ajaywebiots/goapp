import 'package:goapp/screens/app_pages_screen/business_offer_screen/layout/business_offer_layout.dart';

import '../../../config.dart';
import '../../../providers/bottom_providers/offer_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../coupon_list_screen/layouts/coupon_layout.dart';

class BusinessOfferScreen extends StatelessWidget {
  const BusinessOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DirectionalityRtl(
        child: Consumer<LanguageProvider>(
          builder: (context, languages, child)  {
            return Scaffold(
                appBar:AppBar(
                  actions: [CommonArrow(
                      arrow: eSvgAssets.add,
                      onTap: () =>route.pushNamed(context, routeName.businessOfferDetails)).paddingDirectional(horizontal: Sizes.s20)],
                    leadingWidth: 60,
                    title: Text(language(context, "Business Offers"),
                        style:
                        appCss.dmDenseMedium18.textColor(appColor(context).darkText)),
                    centerTitle: true,
                    leading: CommonArrow(
                        arrow: languages.isUserRTl
                            ? eSvgAssets.arrowRight
                            : eSvgAssets.arrowLeft,
                        onTap: () => route.pop(context))
                        .padding(vertical: Insets.i8, left: 20)),
                body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                        VSpace(Sizes.s20),
                    if (appArray.businessOfferList.isEmpty)
                      EmptyLayout(
                          topHeight: MediaQuery.of(context).size.height * 0.08,
                          height: MediaQuery.of(context).size.height * 0.09,
                          isButtonShow: false,
                          title: language(context, appFonts.noResultsWereFound),
                          subtitle: language(context, appFonts.sorry),
                          widget:
                              Image.asset(eImageAssets.noNoti, height: Sizes.s200)),
                    ...appArray.businessOfferList.asMap().entries.map((e) =>
                        BusinessOfferLayout(
                            addOrRemoveTap: () {}, data: e.value, onTap: () {}))
                  ]).paddingSymmetric(horizontal: Insets.i20)),
                ));
          }
        ));
  }
}
