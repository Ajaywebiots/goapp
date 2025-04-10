import 'package:flutter/cupertino.dart';
import '../../../../config.dart';
import '../../../../providers/app_pages_provider/categories_details_provider.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';
import '../../search_screen/filter_tap_layout.dart';
import '../../search_screen/layouts/list_tile_common.dart';
import 'filters_body.dart';

class CategoriesFilterLayout extends StatelessWidget {
  const CategoriesFilterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CategoriesDetailsProvider>(context, listen: true);
    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.2,
        child: Stack(children: [
          SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                        bottom: Insets.i10,
                        left: Insets.i20,
                        right: Insets.i20),
                const FiltersBody(),
                const VSpace(Sizes.s50)
              ]).paddingSymmetric(vertical: Insets.i20)),
          BottomSheetButtonCommon(
                  textOne: appFonts.clearAll,
                  textTwo: appFonts.apply,
                  applyTap: () {
                    route.pop(context);
                    // value.getServiceByCategoryId(
                    //     context, value.categoryModel!.id);
                  },
                  clearTap: () => value.clearFilter(context))
              .backgroundColor(appColor(context).whiteColor)
              .alignment(Alignment.bottomCenter)
        ])).bottomSheetExtension(context);
  }
}

class CouponFilterLayout extends StatelessWidget {
  const CouponFilterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CategoriesDetailsProvider>(context, listen: true);
    final blogFilter = Provider.of<HomeScreenProvider>(context, listen: true);

    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.2,
        child: Stack(children: [
          SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                        bottom: Insets.i10,
                        left: Insets.i20,
                        right: Insets.i20),
                // const FiltersBody(),
                Column(children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: blogFilter.blogFilterList.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return ListTileLayout(
                                data: blogFilter.blogFilterList[index],
                                selectedCategory: blogFilter.selectedCategory,
                                onTap: () => blogFilter.onCategoryChange(
                                    context,
                                    blogFilter.blogFilterList[index].id));
                          }))
                ]),
                const VSpace(Sizes.s50)
              ]).paddingSymmetric(vertical: Insets.i20)),
          BottomSheetButtonCommon(
                  textOne: appFonts.clearAll,
                  textTwo: appFonts.apply,
                  applyTap: () {
                    route.pop(context);
                    // value.getServiceByCategoryId(
                    //     context, value.categoryModel!.id);
                  },
                  clearTap: () => value.clearFilter(context))
              .backgroundColor(appColor(context).whiteColor)
              .alignment(Alignment.bottomCenter)
        ])).bottomSheetExtension(context);
  }
}
