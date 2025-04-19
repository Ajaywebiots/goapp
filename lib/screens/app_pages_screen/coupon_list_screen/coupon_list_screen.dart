import 'package:flutter/cupertino.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:goapp/providers/bottom_providers/offer_provider.dart';

import '../../../config.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../providers/common_providers/common_api_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../search_screen/filter_tap_layout.dart' show FilterTapLayout;
import '../search_screen/layouts/list_tile_common.dart';
import 'layouts/coupon_layout.dart';

class CouponListScreen extends StatefulWidget {
  final bool isHomeScreen;

  const CouponListScreen({super.key, this.isHomeScreen = false});

  @override
  State<CouponListScreen> createState() => _CouponListScreenState();
}

class _CouponListScreenState extends State<CouponListScreen> {
  // bool isArg = false;

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
                        }
                      }),
                  body: SafeArea(
                    child: SingleChildScrollView(
                        child: Column(children: [
                      SearchTextFieldCommon(
                          controller: offerPvr.searchCtrl,
                          focusNode: offerPvr.searchFocus,
                          suffixIcon: FilterIconCommon(
                              selectedFilter: 0.toString(),
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return SafeArea(
                                          child: SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.14,
                                                  child: Stack(children: [
                                                    Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                          Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    language(
                                                                        context,
                                                                        appFonts
                                                                            .filterBy),
                                                                    style: appCss
                                                                        .dmDenseMedium18
                                                                        .textColor(
                                                                            appColor(context).darkText)),
                                                                const Icon(CupertinoIcons
                                                                        .multiply)
                                                                    .inkWell(
                                                                        onTap: () =>
                                                                            route.pop(context))
                                                              ]).paddingSymmetric(
                                                              horizontal:
                                                                  Insets.i20),
                                                          Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height:
                                                                      Sizes.s50,
                                                                  decoration: BoxDecoration(
                                                                      color: appColor(context)
                                                                          .fieldCardBg,
                                                                      borderRadius:
                                                                          const BorderRadius.all(Radius.circular(AppRadius
                                                                              .r30))),
                                                                  child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment
                                                                              .center,
                                                                          children: appArray
                                                                              .filterList1
                                                                              .asMap()
                                                                              .entries
                                                                              .map((e) =>
                                                                                  FilterTapLayout(
                                                                                    data: e.value,
                                                                                    index: e.key,
                                                                                    selectedIndex: offerPvr.selectIndex,
                                                                                    onTap: () => offerPvr.onFilter(e.key),
                                                                                  ))
                                                                              .toList())
                                                                      .paddingAll(
                                                                          Insets
                                                                              .i5))
                                                              .paddingOnly(
                                                                  top:
                                                                      Insets.i25,
                                                                  bottom: (offerPvr.selectIndex == 0 || offerPvr.selectIndex == 2) ? Insets.i20 : 0,
                                                                  left: Insets.i20,
                                                                  right: Insets.i20),
                                                          if (offerPvr
                                                                  .selectIndex ==
                                                              0)
                                                            Text(
                                                                    language(
                                                                        context,
                                                                        appFonts
                                                                            .blogCategoryList),
                                                                    style: appCss
                                                                        .dmDenseRegular14
                                                                        .textColor(appColor(context)
                                                                            .lightText))
                                                                .paddingSymmetric(
                                                                    horizontal:
                                                                        Insets
                                                                            .i20),
                                                          if (offerPvr
                                                                  .selectIndex ==
                                                              1)
                                                            Text(
                                                                    language(
                                                                        context,
                                                                        appFonts
                                                                            .couponTypeList),
                                                                    style: appCss
                                                                        .dmDenseRegular14
                                                                        .textColor(appColor(context)
                                                                            .lightText))
                                                                .paddingSymmetric(
                                                                    horizontal:
                                                                        Insets
                                                                            .i20,
                                                                    vertical:
                                                                        15),
                                                          if (offerPvr
                                                                  .selectIndex ==
                                                              0)
                                                            const VSpace(
                                                                Sizes.s15),
                                                          if (offerPvr
                                                                  .selectIndex ==
                                                              0)
                                                            const VSpace(
                                                                Sizes.s15),
                                                          Expanded(
                                                              child: Column(
                                                                  children: [
                                                                offerPvr.selectIndex ==
                                                                        0
                                                                    ? Expanded(
                                                                        child: ListView.builder(
                                                                            itemCount: offerPvr.categoryList.length,
                                                                            //physics: const NeverScrollableScrollPhysics(),
                                                                            shrinkWrap: true,
                                                                            padding: EdgeInsets.zero,
                                                                            itemBuilder: (context, index) {
                                                                              return ListTileLayout(data: offerPvr.categoryList[index], selectedCategory: offerPvr.selectedCategory, onTap: () {} /*=> value.onCategoryChange(
                                      context, value.categoryList[index].id)*/
                                                                                  );
                                                                            }))
                                                                    : offerPvr.selectIndex == 1
                                                                        ? Expanded(
                                                                            child: ListView.builder(
                                                                                itemCount: offerPvr.type.length,
                                                                                //physics: const NeverScrollableScrollPhysics(),
                                                                                shrinkWrap: true,
                                                                                padding: EdgeInsets.zero,
                                                                                itemBuilder: (context, index) {
                                                                                  return ListTileLayout(data: offerPvr.type[index], selectedCategory: offerPvr.selectedCategory, onTap: () => offerPvr.onCategoryChange(context, offerPvr.type[index].id));
                                                                                }))
                                                                        : SingleChildScrollView(
                                                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                            Text(language(context, appFonts.distance), style: appCss.dmDenseMedium14.textColor(appColor(context).lightText)).padding(
                                                                                horizontal: Insets.i20,
                                                                                bottom: Insets.i10),
                                                                            SizedBox(
                                                                                height: Sizes.s115,
                                                                                child: Column(children: [
                                                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                    IntrinsicHeight(
                                                                                        child: Row(children: [
                                                                                      SvgPicture.asset(eSvgAssets.country, colorFilter: ColorFilter.mode(appColor(context).darkText, BlendMode.srcIn)),
                                                                                      VerticalDivider(indent: 1, endIndent: 1, width: 1, color: appColor(context).stroke).paddingSymmetric(horizontal: Insets.i12),
                                                                                      Text(language(context, appFonts.distanceLocation), style: appCss.dmDenseMedium14.textColor(appColor(context).darkText))
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
                                                                                              labelBox: FlutterSliderSizedBox(height: 10, width: 20, decoration: BoxDecoration(color: appColor(context).trans)),
                                                                                              smallLine: const FlutterSliderSizedBox(width: 1, height: 1),
                                                                                              bigLine: const FlutterSliderSizedBox(
                                                                                                width: 1,
                                                                                                height: 1,
                                                                                              ),
                                                                                              labels: [
                                                                                                FlutterSliderHatchMarkLabel(
                                                                                                    percent: 0.5,
                                                                                                    label: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                                      Container(height: 4, width: 2, color: offerPvr.slider == 0.0 || offerPvr.slider == 5.0 || offerPvr.slider == 10.0 || offerPvr.slider == 15.0 || offerPvr.slider == 20.0 || offerPvr.slider == 25.0 || offerPvr.slider == 30.0 ? appColor(context).darkText : appColor(context).stroke),
                                                                                                      const VSpace(Sizes.s3),
                                                                                                      Text('0\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1))
                                                                                                    ])),
                                                                                                FlutterSliderHatchMarkLabel(
                                                                                                    percent: 17,
                                                                                                    label: Column(children: [
                                                                                                      Container(height: 4, width: 2, color: offerPvr.slider == 5.0 || offerPvr.slider == 10.0 || offerPvr.slider == 15.0 || offerPvr.slider == 20.0 || offerPvr.slider == 25.0 || offerPvr.slider == 30.0 ? appColor(context).darkText : appColor(context).stroke),
                                                                                                      const VSpace(Sizes.s3),
                                                                                                      Text('5\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1))
                                                                                                    ])),
                                                                                                FlutterSliderHatchMarkLabel(
                                                                                                    percent: 33.5,
                                                                                                    label: Column(children: [
                                                                                                      Container(height: 4, width: 2, color: offerPvr.slider == 10.0 || offerPvr.slider == 15.0 || offerPvr.slider == 20.0 || offerPvr.slider == 25.0 || offerPvr.slider == 30.0 ? appColor(context).darkText : appColor(context).stroke),
                                                                                                      const VSpace(Sizes.s3),
                                                                                                      Text('10\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1))
                                                                                                    ])),
                                                                                                FlutterSliderHatchMarkLabel(
                                                                                                    percent: 50,
                                                                                                    label: Column(children: [
                                                                                                      Container(height: 4, width: 2, color: offerPvr.slider == 15.0 || offerPvr.slider == 20.0 || offerPvr.slider == 25.0 || offerPvr.slider == 30.0 ? appColor(context).darkText : appColor(context).stroke),
                                                                                                      const VSpace(Sizes.s3),
                                                                                                      Text('15\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1))
                                                                                                    ])),
                                                                                                FlutterSliderHatchMarkLabel(
                                                                                                    percent: 66,
                                                                                                    label: Column(children: [
                                                                                                      Container(
                                                                                                        height: 4,
                                                                                                        width: 2,
                                                                                                        color: offerPvr.slider == 20.0 || offerPvr.slider == 25.0 || offerPvr.slider == 30.0 ? appColor(context).darkText : appColor(context).stroke,
                                                                                                      ),
                                                                                                      const VSpace(Sizes.s3),
                                                                                                      Text('20\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1))
                                                                                                    ])),
                                                                                                FlutterSliderHatchMarkLabel(
                                                                                                    percent: 84,
                                                                                                    label: Column(
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          height: 4,
                                                                                                          width: 2,
                                                                                                          color: offerPvr.slider == 25.0 || offerPvr.slider == 30.0 ? appColor(context).darkText : appColor(context).stroke,
                                                                                                        ),
                                                                                                        const VSpace(Sizes.s3),
                                                                                                        Text('25\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1)),
                                                                                                      ],
                                                                                                    )),
                                                                                                FlutterSliderHatchMarkLabel(
                                                                                                    percent: 100,
                                                                                                    label: Column(
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          height: 4,
                                                                                                          width: 2,
                                                                                                          color: offerPvr.slider == 30.0 ? appColor(context).darkText : appColor(context).stroke,
                                                                                                        ),
                                                                                                        const VSpace(Sizes.s3),
                                                                                                        Text('30\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1)),
                                                                                                      ],
                                                                                                    )),
                                                                                              ],
                                                                                              labelsDistanceFromTrackBar: 35),
                                                                                          tooltip: FlutterSliderTooltip(alwaysShowTooltip: false, disabled: true),
                                                                                          handler: FlutterSliderHandler(
                                                                                              decoration: BoxDecoration(color: appColor(context).trans),
                                                                                              child: SvgPicture.asset(
                                                                                                eSvgAssets.userSlider,
                                                                                                height: Sizes.s28,
                                                                                              ).paddingOnly(bottom: 14)),
                                                                                          trackBar: FlutterSliderTrackBar(activeTrackBarHeight: 4.5, activeTrackBarDraggable: true, inactiveTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(10), color: appColor(context).stroke), activeTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(10), color: appColor(context).darkText), inactiveTrackBarHeight: 4.5, inactiveDisabledTrackBarColor: appColor(context).stroke, activeDisabledTrackBarColor: appColor(context).darkText),
                                                                                          step: const FlutterSliderStep(step: 5),
                                                                                          jump: true,
                                                                                          onDragging: (handlerIndex, lowerValue, upperValue) => offerPvr.slidingValue(lowerValue)))
                                                                                ])).paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15).boxBorderExtension(context, isShadow: true).padding(horizontal: Insets.i20, bottom: Insets.i15)
                                                                          ]))
                                                              ]))
                                                        ])
                                                        .paddingSymmetric(
                                                            vertical:
                                                                Insets.i20)
                                                        .marginOnly(
                                                            bottom: Insets.i50),
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child:
                                                            BottomSheetButtonCommon(
                                                                textOne: appFonts
                                                                    .clearAll,
                                                                textTwo:
                                                                    appFonts
                                                                        .apply,
                                                                applyTap: () {
                                                                  offerPvr.searchService(
                                                                      context,
                                                                      isPop:
                                                                          true);
                                                                },
                                                                clearTap: () =>
                                                                    offerPvr.clearFilter(
                                                                        context)))
                                                  ]))
                                              .bottomSheetExtension(context));
                                    });
                              })),
                      VSpace(Insets.i22),
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
                                    onSuccess: () => Provider.of<OfferProvider>(
                                            context,
                                            listen: false)
                                        .getViewAllOfferAPI());
                              },
                              data: e.value,
                              onTap: () {
                                offerPvr.offerDetailsAPI(context, e.value.id);
                                // route.pushNamed(
                                //     context, routeName.offerDetailsScreen);
                                // route.pop(context, arg: e.value);
                              }))
                    ]).paddingSymmetric(horizontal: Insets.i20)),
                  ))));
    });
  }
}
