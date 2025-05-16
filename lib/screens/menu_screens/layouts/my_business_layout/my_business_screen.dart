import '../../../../config.dart';

class MyBusinessScreen extends StatelessWidget {
  const MyBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context, languages, child) {
      return Scaffold(
          appBar: AppBar(
              leadingWidth: 60,
              title: Text(language(context, "My Business"),
                  style: appCss.dmDenseMedium18
                      .textColor(appColor(context).darkText)),
              centerTitle: true,
              actions: [
                SizedBox(
                        height: Sizes.s40,
                        width: Sizes.s40,
                        child: SvgPicture.asset(eSvgAssets.add)
                            .marginAll(8)
                            .decorated(
                                shape: BoxShape.circle,
                                color: appColor(context).fieldCardBg)
                            .inkWell(onTap: () {}))
                    .paddingOnly(right: 20)
              ],
              leading: CommonArrow(
                      arrow: languages.isUserRTl
                          ? eSvgAssets.arrowRight
                          : eSvgAssets.arrowLeft,
                      onTap: () => route.pop(context))
                  .padding(vertical: Insets.i8, left: 20)),
          body: Column(children: [
            // VSpace(Insets.i40),
            /* EmptyLayout(
                topHeight: Insets.i40,
                isButtonShow: false,
                isInk: false,
                horizon: Insets.i20,
                title: language(context, "No businesses were found"),
                subtitle: language(context,
                    "Sorry, we could not find any results. Please add a business to start."),
                widget: Image.asset(eImageAssets.noNoti, height: Sizes.s200))*/
            ListView.builder(
                shrinkWrap: true,
                itemCount: appArray.restaurants().length,
                itemBuilder: (context, index) {
                  final restaurant = appArray.restaurants()[index];
                  return SizedBox(
                          child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(
                                height: Sizes.s30,
                                width: Sizes.s30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(restaurant.logo)))),
                            const HSpace(Sizes.s10),
                            Text(language(context, restaurant.name),
                                style: appCss.dmDenseMedium15
                                    .textColor(appColor(context).darkText))
                          ])
                        ]).paddingAll(Insets.i15),
                    Stack(alignment: Alignment.topRight, children: [
                      Container(
                          height: Sizes.s150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(restaurant.imageUrl),
                                  fit: BoxFit.fitHeight)))
                    ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Last Update: ${restaurant.lastUpdate}",
                                    style: appCss.dmDenseRegular12
                                        .textColor(appColor(context).darkText)),
                                SvgPicture.asset(eSvgAssets.edit,
                                    height: Insets.i24, width: Insets.i24)
                              ])
                        ]).paddingSymmetric(vertical: 20, horizontal: 15)
                  ]))
                      .decorated(
                          color: appColor(context).whiteBg,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 2,
                                blurStyle: BlurStyle.outer,
                                color: appColor(context)
                                    .darkText
                                    .withValues(alpha: 0.06))
                          ],
                          borderRadius: BorderRadius.circular(AppRadius.r8),
                          border: Border.all(color: appColor(context).stroke))
                      .paddingOnly(bottom: Insets.i15);
                }).paddingSymmetric(horizontal: Insets.i20)
          ]).marginOnly(top: Insets.i20));
    });
  }
}
