import '../../../../config.dart';
import '../../../../widgets/dotted_line.dart';
import '../../../../widgets/flutter_switch_common.dart';

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
        body: Column(
          children: [
            GridView.builder(
                itemCount: staffList().length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.72),
                itemBuilder: (context, index) {
                  final staff = staffList()[index];
                  return Column(mainAxisSize: MainAxisSize.min, children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(staff['image'],
                            height: 56, width: 56, fit: BoxFit.cover)),
                    VSpace(Insets.i10),
                    Text(staff['name'],
                        style: appCss.dmDenseMedium13
                            .textColor(appColor(context).darkText)),
                    Text(staff['role'],
                        style: appCss.dmDenseRegular12
                            .textColor(appColor(context).lightText)),
                    const DottedLines().paddingSymmetric(vertical: Insets.i12),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Active status",
                              style: appCss.dmDenseRegular13
                                  .textColor(appColor(context).darkText)),
                          FlutterSwitchCommon(
                              value: staff["isActive"], onToggle: (value) {})
                        ]),
                    VSpace(Insets.i15),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xFFEDEEF0),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(eSvgAssets.calling,
                                  color: appColor(context).lightText),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 26),
                                  height: 18,
                                  width: 1,
                                  color: appColor(context).stroke),
                              SvgPicture.asset(eSvgAssets.mail)
                            ]))
                  ])
                      .paddingSymmetric(horizontal: 12, vertical: 12)
                      .boxShapeExtension(
                          color: appColor(context).whiteBg,
                          radius: AppRadius.r12)
                      .decorated(boxShadow: [
                    BoxShadow(
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(1, 2),
                        color: appColor(context).darkText.withOpacity(0.05))
                  ]);
                }),
          ],
        ).marginOnly(top: 20, right: 20, left: 20),
      );
    });
  }

  List<Map<String, dynamic>> staffList() => [
        {
          "name": "Dori Doreau",
          "role": "Manager",
          "image": eImageAssets.img3,
          "isActive": true
        },
        {
          "name": "Angela Bower",
          "role": "Waiter",
          "image": eImageAssets.img4,
          "isActive": true
        },
        {
          "name": "Dori Doreau",
          "role": "Manager",
          "image": eImageAssets.img3,
          "isActive": true
        },
        {
          "name": "Angela Bower",
          "role": "Waiter",
          "image": eImageAssets.img4,
          "isActive": true
        }
      ];
}
