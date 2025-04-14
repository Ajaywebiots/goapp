import 'package:flutter/cupertino.dart';
import 'package:goapp/screens/app_pages_screen/search_screen/layouts/list_tile_common.dart';
import 'package:goapp/screens/app_pages_screen/services_details_screen/layouts/read_more_layout.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config.dart';
import '../../../../models/service_model.dart';
import '../../../../providers/app_pages_provider/time_slot_provider.dart';
import '../../time_slot_screen/layouts/all_time_slot_layout.dart';

class ServiceDescription extends StatelessWidget {
  final Services? services;

  const ServiceDescription({super.key, this.services});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const VSpace(Sizes.s14),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
            spacing: 3,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(appArray.buttonItems.length, (index) {
              final item = appArray.buttonItems[index];
              return Flexible(
                  child: GestureDetector(
                      onTap: () {
                        if (item['label'] == "Call") {
                          String call = "9999988888";
                          makePhoneCall(call);
                        } else if (item['label'] == "Directions") {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return SafeArea(
                                    child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.5,
                                        child: Stack(children: [
                                          SingleChildScrollView(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          language(context,
                                                              "Address"),
                                                          style: appCss
                                                              .dmDenseMedium18
                                                              .textColor(appColor(
                                                                      context)
                                                                  .darkText)),
                                                      const Icon(CupertinoIcons
                                                              .multiply)
                                                          .inkWell(
                                                              onTap: () => route
                                                                  .pop(context))
                                                    ]).paddingSymmetric(
                                                    vertical: 20,
                                                    horizontal: Insets.i20),
                                                Container(
                                                    height: 450,
                                                    margin:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            const BorderRadius.all(
                                                                Radius.circular(
                                                                    12))),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                        child: GoogleMap(
                                                            zoomGesturesEnabled:
                                                                true,
                                                            initialCameraPosition:
                                                                CameraPosition(
                                                                    target: const LatLng(20.5937, 78.9629),
                                                                    zoom: 18.0),
                                                            myLocationEnabled: true,
                                                            myLocationButtonEnabled: true)))
                                              ])),
                                          BottomSheetButtonCommon(
                                                  textOne: "Close",
                                                  textTwo: "Directions",
                                                  applyTap: () {},
                                                  clearTap: () {})
                                              .backgroundColor(
                                                  appColor(context).whiteColor)
                                              .alignment(Alignment.bottomCenter)
                                        ])).bottomSheetExtension(context));
                              });
                        } else if (item['label'] == "Hours") {
                          showOpeningHoursBottomSheet(context);
                        } else if (item['label'] == "Contact") {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        1.4,
                                    child: Stack(children: [
                                      SingleChildScrollView(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      language(context,
                                                          appFonts.contactUs),
                                                      style: appCss
                                                          .dmDenseMedium18
                                                          .textColor(
                                                              appColor(context)
                                                                  .darkText)),
                                                  const Icon(CupertinoIcons
                                                          .multiply)
                                                      .inkWell(
                                                          onTap: () => route
                                                              .pop(context))
                                                ]).paddingSymmetric(
                                                vertical: 20,
                                                horizontal: Insets.i20),
                                            ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: appArray
                                                    .contactItems.length,
                                                itemBuilder: (context, index) {
                                                  final items = appArray
                                                      .contactItems[index];
                                                  return ListTileLayout(
                                                      data:
                                                          appArray.contactItems,
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
                          route.pushNamed(
                              context, routeName.commonGalleryScreen);
                        }
                      },
                      child: Container(
                          height: 46,
                          alignment: Alignment.center,
                          width: 46,
                          padding: EdgeInsets.symmetric(vertical: 7),
                          decoration: BoxDecoration(
                              color: Color(0xffFDB813),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(item['icon'],
                                    height: Insets.i20, width: Insets.i20),
                                Text(item['label'],
                                    style: appCss.dmDenseMedium7
                                        .textColor(appColor(context).darkText))
                              ]))));
            })),
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
          return SafeArea(
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: Consumer<TimeSlotProvider>(
                    builder: (context, value, child) {
                  return SingleChildScrollView(
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(language(context, appFonts.openingHours),
                                style: appCss.dmDenseMedium18
                                    .textColor(appColor(context).darkText)),
                            const Icon(CupertinoIcons.multiply)
                                .inkWell(onTap: () => route.pop(context))
                          ]).paddingSymmetric(
                          vertical: 20, horizontal: Insets.i20),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: Insets.i20),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: appColor(context).fieldCardBg,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                        children: appArray.timeSlotStartAtList
                                            .asMap()
                                            .entries
                                            .map((e) => Text(
                                                    language(context, e.value),
                                                    style: appCss
                                                        .dmDenseMedium12
                                                        .textColor(
                                                            appColor(context)
                                                                .lightText))
                                                .paddingOnly(
                                                    left: e.key == 0
                                                        ? Insets.i5
                                                        : 30,
                                                    right: e.key == 0
                                                        ? Insets.i50
                                                        : 20
                                                    /* left: rtl(context)
                                                        ? 32
                                                        : e.key == 0
                                                            ? Insets.i5
                                                            : rtl(context)
                                                                ? 44
                                                                : e.key == 1
                                                                    ? 0
                                                                    : 0,
                                                    right: rtl(context)
                                                        ? Insets.i10
                                                        : e.key == 0
                                                            ? Insets.i28
                                                            : e.key == 1
                                                                ? Insets.i42
                                                                : 0*/
                                                    ))
                                            .toList())
                                    .paddingSymmetric(horizontal: Insets.i15),
                                const VSpace(Sizes.s15),
                                ...appArray.timeSlotList.asMap().entries.map(
                                    (e) => AllTimeSlotLayout(
                                        data: e.value,
                                        index: e.key,
                                        list: appArray.timeSlotList,
                                        onTapSecond: e.value["status"] == true
                                            ? () => value.selectTimeBottomSheet(
                                                context, e.value, e.key, "end")
                                            : () {},
                                        onTap: e.value["status"] == true
                                            ? () => value.selectTimeBottomSheet(
                                                context,
                                                e.value,
                                                e.key,
                                                "start")
                                            : () {},
                                        onToggle: (val) =>
                                            value.onToggle(e.value, val)))
                              ])),
                      VSpace(Insets.i22),
                      BottomSheetButtonCommon(
                              isRateComplete: true,
                              textOne: appFonts.cancel,
                              textTwo: appFonts.addToContacts,
                              applyTap: () {},
                              clearTap: () {})
                          .marginSymmetric(horizontal: 80)
                          .backgroundColor(appColor(context).whiteColor)
                          .alignment(Alignment.bottomCenter)
                    ]),
                  );
                })),
          );
        });
  }
}
