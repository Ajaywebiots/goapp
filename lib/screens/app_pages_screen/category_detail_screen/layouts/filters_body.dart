import 'dart:developer';

import '../../../../config.dart';
import '../../../../providers/app_pages_provider/categories_details_provider.dart';
import '../../../../widgets/search_text_filed_common.dart';
import '../../add_new_location/drop_down_layout.dart';
import '../../search_screen/second_filter.dart';
import '../../search_screen/third_filter.dart';
import 'experience_layout.dart';

class FiltersBody extends StatelessWidget {
  const FiltersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CategoriesDetailsProvider>(context, listen: true);
    // log("PRO :${value.providerList.length}");

    return Stack(alignment: Alignment.bottomCenter, children: [
      // value.selectIndex == 0
      /* ? Column(children: [
              Row(children: [
                Expanded(
                    child: Text(
                            "${language(context, appFonts.providerList)} (${value.providerList.length})",
                            style: appCss.dmDenseMedium14
                                .textColor(appColor(context).lightText))
                        .alignment(Alignment.centerLeft)),
                Expanded(
                    child: DropDownLayout(
                        isIcon: false,
                        val: value.exValue,
                        categoryList: appArray.experienceList,
                        onChanged: (val) => value.onExperience(val)))
              ]).paddingSymmetric(vertical: Insets.i20, horizontal: Insets.i20),
              SearchTextFieldCommon(
                controller: value.filterSearchCtrl,
                focusNode: value.filterSearchFocus,
                onChanged: (v) {
                  if (v.isEmpty) {
                    value.fetchProviderByFilter();
                  }
                },
                onFieldSubmitted: (v) => value.fetchProviderByFilter(),
              ).paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s10),
              ...value.providerList.asMap().entries.map((e) => ExperienceLayout(
                  data: e.value,
                  isContain: value.selectedProvider.contains(e.key),
                  onTap: () => value.onCategoryChange(e.key)))

              */ /*             Expanded(
                child: ListView.builder(
                    itemCount: value.providerList.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ExperienceLayout(
                          data: value.providerList[index],
                          isContain: value.selectedProvider.contains(index),
                          onTap: () =>
                              value.onCategoryChange(index));
                    }))*/ /*
            ])
          : value.selectIndex == 1
              ? SecondFilter(
                  min: 0.0,
                  max: value.maxPrice,
                  lowerVal: value.lowerVal,
                  upperVal: value.upperVal,
                  selectIndex: value.ratingIndex,
                  onDragging: (handlerIndex, lowerValue, upperValue) => value
                      .onSliderChange(handlerIndex, lowerValue, upperValue),
                  isSearch: false)
              : const ThirdFilter(),*/
    ]);
  }
}
