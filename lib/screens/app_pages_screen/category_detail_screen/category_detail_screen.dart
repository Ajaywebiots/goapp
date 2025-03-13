import 'dart:developer';


import '../../../config.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesDetailsProvider>(
        builder: (context1, value, child) {
      return StatefulWrapper(
        onInit: () => Future.delayed(DurationClass.ms50)
            .then((val) => value.onReady(context)),
        child: LoadingComponent(
          child: Scaffold(
              appBar: AppBarCommon(title: value.categoryModel != null ? value.categoryModel!.title : ""),
              body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SearchTextFieldCommon(
                        controller: value.searchCtrl,
                      focusNode: value.searchFocus,
                        onChanged: (v){
                          if(v.isEmpty){
                            value.getServiceByCategoryId(context,value.categoryModel!.hasSubCategories != null &&
                                value.categoryModel!.hasSubCategories!.isNotEmpty ?value.categoryModel!.hasSubCategories![0].id :value.categoryModel!.id);
                          }
                        },
                        onFieldSubmitted: (v) =>
                            value.getServiceByCategoryId(context,value.categoryModel!.hasSubCategories != null &&
                                value.categoryModel!.hasSubCategories!.isNotEmpty ?value.categoryModel!.hasSubCategories![0].id :value.categoryModel!.id),
                        suffixIcon: FilterIconCommon(
                            selectedFilter: value.totalCountFilter().toString(),
                            onTap: () =>
                                value.onBottomSheet(context))).paddingSymmetric(
                        horizontal: Insets.i20),
                      if (value.categoryModel != null &&
                        value.categoryModel!.hasSubCategories != null &&
                        value.categoryModel!.hasSubCategories!.isNotEmpty)
                    Text(language(context, appFonts.subCategories),
                            style: appCss.dmDenseBold16
                                .textColor(appColor(context).appTheme.darkText))
                        .paddingOnly(
                      top: Insets.i25,
                      left: rtl(context) ? 0 : Insets.i20,
                      right: rtl(context) ? Insets.i20 : 0,
                    ),
                    if (value.categoryModel != null &&
                        value.categoryModel!.hasSubCategories != null &&
                        value.categoryModel!.hasSubCategories!.isNotEmpty)
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                                  children: value.categoryModel!.hasSubCategories!
                                      .asMap()
                                      .entries
                                      .map((e) => TopCategoriesLayout(
                                          index: e.key,
                                          data: e.value,
                                          selectedIndex: value.selectedIndex,
                                          onTap: () => value.onSubCategories(
                                              context, e.key, e.value.id)).paddingOnly(right: Insets.i20))
                                      .toList())
                              .padding(vertical: Insets.i15, left: Insets.i20)),
                        Consumer<CartProvider>(
                            builder: (context2, cart, child) {
                        return Column(
                          children: value.serviceList
                              .asMap()
                              .entries
                              .map((e) => FeaturedServicesLayout(
                                      data: e.value,
                                      isProvider: false,
                              inCart: isInCart(context, e.value.id),
                                      addTap: () => value.getProviderById(
                                          context, e.value.userId, e.key, e.value),
                                      onTap: () =>
                                          value.getServiceById(context, e.value.id))
                                  .paddingSymmetric(horizontal: Insets.i20))
                              .toList(),
                        ).marginOnly(top: Insets.i15);
                      }
                    )
                  ]))),
        ),
      );
    });
  }
}
