import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:goapp/models/api_model/offer_search_model.dart' as models;
import 'package:goapp/providers/bottom_providers/offer_provider.dart';

import '../../../config.dart';
import '../../../models/api_model/home_feed_model.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../providers/common_providers/common_api_provider.dart';
import '../../../services/api_service.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/checkbox_common.dart';
import '../../../widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import 'layouts/coupon_layout.dart';

class CouponListScreen extends StatefulWidget {
  final bool isHomeScreen;

  const CouponListScreen({super.key, this.isHomeScreen = false});

  @override
  State<CouponListScreen> createState() => _CouponListScreenState();
}

class _CouponListScreenState extends State<CouponListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OfferProvider>(builder: (context3, offerPvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(
              Duration(milliseconds: 150), () => offerPvr.onReady()),
          child: DirectionalityRtl(
              child: Scaffold(
                  appBar: AppBarCommon(
                      title: language(context, appFonts.offers),
                      onTap: () {
                        if (widget.isHomeScreen) {
                          final dash = Provider.of<DashboardProvider>(context,
                              listen: false);
                          dash.selectIndex = 0;

                          dash.notifyListeners();
                        } else {
                          route.pop(context);
                          offerPvr.slider = 0.0;
                          offerPvr.selectedOfferTypeIds.clear();
                        }
                      }),
                  body: SafeArea(
                    child: SingleChildScrollView(
                        child: Column(children: [
                      SearchTextFieldCommon(
                          hintText: "Search for offers",
                          controller: offerPvr.searchCtrl,
                          focusNode: offerPvr.searchFocus,
                          suffixIcon: FilterIconCommon(
                              selectedFilter:
                                  offerPvr.totalCountFilter().toString(),
                              onTap: () {
                                openFilterModal(context);
                              })),
                      VSpace(Insets.i22),
                      if (offerPvr.offerViewAllList.isEmpty)
                        EmptyLayout(
                            topHeight:
                                MediaQuery.of(context).size.height * 0.08,
                            height: MediaQuery.of(context).size.height * 0.09,
                            isButtonShow: false,
                            title:
                                language(context, appFonts.noResultsWereFound),
                            subtitle: language(context, appFonts.sorry),
                            widget: Image.asset(eImageAssets.noNoti,
                                height: Sizes.s200)),
                      ...offerPvr.offerViewAllList
                          .asMap()
                          .entries
                          .map((e) => CouponLayout(
                              addOrRemoveTap: () {
                                final common = Provider.of<CommonApiProvider>(
                                    context,
                                    listen: false);
                                common.toggleFavAPI(
                                    context,
                                    e.value.isFavourite,
                                    e.value.appObject!.appObjectType,
                                    e.value.appObject!.appObjectId,
                                    onSuccess: () {
                                  Provider.of<HomeScreenProvider>(context,
                                          listen: false)
                                      .homeFeed(context);
                                  Provider.of<OfferProvider>(context,
                                          listen: false)
                                      .getViewAllOfferAPI();
                                  Provider.of<OfferProvider>(context,
                                          listen: false)
                                      .offerDetailsAPI(context, e.value.id,
                                          isNotRouting: true);
                                });
                              },
                              data: e.value,
                              onTap: () {
                                offerPvr.offerDetailsAPI(context, e.value.id);
                              }))
                    ]).paddingSymmetric(horizontal: Insets.i20)),
                  ))));
    });
  }

  void openFilterModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        builder: (context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 1.14,
              child: FilterBottomSheet());
        });
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  applyFilters() async {
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    final offerPvr = Provider.of<OfferProvider>(context, listen: false);
    Position position = await homePvr.getCurrentLocation();
    double lat = position.latitude;
    double lon = position.longitude;
    log("selectedOfferTypeIds ${offerPvr.selectedOfferTypeIds}");
    String typesQuery =
        offerPvr.selectedOfferTypeIds.map((id) => "types=$id").join("&");

    try {
      apiServices
          .commonApi(
              "${api.offerSearch}?$typesQuery&longitude=$lon&latitude=$lat&radius=${offerPvr.slider.toInt()}",
              [],
              ApiType.get,
              isToken: true)
          .then((value) {
        final offer = Provider.of<OfferProvider>(context, listen: false);
        if (value.isSuccess == true) {
          Navigator.pop(context);
          // if (value.data['responseStatus'] == 1) {
          offer.offerViewAllList.clear();
          models.OfferSearchModel offerSearchModel =
              models.OfferSearchModel.fromJson(value.data);
          offer.notifyListeners();
          offer.offerViewAllList.addAll(offerSearchModel.offers as List<Offer>);
          // }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      log("EEEE applyFilters :: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final offerPvr = Provider.of<OfferProvider>(context, listen: false);
    return SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(language(context, appFonts.filterBy),
            style:
                appCss.dmDenseMedium18.textColor(appColor(context).darkText)),
        const Icon(CupertinoIcons.multiply)
            .inkWell(onTap: () => route.pop(context))
      ]).paddingSymmetric(horizontal: Insets.i20),
      // Tabs
      VSpace(20),
      _buildTab(),
      VSpace(22),
      Row(children: [
        offerPvr.selectedTab == 0
            ? Text("Offer Type",
                style: appCss.dmDenseRegular14
                    .textColor(appColor(context).lightText))
            : Text("Distance",
                style: appCss.dmDenseRegular14
                    .textColor(appColor(context).lightText))
      ]).marginSymmetric(horizontal: 20),
      const SizedBox(height: 16),
      Expanded(
          child: offerPvr.selectedTab == 0
              ? buildTypeFilter()
              : _buildDistanceFilter()),
      const SizedBox(height: 16),
      Row(children: [
        Expanded(
            child: ButtonCommon(
                borderColor: appColor(context).primary,
                color: Colors.white,
                style: appCss.dmDenseRegular16
                    .textColor(appColor(context).primary),
                onTap: () => offerPvr.clearAll(context),
                title: language(context, appFonts.clearAll))),
        const SizedBox(width: Insets.i8),
        Expanded(
            child: ButtonCommon(
                onTap: () => applyFilters(),
                title: language(context, appFonts.apply)))
      ])
    ]).marginOnly(top: Insets.i30, left: Insets.i20, right: Insets.i20));
  }

  Widget _buildTab() {
    final offerPvr = Provider.of<OfferProvider>(context, listen: false);
    return Container(
        height: 50,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: appColor(context).fieldCardBg,
            borderRadius: BorderRadius.circular(30)),
        child: Row(children: [
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      offerPvr.selectedTab = 0;
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.only(left: Insets.i20),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: offerPvr.selectedTab == 0
                              ? appColor(context).primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Text("Offer Type",
                          style: appCss.dmDenseRegular14.textColor(
                              offerPvr.selectedTab == 0
                                  ? appColor(context).whiteBg
                                  : appColor(context).lightText))))),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      offerPvr.selectedTab = 1;
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.only(right: Insets.i20),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          color: offerPvr.selectedTab == 1
                              ? appColor(context).primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Text("Distance",
                          style: appCss.dmDenseRegular14.textColor(
                              offerPvr.selectedTab == 1
                                  ? appColor(context).whiteBg
                                  : appColor(context).lightText)))))
        ])).marginSymmetric(horizontal: Insets.i10);
  }

  Widget buildTypeFilter() {
    final offerPvr = Provider.of<OfferProvider>(context, listen: false);
    return ListView.builder(
        itemCount: offerPvr.offerTypes.length,
        itemBuilder: (context, index) {
          final offer = offerPvr.offerTypes[index];
          return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                IntrinsicHeight(
                    child: Row(children: [
                  Text(language(context, offer.translatedValue ?? ''),
                      overflow: TextOverflow.ellipsis,
                      style: appCss.dmDenseMedium14
                          .textColor(appColor(context).darkText))
                ])),
                CheckBoxCommon(
                    isCheck: offerPvr.selectedOfferTypeIds
                        .contains(offer.offerTypeId),
                    onTap: () {
                      onOfferTypeChange(offer.offerTypeId ?? 0);
                    })
              ])
              .inkWell(onTap: () {
                onOfferTypeChange(offer.offerTypeId ?? 0);
              })
              .paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15)
              .boxBorderExtension(context,
                  isShadow: true, bColor: Color(0xFFF5F6F7))
              .padding(horizontal: Insets.i10, bottom: Insets.i12);
        });
  }

  void onOfferTypeChange(int id) {
    final offerPvr = Provider.of<OfferProvider>(context, listen: false);
    setState(() {
      if (offerPvr.selectedOfferTypeIds.contains(id)) {
        offerPvr.selectedOfferTypeIds.remove(id);
      } else {
        offerPvr.selectedOfferTypeIds.add(id);
      }
    });
    log("Selected OfferType IDs: ${offerPvr.selectedOfferTypeIds}");
  }

  Widget _buildDistanceFilter() {
    final offerPvr = Provider.of<OfferProvider>(context, listen: false);
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
              height: Sizes.s115,
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IntrinsicHeight(
                          child: Row(children: [
                        SvgPicture.asset(eSvgAssets.country,
                            colorFilter: ColorFilter.mode(
                                appColor(context).darkText, BlendMode.srcIn)),
                        VerticalDivider(
                                indent: 1,
                                endIndent: 1,
                                width: 1,
                                color: appColor(context).stroke)
                            .paddingSymmetric(horizontal: Insets.i12),
                        Text(language(context, appFonts.distanceLocation),
                            style: appCss.dmDenseMedium14
                                .textColor(appColor(context).darkText))
                      ]))
                    ]),
                SizedBox(
                    height: Sizes.s85,
                    child: FlutterSlider(
                        values: [offerPvr.slider],
                        min: 0.0,
                        max: 30.0,
                        hatchMark: FlutterSliderHatchMark(
                            density: 0.3,
                            // means 50 lines, from 0 to 100 percent
                            displayLines: true,
                            labelBox: FlutterSliderSizedBox(
                                height: 10,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: appColor(context).trans)),
                            smallLine: const FlutterSliderSizedBox(
                                width: 1, height: 1),
                            bigLine: const FlutterSliderSizedBox(
                              width: 1,
                              height: 1,
                            ),
                            labels: [
                              FlutterSliderHatchMarkLabel(
                                  percent: 0.5,
                                  label: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 4,
                                            width: 2,
                                            color: offerPvr.slider == 0.0 ||
                                                    offerPvr.slider == 5.0 ||
                                                    offerPvr.slider == 10.0 ||
                                                    offerPvr.slider == 15.0 ||
                                                    offerPvr.slider == 20.0 ||
                                                    offerPvr.slider == 25.0 ||
                                                    offerPvr.slider == 30.0
                                                ? appColor(context).darkText
                                                : appColor(context).stroke),
                                        const VSpace(Sizes.s3),
                                        Text('0\nkm',
                                            textAlign: TextAlign.center,
                                            style: appCss.dmDenseMedium12
                                                .textColor(
                                                    appColor(context).darkText)
                                                .textHeight(1))
                                      ])),
                              FlutterSliderHatchMarkLabel(
                                  percent: 17,
                                  label: Column(children: [
                                    Container(
                                        height: 4,
                                        width: 2,
                                        color: offerPvr.slider == 5.0 ||
                                                offerPvr.slider == 10.0 ||
                                                offerPvr.slider == 15.0 ||
                                                offerPvr.slider == 20.0 ||
                                                offerPvr.slider == 25.0 ||
                                                offerPvr.slider == 30.0
                                            ? appColor(context).darkText
                                            : appColor(context).stroke),
                                    const VSpace(Sizes.s3),
                                    Text('5\nkm',
                                        textAlign: TextAlign.center,
                                        style: appCss.dmDenseMedium12
                                            .textColor(
                                                appColor(context).darkText)
                                            .textHeight(1))
                                  ])),
                              FlutterSliderHatchMarkLabel(
                                  percent: 33.5,
                                  label: Column(children: [
                                    Container(
                                        height: 4,
                                        width: 2,
                                        color: offerPvr.slider == 10.0 ||
                                                offerPvr.slider == 15.0 ||
                                                offerPvr.slider == 20.0 ||
                                                offerPvr.slider == 25.0 ||
                                                offerPvr.slider == 30.0
                                            ? appColor(context).darkText
                                            : appColor(context).stroke),
                                    const VSpace(Sizes.s3),
                                    Text('10\nkm',
                                        textAlign: TextAlign.center,
                                        style: appCss.dmDenseMedium12
                                            .textColor(
                                                appColor(context).darkText)
                                            .textHeight(1))
                                  ])),
                              FlutterSliderHatchMarkLabel(
                                  percent: 50,
                                  label: Column(children: [
                                    Container(
                                        height: 4,
                                        width: 2,
                                        color: offerPvr.slider == 15.0 ||
                                                offerPvr.slider == 20.0 ||
                                                offerPvr.slider == 25.0 ||
                                                offerPvr.slider == 30.0
                                            ? appColor(context).darkText
                                            : appColor(context).stroke),
                                    const VSpace(Sizes.s3),
                                    Text('15\nkm',
                                        textAlign: TextAlign.center,
                                        style: appCss.dmDenseMedium12
                                            .textColor(
                                                appColor(context).darkText)
                                            .textHeight(1))
                                  ])),
                              FlutterSliderHatchMarkLabel(
                                  percent: 66,
                                  label: Column(children: [
                                    Container(
                                      height: 4,
                                      width: 2,
                                      color: offerPvr.slider == 20.0 ||
                                              offerPvr.slider == 25.0 ||
                                              offerPvr.slider == 30.0
                                          ? appColor(context).darkText
                                          : appColor(context).stroke,
                                    ),
                                    const VSpace(Sizes.s3),
                                    Text('20\nkm',
                                        textAlign: TextAlign.center,
                                        style: appCss.dmDenseMedium12
                                            .textColor(
                                                appColor(context).darkText)
                                            .textHeight(1))
                                  ])),
                              FlutterSliderHatchMarkLabel(
                                  percent: 84,
                                  label: Column(children: [
                                    Container(
                                        height: 4,
                                        width: 2,
                                        color: offerPvr.slider == 25.0 ||
                                                offerPvr.slider == 30.0
                                            ? appColor(context).darkText
                                            : appColor(context).stroke),
                                    const VSpace(Sizes.s3),
                                    Text('25\nkm',
                                        textAlign: TextAlign.center,
                                        style: appCss.dmDenseMedium12
                                            .textColor(
                                                appColor(context).darkText)
                                            .textHeight(1))
                                  ])),
                              FlutterSliderHatchMarkLabel(
                                  percent: 100,
                                  label: Column(children: [
                                    Container(
                                        height: 4,
                                        width: 2,
                                        color: offerPvr.slider == 30.0
                                            ? appColor(context).darkText
                                            : appColor(context).stroke),
                                    const VSpace(Sizes.s3),
                                    Text('30\nkm',
                                        textAlign: TextAlign.center,
                                        style: appCss.dmDenseMedium12
                                            .textColor(
                                                appColor(context).darkText)
                                            .textHeight(1))
                                  ]))
                            ],
                            labelsDistanceFromTrackBar: 35),
                        tooltip: FlutterSliderTooltip(
                            alwaysShowTooltip: false, disabled: true),
                        handler: FlutterSliderHandler(
                            decoration:
                                BoxDecoration(color: appColor(context).trans),
                            child: SvgPicture.asset(eSvgAssets.userSlider,
                                    height: Sizes.s28)
                                .paddingOnly(bottom: 14)),
                        trackBar: FlutterSliderTrackBar(
                            activeTrackBarHeight: 4.5,
                            activeTrackBarDraggable: true,
                            inactiveTrackBar: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appColor(context).stroke),
                            activeTrackBar: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appColor(context).darkText),
                            inactiveTrackBarHeight: 4.5,
                            inactiveDisabledTrackBarColor:
                                appColor(context).stroke,
                            activeDisabledTrackBarColor:
                                appColor(context).darkText),
                        step: const FlutterSliderStep(step: 5),
                        jump: true,
                        onDragging: (handlerIndex, lowerValue, upperValue) =>
                            offerPvr.slidingValue(lowerValue)))
              ]))
          .paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15)
          .boxBorderExtension(context, isShadow: true)
          .padding(horizontal: Insets.i10, bottom: Insets.i15)
    ]));
  }
}

class OfferCategoryModel {
  OfferCategoryModel(
      {required this.offerTypes,
      required this.responseStatus,
      required this.responseMessage});

  final List<OfferType> offerTypes;
  final int? responseStatus;
  final String? responseMessage;

  factory OfferCategoryModel.fromJson(Map<String, dynamic> json) {
    return OfferCategoryModel(
        offerTypes: json["offerTypes"] == null
            ? []
            : List<OfferType>.from(
                json["offerTypes"]!.map((x) => OfferType.fromJson(x))),
        responseStatus: json["responseStatus"],
        responseMessage: json["responseMessage"]);
  }
}

class OfferType {
  OfferType(
      {required this.offerTypeId,
      required this.icon,
      required this.name,
      required this.translatedValue,
      required this.language});

  final int? offerTypeId;
  final String? icon;
  final String? name;
  final String? translatedValue;
  final int? language;

  factory OfferType.fromJson(Map<String, dynamic> json) {
    return OfferType(
        offerTypeId: json["offerTypeId"],
        icon: json["icon"],
        name: json["name"],
        translatedValue: json["translatedValue"],
        language: json["language"]);
  }
}
