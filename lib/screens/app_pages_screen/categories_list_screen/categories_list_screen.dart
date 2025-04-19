import '../../../config.dart';
import '../../../providers/app_pages_provider/categories_list_provider.dart';
import '../../../providers/app_pages_provider/search_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../bottom_screens/home_screen/layouts/top_categories_layout.dart';
import '../search_screen/search_screen.dart';
import 'layouts/categories_list_layout.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context, listen: true);

    return Consumer<CategoriesListProvider>(builder: (context1, value, child) {
      return DirectionalityRtl(
          child: Scaffold(
              appBar: AppBar(
                  leadingWidth: 80,
                  title: Text(language(context, appFonts.categories),
                      style: appCss.dmDenseBold18
                          .textColor(appColor(context).darkText)),
                  centerTitle: true,
                  leading: CommonArrow(
                      arrow: rtl(context)
                          ? eSvgAssets.arrowRight
                          : eSvgAssets.arrowLeft,
                      onTap: () => route.pop(context)).paddingAll(Insets.i8)),
              body: SingleChildScrollView(
                  child: Column(children: [
                const VSpace(Sizes.s10),
                Column(
                    children: value.categoryList
                        .asMap()
                        .entries
                        .map((e) => CategoriesListLayout(
                            data: e.value,
                            onTap: () {
                              final search = Provider.of<SearchProvider>(
                                  context,
                                  listen: false);
                              final selectedCategory = e.value;
                              final selectedIndex = selectedCategory.categoryId;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                          selectedIndex: selectedIndex! -
                                              1))).then((value) {
                                search.onSubCategories(
                                    context, e.key, e.value.categoryId);
                              });
                              // Provider.of<CategoriesListProvider>(context,
                              //         listen: false)
                              //     .selectCategory(e.value, e.key);
                              // route.pushNamed(context, routeName.search,
                              //     arg: e.key);
                            }))
                        .toList())
              ]).paddingAll(Insets.i20))));
    });
  }
}
