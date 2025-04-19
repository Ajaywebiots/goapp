import 'package:flutter/cupertino.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:goapp/providers/app_pages_provider/categories_list_provider.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';
import 'package:goapp/screens/app_pages_screen/search_screen/layouts/second_filter.dart';
import 'package:goapp/screens/app_pages_screen/search_screen/layouts/third_filter.dart';
import '../../../../config.dart';
import '../../../../providers/app_pages_provider/latest_blog_details_provider.dart';
import '../../../../providers/app_pages_provider/search_provider.dart';
import '../filter_tap_layout.dart';
import 'list_tile_common.dart';

class FilterLayout extends StatelessWidget {
  final value1;

  const FilterLayout(this.value1, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, value, child) {
      return SizedBox(
          height: MediaQuery.of(context).size.height / 1.14,
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(language(context, appFonts.filterBy),
                    style: appCss.dmDenseMedium18
                        .textColor(appColor(context).darkText)),
                Icon(CupertinoIcons.multiply, color: appColor(context).darkText)
                    .inkWell(onTap: () => route.pop(context))
              ]).paddingSymmetric(horizontal: Insets.i20),
              Container(
                      alignment: Alignment.center,
                      height: Sizes.s50,
                      decoration: BoxDecoration(
                          color: appColor(context).fieldCardBg,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppRadius.r30))),
                      child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: appArray.filterList
                                  .asMap()
                                  .entries
                                  .map((e) => FilterTapLayout(
                                      data: e.value,
                                      index: e.key,
                                      selectedIndex: value.selectIndex,
                                      onTap: () => value.onFilter(e.key)))
                                  .toList())
                          .paddingAll(Insets.i5))
                  .paddingOnly(
                      top: Insets.i25,
                      bottom: (value.selectIndex == 0 || value.selectIndex == 2)
                          ? Insets.i20
                          : 0,
                      left: Insets.i20,
                      right: Insets.i20),
              if (value.selectIndex == 0)
                Text(language(context, appFonts.categoryList),
                        style: appCss.dmDenseRegular14
                            .textColor(appColor(context).lightText))
                    .paddingSymmetric(horizontal: Insets.i20),
              if (value.selectIndex == 0) const VSpace(Sizes.s15),
              // if (value.selectIndex == 0)
              //   SearchTextFieldCommon(
              //       controller: value.filterSearchCtrl,
              //       focusNode: value.filterSearchFocus,
              //       onChanged: (v) {
              //         if (v.isEmpty) {
              //           log("v.isEmpty:${v.isEmpty}");
              //           if (value.selectIndex == 0) {
              //             value.getCategory();
              //           }
              //         }
              //       },
              //       onFieldSubmitted: (v) {
              //         if (value.selectIndex == 0) {
              //           value.getCategory(search: value.filterSearchCtrl.text);
              //         }
              //       }).paddingSymmetric(horizontal: Insets.i20),
              if (value.selectIndex == 0) const VSpace(Sizes.s15),
              Expanded(
                  child: Column(children: [
                value.selectIndex == 0
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: value1.categoryList.length,
                            //physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return ListTileLayout(
                                  data: value1.categoryList[index],
                                  selectedCategory: value.selectedCategory,
                                  onTap: () {
                                    value.onCategoryChange(context,
                                        value.categoryList[index].categoryId);
                                  });
                            }))
                    : value.selectIndex == 1
                        ? SecondFilter(
                            min: value.minPrice,
                            max: value.maxPrice,
                            lowerVal: value.lowerVal,
                            upperVal: value.upperVal,
                            selectIndex: value.ratingIndex,
                            onDragging:
                                (handlerIndex, lowerValue, upperValue) =>
                                    value.onSliderChange(
                                        handlerIndex, lowerValue, upperValue))
                        : SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(language(context, appFonts.distance),
                                        style: appCss.dmDenseMedium14.textColor(
                                            appColor(context).lightText))
                                    .padding(
                                        horizontal: Insets.i20,
                                        bottom: Insets.i10),
                                SizedBox(
                                        height: Sizes.s115,
                                        child: Column(children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IntrinsicHeight(
                                                    child: Row(children: [
                                                  SvgPicture.asset(
                                                      eSvgAssets.country,
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                              appColor(context)
                                                                  .darkText,
                                                              BlendMode.srcIn)),
                                                  VerticalDivider(
                                                          indent: 1,
                                                          endIndent: 1,
                                                          width: 1,
                                                          color:
                                                              appColor(context)
                                                                  .stroke)
                                                      .paddingSymmetric(
                                                          horizontal:
                                                              Insets.i12),
                                                  Text(
                                                      language(
                                                          context,
                                                          appFonts
                                                              .distanceLocation),
                                                      style: appCss
                                                          .dmDenseMedium14
                                                          .textColor(
                                                              appColor(context)
                                                                  .darkText))
                                                ]))
                                              ]),
                                          SizedBox(
                                              height: Sizes.s85,
                                              child: FlutterSlider(
                                                  values: [value.slider],
                                                  min: 0.0,
                                                  max: 30.0,
                                                  hatchMark:
                                                      FlutterSliderHatchMark(
                                                          density: 0.3,
                                                          // means 50 lines, from 0 to 100 percent
                                                          displayLines: true,
                                                          labelBox: FlutterSliderSizedBox(
                                                              height: 10,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                  color: appColor(
                                                                          context)
                                                                      .trans)),
                                                          smallLine:
                                                              const FlutterSliderSizedBox(
                                                                  width: 1,
                                                                  height: 1),
                                                          bigLine:
                                                              const FlutterSliderSizedBox(
                                                            width: 1,
                                                            height: 1,
                                                          ),
                                                          labels: [
                                                            FlutterSliderHatchMarkLabel(
                                                                percent: 0.5,
                                                                label: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                          height:
                                                                              4,
                                                                          width:
                                                                              2,
                                                                          color: value.slider == 0.0 || value.slider == 5.0 || value.slider == 10.0 || value.slider == 15.0 || value.slider == 20.0 || value.slider == 25.0 || value.slider == 30.0
                                                                              ? appColor(context).darkText
                                                                              : appColor(context).stroke),
                                                                      const VSpace(
                                                                          Sizes
                                                                              .s3),
                                                                      Text(
                                                                          '0\nkm',
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          style: appCss
                                                                              .dmDenseMedium12
                                                                              .textColor(appColor(context).darkText)
                                                                              .textHeight(1))
                                                                    ])),
                                                            FlutterSliderHatchMarkLabel(
                                                                percent: 17,
                                                                label: Column(
                                                                    children: [
                                                                      Container(
                                                                          height:
                                                                              4,
                                                                          width:
                                                                              2,
                                                                          color: value.slider == 5.0 || value.slider == 10.0 || value.slider == 15.0 || value.slider == 20.0 || value.slider == 25.0 || value.slider == 30.0
                                                                              ? appColor(context).darkText
                                                                              : appColor(context).stroke),
                                                                      const VSpace(
                                                                          Sizes
                                                                              .s3),
                                                                      Text(
                                                                          '5\nkm',
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          style: appCss
                                                                              .dmDenseMedium12
                                                                              .textColor(appColor(context).darkText)
                                                                              .textHeight(1))
                                                                    ])),
                                                            FlutterSliderHatchMarkLabel(
                                                                percent: 33.5,
                                                                label: Column(
                                                                    children: [
                                                                      Container(
                                                                          height:
                                                                              4,
                                                                          width:
                                                                              2,
                                                                          color: value.slider == 10.0 || value.slider == 15.0 || value.slider == 20.0 || value.slider == 25.0 || value.slider == 30.0
                                                                              ? appColor(context).darkText
                                                                              : appColor(context).stroke),
                                                                      const VSpace(
                                                                          Sizes
                                                                              .s3),
                                                                      Text(
                                                                          '10\nkm',
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          style: appCss
                                                                              .dmDenseMedium12
                                                                              .textColor(appColor(context).darkText)
                                                                              .textHeight(1))
                                                                    ])),
                                                            FlutterSliderHatchMarkLabel(
                                                                percent: 50,
                                                                label: Column(
                                                                    children: [
                                                                      Container(
                                                                          height:
                                                                              4,
                                                                          width:
                                                                              2,
                                                                          color: value.slider == 15.0 || value.slider == 20.0 || value.slider == 25.0 || value.slider == 30.0
                                                                              ? appColor(context).darkText
                                                                              : appColor(context).stroke),
                                                                      const VSpace(
                                                                          Sizes
                                                                              .s3),
                                                                      Text(
                                                                          '15\nkm',
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          style: appCss
                                                                              .dmDenseMedium12
                                                                              .textColor(appColor(context).darkText)
                                                                              .textHeight(1))
                                                                    ])),
                                                            FlutterSliderHatchMarkLabel(
                                                                percent: 66,
                                                                label: Column(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            4,
                                                                        width:
                                                                            2,
                                                                        color: value.slider == 20.0 ||
                                                                                value.slider == 25.0 ||
                                                                                value.slider == 30.0
                                                                            ? appColor(context).darkText
                                                                            : appColor(context).stroke,
                                                                      ),
                                                                      const VSpace(
                                                                          Sizes
                                                                              .s3),
                                                                      Text(
                                                                          '20\nkm',
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          style: appCss
                                                                              .dmDenseMedium12
                                                                              .textColor(appColor(context).darkText)
                                                                              .textHeight(1))
                                                                    ])),
                                                            FlutterSliderHatchMarkLabel(
                                                                percent: 84,
                                                                label: Column(
                                                                  children: [
                                                                    Container(
                                                                      height: 4,
                                                                      width: 2,
                                                                      color: value.slider == 25.0 ||
                                                                              value.slider ==
                                                                                  30.0
                                                                          ? appColor(context)
                                                                              .darkText
                                                                          : appColor(context)
                                                                              .stroke,
                                                                    ),
                                                                    const VSpace(
                                                                        Sizes
                                                                            .s3),
                                                                    Text(
                                                                        '25\nkm',
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style: appCss
                                                                            .dmDenseMedium12
                                                                            .textColor(appColor(context).darkText)
                                                                            .textHeight(1)),
                                                                  ],
                                                                )),
                                                            FlutterSliderHatchMarkLabel(
                                                                percent: 100,
                                                                label: Column(
                                                                  children: [
                                                                    Container(
                                                                      height: 4,
                                                                      width: 2,
                                                                      color: value.slider ==
                                                                              30.0
                                                                          ? appColor(context)
                                                                              .darkText
                                                                          : appColor(context)
                                                                              .stroke,
                                                                    ),
                                                                    const VSpace(
                                                                        Sizes
                                                                            .s3),
                                                                    Text(
                                                                        '30\nkm',
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style: appCss
                                                                            .dmDenseMedium12
                                                                            .textColor(appColor(context).darkText)
                                                                            .textHeight(1)),
                                                                  ],
                                                                )),
                                                          ],
                                                          labelsDistanceFromTrackBar:
                                                              35),
                                                  tooltip: FlutterSliderTooltip(
                                                      alwaysShowTooltip: false,
                                                      disabled: true),
                                                  handler: FlutterSliderHandler(
                                                      decoration: BoxDecoration(
                                                          color:
                                                              appColor(context)
                                                                  .trans),
                                                      child: SvgPicture.asset(
                                                        eSvgAssets.userSlider,
                                                        height: Sizes.s28,
                                                      ).paddingOnly(
                                                          bottom: 14)),
                                                  trackBar: FlutterSliderTrackBar(
                                                      activeTrackBarHeight: 4.5,
                                                      activeTrackBarDraggable:
                                                          true,
                                                      inactiveTrackBar: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(10),
                                                          color: appColor(context).stroke),
                                                      activeTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(10), color: appColor(context).darkText),
                                                      inactiveTrackBarHeight: 4.5,
                                                      inactiveDisabledTrackBarColor: appColor(context).stroke,
                                                      activeDisabledTrackBarColor: appColor(context).darkText),
                                                  step: const FlutterSliderStep(step: 5),
                                                  jump: true,
                                                  onDragging: (handlerIndex, lowerValue, upperValue) => value.slidingValue(lowerValue)))
                                        ]))
                                    .paddingSymmetric(
                                        vertical: Insets.i12,
                                        horizontal: Insets.i15)
                                    .boxBorderExtension(context, isShadow: true)
                                    .padding(
                                        horizontal: Insets.i20,
                                        bottom: Insets.i15)
                              ]))
              ]))
            ])
                .paddingSymmetric(vertical: Insets.i20)
                .marginOnly(bottom: Insets.i50),
            Align(
                alignment: Alignment.bottomCenter,
                child: BottomSheetButtonCommon(
                    textOne: appFonts.clearAll,
                    textTwo: appFonts.apply,
                    applyTap: () {
                      value.searchService(context, isPop: true);
                    },
                    clearTap: () => value.clearFilter(context)))
          ])).bottomSheetExtension(context);
    });
  }
}

// class FilterLayout1 extends StatelessWidget {
//   final blogPvr;
//
//   const FilterLayout1(this.blogPvr, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
// final value = Provider.of<SearchProvider>(context, listen: true);
// final blogFilter = Provider.of<HomeScreenProvider>(context, listen: true);
//
//     return ;
//   }
// }

class FilterLayout2 extends StatelessWidget {
  const FilterLayout2({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<SearchProvider>(context, listen: true);

    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.14,
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(language(context, appFonts.filterBy),
                  style: appCss.dmDenseMedium18
                      .textColor(appColor(context).darkText)),
              const Icon(CupertinoIcons.multiply)
                  .inkWell(onTap: () => route.pop(context))
            ]).paddingSymmetric(horizontal: Insets.i20),

            Container(
                    alignment: Alignment.center,
                    height: Sizes.s50,
                    decoration: BoxDecoration(
                        color: appColor(context).fieldCardBg,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r30))),
                    child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: appArray.filterList1
                                .asMap()
                                .entries
                                .map((e) => FilterTapLayout(
                                    data: e.value,
                                    index: e.key,
                                    selectedIndex: value.selectIndex,
                                    onTap: () => value.onFilter(e.key)))
                                .toList())
                        .paddingAll(Insets.i5))
                .paddingOnly(
                    top: Insets.i25,
                    bottom: (value.selectIndex == 0 || value.selectIndex == 2)
                        ? Insets.i20
                        : 0,
                    left: Insets.i20,
                    right: Insets.i20),

            if (value.selectIndex == 0)
              Text(language(context, appFonts.businessCategoryList),
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).lightText))
                  .paddingSymmetric(horizontal: Insets.i20),
            if (value.selectIndex == 1)
              Text(language(context, appFonts.couponTypeList),
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).lightText))
                  .paddingSymmetric(horizontal: Insets.i20, vertical: 15),
            if (value.selectIndex == 0) const VSpace(Sizes.s15),
            // if (value.selectIndex == 0)
            //   SearchTextFieldCommon(
            //       controller: value.filterSearchCtrl,
            //       focusNode: value.filterSearchFocus,
            //       onChanged: (v) {
            //         if (v.isEmpty) {
            //           log("v.isEmpty:${v.isEmpty}");
            //           if (value.selectIndex == 0) {
            //             value.getCategory();
            //           }
            //         }
            //       },
            //       onFieldSubmitted: (v) {
            //         if (value.selectIndex == 0) {
            //           value.getCategory(search: value.filterSearchCtrl.text);
            //         }
            //       }).paddingSymmetric(horizontal: Insets.i20),
            if (value.selectIndex == 0) const VSpace(Sizes.s15),
            Expanded(
                child: Column(children: [
              value.selectIndex == 0
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: value.categoryList.length,
                          //physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return ListTileLayout(
                                data: value.categoryList[index],
                                selectedCategory: value.selectedCategory,
                                onTap:
                                    () {} /*=> value.onCategoryChange(
                                    context, value.categoryList[index].id)*/
                                );
                          }))
                  : value.selectIndex == 1
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: value.type.length,
                              //physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return ListTileLayout(
                                    data: value.type[index],
                                    selectedCategory: value.selectedCategory,
                                    onTap: () => value.onCategoryChange(
                                        context, value.type[index].id));
                              }))
                      : const ThirdFilter()
            ]))
          ])
              .paddingSymmetric(vertical: Insets.i20)
              .marginOnly(bottom: Insets.i50),
          Align(
              alignment: Alignment.bottomCenter,
              child: BottomSheetButtonCommon(
                  textOne: appFonts.clearAll,
                  textTwo: appFonts.apply,
                  applyTap: () {
                    value.searchService(context, isPop: true);
                  },
                  clearTap: () => value.clearFilter(context)))
        ])).bottomSheetExtension(context);
  }
}
