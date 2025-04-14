import 'dart:developer';
import 'package:intl/intl.dart';

import '../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';

class OfferDetailsScreen extends StatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  bool isActive = false;
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return DirectionalityRtl(
      child: Scaffold(
          appBar: AppBarCommon(
              title: language(context, appFonts.offerDetails),
              onTap: () {
                route.pop(context);
              }),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Stack(alignment: Alignment.center, children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image.network(args?['imageUrl'],
                          width: MediaQuery.of(context).size.width,
                          height: Insets.i200,
                          fit: BoxFit.fill)),
                  VSpace(Insets.i55),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Sparrow Coffee & Sweets",
                        style: appCss.dmDenseBold14
                            .textColor(appColor(context).darkText)),
                    SvgPicture.asset('assets/svg/verified.svg')
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Restaurant  |",
                        style: appCss.dmDenseRegular13
                            .textColor(appColor(context).darkText)),
                    HSpace(5),
                    SvgPicture.asset('assets/svg/receipt.svg'),
                    HSpace(3),
                    Text("255 booked",
                        style: appCss.dmDenseRegular13
                            .textColor(appColor(context).darkText))
                  ]),
                  DottedLine(dashColor: Color(0xffE5E8EA))
                      .paddingDirectional(top: 15, bottom: 20),
                  isActive == true
                      ? Image.asset('assets/images/qr_code.png',
                          height: 140, width: 140, fit: BoxFit.contain)
                      : ButtonCommon(
                          margin: 20,
                          title: 'Activate Offer Now',
                          onTap: () {
                            log("aaaa ");
                            setState(() {
                              isActive = true;
                            });
                          }).paddingOnly(bottom: 5),
                  VSpace(20),
                  Column(children: [
                    Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            child: Column(children: [
                              Text(args!['tag'],
                                  style: appCss.dmDenseBold24
                                      .textColor(appColor(context).darkText)),
                              Text(args['title'],
                                  textAlign: TextAlign.center,
                                  style: appCss.dmDenseBold13
                                      .textColor(appColor(context).primary))
                            ]))
                        .boxBorderExtension(context,
                            isShadow: true, color: Color(0xffF2F3F4)),
                    VSpace(15),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(language(context, appFonts.description),
                              style: appCss.dmDenseRegular12
                                  .textColor(appColor(context).lightText)),
                          VSpace(8),
                          Text(
                              style: appCss.dmDenseRegular14
                                  .textColor(appColor(context).darkText),
                              args['description']),
                          Text("Terms and Conditions",
                              style: appCss.dmDenseRegular12
                                  .textColor(appColor(context).lightText)),
                          VSpace(8),
                          Text(
                              style: appCss.dmDenseRegular14
                                  .textColor(appColor(context).darkText),
                              'This business was founded in 2021 by Kurt. Working well together, he and his staff. This business was founded in 2021 by Kurt. Working well together, he and his staff.'),
                          VSpace(20),
                          isActive == true
                              ? Container()
                              : ButtonCommon(
                                  title: 'Activate Offer Now',
                                  onTap: () {
                                    log("aaaa ");
                                    setState(() {
                                      isActive = true;
                                    });
                                  }).paddingOnly(bottom: 25)
                        ])
                  ]).paddingDirectional(horizontal: 20)
                ]).boxBorderExtension(context, isShadow: true),
                VSpace(15),
                Container(
                        padding: EdgeInsets.symmetric(vertical: Insets.i20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Start date:",
                                        style: appCss.dmDenseRegular12
                                            .textColor(
                                                appColor(context).lightText)),
                                    Text("12 Oct, 2023",
                                        style: appCss.dmDenseMedium12.textColor(
                                            appColor(context).darkText))
                                  ]),
                              SvgPicture.asset('assets/svg/line.svg'),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("End date",
                                        style: appCss.dmDenseRegular12
                                            .textColor(
                                                appColor(context).lightText)),
                                    Text(
                                        formatDate(
                                            args['expirationDate'].toString()),
                                        style: appCss.dmDenseMedium12.textColor(
                                            appColor(context).darkText))
                                  ]),
                              SvgPicture.asset('assets/svg/line.svg'),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Status",
                                        style: appCss.dmDenseRegular12
                                            .textColor(
                                                appColor(context).lightText)),
                                    Text("Active",
                                        style: appCss.dmDenseMedium12.textColor(
                                            appColor(context).greenColor))
                                  ])
                            ]).paddingDirectional(horizontal: Insets.i40))
                    .boxBorderExtension(context, isShadow: true),
                VSpace(Insets.i40),
              ]).paddingSymmetric(horizontal: Insets.i20),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.17,
                  child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                          maxRadius: 50,
                          backgroundImage:
                              AssetImage('assets/images/coupon1.png')))),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.24,
                  right: MediaQuery.of(context).size.width * 0.08,
                  child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(args['isFavourite']
                              ? "assets/svg/fav.svg"
                              : "assets/svg/dislike.svg"))
                      .inkWell(onTap: () {
                    isLike = !isLike;
                    setState(() {});
                  }))
            ])),
          )),
    );
  }

  String formatDate(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);
      return DateFormat("dd MMM, yyyy").format(dateTime);
    } catch (e) {
      return "Invalid Date";
    }
  }
}
