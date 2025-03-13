import '../../../config.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context, listen: true);

    return Consumer<CategoriesListProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
        onInit: () => Future.delayed(DurationClass.ms50)
            .then((vaj) => value.onReady(context, dash)),
        child: Scaffold(
            appBar: AppBar(
                leadingWidth: 80,
                title: Text(language(context, appFonts.categories),
                    style: appCss.dmDenseBold18
                        .textColor(appColor(context).appTheme.darkText)),
                centerTitle: true,
                leading: CommonArrow(
                    arrow: rtl(context)
                        ? eSvgAssets.arrowRight
                        : eSvgAssets.arrowLeft,
                    onTap: () => route.pop(context)).paddingAll(Insets.i8),
                actions: [
                  CommonArrow(
                      arrow: value.isGrid ? eSvgAssets.list : eSvgAssets.grid,
                      onTap: () =>
                          value.onGrid()).paddingOnly(
                      left: rtl(context) ? Insets.i20 : 0,
                      right: rtl(context) ? 0 : Insets.i20)
                ]),
            body: SingleChildScrollView(
                child: Column(children: [
              SearchTextFieldCommon(
                controller: value.searchCtrl,
                focusNode: value.searchFocus,
                onChanged: (v){
                  if(v.isEmpty){
                    value.searchCategory(context);
                  }
                },
                onFieldSubmitted: (v) => value.searchCategory(context),
                color: value.searchCtrl.text.isEmpty
                    ? appColor(context).appTheme.lightText
                    : appColor(context).appTheme.darkText,
              ),
              const VSpace(Sizes.s20),
              value.isGrid
                  ? GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: value.categoryList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisExtent: Sizes.s90,
                              mainAxisSpacing: Sizes.s10,
                              crossAxisSpacing: Sizes.s10),
                      itemBuilder: (context, index) {
                        // Top Categories lists
                        return TopCategoriesLayout(
                            index: index,
                            selectedIndex: dash.topSelected,
                            data: value.categoryList[index],
                            onTap: () => route.pushNamed(
                                context, routeName.categoriesDetailsScreen,
                                arg: value.categoryList[index]));
                      })
                  : Column(
                      children: value.categoryList
                          .asMap()
                          .entries
                          .map((e) => CategoriesListLayout(
                              data: e.value,
                              onTap: () => route.pushNamed(
                                  context, routeName.categoriesDetailsScreen,
                                  arg: e.value)))
                          .toList())
            ]).paddingAll(Insets.i20))),
      );
    });
  }
}
