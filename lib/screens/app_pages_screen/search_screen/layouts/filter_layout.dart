import 'package:flutter/cupertino.dart';
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
                                  /*=>
                                      value.onCategoryChange(
                                          context, value.categoryList[index].id)*/
                                });
                          }))
                  : value.selectIndex == 1
                      ? SecondFilter(
                          min: value.minPrice,
                          max: value.maxPrice,
                          lowerVal: value.lowerVal,
                          upperVal: value.upperVal,
                          selectIndex: value.ratingIndex,
                          onDragging: (handlerIndex, lowerValue, upperValue) =>
                              value.onSliderChange(
                                  handlerIndex, lowerValue, upperValue))
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
                      : const ThirdFilter(),
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
