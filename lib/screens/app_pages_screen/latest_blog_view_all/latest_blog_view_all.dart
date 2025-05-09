import '../../../config.dart';
import '../../../providers/app_pages_provider/latest_blog_details_provider.dart';
import '../../../providers/common_providers/common_api_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../../bottom_screens/home_screen/layouts/latest_blog_layout.dart';

class LatestBlogViewAll extends StatelessWidget {
  const LatestBlogViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LatestBLogDetailsProvider>(
        builder: (context, value, child) {
      return DirectionalityRtl(
          child: Scaffold(
              appBar: AppBarCommon(
                  title: language(context, appFonts.articles),
                  onTap: () {
                    route.pop(context);
                    value.searchCtrl.text = "";
                    value.selectedCategory = [];
                  }),
              body: SafeArea(
                  child: Column(children: [
                SearchTextFieldCommon(
                    hintText: "Search for articles",
                    controller: value.searchCtrl,
                    focusNode: value.searchFocus,
                    suffixIcon: FilterIconCommon(
                        selectedFilter:
                            value.selectedCategory.length.toString(),
                        onTap: () => value.showBottomBlogFilter(context))),
                VSpace(Insets.i15),
                Expanded(
                    child: value.articlesSearchList.isEmpty
                        ? SingleChildScrollView(
                            child: EmptyLayout(
                                topHeight:
                                    MediaQuery.of(context).size.height * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                isButtonShow: false,
                                title: language(
                                    context, appFonts.noResultsWereFound),
                                subtitle: language(context, appFonts.sorry),
                                widget: Image.asset(eImageAssets.noNoti,
                                    height: Sizes.s200)))
                        : ListView.builder(
                            itemCount: value.articlesSearchList.length,
                            itemBuilder: (context, index) {
                              final article = value.articlesSearchList[index];
                              return LatestBlogLayout(
                                  onTap: () =>
                                      value.detailsDataAPI(context, article.id),
                                  data: article,
                                  rPadding: 0,
                                  isView: true,
                                  addOrRemoveTap: () {
                                    final previousFavourite =
                                        article.isFavourite;
                                    article.isFavourite = !previousFavourite;
                                    value.notifyListeners();
                                    final common =
                                        Provider.of<CommonApiProvider>(context,
                                            listen: false);
                                    common.toggleFavAPI(
                                        onSuccess: () => Provider.of<
                                                    LatestBLogDetailsProvider>(
                                                context,
                                                listen: false)
                                            .getArticlesSearchAPI(context),
                                        context,
                                        previousFavourite,
                                        article.appObject!.appObjectType,
                                        article.appObject!.appObjectId);
                                  }).width(MediaQuery.of(context).size.width);
                            })),
                VSpace(Insets.i15)
              ]).paddingSymmetric(horizontal: Insets.i20))));
    });
  }
}
