import 'package:flutter/cupertino.dart';
import 'package:goapp/screens/app_pages_screen/search_screen/layouts/list_tile_common.dart';
import 'package:goapp/screens/app_pages_screen/services_details_screen/layouts/read_more_layout.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config.dart';
import '../../../../models/service_model.dart';

class ServiceDescription extends StatelessWidget {
  final Services? services;

  const ServiceDescription({super.key, this.services});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const VSpace(Sizes.s14),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: appArray.buttonItems.map((item) {
              return GestureDetector(
                  onTap: () {
                    if (item['label'] == "Call") {
                      String call = "9999988888";
                      makePhoneCall(call);
                    } else if (item['label'] == "Hours") {
                      showOpeningHoursBottomSheet(context);
                    } else if (item['label'] == "Contact") {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 1.4,
                                child: Stack(children: [
                                  SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  language(context,
                                                      appFonts.contactUs),
                                                  style: appCss.dmDenseMedium18
                                                      .textColor(
                                                          appColor(context)
                                                              .darkText)),
                                              const Icon(
                                                      CupertinoIcons.multiply)
                                                  .inkWell(
                                                      onTap: () =>
                                                          route.pop(context))
                                            ]).paddingSymmetric(
                                            vertical: 20,
                                            horizontal: Insets.i20),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                                appArray.contactItems.length,
                                            itemBuilder: (context, index) {
                                              final items =
                                                  appArray.contactItems[index];
                                              return ListTileLayout(
                                                  data: appArray.contactItems,
                                                  isCheckBox: false,
                                                  isHavingIcon: true,
                                                  icon: items['icon'],
                                                  title: items['label'],
                                                  onTap: () {});
                                            })
                                      ])),
                                  BottomSheetButtonCommon(
                                          textOne: appFonts.cancel,
                                          textTwo: appFonts.addToContacts,
                                          applyTap: () {},
                                          clearTap: () {})
                                      .backgroundColor(
                                          appColor(context).whiteColor)
                                      .alignment(Alignment.bottomCenter)
                                ])).bottomSheetExtension(context);
                          });
                    } else if (item['label'] == "Gallery") {
                      route.pushNamed(context, routeName.commonGalleryScreen);
                    }
                  },
                  child: Container(
                      padding: EdgeInsets.only(top: 10),
                      // alignment: Alignment.center,
                      height: Insets.i50,
                      width: Insets.i50,
                      decoration: BoxDecoration(
                          color: Color(0xffFDB813),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        SvgPicture.asset(item['icon'],
                                height: Insets.i20, width: Insets.i20)
                            .paddingOnly(bottom: 1),
                        Text(item['label'],
                            style: appCss.dmDenseMedium8
                                .textColor(appColor(context).darkText))
                      ])));
            }).toList()),
        VSpace(Insets.i30),
        Text(language(context, appFonts.description),
            style:
                appCss.dmDenseMedium12.textColor(appColor(context).lightText)),
        const VSpace(Sizes.s6),
        if (services!.description != null)
          ReadMoreLayout(text: services!.description!, trimLines: 10),
        const VSpace(Sizes.s20),
      ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i20)
    ]).boxBorderExtension(context,
        isShadow: true, bColor: appColor(context).fieldCardBg);
  }

  Future<void> makePhoneCall(phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  void showOpeningHoursBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        builder: (context) {
          return const OpeningHoursSheet();
        });
  }
}

class OpeningHoursSheet extends StatelessWidget {
  const OpeningHoursSheet({super.key});

  final List<Map<String, String>> openingHours = const [
    {'day': 'Monday', 'open': '9:00', 'close': '17:00', 'remark': ''},
    {
      'day': 'Tuesday',
      'open': '-',
      'close': '-',
      'remark': 'Closed for Christmas'
    },
    {'day': 'Wednesday', 'open': '9:00', 'close': '17:00', 'remark': ''},
    {'day': 'Thursday', 'open': '9:00', 'close': '17:00', 'remark': ''},
    {'day': 'Friday', 'open': '9:00', 'close': '17:00', 'remark': ''},
    {'day': 'Saturday', 'open': '9:00', 'close': '17:00', 'remark': ''},
    {
      'day': 'Sunday',
      'open': '-',
      'close': '-',
      'remark': 'Closed for Christmas'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.58,
        child: SingleChildScrollView(
            child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(language(context, appFonts.openingHours),
                style: appCss.dmDenseMedium18
                    .textColor(appColor(context).darkText)),
            const Icon(CupertinoIcons.multiply)
                .inkWell(onTap: () => route.pop(context))
          ]),
          Row(children: [
            Text('Day',
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).lightText)),
            HSpace(MediaQuery.of(context).size.width * 0.16),
            Text('Open',
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).lightText)),
            HSpace(MediaQuery.of(context).size.width * 0.1),
            Text('Close',
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).lightText)),
            HSpace(MediaQuery.of(context).size.width * 0.07),
            Text('Remark',
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).lightText))
          ]).paddingDirectional(
              start: MediaQuery.of(context).size.width * 0.03, vertical: 20),
          ListView.builder(
              shrinkWrap: true,
              itemCount: openingHours.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  buildTableRow(openingHours[index], context),
                  CustomPaint(
                          size: const Size(double.infinity, 1),
                          painter: DottedLinePainter(
                              color: appColor(context).borderStroke))
                      .paddingDirectional(vertical: 15)
                ]).paddingOnly(right: 20, left: 15);
              }),
          ButtonCommon(
              width: 150, title: 'Close', onTap: () => route.pop(context))
        ]).paddingSymmetric(vertical: 20, horizontal: Insets.i20)));
  }

  //data
  Widget buildTableRow(Map<String, String> entry, context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 90,
              child: Text(entry['day']!,
                  style: appCss.dmDenseRegular12
                      .textColor(appColor(context).darkText))),
          SizedBox(
              width: 70,
              child: Text(entry['open']!,
                  style: appCss.dmDenseRegular12
                      .textColor(appColor(context).darkText))),
          SizedBox(
              width: 40,
              child: Text(entry['close']!,
                  style: appCss.dmDenseRegular12
                      .textColor(appColor(context).darkText))),
          Expanded(
              child: Text(entry['remark']!,
                  textAlign: TextAlign.right,
                  style: appCss.dmDenseRegular11.textColor(
                      entry['remark']!.isNotEmpty
                          ? appColor(context).lightText
                          : appColor(context).darkText)))
        ]);
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;

  DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double dashWidth = 5;
    double dashSpace = 3;
    double startX = 0;
    double endX = size.width;
    double yPos = 0;

    double currentX = startX;
    while (currentX < endX) {
      canvas.drawLine(
          Offset(currentX, yPos), Offset(currentX + dashWidth, yPos), paint);
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
