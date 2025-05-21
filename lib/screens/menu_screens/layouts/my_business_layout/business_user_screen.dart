import '../../../../config.dart';

class BusinessUserScreen extends StatelessWidget {
  const BusinessUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context, languages, child) {
      return Scaffold(
          appBar: AppBar(
              leadingWidth: 60,
              title: Text(language(context, "Business Users"),
                  style: appCss.dmDenseMedium18
                      .textColor(appColor(context).darkText)),
              centerTitle: true,
              actions: [
                SizedBox(
                        height: Sizes.s40,
                        width: Sizes.s40,
                        child: SvgPicture.asset(eSvgAssets.add)
                            .marginAll(Insets.i8)
                            .decorated(
                                shape: BoxShape.circle,
                                color: appColor(context).fieldCardBg))
                    .inkWell(
                        onTap: () => route.pushNamed(
                            context, routeName.addBusinessUserScreen))
                    .paddingOnly(right: Insets.i20)
              ],
              leading: CommonArrow(
                      arrow: languages.isUserRTl
                          ? eSvgAssets.arrowRight
                          : eSvgAssets.arrowLeft,
                      onTap: () => route.pop(context))
                  .padding(vertical: Insets.i8, left: Insets.i20)),
          body: Column(children: [
            ListView.builder(
                itemCount: staffList().length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final staff = staffList()[index];
                  return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Row(children: [
                          CircleAvatar(
                              backgroundImage: AssetImage(staff['image'])),
                          HSpace(Insets.i10),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(staff['name'],
                                    style: appCss.dmDenseMedium13
                                        .textColor(appColor(context).darkText)),
                                VSpace(Insets.i2),
                                Text(staff['contact'],
                                    style: appCss.dmDenseRegular12
                                        .textColor(appColor(context).lightText))
                              ])
                        ]),
                        CommonArrow(isThirteen: true, arrow: eSvgAssets.edit)
                      ])
                      .paddingSymmetric(horizontal: 12, vertical: 12)
                      .boxShapeExtension(
                          color: appColor(context).whiteBg,
                          radius: AppRadius.r12)
                      .decorated(boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: Offset(1, 2),
                        color: appColor(context).darkText.withOpacity(0.05))
                  ]).marginOnly(bottom: 10);
                })
          ]).marginOnly(top: 20, right: 20, left: 20));
    });
  }

  List<Map<String, dynamic>> staffList() => [
        {
          "name": "Dori Doreau",
          "contact": "Manager",
          "image": eImageAssets.img3,
        },
        {
          "name": "Angela Bower",
          "contact": "Waiter",
          "image": eImageAssets.img4,
        },
        {
          "name": "Dori Doreau",
          "contact": "Manager",
          "image": eImageAssets.img3,
        },
        {
          "name": "Angela Bower",
          "contact": "Waiter",
          "image": eImageAssets.img4,
        }
      ];
}
