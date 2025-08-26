import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:goapp/config.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';

class OfferDetailsScreen extends StatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  // bool isActive = false;
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    final offerPvr = Provider.of<OfferProvider>(context);
    final offers = offerPvr.offersDetails?.offer;

    // log("offers?.isFavourite ${offers?.isFavourite}");
    return DirectionalityRtl(
        child: Scaffold(
            appBar: AppBarCommon(
                title: language(context, appFonts.offerDetails),
                onTap: () {
                  offerPvr.onReady();
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
                      child: Container(
                          height: Insets.i154,
                          color: Color(0xffF2F3F4),
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: EdgeInsets.all(Insets.i14),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(offers?.tag ?? "",
                                    style: appCss.dmDenseBold24
                                        .textColor(appColor(context).darkText)),
                                Text(offers?.title ?? "",
                                    textAlign: TextAlign.center,
                                    style: appCss.dmDenseBold16
                                        .textColor(appColor(context).primary))
                              ]))),
                  VSpace(Insets.i55),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(offers?.name ?? "",
                        style: appCss.dmDenseBold14
                            .textColor(appColor(context).darkText)),
                    SvgPicture.asset('assets/svg/verified.svg')
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    offers?.categoty == ""
                        ? Container()
                        : Text("${offers?.categoty}  |",
                            style: appCss.dmDenseRegular13
                                .textColor(appColor(context).darkText)),
                    HSpace(5),
                    SvgPicture.asset('assets/svg/receipt.svg'),
                    HSpace(3),
                    Text("${offers?.redeemCounter} booked",
                        style: appCss.dmDenseRegular13
                            .textColor(appColor(context).darkText))
                  ]),
                  DottedLine(dashColor: Color(0xffE5E8EA))
                      .paddingDirectional(top: 15, bottom: 20),
                  offers?.qrCode != null
                      ? Image.memory(base64Decode(offers?.qrCode ?? ""),
                          height: 140, width: 140, fit: BoxFit.contain)
                      : ButtonCommon(
                          margin: 20,
                          title: 'Activate Offer Now',
                          onTap: () async {
                            route.pushNamed(context, routeName.subscriptionPlanScreen);
                            // SharedPreferences pref =
                            //     await SharedPreferences.getInstance();
                            // log("${apiClass.baseUrl}${api.qrGenerate}${pref.getInt(session.id)}/QR/${offers?.id}");
                            // try {
                            //   final dio = Dio();
                            //   Response response = await dio.get(
                            //     '${apiClass.baseUrl}${api.qrGenerate}${pref.getInt(session.id)}/QR/${offers?.id}',
                            //     options: Options(headers: {
                            //       'X-GoApp-Api-Key':
                            //           'ba16106c-2d7b-4a13-bdb2-b15b19691280',
                            //       'Authorization':
                            //           'Bearer ${pref.getString(session.accessToken)}',
                            //       'Content-Type': 'application/json'
                            //     }),
                            //   );
                            //
                            //   // ✅ Save QR data
                            //   setState(() {
                            //     qrBase64 = response.data[
                            //         'qr']; // assuming API returns base64 string in "qr"
                            //     isActive = true;
                            //   });
                            //
                            //   log("QR Saved: $qrBase64");
                            // } catch (e, s) {
                            //   log("Search error: $e $s");
                            // }
                          }),
                  VSpace(20),
                  Column(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(language(context, appFonts.description),
                              style: appCss.dmDenseRegular12
                                  .textColor(appColor(context).lightText)),
                          VSpace(Insets.i8),
                          Text(
                              style: appCss.dmDenseRegular14
                                  .textColor(appColor(context).darkText),
                              offers?.description ?? ""),
                          VSpace(32),
                          Text("Terms and Conditions",
                              style: appCss.dmDenseRegular12
                                  .textColor(appColor(context).lightText)),
                          VSpace(Insets.i8),
                          Text(
                              style: appCss.dmDenseRegular14
                                  .textColor(appColor(context).darkText),
                              offers?.terms ?? ""),
                          VSpace(Insets.i20),
                        ]),
                    DottedLine(dashColor: Color(0xffE5E8EA))
                        .paddingDirectional(top: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Start date:",
                                    style: appCss.dmDenseRegular12.textColor(
                                        appColor(context).lightText)),
                                Text(
                                    formatDate(
                                        offers?.activationDate.toString() ??
                                            ""),
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
                                Text(
                                    formatDate(
                                        offers?.expirationDate.toString() ??
                                            ""),
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
                        ]).paddingSymmetric(
                        horizontal: Insets.i20, vertical: Insets.i20)
                  ]).paddingDirectional(horizontal: Insets.i20)
                ]).boxBorderExtension(context,
                    isShadow: true, bColor: Color(0xffF2F3F4)),
                VSpace(15),
                // Container(
                //         padding: EdgeInsets.symmetric(vertical: Insets.i20),
                //         child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text("Start date:",
                //                         style: appCss.dmDenseRegular12
                //                             .textColor(
                //                                 appColor(context).lightText)),
                //                     Text(
                //                         formatDate(
                //                             offers?.activationDate.toString() ??
                //                                 ""),
                //                         style: appCss.dmDenseMedium12.textColor(
                //                             appColor(context).darkText))
                //                   ]),
                //               SvgPicture.asset('assets/svg/line.svg'),
                //               Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text("End date",
                //                         style: appCss.dmDenseRegular12
                //                             .textColor(
                //                                 appColor(context).lightText)),
                //                     Text(
                //                         formatDate(
                //                             offers?.expirationDate.toString() ??
                //                                 ""),
                //                         style: appCss.dmDenseMedium12.textColor(
                //                             appColor(context).darkText))
                //                   ]),
                //               SvgPicture.asset('assets/svg/line.svg'),
                //               Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text("Status",
                //                         style: appCss.dmDenseRegular12
                //                             .textColor(
                //                                 appColor(context).lightText)),
                //                     Text("Active",
                //                         style: appCss.dmDenseMedium12.textColor(
                //                             appColor(context).greenColor))
                //                   ])
                //             ]).paddingDirectional(horizontal: Insets.i40))
                //     .boxBorderExtension(context, isShadow: true),
                VSpace(Insets.i40),
              ]).paddingSymmetric(horizontal: Insets.i20),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.14,
                  child: Container(
                      height: Insets.i75,
                      width: Insets.i75,
                      padding: EdgeInsets.all(Insets.i2),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: CachedNetworkImageProvider(
                                  offers?.image?.source ?? "")),
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle))),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.18,
                  right: MediaQuery.of(context).size.width * 0.08,
                  child: Container(
                          padding: EdgeInsets.all(Insets.i2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(offers?.isFavourite == true
                              ? "assets/svg/fav.svg"
                              : "assets/svg/dislike.svg"))
                      .inkWell(onTap: () {
                    // log("offers?.appObject!.appObjectType ${offers?.id} ${offers?.appObject!.appObjectType} ${offers?.appObject!.appObjectId}");
                    Provider.of<CommonApiProvider>(context, listen: false)
                        .toggleFavAPI(
                            context,
                            offers?.isFavourite,
                            offers?.appObject!.appObjectType,
                            offers?.appObject!.appObjectId,
                            onSuccess: () async {
                      await Provider.of<OfferProvider>(context, listen: false)
                          .offerDetailsAPI(context, offers?.id,
                              isNotRouting: true);
                      await Provider.of<HomeScreenProvider>(context,
                              listen: false)
                          .homeFeed(context);
                    });
                  }))
            ])))));
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
