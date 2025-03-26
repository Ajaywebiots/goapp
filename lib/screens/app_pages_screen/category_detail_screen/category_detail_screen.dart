import '../../../config.dart';
import '../../../providers/app_pages_provider/categories_details_provider.dart';
import '../../../providers/app_pages_provider/categories_list_provider.dart';
import '../../../providers/app_pages_provider/search_provider.dart';
import '../../../providers/bottom_providers/cart_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../../bottom_screens/home_screen/layouts/featured_business_layout.dart';
import '../../bottom_screens/home_screen/layouts/top_categories_layout.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer2<CategoriesDetailsProvider, CategoriesListProvider>(
        builder: (context1, value, value1, child) {
      final search = Provider.of<SearchProvider>(context, listen: true);
      return StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms50).then((val) {
                search.onAnimate(context, this);
                value.onReady(context);
              }),
          child: LoadingComponent(
              child: DirectionalityRtl(
            child: Scaffold(
                appBar: AppBarCommon(title: appFonts.search),
                body: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SearchTextFieldCommon(
                              focusNode: value.searchFocus,
                              controller: search.searchCtrl,
                              onChanged: (v) {
                                if (v.isEmpty) {
                                  search.searchList = [];
                                  value.notifyListeners();
                                }
                              },
                              onFieldSubmitted: (v) =>
                                  search.searchService(context),
                              suffixIcon: FilterIconCommon(
                                  selectedFilter:
                                      search.totalCountFilter().toString(),
                                  onTap: () => search.onBottomSheet(context)))
                          .paddingSymmetric(horizontal: 20),
                      VSpace(Insets.i25),
                      Text(appFonts.categories,
                              style: appCss.dmDenseBold16
                                  .textColor(appColor(context).darkText))
                          .paddingSymmetric(horizontal: Insets.i20),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                        height: Sizes.s60,
                                        width: Sizes.s60,
                                        decoration: ShapeDecoration(
                                            color:
                                                appColor(context).fieldCardBg,
                                            shape: SmoothRectangleBorder(
                                                side: BorderSide(
                                                    color: appColor(context)
                                                        .trans),
                                                borderRadius:
                                                    SmoothBorderRadius(
                                                        cornerRadius:
                                                            AppRadius.r10,
                                                        cornerSmoothing: 1))),
                                        child: SvgPicture.asset(
                                                "assets/svg/all.svg",
                                                colorFilter: ColorFilter.mode(
                                                    appColor(context).darkText,
                                                    BlendMode.srcIn),
                                                fit: BoxFit.fill,
                                                height: Sizes.s24,
                                                width: Sizes.s24)
                                            .paddingAll(Insets.i17)),
                                    VSpace(Insets.i8),
                                    Text(appFonts.popular,
                                        style: appCss.dmDenseRegular13
                                            .textColor(
                                                appColor(context).darkText))
                                  ],
                                )).paddingOnly(right: Insets.i20),

                            // Existing Categories List
                            ...value1.categoryList
                                .asMap()
                                .entries
                                .map((e) => TopCategoriesLayout(
                                      index: e.key,
                                      data: e.value,
                                      selectedIndex: value.selectedIndex,
                                      onTap: () => value.onSubCategories(
                                          context, e.key, e.value.id),
                                    ).paddingOnly(right: Insets.i20))
                                .toList(),
                          ]).padding(vertical: Insets.i15, left: Insets.i20)),
                      Consumer<CartProvider>(builder: (context2, cart, child) {
                        return Column(
                                children: value.serviceList
                                    .asMap()
                                    .entries
                                    .map((e) => FeaturedBusinessLayout(
                                        data: e.value,
                                        isProvider: false,
                                        inCart: isInCart(context, e.value.id),
                                        addTap: () => value.getProviderById(
                                            context,
                                            e.value.userId,
                                            e.key,
                                            e.value),
                                        onTap: () => value.getServiceById(
                                            context,
                                            e.value.id)).paddingSymmetric(
                                        horizontal: Insets.i20))
                                    .toList())
                            .marginOnly(top: Insets.i15);
                      })
                    ]))),
          )));
    });
  }
}
