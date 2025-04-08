import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../config.dart';
import '../../models/api_model/articles_search_model.dart';
import '../../models/api_model/blog_categories_model.dart';
import '../../models/api_model/home_feed_model.dart';
import '../../models/blog_model.dart';
import '../../screens/app_pages_screen/search_screen/layouts/list_tile_common.dart';
import '../../services/api_service.dart';
import '../bottom_providers/dashboard_provider.dart';

class LatestBLogDetailsProvider with ChangeNotifier {
  Article? data;

  onReady(context) {
    getArticlesSearchAPI(context);
    dynamic data1 = ModalRoute.of(context)!.settings.arguments;
    data = data1;
    blogCategoriesData(context);
    notifyListeners();

    notifyListeners();
  }

  List selectedCategory = [];
  List filteredData = [];

  TextEditingController searchCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  showBottomBlogFilter(context) {
    {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return SizedBox(
                height: MediaQuery.of(context).size.height / 1.14,
                child: Stack(children: [
                  Column(
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
                        VSpace(23),
                        Text(language(context, appFonts.blogCategoryList),
                                style: appCss.dmDenseRegular14
                                    .textColor(appColor(context).lightText))
                            .paddingSymmetric(horizontal: Insets.i20),
                        VSpace(15),
                        Expanded(
                            child: Column(children: [
                          Expanded(
                            child: Consumer<LatestBLogDetailsProvider>(
                              builder: (context, value, _) {
                                return ListView.builder(
                                  itemCount: value.categoryList.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    final category = value.categoryList[index];
                                    return ListTileLayout(
                                      data: category,
                                      selectedCategory: value.selectedCategory,
                                      onTap: () => value.onCategoryChange(
                                          context, category.categoryId),
                                    );
                                  },
                                );
                              },
                            ),
                          )
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
                            searchService(context);
                          },
                          clearTap: () => clearFilter(context)))
                ])).bottomSheetExtension(context);
          }).then((value) {
        log("DDDD");
        // getCategory();
        notifyListeners();
        // filterSearchCtrl.text = "";
      });
    }
  }

  void onCategoryChange(BuildContext context, int id) {
    if (!selectedCategory.contains(id)) {
      selectedCategory.add(id);
    } else {
      selectedCategory.remove(id);
    }

    refreshDataBasedOnSelection();
    notifyListeners();
  }

  void refreshDataBasedOnSelection() {
    if (selectedCategory.isEmpty) {
      filteredData = categoryList;
    } else {
      filteredData = categoryList
          .where((item) => selectedCategory.contains(item.categoryId))
          .toList();
    }
    notifyListeners();
  }

  bool isLike = false;

  setState() {
    notifyListeners();
  }

  List categoryList = [];

  // searchService(context, {isPop = false}) async {
  //   if (isPop) {
  //     route.pop(context);
  //   }
  // }

  clearFilter(context) {
    selectedCategory = [];
    // selectedRates = [];
    // searchList = [];
    // lowerVal = 0.0;
    // upperVal = maxPrice;
    // slider = 0;
    // final dashCtrl = Provider.of<DashboardProvider>(context, listen: false);
    // categoryList = dashCtrl.categoryList;
    blogCategoriesData(context);
    route.pop(context);
    notifyListeners();
  }

// blogCategoriesData (blog Categorries)
  blogCategoriesData(context) {
    showLoading(context);
    notifyListeners();
    apiServices.commonApi(api.blogCategories, [], ApiType.get).then((value) {
      if (value.data['responseStatus'] == 1) {
        notifyListeners();
        hideLoading(context);
        log("API Response: blogCategory ${value.data}");
        BlogCategoriesModel blogCategoryModel =
            BlogCategoriesModel.fromJson(value.data);
        notifyListeners();
        // Clear old list and add new parsed categories
        categoryList.clear();
        notifyListeners();
        categoryList.addAll(blogCategoryModel.blogCategories ?? []);
        notifyListeners();
      }
    });
  }

  // List<dynamic> articlesSearchList = [];
  List<dynamic> filteredArticlesList = [];

  Uri buildUriWithRepeatedKeys(String baseUrl, Map<String, dynamic> params) {
    List<String> queryParts = [];

    params.forEach((key, value) {
      if (value is List) {
        for (var item in value) {
          queryParts.add(
              '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(item.toString())}');
        }
      } else {
        queryParts.add(
            '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(value.toString())}');
      }
    });

    return Uri.parse('$baseUrl?${queryParts.join('&')}');
  }

// Search Services (bloc Search)

  void searchService(context) {
    try {
      Map<String, dynamic> queryParams = {"category": selectedCategory};
      Uri uri = buildUriWithRepeatedKeys(api.blogSearch, queryParams);

      apiServices.commonApi(uri, [], ApiType.get, isToken: true).then((value) {
        log("value.data ${value.data}");
        if (value.data['responseStatus'] == 1) {
          hideLoading(context);
          articlesSearchList.clear();
          ArticlesSearchModel articlesSearchModel =
              ArticlesSearchModel.fromJson(value.data);

          articlesSearchList.addAll(articlesSearchModel.articles);
          route.pop(context);
          log("getArticlesSearchAPI $articlesSearchList");
        }
      });
    } catch (e) {
      hideLoading(context);
      log("getArticlesSearchAPI :::");
    }
  }

  List articlesSearchList = [];

  getArticlesSearchAPI(context) async {
    showLoading(context);
    try {
      apiServices
          .commonApi(api.blogSearch, [], ApiType.get, isToken: true)
          .then((value) {
        log("value.data ${value.data}");
        if (value.data['responseStatus'] == 1) {
          hideLoading(context);

          articlesSearchList.clear();
          ArticlesSearchModel articlesSearchModel =
              ArticlesSearchModel.fromJson(value.data);

          articlesSearchList.addAll(articlesSearchModel.articles);

          log("articlesSearchList $articlesSearchList");
        }
      });
    } catch (e) {
      hideLoading(context);
      log("getArticlesSearchAPI :::");
    }
  }

  likeDislike() {
    // data!.isFavourite = !data!.isFavourite;
    notifyListeners();
  }
}
