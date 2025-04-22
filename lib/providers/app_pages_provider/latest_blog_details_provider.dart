import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:goapp/models/api_model/articles_detail_model.dart';

import '../../config.dart';
import '../../models/api_model/articles_search_model.dart';
import '../../models/api_model/blog_categories_model.dart';
import '../../screens/app_pages_screen/search_screen/layouts/list_tile_common.dart';
import '../../services/api_service.dart';

class LatestBLogDetailsProvider with ChangeNotifier {
  // Article? data;
  ArticlesDetailModel? articleDetail;

  onReady(context) {
    getArticlesSearchAPI(context);
    // dynamic data1 = ModalRoute.of(context)!.settings.arguments;
    // data = data1;
    blogCategoriesData(context);
    notifyListeners();

    notifyListeners();
  }

  detailsDataAPI(context, value, {isNotRouting = false}) {
    notifyListeners();
    try {
      apiServices
          .commonApi("${api.blogDetails}$value/details", [], ApiType.get,
              isToken: true)
          .then((value) {
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            notifyListeners();
            ArticlesDetailModel articlesDetailModel =
                ArticlesDetailModel.fromJson(value.data);
            articleDetail = articlesDetailModel;
            notifyListeners();
            isNotRouting == true
                ? null
                : route.pushNamed(context, routeName.latestBlogDetails);
            notifyListeners();
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      notifyListeners();
      log("detailsDataAPI :: $e");
    }
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
            return SafeArea(
              child: SizedBox(
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
                            Expanded(child: Consumer<LatestBLogDetailsProvider>(
                                builder: (context, value, _) {
                              return ListView.builder(
                                  itemCount: value.categoryList.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    final category = value.categoryList[index];
                                    return ListTileLayout(
                                        data: category,
                                        selectedCategory:
                                            value.selectedCategory,
                                        onTap: () => value.onCategoryChange(
                                            context, category.categoryId));
                                  });
                            }))
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
                  ])).bottomSheetExtension(context),
            );
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
      if (value.isSuccess == true) {
        if (value.isSuccess! && value.data['responseStatus'] == 1) {
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
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, routeName.login, (Route<dynamic> route) => false);
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
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            hideLoading(context);
            articlesSearchList.clear();
            ArticlesSearchModel articlesSearchModel =
                ArticlesSearchModel.fromJson(value.data);

            articlesSearchList.addAll(articlesSearchModel.articles);
            route.pop(context);
            log("getArticlesSearchAPI $articlesSearchList");
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      hideLoading(context);
      log("getArticlesSearchAPI :::");
    }
  }

  List articlesSearchList = [];

  getArticlesSearchAPI(context) async {
    notifyListeners();
    showLoading(context);
    try {
      apiServices
          .commonApi(api.blogSearch, [], ApiType.get, isToken: true)
          .then((value) {
        notifyListeners();
        log("value.data ${value.data}");
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            hideLoading(context);
            notifyListeners();
            articlesSearchList.clear();
            ArticlesSearchModel articlesSearchModel =
                ArticlesSearchModel.fromJson(value.data);
            notifyListeners();
            articlesSearchList.addAll(articlesSearchModel.articles);
            notifyListeners();
            log("articlesSearchList $articlesSearchList");
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
        notifyListeners();
      });
    } catch (e) {
      notifyListeners();
      hideLoading(context);
      log("getArticlesSearchAPI :::");
    }
  }

  likeDislike() {
    // data!.isFavourite = !data!.isFavourite;
    notifyListeners();
  }

  Timer? debounceTimer;

  LatestBLogDetailsProvider() {
    searchCtrl.addListener(onSearchChange);
  }

  onSearchChange() {
    if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();
    log("rrrrr ssss${searchCtrl.text}");
    // Start a new debounce timer
    debounceTimer = Timer(Duration(milliseconds: 500), () {
      final query = searchCtrl.text.trim();
      log("rrrrr $query");
      if (query.isEmpty) {
        BuildContext? context;
        getArticlesSearchAPI(context);
      } else if (query.length >= 3) {
        log("ddd ${query}");
        fetchSearchResults(query);
      }
    });
  }

  void fetchSearchResults(String query) {
    try {
      apiServices
          .commonApi("${api.blogSearch}?title=$query", [], ApiType.get,
              isToken: true)
          .then((value) {
        if (value.data['responseStatus'] == 1) {
          articlesSearchList.clear();
          ArticlesSearchModel articlesSearchModel =
              ArticlesSearchModel.fromJson(value.data);
          articlesSearchList.addAll(articlesSearchModel.articles);
          notifyListeners();
        }
      });
    } catch (e) {
      log("Search error: $e");
    }
  }
}
