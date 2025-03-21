import 'dart:developer';
import '../../../config.dart';

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
    return Scaffold(
        appBar: AppBarCommon(
            title: appFonts.offerDetails,
            onTap: () {
              route.pop(context);
            }),
        body: SingleChildScrollView(
            child: Stack(alignment: Alignment.center, children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(children: [
              ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.asset('assets/images/sale.png',
                      width: MediaQuery.of(context).size.width,
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
                        padding: EdgeInsets.all(8),
                        child: Column(children: [
                          Text(
                            "5% OFF",
                            style: appCss.dmDenseBold24
                                .textColor(appColor(context).darkText),
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              style: appCss.dmDenseBold13
                                  .textColor(appColor(context).primary),
                              'Get 5% off all cocktails before midnight and every Sunday')
                        ]))
                    .boxBorderExtension(context,
                        isShadow: true, color: Color(0xffF2F3F4)),
                VSpace(15),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Description",
                      style: appCss.dmDenseRegular12
                          .textColor(appColor(context).lightText)),
                  VSpace(8),
                  Text(
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).darkText),
                      'This business was founded in 2021 by Kurt. Working well together, he and his staff. This business was founded in 2021 by Kurt. Working well together, he and his staff.')
                ]),
                VSpace(30),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                                    style: appCss.dmDenseRegular12.textColor(
                                        appColor(context).lightText)),
                                Text("12 Oct, 2023",
                                    style: appCss.dmDenseMedium12
                                        .textColor(appColor(context).darkText))
                              ]),
                          SvgPicture.asset('assets/svg/line.svg'),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("End date",
                                    style: appCss.dmDenseRegular12.textColor(
                                        appColor(context).lightText)),
                                Text("12 Nov, 2023",
                                    style: appCss.dmDenseMedium12
                                        .textColor(appColor(context).darkText))
                              ]),
                          SvgPicture.asset('assets/svg/line.svg'),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Status",
                                    style: appCss.dmDenseRegular12.textColor(
                                        appColor(context).lightText)),
                                Text("Active",
                                    style: appCss.dmDenseMedium12.textColor(
                                        appColor(context).greenColor))
                              ])
                        ]).paddingDirectional(horizontal: Insets.i40))
                .boxBorderExtension(context, isShadow: true),
            VSpace(40),
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
                      child: SvgPicture.asset(isLike
                          ? "assets/svg/dislike.svg"
                          : "assets/svg/fav.svg"))
                  .inkWell(onTap: () {
                isLike = !isLike;
                setState(() {});
              }))
        ])));
  }
}
