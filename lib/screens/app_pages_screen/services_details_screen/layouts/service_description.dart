import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:goapp/models/api_model/business_details_model.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';
import 'package:goapp/screens/app_pages_screen/search_screen/layouts/list_tile_common.dart';
import 'package:goapp/screens/app_pages_screen/services_details_screen/layouts/read_more_layout.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config.dart';
import '../../../../models/app_model/contact_vcf_file_model.dart';
import '../../../../providers/app_pages_provider/search_provider.dart';
import '../../../../providers/app_pages_provider/time_slot_provider.dart';
import '../../../../providers/common_providers/common_api_provider.dart';
import '../../../../widgets/common_gallery_screen.dart';
import '../../time_slot_screen/layouts/all_time_slot_layout.dart';

class ServiceDescription extends StatefulWidget {
  final BusinessSec? businessData;

  const ServiceDescription({super.key, this.businessData});

  @override
  State<ServiceDescription> createState() => _ServiceDescriptionState();
}

class _ServiceDescriptionState extends State<ServiceDescription> {
  bool? isFavLocal;

  @override
  void initState() {
    super.initState();
    isFavLocal = widget.businessData?.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    final Contact? contact = widget.businessData?.contact;
    Future<void> launchURL(String url) async {
      /* final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.inAppWebView);
      } else {
        throw 'Could not launch $url';
      }*/
    }

    String extractFacebookPageId(String url) {
      return url.split('/').where((part) => part.isNotEmpty).last;
    }

    Future<void> launchFacebook(String url) async {
      final pageId = extractFacebookPageId(url);
      final Uri fbUri = Uri.parse('fb://page/$pageId');
      final Uri webUri = Uri.parse(url);

      if (await canLaunchUrl(fbUri)) {
        await launchUrl(fbUri);
      } else {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      }
    }

    String extractInstagramUsername(String url) {
      return url.split('/').where((part) => part.isNotEmpty).last;
    }

    String extractTikTokUsername(String url) {
      final uri = Uri.parse(url);
      final segments = uri.pathSegments;
      if (segments.isNotEmpty && segments.first.startsWith('@')) {
        return segments.first.replaceAll('@', '');
      }
      return '';
    }

    Future<void> launchTikTok(String url) async {
      final username = extractTikTokUsername(url);
      final Uri tiktokAppUri = Uri.parse('snssdk1128://user/profile/$username');
      final Uri webUri = Uri.parse(url);

      if (await canLaunchUrl(tiktokAppUri)) {
        await launchUrl(tiktokAppUri);
      } else {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      }
    }

    Future<void> launchInstagram(String url) async {
      final username = extractInstagramUsername(url);
      final Uri instaUri = Uri.parse('instagram://user?username=$username');
      final Uri webUri = Uri.parse(url);

      if (await canLaunchUrl(instaUri)) {
        await launchUrl(instaUri);
      } else {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      }
    }

    Future<void> launchWebsite(String url) async {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }

    Future<void> launchYouTube(String url) async {
      final Uri appUri =
          Uri.parse(url.replaceFirst('https://', 'vnd.youtube:'));
      final Uri webUri = Uri.parse(url);

      if (await canLaunchUrl(appUri)) {
        await launchUrl(appUri);
      } else {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      }
    }

    Future<void> launchGoogleMaps(String address) async {
      final encodedAddress = Uri.encodeComponent(address);
      final Uri mapsAppUri = Uri.parse('geo:0,0?q=$encodedAddress');
      final Uri mapsWebUri = Uri.parse(
          'https://www.google.com/maps/search/?api=1&query=$encodedAddress');

      if (await canLaunchUrl(mapsAppUri)) {
        await launchUrl(mapsAppUri);
      } else {
        await launchUrl(mapsWebUri, mode: LaunchMode.externalApplication);
      }
    }

    Future<void> launchGoogleMapsAtLocation(double lat, double lng) async {
      final Uri mapsAppUri = Uri.parse('geo:$lat,$lng?q=$lat,$lng');
      final Uri mapsWebUri = Uri.parse(
          'https://www.google.com/maps/search/?api=1&query=$lat,$lng');

      if (await canLaunchUrl(mapsAppUri)) {
        await launchUrl(mapsAppUri);
      } else {
        await launchUrl(mapsWebUri, mode: LaunchMode.externalApplication);
      }
    }

    final List<Map<String, dynamic>> contactItems = [
      {
        'icon': eSvgAssets.calling,
        'label': contact?.phoneNumber ?? "",
        'action': () async {
          final Uri uri = Uri.parse("tel:${contact?.phoneNumber}");
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            throw 'Could not launch tel:${contact?.phoneNumber}';
          }
        },
        'contactAction': contact?.phoneNumber ?? "",
      },
      {
        'icon': eSvgAssets.mail,
        'label': contact?.email ?? "",
        'action': () async {
          final Uri emailUri = Uri(
            scheme: 'mailto',
            path: contact?.email,
            query: Uri(queryParameters: {'subject': '', 'body': ''}).query,
          );
          if (await canLaunchUrl(emailUri)) {
            await launchUrl(emailUri);
          } else {
            throw 'Could not launch email client';
          }
        },
        'contactAction': contact?.email ?? ""
      },
      {
        'icon': eSvgAssets.locationOut1,
        'label': contact?.address ?? "",
        'action': () => launchGoogleMaps(contact?.address ?? ""),
        'contactAction': contact?.address ?? ""
      },
      {
        'icon': eSvgAssets.global,
        'label': contact?.website ?? "",
        'action': () => launchWebsite(contact?.website ?? ""),
        'contactAction': contact?.website ?? ""
      },
      {
        'icon': eImageAssets.fbIcon,
        'label': "Facebook",
        'action': () => launchFacebook(contact?.facebookPage ?? ""),
        'contactAction': contact?.facebookPage ?? ""
      },
      {
        'icon': eImageAssets.insta,
        'label': "Instagram",
        'action': () => launchInstagram(contact?.instagramPage ?? ""),
        'contactAction': contact?.instagramPage ?? ""
      },
      {
        'icon': eImageAssets.tiktok,
        'label': "TikTok",
        'action': () => launchTikTok(contact?.tiktokPage ?? ""),
        'contactAction': contact?.tiktokPage ?? ""
      },
      {
        'icon': eImageAssets.ytIcon,
        'label': "YouTube",
        'action': () => launchYouTube(contact?.youtubePage ?? ""),
        'contactAction': contact?.youtubePage ?? ""
      }
    ]
        .where((item) =>
            item['contactAction'] != null &&
            item['contactAction'].toString().trim().isNotEmpty)
        .toList();

    String generateFullVCard(Contact? contact) {
      return '''
BEGIN:VCARD
VERSION:3.0
FN:${widget.businessData?.name ?? ''}
TEL;TYPE=CELL:${contact?.phoneNumber ?? ''}
EMAIL:${contact?.email ?? ''}
ADR:${contact?.address ?? ''}
URL:${contact?.website ?? ''}

item1.URL:${contact?.facebookPage ?? ''}
item1.X-ABLabel:Facebook

item2.URL:${contact?.instagramPage ?? ''}
item2.X-ABLabel:Instagram

item3.URL:${contact?.tiktokPage ?? ''}
item3.X-ABLabel:TikTok

item4.URL:${contact?.youtubePage ?? ''}
item4.X-ABLabel:YouTube
END:VCARD
''';
    }

    Future<void> saveVCardToFile(String vCardContent, String fileName) async {
      final permission = Permission.manageExternalStorage;

      final status = await permission.status;
      if (!status.isGranted) {
        final result = await permission.request();
        if (!result.isGranted) {
          print("Storage permission not granted.");
          return;
        }
      }

      final directory = await getExternalStorageDirectory();
      if (directory == null) {
        print("No directory found.");
        return;
      }

      final path = directory.path;
      final file = File('$path/$fileName.vcf');

      await file.writeAsString(vCardContent);
      print("vCard saved at: $path/$fileName.vcf");
    }

    return Consumer<SearchProvider>(builder: (context, search, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const VSpace(Sizes.s14),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
              spacing: 3,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  appArray
                      .buttonItemsB(widget.businessData!.isFavourite!)
                      .length, (index) {
                final item = appArray
                    .buttonItemsB(widget.businessData!.isFavourite!)[index];
                return Flexible(
                    child: GestureDetector(
                        onTap: () {
                          if (item['label'] == appFonts.call) {
                            String? call =
                                widget.businessData?.contact?.phoneNumber;
                            makePhoneCall(call);
                          } else if (item['label'] == appFonts.directions) {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return SafeArea(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                        Column(
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
                                                            appFonts.address),
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
                                                  margin: const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: GoogleMap(
                                                          initialCameraPosition: CameraPosition(
                                                              target: LatLng(
                                                                  (widget
                                                                          .businessData!
                                                                          .location
                                                                          ?.latitude)
                                                                      .toDouble(),
                                                                  (widget
                                                                          .businessData
                                                                          ?.location
                                                                          ?.longitude)
                                                                      .toDouble()),
                                                              zoom: 18.0),
                                                          myLocationEnabled:
                                                              true,
                                                          myLocationButtonEnabled:
                                                              true,
                                                          zoomGesturesEnabled:
                                                              true,
                                                          scrollGesturesEnabled:
                                                              true,
                                                          rotateGesturesEnabled: true,
                                                          tiltGesturesEnabled: true,
                                                          markers: {
                                                            Marker(
                                                                markerId: MarkerId(
                                                                    "target-location"),
                                                                position: LatLng(
                                                                    (widget
                                                                            .businessData!
                                                                            .location
                                                                            ?.latitude)
                                                                        .toDouble(),
                                                                    (widget
                                                                            .businessData
                                                                            ?.location
                                                                            ?.longitude)
                                                                        .toDouble()),
                                                                infoWindow:
                                                                    InfoWindow(
                                                                        title:
                                                                            "Selected Location"))
                                                          },
                                                          zoomControlsEnabled: true)))
                                            ]),
                                        VSpace(Insets.i20),
                                        BottomSheetButtonCommon(
                                                textOne: appFonts.close,
                                                textTwo: appFonts.directions,
                                                applyTap: () {
                                                  final lat = widget
                                                      .businessData
                                                      ?.location
                                                      ?.latitude
                                                      .toDouble();
                                                  final lng = widget
                                                      .businessData
                                                      ?.location
                                                      ?.longitude
                                                      .toDouble();

                                                  if (lat != null &&
                                                      lng != null) {
                                                    launchGoogleMapsAtLocation(
                                                        lat, lng);
                                                  }
                                                },
                                                clearTap: () {
                                                  route.pop(context);
                                                })
                                            .backgroundColor(
                                                appColor(context).whiteColor)
                                            .alignment(Alignment.bottomCenter)
                                      ]).bottomSheetExtension(context));
                                });
                          } else if (item['label'] == appFonts.hours) {
                            showOpeningHoursBottomSheet(context);
                          } else if (item['label'] == appFonts.contact) {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return SafeArea(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                        SingleChildScrollView(
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
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
                                                            .textColor(appColor(
                                                                    context)
                                                                .darkText)),
                                                    Icon(
                                                            CupertinoIcons
                                                                .multiply,
                                                            color: appColor(
                                                                    context)
                                                                .darkText)
                                                        .inkWell(
                                                            onTap: () => route
                                                                .pop(context))
                                                  ]).paddingSymmetric(
                                                  vertical: Insets.i20,
                                                  horizontal: Insets.i20),
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      contactItems.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final item =
                                                        contactItems[index];
                                                    return ListTileLayout(
                                                        color: appColor(context)
                                                            .lightText,
                                                        data: contactItems,
                                                        isCheckBox: false,
                                                        isHavingIcon: true,
                                                        icon: item['icon'],
                                                        title: item['label'],
                                                        onClick:
                                                            item['action']);
                                                  })
                                            ])),
                                        VSpace(Insets.i10),
                                        BottomSheetButtonCommon(
                                                textOne: appFonts.cancel,
                                                textTwo: appFonts.addToContacts,
                                                applyTap: () async {
                                                  String? businessName =
                                                      widget.businessData?.name;
                                                  final vcfData = generateVCF(
                                                      contactItems,
                                                      businessName!);

                                                  final directory =
                                                      await getTemporaryDirectory();
                                                  final safeName = businessName
                                                      .toLowerCase()
                                                      .replaceAll(
                                                          RegExp(r'[^a-z0-9]+'),
                                                          '_');
                                                  final filePath =
                                                      '${directory.path}/${safeName}_contact.vcf';

                                                  final file = File(filePath);
                                                  await file
                                                      .writeAsString(vcfData);

                                                  await Share.shareXFiles([
                                                    XFile(filePath,
                                                        mimeType: "text/vcard")
                                                  ]);
                                                },
                                                clearTap: () =>
                                                    route.pop(context))
                                            .backgroundColor(
                                                appColor(context).whiteColor)
                                            .alignment(Alignment.bottomCenter),
                                      ]).bottomSheetExtension(context));
                                });
                          } else if (item['label'] == appFonts.gallery) {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                builder: (context) => DraggableScrollableSheet(
                                    expand: false,
                                    initialChildSize: 0.8,
                                    minChildSize: 0.4,
                                    maxChildSize: 0.95,
                                    builder: (_, controller) =>
                                        SingleChildScrollView(
                                            controller: controller,
                                            child: Column(children: [
                                              CommonGalleryContent(
                                                  galleryUrls:
                                                      widget.businessData)
                                            ]))));
                          } else if (item['label'] == appFonts.save) {
                            search.notifyListeners();
                            Provider.of<CommonApiProvider>(context,
                                    listen: false)
                                .toggleFavAPI(
                                    context,
                                    widget.businessData?.isFavourite,
                                    widget
                                        .businessData?.appObject!.appObjectType,
                                    widget.businessData?.appObject!.appObjectId,
                                    onSuccess: () {
                              Provider.of<SearchProvider>(context,
                                      listen: false)
                                  .businessDetailsAPI(
                                      context, widget.businessData?.id,
                                      isNotRouting: true);

                              Provider.of<SearchProvider>(context,
                                      listen: false)
                                  .getBusinessSearchAPI(context);
                              Provider.of<HomeScreenProvider>(context,
                                      listen: false)
                                  .homeFeed(context);
                            });
                            search.notifyListeners();
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(item['icon'],
                                      height: Insets.i20, width: Insets.i20),
                                  Text(language(context, item['label']),
                                      style: appCss.dmDenseMedium7.textColor(
                                          appColor(context).darkText))
                                ]))));
              })),
          VSpace(Insets.i30),
          Text(language(context, appFonts.description),
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).lightText)),
          const VSpace(Sizes.s6),
          ReadMoreLayout(text: widget.businessData?.description, trimLines: 10),
          const VSpace(Sizes.s20),
        ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i20)
      ]).boxBorderExtension(context,
          isShadow: true, bColor: appColor(context).fieldCardBg);
    });
  }

  Future<void> makePhoneCall(String? phoneNumber) async {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      print('Phone number is null or empty');
      return;
    }

    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(launchUri)) {
      await launchUrl(
        launchUri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  void showOpeningHoursBottomSheet(BuildContext context) {
    final business = widget.businessData;
    final workingHours = business?.workingHours ?? [];
    final List<Map<String, dynamic>> timeSlotList =
        generateTimeSlotList(workingHours);
    final timeSlotStartAtList = [appFonts.days, "Start at", "End at"];

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        builder: (context) {
          return SafeArea(child: SizedBox(
              // height: MediaQuery.of(context).size.height / 1.3,
              child:
                  Consumer<TimeSlotProvider>(builder: (context, value, child) {
            return SingleChildScrollView(
                child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(language(context, appFonts.openingHours),
                    style: appCss.dmDenseMedium18
                        .textColor(appColor(context).darkText)),
                Icon(CupertinoIcons.multiply, color: appColor(context).darkText)
                    .inkWell(onTap: () => route.pop(context))
              ]).paddingSymmetric(vertical: 20, horizontal: Insets.i20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: Insets.i20),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: appColor(context).fieldCardBg,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                                children: timeSlotStartAtList
                                    .asMap()
                                    .entries
                                    .map((e) => Text(language(context, e.value),
                                            style: appCss.dmDenseMedium12
                                                .textColor(appColor(context)
                                                    .lightText))
                                        .paddingOnly(
                                            left: e.key == 0 ? Insets.i5 : 30,
                                            right:
                                                e.key == 0 ? Insets.i50 : 20))
                                    .toList())
                            .paddingSymmetric(horizontal: Insets.i15),
                        const VSpace(Sizes.s15),
                        ...timeSlotList
                            .asMap()
                            .entries
                            .map(
                                (e) =>
                                    AllTimeSlotLayout(
                                        data: e.value,
                                        index: e.key,
                                        list: timeSlotList,
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
                      textOne: language(context, appFonts.close),
                      clearTap: () => route.pop(context))
                  .marginSymmetric(horizontal: 80)
                  .backgroundColor(appColor(context).whiteColor)
                  .alignment(Alignment.bottomCenter)
            ]));
          })));
        });
  }

  List<String> weekDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  List<Map<String, dynamic>> generateTimeSlotList(
      List<WorkingHour> workingHours) {
    return List.generate(7, (index) {
      final hour = workingHours.firstWhere((w) => w.weekDay == index + 1,
          orElse: () => WorkingHour(
                weekDay: index + 1,
                openTime: "00:00",
                closeTime: "00:00",
                remark: "",
                isClosed: true,
              ));

      return {
        "days": weekDays[index],
        "start_at": hour.openTime ?? "00:00",
        "end_at": hour.closeTime ?? "00:00",
        "status": !(hour.isClosed ?? true)
      };
    });
  }
}
